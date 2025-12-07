// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract CuteCatNFT is
    ERC721URIStorage,
    ERC721Burnable,
    Ownable,
    ReentrancyGuard
{
    uint256 public constant MAX_SUPPLY = 1000;
    uint256 public constant MINT_PRICE = 0.0005 ether;

    uint256 public totalMinted;
    bool public mintActive;

    // Track minters
    mapping(uint256 => address) public tokenMinters;

    // Base URI (like ipfs://cid/)
    string public baseUri;

    constructor(string memory _baseUri) ERC721("CuteCat NFT", "CATTU") {
        mintActive = true;
        baseUri = _baseUri;
    }

    function mint(uint256 amount) external payable nonReentrant {
        require(mintActive, "Minting disabled");
        require(amount > 0, "Amount must be > 0");
        require(totalMinted + amount <= MAX_SUPPLY, "Exceeds total supply");
        require(msg.value >= MINT_PRICE * amount, "Not enough ETH");

        for (uint256 i = 0; i < amount; i++) {
            uint256 tokenId = totalMinted;
            _safeMint(msg.sender, tokenId);

            // metadata => baseUri + tokenId + ".json"
            string memory uri = string(
                abi.encodePacked(baseUri, _toString(tokenId), ".json")
            );
            _setTokenURI(tokenId, uri);

            tokenMinters[tokenId] = msg.sender;
            totalMinted++;
        }
    }

    function flipMintActive() external onlyOwner {
        mintActive = !mintActive;
    }

    function withdraw(address payable to) external onlyOwner nonReentrant {
        require(address(this).balance > 0, "No ETH");
        (bool success, ) = to.call{value: address(this).balance}("");
        require(success, "Withdraw failed");
    }

    // Overrides for multi inheritance
    function _burn(
        uint256 tokenId
    ) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    // Helper: uint => string
    function _toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) return "0";
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits--;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}
