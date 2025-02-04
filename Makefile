-include .env

build:; forge build

deploy-base-sepolia:
	forge clean
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(RPC_URL_BASE_SEPOLIA) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(BASESCAN_API_KEY) -vvvv