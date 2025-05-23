# 🚀 NOCKCHAIN MINER BY MeG

Automated script to install and run a **Nockchain miner node** with ease. Designed to simplify setup for beginners and advanced users alike — just run and mine!

---

## 🐦 SOCIALS
🔗 Twitter:  https://x.com/Jaishiva0302      
💬 Telegram: https://t.me/vampsairdrop 
---

# Nockchain-mining Guide by MeG


---

**Nockchain** is a lightweight blockchain designed for heavy-duty computation. It leverages **zk-Proof of Work (zkPoW)**, where miners solve a fixed computational puzzle, generate a **zero-knowledge proof (ZKP)** of the solution, hash the ZKP, and earn **\$NOCK tokens** based on their computational effort.

The team has launched a **Public Testnet**, allowing users to run both a **local testnet node** and a **testnet miner** to explore and understand how Nockchain operates before the **Mainnet** goes live.


![Screenshot 2025-05-21 053502](https://github.com/user-attachments/assets/ad102b46-32e8-4018-9569-3c7a00aaaaeb)

---

## $NOCK details 

O Total Supply: 2^32 nocks (around 4.29 billion).

O Fair launch: 100% of $NOCK will be issued to Miners.

O $NOCK is used to pay for blockspace on Nockchain.

❌ No exchanges

❌ No team allocation

❌ No airdrops

---

---
## 📦 Features

- Auto installs dependencies
- Builds and compiles Nockchain from source
- Sets up wallet and config automatically
- Opens required ports for mining
- Fully interactive and beginner-friendly

---

## 🖥️ System Requirements

- Ubuntu 20.04 / 22.04 (recommended)
- At least 32GB RAM (64GB+ preferred)
- Or GPU (RTX3090 OR RTX4090)
- 20GB disk space
- Basic VPS or dedicated server

you can buy vps from contabo here - https://contabo.com/en/vps/

![Screenshot 2025-05-23 041956](https://github.com/user-attachments/assets/92bb9967-0201-420a-ac66-5bb4a580a24c)

---

>> STEP 1 - Open terminal


## 💻 create a screen session

```bash 

apt install screen -y && apt install sudo -y && apt install ufw -y && screen -S nockminer

```
### Install tmux
```
 apt install tmux -y && tmux

```

> Then paste the below commands 

### Open ports 

```bash

# Allow ssh port
sudo ufw allow ssh
sudo ufw allow 22

# Enable firewall
sudo ufw enable

# Open ports
sudo ufw allow 3005/tcp
sudo ufw allow 3006/tcp

```
## ⚙️ One-Line Installation Command

```bash
sudo apt update && sudo apt install git -y && apt install ufw -y && git clone https://github.com/MeG0302/Nockchain-by-meg && cd Nockchain-by-meg && chmod +x setup.sh && ./setup.sh

```

### Normal logs 

>> These are the normal logs

![Screenshot 2025-05-22 230907](https://github.com/user-attachments/assets/b394c87b-9ff6-42c3-94ba-737ddebb2de7)


just in case you want to see more detailed logs (no trace element)
then stop the node by pressing CTRL C
and paste below command but change/replace "(add your pub key here and remove brackets also before running)" with your pblic key 

```bash

export RUST_LOG=info
nockchain --mining-pubkey (add your pub key here and remove brackets also before running)
 --mine --peer /ip4/95.216.102.60/udp/3006/quic-v1 --peer /ip4/65.108.123.225/udp/3006/quic-v1 --peer /ip4/65.109.156.108/udp/3006/quic-v1 --peer /ip4/65.21.67.175/udp/3006/quic-v1 --peer /ip4/65.109.156.172/udp/3006/quic-v1 --peer /ip4/34.174.22.166/udp/3006/quic-v1 --peer /ip4/34.95.155.151/udp/30000/quic-v1 --peer /ip4/34.18.98.38/udp/30000/quic-v1

```

then you will get these logs 

![Screenshot 2025-05-23 060102](https://github.com/user-attachments/assets/8322e773-972b-42b9-9228-87f1d3d86adf)

>> NOTE!

look for "Generating new candidate" like in above screenshot
it does mean your miner is working all fine
