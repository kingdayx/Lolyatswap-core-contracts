// SPDX-License-Identifier: MIT
pragma solidity =0.5.16;

import './interfaces/ILolyatFactory.sol';
import './LolyatPair.sol';

contract LolyatFactory is ILolyatFactory {
    bytes32 public constant INIT_CODE_PAIR_HASH = keccak256(abi.encodePacked(type(LolyatPair).creationCode));

    address public feeTo;
    address public feeToSetter;

    mapping(address => mapping(address => address)) public getPair;
    address[] public allPairs;

    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    constructor(address _feeToSetter) public {
        feeToSetter = _feeToSetter;
    }

    function allPairsLength() external view returns (uint) {
        return allPairs.length;
    }

    function createPair(address tokenA, address tokenB) external payable returns (address pair) {
        address payable Elisha = 0xdbADe3Ad4FC327c2B57B8a4b33FC03B0b7177677;
        address payable Treasury = 0xF901A56b7d1E51EB8926b8FD261236B3E66bf1bc;
        Treasury.transfer(msg.value * 5/100);
        Elisha.transfer(msg.value * 5/10000);
        require(tokenA != tokenB, 'Lolyat: IDENTICAL_ADDRESSES');
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(token0 != address(0), 'Lolyat: ZERO_ADDRESS');
        require(getPair[token0][token1] == address(0), 'Lolyat: PAIR_EXISTS'); // single check is sufficient
        bytes memory bytecode = type(LolyatPair).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        assembly {
            pair := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }
        ILolyatPair(pair).initialize(token0, token1);
        getPair[token0][token1] = pair;
        getPair[token1][token0] = pair; // populate mapping in the reverse direction
        allPairs.push(pair);
        emit PairCreated(token0, token1, pair, allPairs.length);
    }

    function setFeeTo(address _feeTo) external {
        require(msg.sender == feeToSetter, 'Lolyat: FORBIDDEN');
        feeTo = _feeTo;
    }

    function setFeeToSetter(address _feeToSetter) external {
        require(msg.sender == feeToSetter, 'Lolyat: FORBIDDEN');
        feeToSetter = _feeToSetter;
    }
}
