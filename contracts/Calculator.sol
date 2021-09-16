pragma solidity 0.8.7;

import "./Library.sol";

contract Calculator {
    uint256 public value;

    function divideNums(uint256 _num1, uint256 _num2) public {
        value = Math.divide(_num1, _num2);
    }
}
