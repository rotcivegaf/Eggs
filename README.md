# Eggs Idle Miner

Welcome to Eggs Idle Miner, an innovative idle mining game that combines the engaging elements of idle games with the revolutionary potential of blockchain technology. In this game, players use their PC's processing power to mine unique and rare eggs, each represented as ERC-1155 NFTs.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Types of Eggs](#types-of-eggs)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Eggs Idle Miner is designed to provide a unique gaming experience where players can earn digital assets through mining. The rarity of the eggs is determined by the complexity of the hashes found during the mining process, creating a fair and engaging reward system.

## Features

- Blockchain Integration: Utilizes Ethereum blockchain to mint and manage ERC-1155 NFTs.
- Idle Mining: Players use their computing power to mine eggs, with rarity based on hash complexity.
- Variety of Eggs: Includes Normal, Plate, Golden, Crystal, Mystic, Fiery, Galaxy, and Cyber Eggs.
- Decentralized Marketplace: Trade your eggs on platforms like OpenSea.

## Installation

To run Eggs Idle Miner locally, follow these steps:

Clone the Repository:
```bash
git clone https://github.com/rotcivegaf/Eggs
cd Eggs/
```

## Code

- Contract: [Eggs.sol](https://github.com/rotcivegaf/Eggs/blob/master/contracts/src/Eggs.sol)
- Miner example: [miner.js](https://github.com/rotcivegaf/Eggs/blob/master/miner/miner.js)

## Deployments

- Sepolia Arbiscan Eggs Contract: [0x3Ec5C0A31D779cdEd116741bc3E0f2713E39CA14](https://sepolia.arbiscan.io/address/0x3Ec5C0A31D779cdEd116741bc3E0f2713E39CA14)
- TX: [0x5703204f4b2065317418d3abb5a3717ae3185caf787a1f6adf75918fd5634d9c](https://sepolia.arbiscan.io/tx/0x5703204f4b2065317418d3abb5a3717ae3185caf787a1f6adf75918fd5634d9c)

- Sepolia Scroll Eggs Contract: [0x4c21515b92f488a02ac44d8fe2878e00e270a42a](https://sepolia.scrollscan.com/address/0x4c21515b92f488a02ac44d8fe2878e00e270a42a#code)
- Zircuit testnet Eggs Contract: [0x165547bE10567d6188DA6De7fd6BdcCd34F80D60](https://explorer.zircuit.com/address/0x165547bE10567d6188DA6De7fd6BdcCd34F80D60)
- Morph testnet Eggs Contract: [0x165547bE10567d6188DA6De7fd6BdcCd34F80D60](https://explorer-holesky.morphl2.io/address/0x165547bE10567d6188DA6De7fd6BdcCd34F80D60)
- Polygon Cardona ZKEvm Contract: [0x165547be10567d6188da6de7fd6bdccd34f80d60](https://cardona-zkevm.polygonscan.com/address/0x165547be10567d6188da6de7fd6bdccd34f80d60#code)

## Usage
-----

1.  **Start Mining **:
    -   This demo currently runs using Hardhat, a development environment for Ethereum. You can start the mining process by running the Hardhat node and executing the mining script.
    -   Adjust the number of cores used for mining in the "Cores" section.
2.  **Claim Your Eggs**:
    -   Once you have mined enough, click the "Claim!" button to mint your eggs as ERC-1155 NFTs.
3.  **Check Inventory**:
    -   View your mined eggs in the Eggs Contract.

Types of Eggs
-------------

-   **Normal Egg**: A plain, smooth white egg.
-   **Steel Egg**: A shiny, metallic egg with a platinum-like appearance.
-   **Golden Egg**: A golden egg with a glowing aura.
-   **Crystal Egg**: A transparent egg with multicolored reflections.
-   **Mystic Egg**: An egg covered in ancient runes, emitting a faint purple glow.

Contracts
------------

- Arbitrum: [0x3ec5c0a31d779cded116741bc3e0f2713e39ca14](https://sepolia.arbiscan.io/address/0x3ec5c0a31d779cded116741bc3e0f2713e39ca14#code)
- Scroll: [0x4c21515b92f488a02ac44d8fe2878e00e270a42a](https://sepolia.scrollscan.com/address/0x4c21515b92f488a02ac44d8fe2878e00e270a42a#code)
- Zircuit: [0x165547bE10567d6188DA6De7fd6BdcCd34F80D60](https://explorer.zircuit.com/address/0x165547bE10567d6188DA6De7fd6BdcCd34F80D60)
- Morph: [0x165547bE10567d6188DA6De7fd6BdcCd34F80D60](https://explorer-holesky.morphl2.io/address/0x165547bE10567d6188DA6De7fd6BdcCd34F80D60)

TODO
------------

- [Front] Inventory page

Contributing
------------

We welcome contributions from the community! Please follow these steps to contribute:

1.  **Fork the Repository**: Click the "Fork" button on the top right corner of this repository page.
2.  **Create a Branch**: Create your feature branch (`git checkout -b feature/AmazingFeature`).
3.  **Commit Your Changes**: Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4.  **Push to the Branch**: Push to the branch (`git push origin feature/AmazingFeature`).
5.  **Open a Pull Request**: Open a pull request to the `main` branch.

License
-------

This project is licensed under the MIT License.