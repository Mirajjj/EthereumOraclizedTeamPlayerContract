# Ethereum Oraclized Team Player Contract

Ethereum Oraclized Contract where team sends funds to a player depending on external API call

## Scenario

1. Contract owner is a team with funds
2. Team requests external API calls for a permission to send funds to a player every N minutes
3. As soon as API call responses with an affirmative permission, funds are transfered contract is considered fulfilled.

## Install

1. npm install -g truffle
2. Install [Ganache](http://truffleframework.com/ganache/) ([Windows 10](https://www.howtogeek.com/285410/how-to-install-.appx-or-.appxbundle-software-on-windows-10/))
