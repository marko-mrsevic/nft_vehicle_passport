// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract VehicleNft is ERC721 {
    uint256 public s_tokenCounter;

    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("VehicleNFT", "VNFT") {
        s_tokenCounter = 0;
    }

    function mintVehicleNft(string memory tokenUri) external {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function getTokenUri(uint256 tokenId) external view returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}