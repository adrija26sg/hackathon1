// contracts/DTUToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DTUToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("DTUToken", "DTUT") {
        _mint(msg.sender, initialSupply);
    }
}