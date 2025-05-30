// SPDX-License-Identifier: MIT

pragma solidity 0.8.29;

import {Test} from "forge-std/Test.sol";
import {VehicleNft} from "../../src/VehicleNft.sol";
import {DeployVehicleNft} from "../../script/DeployVehicleNft.s.sol";
import {MintVehicleNft} from "../../script/Interactions.s.sol";
import {MintVehicleNft} from "../../script/Interactions.s.sol";

contract IntegrationTest is Test {
    VehicleNft public vehicleNft;

    function setUp() public {
        DeployVehicleNft deployVehicleNft = new DeployVehicleNft();
        vehicleNft = deployVehicleNft.run();
    }

    function testMintVehicleNftInteractions() public {
        MintVehicleNft mintVehicleNft = new MintVehicleNft();
        mintVehicleNft.mintNftOnContract(address(vehicleNft));

        // Check if the NFT was minted correctly
        assertEq(vehicleNft.s_tokenCounter(), 1);
        assertEq(vehicleNft.getTokenUri(0), "ipfs://QmTg5buUQe8w1ugAPbWmwFFshJgxY6kR1HN8p1cZeXRDNH");
    }

}