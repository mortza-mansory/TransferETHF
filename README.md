# TransferETHF
It's a frontend via flutter and web3dart for transferETH repo contract of mine witch you can use togather for starting the web3 via flutter.


After compiling and deploying via this repo () copy the contract address from here:
```

Starting migrations...
======================
> Network name:    'development'
> Network id:      5777
> Block gas limit: 6721975 (0x6691b7)


2_deploy_transfer.js
====================

   Replacing 'Transfer'
   --------------------
   > transaction hash:    0x5bd875ce0465fd52a68b416571d1094192654ecb2d9299773ebf211dcf7b5e4d
   > Blocks: 0            Seconds: 0
   > contract address:    0xb86A1F42c990575C64f3d34C49d9150e3b905CB8
   > block number:        6
   > block timestamp:     1745515255
   > account:             0x814EabE6C22a4ba2B7658702cd9cB56155DbD34f
   > balance:             103.999085472
   > gas used:            228632 (0x37d18)
   > gas price:           2 gwei
   > value sent:          0 ETH
   > total cost:          0.000457264 ETH

   > Saving artifacts
   -------------------------------------
   > Total cost:         0.000457264 ETH

Summary
=======
> Total deployments:   1
> Final cost:          0.000457264 ETH

```
the contract address is gonna be in this filed:
```
   > contract address:    0xb86A1F42c990575C64f3d34C49d9150e3b905CB8
```
then copy it and put it into eth_service.dart on service folder, and add the private key is your first account witch is will pay the gas for transferring token( make sure its the account of the owner who deployed that contract...).

Creator : mortza mansouri
