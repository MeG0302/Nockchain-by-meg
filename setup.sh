#!/bin/bash

# Colors
GREEN="\e[32m"
RED="\e[31m"
CYAN="\e[36m"
YELLOW="\e[33m"
RESET="\e[0m"

banner() {
  echo -e "${CYAN}"
  echo "╔══════════════════════════════════════════════╗"
  echo "║        🚀 NOCKCHAIN MINER BY MeG 🚀          ║"
  echo "╠══════════════════════════════════════════════╣"
  echo "║ 🔗 Twitter:  https://x.com/Jaishiva0302      ║"
  echo "║ 💬 Telegram: https://t.me/vampsairdrop       ║"
  echo "╚══════════════════════════════════════════════╝"
  echo -e "${RESET}"
}

check_success() {
  if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Error encountered. Exiting.${RESET}"
    exit 1
  fi
}

prompt_continue() {
  read -rp "$(echo -e "${YELLOW}➡️  $1 (y/n): ${RESET}")" answer
  case "$answer" in
    [Yy]*) return 0 ;;
    [Nn]*) echo -e "${RED}❌ Exiting...${RESET}"; exit 1 ;;
    *) echo -e "${RED}❗ Please enter y or n.${RESET}"; prompt_continue "$1" ;;
  esac
}

# Banner
clear
banner
echo -e "${YELLOW}⏳ Please wait... setting up environment in 7 seconds...${RESET}"
sleep 7

# Install dependencies
echo -e "${CYAN}📦 Updating system and installing packages...${RESET}"
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install curl iptables build-essential git wget lz4 jq make gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev libclang-dev llvm-dev screen -y
check_success

# Install Rust
echo -e "${CYAN}🦀 Installing Rust...${RESET}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
check_success

# Cleanup & Clone
echo -e "${CYAN}🧹 Cleaning up and cloning Nockchain repo...${RESET}"
rm -rf nockchain ~/.nockapp
git clone https://github.com/zorp-corp/nockchain
cd nockchain || exit
cp .env_example .env
check_success

# Build steps
echo -e "${CYAN}⚙️ Building the project... This may take 30–40 minutes.${RESET}"
make install-hoonc
make build
make install-nockchain-wallet
make install-nockchain
export PATH="$PATH:$(pwd)/target/release"
check_success

# Generate wallet
echo -e "${CYAN}🔐 Generating a new wallet...${RESET}"
nockchain-wallet keygen
check_success

prompt_continue "Have you saved your wallet keys and mnemonic safely?"

# Replace public key
read -rp "$(echo -e "${YELLOW}🔑 Enter your PUBLIC KEY to update .env: ${RESET}")" pubkey
sed -i "s|MINING_PUBKEY=.*|MINING_PUBKEY=$pubkey|" .env
echo -e "${GREEN}✅ .env updated with your public key.${RESET}"


# Final launch prompt
read -rp "$(echo -e "${YELLOW}🚀 Re-enter your PUBLIC KEY to start the miner: ${RESET}")" start_pubkey

echo -e "${GREEN}🚀 Launching Nockchain miner...${RESET}"
nockchain --mining-pubkey "$start_pubkey" --mine \
  --peer /ip4/95.216.102.60/udp/3006/quic-v1 \
  --peer /ip4/65.108.123.225/udp/3006/quic-v1 \
  --peer /ip4/65.109.156.108/udp/3006/quic-v1 \
  --peer /ip4/65.21.67.175/udp/3006/quic-v1 \
  --peer /ip4/65.109.156.172/udp/3006/quic-v1 \
  --peer /ip4/34.174.22.166/udp/3006/quic-v1 \
  --peer /ip4/34.95.155.151/udp/30000/quic-v1 \
  --peer /ip4/34.18.98.38/udp/30000/quic-v1

echo -e "${GREEN}🎉 Your node is up and mining! Follow me for updates: https://x.com/Jaishiva0302${RESET}"
