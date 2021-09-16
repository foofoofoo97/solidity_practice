pragma solidity 0.8.7;

contract Token {
    string public name;
    mapping(address => uint256) public accBalances;

    constructor(string memory _name) {
        name = _name;
    }

    function addBalances() public virtual {
        accBalances[tx.origin]++;
    }
}

contract MyToken is Token {
    string public symbol;
    address[] public ownerAddress;
    uint256 public ownerCount = 0;

    constructor(string memory _name, string memory _symbol) Token(_name) {
        symbol = _symbol;
    }

    function addBalances() public override {
        super.addBalances();
        ownerCount++;
        ownerAddress.push(msg.sender);
    }
}
