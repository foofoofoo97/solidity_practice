pragma solidity 0.8.7;

contract Token {
    string public name;
    mapping(address => uint256) public accBalances;

    function addBalances() public {
        accBalances[tx.origin]++;
    }
}

contract TransactionManager {
    address payable wallet;
    address public token;

    constructor(address payable _seller, address _token) {
        wallet = _seller;
        token = _token;
    }

    event Purchase(address indexed _buyer, uint256 _amount);

    function buyToken() public payable {
        //add balances to sender
        Token(address(token)).addBalances();

        //send ether to wallet
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }

    //external can only be called outside contract
    fallback() external payable {
        buyToken();
    }

    receive() external payable {}
}
