// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract StableDollarRouter {
    address public stableDollarToken; // e.g., USDC

    constructor(address _stableDollarToken) {
        stableDollarToken = _stableDollarToken;
    }

    function convertToStableDollar(address fromToken, uint256 amount) external returns (uint256) {
        // Placeholder: integrate DEX or oracle for conversion rate
        // Assume 1:1 for demonstration
        require(IERC20(fromToken).transferFrom(msg.sender, address(this), amount), "Transfer failed");
        require(IERC20(stableDollarToken).transfer(msg.sender, amount), "Payout failed");
        return amount;
    }
}