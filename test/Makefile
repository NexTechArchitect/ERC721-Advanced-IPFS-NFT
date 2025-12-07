# ==========================
#   ADVANCED NFT MAKEFILE
# ==========================

---- Basic forge tasks ----

build:
	forge build

test:
	forge test -vvvv

fmt:
	forge fmt

clean:
	forge clean

# Scripts (all use env: SEPOLIA_RPC_URL, PRIVATE_KEY) 

deploy:
	forge script script/DeployCuteCatNft.s.sol:DeployCuteCatNft --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast

mint:
	forge script script/MintCuteCatNft.s.sol:MintCuteCatNft --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast

transfer:
	forge script script/TransferCuteCatNft.s.sol:TransferCuteCatNft --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast

withdraw:
	forge script script/WithdrawCuteCatFunds.s.sol:WithdrawCuteCatFunds --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast

flipMint:
	forge script script/FlipMintActiveCuteCatNft.s.sol:FlipMintActiveCuteCatNft --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast

checkMint:
	forge script script/CheckMintActiveCuteCatNft.s.sol:CheckMintActiveCuteCatNft --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast

checkTotal:
	forge script script/CheckTotalMintedCuteCatNft.s.sol:CheckTotalMintedCuteCatNft --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcas

