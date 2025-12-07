//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "../src/CuteCatNFT.sol";

contract DeployCuteCatNft is Script {
    function run() external {
        vm.startBroadcast();

        new CuteCatNFT(
            "ipfs://bafybeifl2iohsgq7dtu2l6f53flic7zja7iko3oomdyacjevm6ur7m6dem/"
        );

        vm.stopBroadcast();
    }
}
