// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {VehicleNft} from "../src/VehicleNft.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

contract MintVehicleNft is Script {
    string public constant VEHICLE_URI = "ipfs://QmTg5buUQe8w1ugAPbWmwFFshJgxY6kR1HN8p1cZeXRDNH";

    function run() external {
        address mostRecentDeployedVehicleNft = DevOpsTools.get_most_recent_deployment(
            "VehicleNft",
            block.chainid
        );
        mintNftOnContract(mostRecentDeployedVehicleNft);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        VehicleNft(contractAddress).mintVehicleNft(
            VEHICLE_URI
        );
        vm.stopBroadcast();
    }
}