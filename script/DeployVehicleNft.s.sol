// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {VehicleNft} from "../src/VehicleNft.sol";
import {console} from "forge-std/console.sol";

contract DeployVehicleNft is Script {
    VehicleNft public vehicleNft;

    function run() external returns (VehicleNft) {
        vm.startBroadcast();
        vehicleNft = new VehicleNft();
        vm.stopBroadcast();
        return vehicleNft;
    }
}
