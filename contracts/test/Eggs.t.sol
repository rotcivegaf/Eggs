// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {Eggs} from "../src/Eggs.sol";

contract EggsTest is Test {
    Eggs eggs;

    address owner = address(0xFF);
    address user = 0x889558Ea3C7b58b544EB17a6Fc04044547837a77;

    function setUp() public {
        vm.prank(owner);
        eggs = new Eggs(2);
    }

    function test_constructor() public view {
        assertEq(eggs.owner(), owner);
    }

    function test_mintBatch_four_ids_1() public {
        uint256[] memory nonces = new uint256[](8);

        nonces[0] = 0x0000000000000000000000000000000000000000000000000000310159a737c8; // 3 zeros
        nonces[1] = 0x00000000000000000000000000000000000000000000000000000bc6e541bf7b; // 3 zeros
        nonces[2] = 0x000000000000000000000000000000000000000000000000000003fc5d630f92; // 3 zeros
        nonces[3] = 0x00000000000000000000000000000000000000000000000000004688655ff8cf; // 3 zeros
        nonces[4] = 0x0000000000000000000000000000000000000000000000000000000000000001; // non-zeros
        nonces[5] = 0; // non-zeros
        nonces[6] = 0x0000000000000000000000000000000000000000000000000000000000000003; // non-zeros
        nonces[7] = 0x0000000000000000000000000000000000000000000000000000000000000002; // non-zeros

        vm.prank(user);
        eggs.mintBatch(
            user,
            nonces
        );

        assertEq(eggs.balanceOf(user, 0), 1);
        assertEq(eggs.balanceOf(user, 1), 0);
        assertEq(eggs.balanceOf(user, 2), 0);
        assertEq(eggs.balanceOf(user, 4), 0);
    }
}
