// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// 1. Deploy mocks when we are on a local anvil chain
// 2. Keep track of contract addresses across different chains
// Sepolia ETH/USD
// Mainnet ETH/USD

import {Script} from "forge-std/Script.sol";

contract HelperConfig {
    // If we are on a local chain, we will deploy mocks
    // Otherwise, grab the existing address from the live network

    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed;
    }

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else if (block.chainid == 1) {
            activeNetworkConfig = getEthConfig();
        } else if (block.chainid == 8453) {
            activeNetworkConfig = getBaseConfig();
        } else {
            activeNetworkConfig = getAnvilEthConfig();
        }
    }

    function getEthConfig() public pure returns (NetworkConfig memory) {
        // price feed addr

        NetworkConfig memory ethConfig = NetworkConfig({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });

        return ethConfig;
    }

    function getBaseConfig() public pure returns (NetworkConfig memory) {
        // price feed addr

        NetworkConfig memory baseConfig = NetworkConfig({
            priceFeed: 0x71041dddad3595F9CEd3DcCFBe3D1F4b0a16Bb70
        });

        return baseConfig;
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        // price feed addr

        NetworkConfig memory sepoliaEthConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });

        return sepoliaEthConfig;
    }

    function getAnvilEthConfig() public pure returns (NetworkConfig memory) {
        // price feed addr
    }
}
