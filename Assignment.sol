pragma solidity >=0.7.0 <0.9.0;

contract Assignment {               
    uint order;
    bool orderAccepted;
    uint price;
    uint amount;
    bool paymentConfirm;
    address owner;
    string message;
    
    constructor() {
        owner = msg.sender;
        order = 0;
        orderAccepted = false;
        paymentConfirm = false;
        amount = 0;
    }
    //msg.sender => Beach T-shirt Account
    //!msg.sender => Threads Inc. Account
    function setPrice(uint p) public {
        require(msg.sender != owner);
        price = p;
    }
    
    function newOrder(uint x)  public {
        require(msg.sender == owner);
        order = x;
    }
    
    function acceptOrder() public returns(uint) {
        require(msg.sender != owner);
        orderAccepted = true;
        amount = order * price;
        return amount;
    }
    
    function confirmPayment() public returns(string memory){
        require(msg.sender == owner);
        paymentConfirm = true;
        order = 0;
        message = "Order Completed";
        return message;
    }
}
