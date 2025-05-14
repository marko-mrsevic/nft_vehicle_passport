// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {VehicleNft} from "../src/VehicleNft.sol";

contract VehicleNftTest is Test {
    VehicleNft public vehicleNft;
    address public constant USER = address(0x123);

    function setUp() public {
        vehicleNft = new VehicleNft();
    }

    function testMintVehicleNft() public {
        vm.prank(USER);
        string memory tokenUri = "ipfs://QmTg5buUQe8w1ugAPbWmwFFshJgxY6kR1HN8p1cZeXRDNH";
        vehicleNft.mintVehicleNft(tokenUri);
        assertEq(vehicleNft.getTokenUri(0), tokenUri);
    }
}