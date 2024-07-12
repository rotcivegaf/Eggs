// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { ERC1155 } from "solmate/tokens/ERC1155.sol";
import { Owned } from "solmate/auth/Owned.sol";

interface IUriContract {
    function uri(uint256 id) external view returns (string memory);
}

contract Eggs is ERC1155, Owned {
    event SetUriContract(IUriContract uriContract);
    event SetMinZeros(uint256 minZeros);

    bytes32 constant private F = 0xF000000000000000000000000000000000000000000000000000000000000000;
    string public name = "Eggs";
    string public symbol = "EGGS";

    uint256 public minZeros;
    IUriContract public uriContract;

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

    function mintBatch(
        address to,
        uint256[] calldata nonces
    ) external {
        uint256 noncesLength = nonces.length;
        uint256[] memory amounts = new uint256[](64);

        for (uint256 i; i < noncesLength; ++i) {
            uint256 zeros = _countZeros(
                keccak256(
                    //abi.encodePacked(block.chainid, address(this), msg.sender, usersHash[to], to, i, nonces[i])
                    abi.encodePacked(to, usersHash[to], nonces[i])
                )
            );
            if (zeros >= minZeros) {
                ++amounts[zeros];
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
