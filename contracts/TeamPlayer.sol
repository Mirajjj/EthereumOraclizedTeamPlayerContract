pragma solidity ^0.4.18;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract TeamPlayer is usingOraclize {
    address public team;
    address private player;
    
    uint transactionAmount = 1000000000000000000;
    
    modifier isOwner() {
        require(msg.sender == team);
        _;
    }
    
    event LogString(string message);
    event LogSU(string message, uint number);
    
    function TeamPlayer() public payable {
        team = msg.sender;
        player = 0xe602c85b02fd233d709da282ceb89f29a62ec4c8;
        
        requestTransfer();
    }
    
    function requestTransfer() private isOwner {
        LogSU("Contract Balance", this.balance);
        
        sendOralizedQuery(false);
    }
    
    function sendOralizedQuery(bool periodical) private {
        if (oraclize_getPrice("URL") > this.balance) {
            LogString("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            LogString("Oraclize query was sent, standing by for the answer..");
            
            if (periodical) {
                oraclize_query(10, "URL", "http://test-blockchain.getsandbox.com/state");
            } else {
                oraclize_query("URL", "http://test-blockchain.getsandbox.com/state");
            }
        }
    }
    
    function __callback(bytes32 myid, string result) public {
        if(convertStringToBoolean(result)) {
            transfer();
        } else {
            sendOralizedQuery(true);
        }
    }
    
    function transfer() private returns (bool) {
        bool success = false;
        
        LogString("Starting Transfer");
        LogSU("Transaction Amount", transactionAmount);
        LogSU("Team Balance", team.balance);
        LogSU("Player Balance", player.balance);
        
        if(team.balance >= transactionAmount) {
            LogString("Team has enough funds to proceed");

            if (!player.send(transactionAmount)) {
                LogString("Team has Failed to send funds as a lack of gas required");
                revert();
            } else {
                LogString("Transfer is Successful!");
                success = true;
            }
            
            LogSU("Team Balance", team.balance);
            LogSU("Player Balance", player.balance);
        } else {
            LogString("Team doesn't have enough funds to proceed");
        }
        
        return success;
    }
    
    function convertStringToBoolean(string value) internal pure returns (bool) {
        bool boolValue = false;

        if (keccak256(value) == keccak256("{\n  \"state\": true\n}")) boolValue = true;
        
        return boolValue;
    }
}   