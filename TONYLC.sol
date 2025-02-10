// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TonyLCCoin is ERC20, Ownable {
    address public burnAddress = 0x000000000000000000000000000000000000dEaD;
    string public website = "https://tonylc.com/";
    string public telegram = "https://t.me/tonylccoin";
    string public twitter =
        "https://x.com/TONYLCCoin?t=06Nw0GwnFXQtgIXXWdwopw&s=09";
    string public instagram =
        "https://www.instagram.com/homie.tony.coin/?utm_source=qr&r=nametag";

    constructor() ERC20("Tony LC Coin", "TONYLC") Ownable(msg.sender) {
        _mint(
            0x6B9C2FBed0435f3b19b760e99E8E31699781Ce0b,
            5_000_000_000 * 10**decimals()
        );
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function revokeMinting() external onlyOwner {
        renounceOwnership(); // Revokes contract ownership (No more minting)
    }
}
