// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "../src/CuteCatNFT.sol";

contract CheckTotalMintedCuteCatNft is Script {
    function run() external {
        address nftAddress = 0x7124F139A67B393380C5A705653Ee30d882ADA5A;

        uint256 total = CuteCatNFT(nftAddress).totalMinted();
        console2.log("Total Minted:", total);
    }
}
