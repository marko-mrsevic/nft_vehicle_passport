// SPDX-License-Identifier: MIT

pragma solidity 0.8.29;

import {Test} from "forge-std/Test.sol";
import {VehicleNft} from "../../src/VehicleNft.sol";

contract VehicleNftTest is Test {
    VehicleNft public vehicleNft;
    address public constant USER = address(0x123);
    string public constant VIN = "1HGCM82633A123456";
    string public constant MAKE = "Ford";
    string public constant MODEL = "Mustang";
    // IPFS URI for the vehicle NFT metadata
    string public constant TOKEN_URI = "ipfs://QmTg5buUQe8w1ugAPbWmwFFshJgxY6kR1HN8p1cZeXRDNH";

    function setUp() public {
        vehicleNft = new VehicleNft();
    }

    function testMintVehicleNft() public {
        vm.prank(USER);
        vehicleNft.mintVehicleNft(VIN, MAKE, MODEL, TOKEN_URI);
        assertEq(vehicleNft.getTokenUri(0), TOKEN_URI);
    }

    function testCanUpdateVehicleNft() public {
        vm.prank(USER);
        vehicleNft.mintVehicleNft(VIN, MAKE, MODEL, TOKEN_URI);
        string memory newTokenUri = "ipfs://QmTg5buUQe8w1ugAPbWmwFFshJgxY6kR1H34p1cZeXRDNH";
        vm.prank(USER);
        vehicleNft.updateTokenURI(0, newTokenUri);
        assertEq(vehicleNft.getTokenUri(0), newTokenUri);
    }

    function testTransferOwnership() public {
        vm.prank(USER);
        vehicleNft.mintVehicleNft(VIN, MAKE, MODEL, TOKEN_URI);
        vm.prank(USER);
        vehicleNft.transferOwnership(0, address(this));
        assertEq(vehicleNft.ownerOf(0), address(this));
    }

    function testRevertIfNotOwnerNorApproved() public {
        vm.prank(USER);
        vehicleNft.mintVehicleNft(VIN, MAKE, MODEL, TOKEN_URI);
        vm.expectRevert(VehicleNft.VehicleNft__NotOwnerNorApproved.selector);
        vehicleNft.updateTokenURI(0, "newUri");
    }
}
