// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.6.0 < 0.9.0;

interface IManager {
    // variables
    enum Rank { Bronze, Silver, Gold, Platinum, Diamond, Challenger }
    
    struct Scholar {
        uint256 claimedAmount;
        uint256 profitReturnedAmount;
        uint24 score; // use for calculate the ranking
        Rank rank; // use for calculate clamable amount of scholarship
        bool isRegistered; 
    }
    
    //events
    event DepositLiquidity(address indexed sponsor, uint256 amount, uint256 timestamp);
    event WithdrawLiquidity(address indexed sponsor, uint256 amount, uint256 timestamp);
    event UpdateRank(address indexed scholar, Rank fromRank, Rank toRank, uint256 timestamp);
    event RegisterScholarship(address indexed account, uint256 timestamp);
    event ClaimScholarship(address indexed scholar, uint256 amount, uint256 timestamp);
    
    // functions
    function depositLiquidity(uint256 amount) external returns (bool);
    function withdrawLiquidity(uint256 amount) external returns (bool);
    function claimScholarship(uint256 amount) external returns (bool);
    function registerScholarship() external returns (bool);
    function updateRank(Rank oldRank, Rank newRank) external returns (bool); 
    function totalDepositedLiquidity() external returns (uint256);
    function totalClaimedScholarship() external returns (uint256);
    function totalProfitReturned() external returns (uint256);
}

