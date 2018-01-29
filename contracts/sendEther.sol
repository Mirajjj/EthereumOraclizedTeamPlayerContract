pragma solidity 0.4.18;

contract sendEther {
    address public team;
    address public player;
    
    uint public transactionAmount;
    
    modifier isOwner() {
        require(msg.sender == team);
        _;
    }
    
    event LogString(string message);
    event LogSU(string message, uint number);

    function sendEther(address _player) public payable {
        team = msg.sender;
        player = _player;
        transactionAmount = msg.value;

        transfer();
    }

    function transfer() private isOwner returns (bool) {
        bool success = false;
        
        if(team.balance >= transactionAmount) {

            if (!player.send(transactionAmount)) {
                revert();
            } else {
                success = true;
            }
            
            LogSU("Team Balance", team.balance);
            LogSU("Player Balance", player.balance);
        } else {
            LogString("Team doesn't have enough funds to proceed");
        }
        
        return success;
    }
}   