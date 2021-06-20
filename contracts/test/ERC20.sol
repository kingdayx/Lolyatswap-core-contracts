pragma solidity =0.5.16;

import '../LolyatERC20.sol';

contract ERC20 is LolyatERC20 {
    constructor(uint _totalSupply) public {
        _mint(msg.sender, _totalSupply);
    }
}
