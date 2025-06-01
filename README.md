
# NFT-based Vehicle Passport 
  
**Note:** This project is implemented entirely in Solidity and uses [Foundry](https://book.getfoundry.sh/) for smart contract development, testing, and deployment.


## Description

NFT Vehicle Passport is a blockchain-based application that issues, manages, and verifies digital vehicle passports as NFTs (ERC721 token). This system provides a secure, tamper-proof, and transparent way to track vehicle ownership, history, and credentials.

## Features

- Mint unique NFT passports for vehicles
- Transfer vehicle ownership securely on-chain
- Store and update vehicle metadata (e.g., VIN, make, model, service history)
- Query and verify vehicle details publicly
- Immutable record of ownership and history

## Installation

### Prerequisites

- [Foundry](https://book.getfoundry.sh/) (for smart contract development)
- [Git](https://git-scm.com/)

### Setup Steps

```bash
# Clone the repository
git clone https://github.com/yourusername/nft_vehicle_passport.git
cd nft_vehicle_passport

# (Optional) Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup

# Install dependencies
forge build
```

## Usage
The following `Makefile` commands are available for common tasks:

***Note:*** Ensure that you set up .env file with your data
### Deploy Contracts

```bash
make deploy #Deploy contracts to the Anvil chain
```
```bash
make deploy-sepolia #Deploy to the Sepolia chain
```

### Test Contracts

```bash
make test #Run all contract tests.
```
```bash
make forked-test #Run tests on ferked environment
```


## API Documentation

### Smart Contract Methods

- `mintVehicle(address to, string metadataURI)`: Mints a new vehicle passport NFT.
- `transferFrom(address from, address to, uint256 tokenId)`: Transfers ownership.
- `tokenURI(uint256 tokenId)`: Returns metadata URI for a vehicle.
- `updateTokenURI(uint256 tokenId, string memory newTokenUri)`: Updates tokens URI


## Technologies Used

- Solidity (Smart Contracts)
- Foundry (Development & Testing)
- IPFS (Metadata storage)

## Contributing

Contributions are welcome! Please open issues or submit pull requests.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a pull request

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## Contact / Acknowledgments

- Project Maintainer: [Marko Mrsevic](marko.mrsevic@outlook.com)

