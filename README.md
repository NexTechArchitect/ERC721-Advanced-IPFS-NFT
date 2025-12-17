
<div align="center">
  <a href="https://git.io/typing-svg">
    <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&weight=600&size=28&pause=1000&color=FF69B4&center=true&vCenter=true&random=false&width=1000&height=100&lines=CUTECAT_NFT_PROTOCOL;Advanced+ERC-721+Architecture;On-Chain+Ownership+%7C+IPFS+Data;Production-Grade+Foundry+Scripts" alt="Typing Effect" />
  </a>

  <br/>

  <p>
    <img src="https://img.shields.io/badge/Standard-ERC721_(OZ)-2E2E2E?style=for-the-badge&logo=ethereum&logoColor=white" />
  </p>

  <p width="90%">
    <b>A production-grade NFT system demonstrating clean separation of concerns.</b><br/>
    Bridging on-chain ownership with off-chain IPFS metadata to ensure your assets are permanent and viewable in MetaMask.
  </p>

  <br/>

  <table>
    <tr>
      <td align="center"><a href="#-project-overview"><strong>📌 Overview</strong></a></td>
      <td align="center"><a href="#-ipfs-architecture"><strong>🏗 Architecture</strong></a></td>
      <td align="center"><a href="#-script-capabilities"><strong>⚙️ Scripts</strong></a></td>
      <td align="center"><a href="#-tech-stack"><strong>💻 Tech Stack</strong></a></td>
    </tr>
  </table>

</div>

---

## 📌 Project Overview

**CuteCatNFT** is not a basic tutorial project. It is a robust **ERC-721 implementation** designed for protocol-level environments.

Unlike simple tokens, this project demonstrates the full lifecycle of a digital asset:

* **🔒 Secure Minting:** Assets are created using rigorous checks via `MintCuteCatNft.s.sol`.
* **🌍 Decentralized Storage:** Metadata is not on a server; it's on **IPFS**, ensuring it can never be deleted.
* **🦊 Wallet Optimized:** Token URIs are formatted specifically to render perfectly in **MetaMask** and **OpenSea**.
* **🛡️ Admin Controls:** Governance features to flip minting states (`FlipMintActive`) and withdraw funds securely.

---

## 🏗 IPFS Architecture

The core value of this project is how it handles data. We utilize a **Split-Stack Architecture**.

### 🧬 Data Resolution Flow

```mermaid
graph LR
    User["User / Wallet"]
    Contract["CuteCatNFT Contract"]
    IPFS["IPFS Network"]
    Display["MetaMask / OpenSea"]

    subgraph "On-Chain Layer"
      User -- "1. Mint Token" --> Contract
      Contract -- "2. Assign Owner" --> Contract
    end

    subgraph "Off-Chain Layer"
      User -- "3. View Asset" --> Display
      Display -- "4. Call tokenURI()" --> Contract
      Contract -- "5. Return ipfs://..." --> Display
      Display -- "6. Fetch Image" --> IPFS
    end

    style Contract fill:#f9f,stroke:#333,stroke-width:2px
    style IPFS fill:#b19cd9,stroke:#333,stroke-width:2px

```

> **Why this matters:** The "Cute Cat" image is immutable. It relies on cryptographic hashes, not website URLs.

---

## ⚙️ Script Capabilities

This repository includes a suite of professional Foundry scripts located in the `script/` folder. These automations replace manual console interactions.

<div align="center">

| 📜 Script File | 🛠 Functionality | 🔑 Impact |
| --- | --- | --- |
| **`DeployCuteCatNft.s.sol`** | Deployment | Deploys logic & configures IPFS Base URI. |
| **`MintCuteCatNft.s.sol`** | Interaction | Mints a new NFT to a specific target address. |
| **`FlipMintActive...s.sol`** | Governance | Toggles contract state (`OPEN` / `CLOSED`). |
| **`CheckTotalMinted...s.sol`** | Verification | Audits the current total supply on-chain. |
| **`Withdraw...Funds.s.sol`** | Security | Securely drains ETH to the owner wallet. |

</div>

---

## 💻 Tech Stack

The project is built using the modern **Ethereum Development Stack**.

* **Language:** Solidity `^0.8.20`
* **Framework:** Foundry (Forge, Cast, Anvil)
* **Standard:** ERC-721 (OpenZeppelin)
* **Storage:** IPFS (Pinata / NFT.Storage)



<div align="center">
  <br/>
  <img src="https://raw.githubusercontent.com/rajput2107/rajput2107/master/Assets/Developer.gif" width="45" />
  <br/>
  <b>Developed by NexTechArchitect</b>
  <br/>
  <i>Building the Future of Web3</i>
  <br/><br/>

  <a href="https://github.com/NexTechArchitect">
    <img src="https://img.shields.io/badge/GitHub-Profile-181717?style=flat&logo=github&logoColor=white" alt="GitHub"/>
  </a>
  <a href="https://linkedin.com/in/amit-kumar-811a11277">
    <img src="https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=flat&logo=linkedin&logoColor=white" alt="LinkedIn"/>
  </a>
</div>

