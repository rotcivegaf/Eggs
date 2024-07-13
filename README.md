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

- Eggs Contract: [0x55ee3c0e8ae6c8634be3c3ff90852d838898089a](https://testnet.cyberscan.co/address/0x55ee3c0e8ae6c8634be3c3ff90852d838898089a)

## Transactions

- [0xa4e926e7253ba2a875445b59787091399ba149d9dc852558073dbe11cf31774a](https://testnet.cyberscan.co/tx/0xa4e926e7253ba2a875445b59787091399ba149d9dc852558073dbe11cf31774a)
- [0x02f49e8ea56707d18617af0e915b33056a7c8f7c0a104acda61e7f48140f5c87](https://testnet.cyberscan.co/tx/0x02f49e8ea56707d18617af0e915b33056a7c8f7c0a104acda61e7f48140f5c87)
- [0x003ec164330bee7d29d2de43a7368ab21450eac3e8b7e122d49a91f70e6499a6](https://testnet.cyberscan.co/tx/0x003ec164330bee7d29d2de43a7368ab21450eac3e8b7e122d49a91f70e6499a6)
- [0x958ca5a27eb184fc5f219cf673b39027dc7bc8e87d711feee92275561ad6d15b](https://testnet.cyberscan.co/tx/0x958ca5a27eb184fc5f219cf673b39027dc7bc8e87d711feee92275561ad6d15b)

## Usage
-----

1.  **Start Mining**:
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

TODO
------------

- [Contracts] Make ERC1155 ids, ERC20
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