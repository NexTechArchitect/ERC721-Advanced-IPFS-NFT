// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "../src/CuteCatNFT.sol";

contract TransferCuteCatNft is Script {
    function run() external {
        // NFT Contract
        address nftAddress = 0x7124F139A67B393380C5A705653Ee30d882ADA5A;

        // Send to this wallet
        address recipient = 0x21BDd5d84E683e59DF1dd37765aEd32EE6AE0a6B;

        // TokenID to transfer
        uint256 tokenId = 0;

        vm.startBroadcast();

        CuteCatNFT(nftAddress).safeTransferFrom(msg.sender, recipient, tokenId);

        vm.stopBroadcast();
    }
}
