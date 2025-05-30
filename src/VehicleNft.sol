// SPDX-License-Identifier: MIT

// Layout of Contract:
// version
// imports
// interfaces, libraries, contracts
// errors
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

pragma solidity 0.8.29;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

/**
 * @title NFT-based vehicle passport
 * @author Marko Mrsevic
 * @notice This contract allows minting and managing vehicle NFTs.
 * @notice Each NFT represents a vehicle with a unique VIN, make, and model.
 * @notice The contract allows for minting, transferring, and updating vehicle information.
 * @dev This contract uses OpenZeppelin's ERC721 implementation.
 */

contract VehicleNft is ERC721 {
    //////////////////////
    //      Erorrs      //
    //////////////////////
    error VehicleNft__NotOwnerNorApproved();

    ///////////////////////////////
    //      State Variables      //
    ///////////////////////////////
    struct Vehicle {
        string vin;
        string make;
        string model;
    }

    uint256 public s_tokenCounter;

    mapping(uint256 => Vehicle) private s_tokenIdToVehicle;
    mapping(uint256 => string) private s_tokenIdToUri;

    //////////////////////
    //      Events      //
    //////////////////////
    event VehicleMinted(address indexed to, uint256 tokenId, string vin, string uri);
    event TokenURIUpdated(uint256 indexed tokenId, string newURI);
    event OwnershipTransferred(uint256 indexed tokenId, address from, address to);

    /////////////////////////
    //      Functions      //
    /////////////////////////
    constructor() ERC721("VehicleNFT", "VNFT") {
        s_tokenCounter = 0;
    }

    ///////////////////////////////////////////
    //      Public & External Functions      //
    ///////////////////////////////////////////
    function mintVehicleNft(string memory vin, string memory make, string memory model, string memory tokenUri)
        external
    {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToVehicle[s_tokenCounter] = Vehicle(vin, make, model);
        s_tokenCounter++;
        emit VehicleMinted(msg.sender, s_tokenCounter - 1, vin, tokenUri);
    }

    function updateTokenURI(uint256 tokenId, string memory newTokenUri) external {
        if (_isApprovedOrOwner(msg.sender, tokenId) == false) {
            revert VehicleNft__NotOwnerNorApproved();
        }
        s_tokenIdToUri[tokenId] = newTokenUri;
        emit TokenURIUpdated(tokenId, newTokenUri);
    }

    function transferOwnership(uint256 tokenId, address newOwner) external {
        if (_isApprovedOrOwner(msg.sender, tokenId) == false) {
            revert VehicleNft__NotOwnerNorApproved();
        }
        _transfer(msg.sender, newOwner, tokenId);
        emit OwnershipTransferred(tokenId, msg.sender, newOwner);
    }

    /////////////////////////////////////////////////
    //      Private & Internal View Functions      //
    /////////////////////////////////////////////////
    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view returns (bool) {
        return (spender == ownerOf(tokenId) || isApprovedForAll(ownerOf(tokenId), spender));
    }

    ////////////////////////////////////////////////
    //      Public & External View Functions      //
    ////////////////////////////////////////////////
    function getTokenUri(uint256 tokenId) external view returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}
