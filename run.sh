#!/bin/bash

if ! command -v solana &> /dev/null
then
    echo "Solana is not installed. Installing..."
    sh -c "$(curl -sSfL https://release.solana.com/v1.18.4/install)"
    echo "Solana has been installed."
    echo "Adding Solana to PATH..."

    install_output=$(sh -c "$(curl -sSfL https://release.solana.com/v1.18.4/install)")
    solana_path=$(echo "$install_output" | grep -oP '(?<=export PATH=")[^:]+')

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
        solana-keygen grind --starts-with "$char_name":1
        ;;
    2)
        solana-keygen grind --ends-with "$char_name":1
        ;;
    *)
        echo "Invalid choice. Please enter either 1 or 2."
        ;;
esac
