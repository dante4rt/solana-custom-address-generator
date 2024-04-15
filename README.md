# Solana Custom Address Generator

This script allows you to generate Solana addresses with custom starting or ending characters.

## Prerequisites

Before using this script, make sure you have the following installed:
- `bash`
- `curl`
- `wget`

## Usage

1. Clone this repository:

   ```bash
   git clone https://github.com/dante4rt/solana-custom-address-generator.git
   ```

2. Navigate into the repository directory:

   ```bash
   cd solana-custom-address-generator
   ```

3. Run the script:

   ```bash
   chmod +x run.sh && ./run.sh
   ```

4. Follow the prompts:
   - If Solana is not installed, the script will guide you through the installation process.
   - Enter the character you want to use for generating the key (max 8 characters).
   - Select whether you want the character to be placed at the start or end of the address.
   
   Example:
   
   ```plaintext
   Enter the character you want to use for generating the key (max 8 characters):
   R
   Select where you want to place the character:
   1. Start
   2. End
   ```

5. Once the script completes, it will generate the Solana address with the specified character placement.

## Notes

- Ensure you have a stable internet connection to download necessary dependencies.
- This script relies on the Solana CLI for address generation, so make sure it's correctly installed and configured.