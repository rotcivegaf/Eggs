// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Owned } from "solmate/auth/Owned.sol";
import {ERC403} from "ERC403/ERC403.sol";
interface IUriContract {
    function uri(uint256 id) external view returns (string memory);
}

contract Eggs is ERC403, Owned {
    event SetUriContract(IUriContract uriContract);
    event SetMinZeros(uint256 minZeros);
    event ApproveToMint(address sender, address minter, bool value);

    bytes32 constant private F = 0xF000000000000000000000000000000000000000000000000000000000000000;
    string public name = "Eggs";
    string public symbol = "EGGS";

    uint256 public minZeros;
    IUriContract public uriContract;

    mapping(address => mapping(address => bool)) public isApprovedToMint;
    mapping(address => bytes32) public usersHash;

    constructor (uint256 _minZeros) Owned(msg.sender) {
        require(_minZeros < 64, "Too much zeros");
        minZeros = _minZeros;
        emit SetMinZeros(_minZeros);
    }

    function setMinZeros(uint256 _minZeros) external onlyOwner {
        require(_minZeros < 64, "Too much zeros");
        minZeros = _minZeros;
        emit SetMinZeros(_minZeros);
    }

    function setUriContract(IUriContract _uriContract) external onlyOwner {
        uriContract = _uriContract;
        emit SetUriContract(_uriContract);
    }

    function uri(uint256 id) public override view returns (string memory) {
        return uriContract.uri(id);
    }

    function approveToMint(address minter, bool value) external {
        isApprovedToMint[msg.sender][minter] = value;
        emit ApproveToMint(msg.sender, minter, value);
    }

    function mintBatch(
        address to,
        uint256[] calldata nonces
    ) external {
        require(msg.sender == to || isApprovedToMint[to][msg.sender], "Sender it's not approved");

        uint256 noncesLength = nonces.length;
        uint256[] memory amounts = new uint256[](64);
        uint256 prevNonce;

        for (uint256 i; i < noncesLength;) {
            uint256 nonce = nonces[i];
            require(prevNonce < nonce, "Nonces should be order");
            prevNonce = nonce;

            uint256 zeros = _countZeros(
                keccak256(
                    abi.encodePacked(to, usersHash[to], nonce)
                )
            );
            unchecked {
                if (zeros >= minZeros) {
                    ++amounts[zeros];
                }
                ++i;
            }
        }

        usersHash[to] = blockhash(block.number - 1);

        uint256 amountsLength = amounts.length;
        for (uint256 i = minZeros; i < amountsLength; ++i) {
            if (amounts[i] == 0) continue;
            _mint(
                to,
                i - minZeros,
                amounts[i],
                ""
            );
        }
    }

    function _countZeros(bytes32 hash) private pure returns(uint256 zeros) {
        unchecked {
            for (uint256 i; i < 64; ++i) {
                uint256 shiftBits = i * 4;

                if (hash << shiftBits & F == 0) {
                    ++zeros;
                } else {
                    return zeros;
                }
            }
        }
    }
}
