// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts@4.6.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.6.0/access/AccessControl.sol";

contract Token is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor() ERC20("Chainlink Bootcamp 2025 Token", "CLBoot25") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function mintForEOA(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);}
 
    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }
 
    function decimals() public pure override returns (uint8) {
        return 2;
    }
}