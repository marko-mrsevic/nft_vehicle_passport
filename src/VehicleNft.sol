// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract VehicleNft is ERC721 {
    uint256 public tokenCounter;

    constructor() ERC721("VehicleNFT", "VNFT") {
        tokenCounter = 0;
    }

    function mintVehicleNFT(address to) external returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _mint(to, newTokenId);
        tokenCounter++;
        return newTokenId;
    }
}