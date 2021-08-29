// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.6.0 < 0.9.0;

import '@openzeppelin/contracts/token/ERC721/IERC721.sol';

interface INFTBadge is IERC721 {
    // variables
    struct BadgeParams {
        uint256 amount;
        uint256 unclaimedReward;
        uint256 claimedReward;
    }
    
    //events
    event BadgeMinted(address indexed sponsor, uint256 indexed tokenID, uint256 timestamp);
    event BadgeBurned(uint256 indexed tokenID, uint256 timestamp);
    event BadgeOwnerChanged(address indexed newOwner, uint256 indexed tokenID, uint256 timestamp);
    
    // functions
    function mintBadge(BadgeParams calldata params) external returns (uint256);
    function burnBadge(uint256 tokenID) external returns (bool);
    function changeBadgeOwner(uint256 tokenID, address newOwner) external returns (bool);
}

