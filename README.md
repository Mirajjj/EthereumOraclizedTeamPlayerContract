# Ethereum Oraclized Team Player Contract

Ethereum Oraclized Contract where team sends funds to a player depending on external API call

## Scenario

1. Contract owner is a team with funds
2. Team requests external API calls for a permission to send funds to a player every N minutes
3. As soon as API call responses with an affirmative permission, funds are transfered contract is considered fulfilled.

## Install
List of Items to Install
- clone project and it's dependencies
- Create Accounts
- Private Blockchain Network

### Clone project and it's dependencies
1. `npm install -g truffle`
2. `npm install -g ethereumjs-testrpc`
3. install [Geth](https://ethereum.github.io/go-ethereum/downloads/)

### Create Team and Player account
1. `cd D:\ && mkdir ethereum`
2. from the current project folder 
- `geth --datadir D:\ethereum\test-net-blockchain --keystore D:\ethereum\test-net-blockchain\keystore --password ./passwords/team.txt account new > ./accounts/team.txt`
- `geth --datadir D:\ethereum\test-net-blockchain --keystore D:\ethereum\test-net-blockchain\keystore --password ./passwords/player.txt account new > ./accounts/player.txt`
3. Copy created addresses in accounts folder into `genesis.json`
- Example 
```javascript
  "alloc": {
      "096b5ba234a67885a8766beb418a23f9fb432169": { "balance": "999999999999999999999999" },
      "28adb546a78c285fba91c2688b5cbad591ec6ece": { "balance": "10000000000" }
   }
```

### Init Genesis + accounts with prepopulated balance
`geth --identity "TeamPlayerTestNetNode" --networkid 5777 --datadir D:\ethereum\test-net-blockchain --keystore D:\ethereum\test-net-blockchain\keystore init genesis.json`


## Start Private Network 
`geth console --identity "TeamPlayerTestNetNode" --networkid 5777 --rpcaddr "127.0.0.1" --rpcport "8545" --datadir D:\ethereum\test-net-blockchain --keystore D:\ethereum\test-net-blockchain\keystore`


## List of steps to proceed with first transaction
[Get balance]

`web3.fromWei(web3.eth.getBalance(web3.eth.accounts[0]), "ether")`

[Unlock sending account]

`personal.unlockAccount(eth.account[0], "123456789")`

[Send Ether]

`eth.sendTransaction({from:eth.accounts[0], to:eth.accounts[1], value: web3.toWei(1, "ether")})`

[Start Miner]

`miner.start()`






