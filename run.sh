#!/bin/bash

echo "Showing HCA logo..."
wget -O loader.sh https://raw.githubusercontent.com/DiscoverMyself/Ramanode-Guides/main/loader.sh && chmod +x loader.sh && ./loader.sh
curl -s https://raw.githubusercontent.com/DiscoverMyself/Ramanode-Guides/main/logo.sh | bash
sleep 2

if ! command -v solana &> /dev/null
then
    echo "Solana is not installed. Installing..."
    install_logs=$(sh -c "$(curl -sSfL https://release.solana.com/v1.18.4/install)" 2>&1)
    echo "Solana has been installed."
    solana_path=$(echo "$install_logs" | grep -oP 'PATH="\K[^"]+(?=")')
    echo "Adding Solana to PATH..."
    export PATH="$solana_path:$PATH"
    echo "Solana has been added to the PATH."
else
    echo "Solana is already installed."
fi

solana_version=$(solana --version)
echo "Solana version: $solana_version"

echo "Enter the character you want to use for generating the key (max 8 characters): "
read -r char_name
echo "Select where you want to place the character:"
echo "1. Start"
echo "2. End"
read -r choice

case $choice in
    1)
        echo "Enter the number of threads (1-16): "
        read -r threads
        solana-keygen grind --starts-with "$char_name":$threads
        ;;
    2)
        echo "Enter the number of threads (1-16): "
        read -r threads
        solana-keygen grind --ends-with "$char_name":$threads
        ;;
    *)
        echo "Invalid choice. Please enter either 1 or 2."
        ;;
esac
