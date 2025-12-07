// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "../src/CuteCatNFT.sol";

contract MintCuteCatNft is Script {
    function run() external {
        // CURRENT DEPLOYED CONTRACT ADDRESS
        address nftAddress = 0x7124F139A67B393380C5A705653Ee30d882ADA5A;

        vm.startBroadcast();

        // Mint 1 NFT (0.0005 ETH required)
        CuteCatNFT(nftAddress).mint{value: 0.0005 ether}(1);

        vm.stopBroadcast();
    }
}
