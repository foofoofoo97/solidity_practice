pragma solidity 0.8.7; //specific version

contract Basic {
    string public value;
    string public constant myConst = "ABC";
    bool public myBool = true;
    int256 public myInt = -1;
    uint256 public myUint = 1;
    int256 public myInt256 = 9999;
    int8 public myInt8 = 88;

    enum State {
        Waiting,
        Ready,
        Active
    }

    struct Person {
        string firstname;
        string lastname;
    }

    State public state;

    Person[] public people;
    mapping(uint256 => Person) public peopleMapping;

    uint256 public peopleCount = 0;

    address owner;
    uint256 openingTime;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }

    constructor() {
        value = "MyValue";
        state = State.Waiting;
        owner = msg.sender;
        openingTime = block.timestamp;
    }

    function set(string memory _value) public {
        value = _value;
    }

    function activate() public {
        state = State.Active;
    }

    function isActive() public view returns (bool) {
        return state == State.Active;
    }

    function addPerson(string memory _firstname, string memory _lastname)
        public
        onlyWhileOpen
    {
        people.push(Person(_firstname, _lastname));
        peopleMapping[peopleCount] = Person(_firstname, _lastname);
        incrementCount();
    }

    function incrementCount() internal {
        peopleCount++;
    }
}
