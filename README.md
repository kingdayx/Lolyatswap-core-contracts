# Pancake Factory

[![Actions Status](https://github.com/pancakeswap/pancake-swap-core/workflows/CI/badge.svg)](https://github.com/pancakeswap/pancake-swap-core/actions)

In-depth documentation on PancakeSwap is available at [docs.pancakeswap.finance](https://docs.pancakeswap.finance/).

## after downloading the code. navigate to the core folder and run this command in node

npm i

## next make sure fs path and truffle-hdwallet-provider is installed by running these commands

npm i fs path truffle-hdwallet-provder

## now input your secret phrase of your bsc wallet inot the .secret file

## to deploy to a chain you must make sure that there are tokens in your wallet that you have typed the secret phrase of

## run this command if you want to deploy to test net

truffle migrate --network bsc_testnet

## run this command if you want to deploy to main net

truffle migrate --network bsc_mainnet

# Local Development

The following assumes the use of `node@>=10`.

## Install Dependencies

`yarn`

## Compile Contracts

`yarn compile`

## Run Tests

`yarn test`
 
 ## in terminal
 
 `cd core`
 
 ##deploy to main net
 
 ` truffle migrate --network bsc_mainnet `
