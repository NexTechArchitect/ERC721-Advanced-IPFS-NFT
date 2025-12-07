CuteCat NFT — Advanced ERC721 Implementation Using Foundry and IPFS

This repository presents a production-style ERC721 NFT system built with Foundry, OpenZeppelin, and IPFS-backed metadata. The project has been structured deliberately to resemble a real-world codebase rather than a demo, incorporating contract-level safeguards, deterministic mint behavior, automated scripts, and extensive test coverage.


Overview


CuteCat NFT is an ERC721 collection that enforces a finite supply, integrates payable minting, stores metadata via IPFS directory structure, and supports safe withdrawals. Each token resolves to baseURI/tokenId.json, establishing deterministic metadata handling compatible with NFT wallets and explorers. Security considerations include the use of ReentrancyGuard and explicit validation paths for common edge cases.

The workflow leverages Foundry for compilation, testing, deployment scripting, and reproducible interaction with deployed contracts.



Contract Design Principles

The contract is composed with clarity, traceability, and correctness in mind. It inherits from:

ERC721URIStorage for structured metadata

ERC721Burnable to securely destroy tokens

Ownable to enforce operational control

ReentrancyGuard to protect fund extraction


Minting logic is deterministic. Token IDs are sequential and tied directly to mint order. Minter attribution is recorded for each token, enabling provenance reconstruction if required. Supply boundaries and payment conditions are enforced at the contract level.

Administrative control is intentionally minimal. The owner is able to toggle mint availability and execute withdrawals; the contract introduces no privileged metadata paths or central mutation ability.



Metadata and IPFS Strategy

Metadata is decentralized and resolved solely through IPFS. The base URI provided at deployment points to a directory where token-specific metadata files are stored. Each token fetches its metadata by appending "tokenId.json" to the base URI.

This approach avoids external HTTP dependence and ensures persistence compatible with multiple gateways.

Example structure:

ipfs://<CID>/
 ├── 0.json
 ├── 1.json
 ├── ...

A standard metadata entry includes fields for name, description, image, and structured attributes. The image field itself is also specified as an ipfs:// reference, maintaining decentralization throughout.



Repository Anatomy

The repository reflects a professional smart-contract workspace:

.
├── src/                        Core contract
├── script/                     Deployment and operational scripts
├── test/                       Foundry-based test suite
├── metadata/                   Example metadata files
├── Makefile                    Repeatable automation layer
└── README.md

Scripts are not “samples” — they are operational tools. Each one exists to support deterministic deployment and post-deployment interaction without manual transactions.



Tooling and Workflow

Foundry is used as the development foundation. The Makefile consolidates common forge commands into a reproducible workflow. Developers and CI pipelines both benefit from this structure.

The typical local workflow consists of:

Compilation via make build

Test execution via make test

Deployment via make deploy

Operational calls (minting, transferring, withdrawing) through corresponding make targets


Environment requirements are confined to:

SEPOLIA_RPC_URL

PRIVATE_KEY


These variables are intentionally not hard-coded to ensure safe CI integration and portability.



Deployment and Operational Scripts

Deployment is addressed through a dedicated Foundry script. Post-deployment interactions are equally automated:

Minting NFCs programmatically

Transferring tokens

Inspecting ownership and tokenURI

Verifying minting status and supply counters

Withdrawing contract funds safely


This makes the repository practical not only for learning, but for transferring into actual production environments.



Test Coverage

A structured Foundry test suite validates contract invariants and behavioral expectations. Tests include:

Expected supply transitions

Correct token ownership attribution

Proper metadata URI resolution

Secure withdrawals under valid conditions

Revert conditions under invalid use

Mapping accuracy for minter provenance

Compliance of contract constants

Burn behavior and access expectations


The goal of these tests is correctness rather than brute quantity; however, a deliberate set of twenty tests provides confident behavioral coverage.



Security Considerations

Several security principles guide this implementation:

ETH extraction is guarded against reentrancy

Mint paths enforce strict economic conditions

Metadata resolution is deterministic and immutable

Owner privileges are intentionally sparse

Public attack surface area is minimal

No proxy-related risks in the current version


This style of design reduces the need for broad audits and keeps reasoning about state transitions straightforward.



Extensibility Outlook

The current commit represents a complete and stable ERC721 implementation. Future extensions may include:

Royalty support (ERC2981)

Merkle-tree-based access control

Presale/public-sale phase structure

Subgraph indexing for analytics

Frontend mint portal (React + wagmi)

Marketplace integrations


The contract was structured so that such features can be layered naturally without architectural rework.



Author and Licensing

Authored by:
NEXTECHARHITECT (Smart Contract Developer and Solidity, Foundry, Web3 Engineering)

License:
MIT by default. The project may be relicensed, but the author attribution remains unchanged.
