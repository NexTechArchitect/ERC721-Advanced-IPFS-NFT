// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "../src/CuteCatNFT.sol";

contract WithdrawCuteCatFunds is Script {
    function run() external {
        address nftAddress = 0x7124F139A67B393380C5A705653Ee30d882ADA5A;

        address payable recipient = payable(
            0x023c6911c69b6c0E70A76C27b23fe1A32b08Bf98
        );

        vm.startBroadcast();
        CuteCatNFT(nftAddress).withdraw(recipient);
        vm.stopBroadcast();
    }
}
