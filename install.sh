#!/bin/bash
# install.sh - Run Soul 50x on VPS

set -e

echo "Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "Installing required packages..."
sudo apt-get install -y gcc python3 python3-pip git

echo "Compiling soul.c..."
gcc soul.c -o soul -lpthread

echo "Installing Python dependencies..."
pip3 install --upgrade pip
pip3 install telebot flask aiogram pyTelegramBotAPI python-telegram-bot

echo "Starting 50 Soul instances..."
for i in $(seq 1 50); do
    echo "Launching instance $i..."
    # Run in background (&) so all 50 can run together
    python3 shubh.py --id $i &
done

echo "All 50 instances launched successfully!"
