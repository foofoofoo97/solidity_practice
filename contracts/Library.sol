pragma solidity 0.8.7;

library Math {
    function divide(uint256 _num1, uint256 _num2)
        public
        pure
        returns (uint256)
    {
        require(_num2 != 0);
        return _num1 / _num2;
    }
}
