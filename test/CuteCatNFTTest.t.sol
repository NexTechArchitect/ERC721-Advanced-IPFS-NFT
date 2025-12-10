// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import "../src/CuteCatNFT.sol";

contract CuteCatNFTTest is Test {
    CuteCatNFT nft;
    address owner = address(0xA1);
    address user1 = address(0xB1);
    address user2 = address(0xC1);
    address user3 = address(0xD1);

    string baseURI = "ipfs://test/";

    function setUp() public {
        vm.deal(owner, 100 ether);
        vm.deal(user1, 100 ether);
        vm.deal(user2, 100 ether);
        vm.deal(user3, 100 ether);

        vm.prank(owner);
        nft = new CuteCatNFT(baseURI);
    }

    function testOwner() public {
        assertEq(nft.owner(), owner);
    }

    function testMintActiveInitially() public {
        assertTrue(nft.mintActive());
    }

    // Mint 1 NFT
    function testMintOne() public {
        vm.prank(user1);
        nft.mint{value: 0.0005 ether}(1);
        assertEq(nft.totalMinted(), 1);
    }

    // Mint multiple
    function testMintTwo() public {
        vm.prank(user1);
        nft.mint{value: 0.001 ether}(2);
        assertEq(nft.totalMinted(), 2);
    }

    // OwnerOf after mint
    function testOwnerOfToken() public {
        vm.prank(user1);
        nft.mint{value: 0.0005 ether}(1);
        assertEq(nft.ownerOf(0), user1);
    }

    // Mint fail insufficient ETH
    function testMintFailLowEth() public {
        vm.prank(user1);
        vm.expectRevert("Not enough ETH");
        nft.mint{value: 0.0001 ether}(1);
    }

    function testMintZeroFail() public {
        vm.prank(user1);
        vm.expectRevert("Amount must be > 0");
        nft.mint{value: 0 ether}(0);
    }

    function testTokenUri() public {
        vm.prank(user1);
        nft.mint{value: 0.0005 ether}(1);
        string memory uri = nft.tokenURI(0);
        assertEq(uri, "ipfs://test/0.json");
    }

    function testTrackMinter() public {
        vm.prank(user1);
        nft.mint{value: 0.0005 ether}(1);
        assertEq(nft.tokenMinters(0), user1);
    }

    // Burn NFT
    function testBurnNft() public {
        vm.prank(user1);
        nft.mint{value: 0.0005 ether}(1);

        vm.prank(user1);
        nft.burn(0);

        vm.expectRevert();
        nft.ownerOf(0);
    }

    // Flip mint active
    function testFlipMintActive() public {
        assertTrue(nft.mintActive());
        vm.prank(owner);
        nft.flipMintActive();
        assertFalse(nft.mintActive());
    }

    // Mint disabled
    function testMintFailWhenDisabled() public {
        vm.prank(owner);
        nft.flipMintActive();

        vm.prank(user1);
        vm.expectRevert("Minting disabled");
        nft.mint{value: 0.0005 ether}(1);
    }

    // Withdraw funds works
    function testWithdrawFunds() public {
        vm.prank(user1);
        nft.mint{value: 0.0005 ether}(1);

        uint256 before = owner.balance;
        vm.prank(owner);
        nft.withdraw(payable(owner));
        uint256 afterBal = owner.balance;
        assertGt(afterBal, before);
    }

    // Withdraw fails when empty
    function testWithdrawEmptyFail() public {
        vm.prank(owner);
        vm.expectRevert("No ETH");
        nft.withdraw(payable(owner));
    }

    // Multiple minting owners
    function testMultipleOwners() public {
        vm.prank(user1);
        nft.mint{value: 0.001 ether}(2);

        vm.prank(user2);
        nft.mint{value: 0.0005 ether}(1);

        assertEq(nft.ownerOf(0), user1);
        assertEq(nft.ownerOf(1), user1);
        assertEq(nft.ownerOf(2), user2);
    }

    // Supply increases correctly
    function testTotalSupplyIncrements() public {
        vm.prank(user1);
        nft.mint{value: 0.001 ether}(2);
        assertEq(nft.totalMinted(), 2);

        vm.prank(user1);
        nft.mint{value: 0.001 ether}(2);
        assertEq(nft.totalMinted(), 4);
    }

    // Minting mapping accuracy
    function testMinterMappingAccuracy() public {
        vm.prank(user1);
        nft.mint{value: 0.001 ether}(2);

        vm.prank(user2);
        nft.mint{value: 0.001 ether}(2);

        assertEq(nft.tokenMinters(0), user1);
        assertEq(nft.tokenMinters(1), user1);
        assertEq(nft.tokenMinters(2), user2);
        assertEq(nft.tokenMinters(3), user2);
    }

    // Contract name correctness
    function testContractName() public {
        assertEq(nft.name(), "CuteCat NFT");
    }

    function testContractSymbol() public {
        assertEq(nft.symbol(), "CATTU");
    }

    function testMintPriceCorrect() public {
        assertEq(nft.MINT_PRICE(), 0.0005 ether);
    }
}
