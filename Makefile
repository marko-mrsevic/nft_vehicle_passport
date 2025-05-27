# Makefile for testing and deploying smart contracts

# Load environment variables from .env file
ifneq (,$(wildcard .env))
	include .env
	export
endif

# Default target
.PHONY: all
all: help

# Help command
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make test           - Run tests on Anvil"
	@echo "  make deploy   - Deploy contracts to Anvil"
	@echo "  make deploy-sepolia - Deploy contracts to Sepolia testnet"

# Run tests on Anvil
.PHONY: test
test:
	forge test

# Deploy contracts to Anvil
.PHONY: deploy
deploy:
	forge script script/DeployVehicleNft.s.sol:DeployVehicleNft --broadcast

# Deploy contracts to Sepolia testnet
.PHONY: deploy-sepolia
deploy-sepolia:
	forge script script/DeployVehicleNft.s.sol:DeployVehicleNft --rpc-url $(SEPOLIA_RPC_URL) --account $(ACCOUNT_NAME) --sender $(SENDER_ADDRESS) --broadcast