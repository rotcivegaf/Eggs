import { config, chainId } from './store';
import { readContract, writeContract, multicall, watchContractEvent } from '@wagmi/core';
import { get } from 'svelte/store';

import { parseAbi } from 'viem'

const CYBER_EGGS = '0x3ec5c0a31d779cded116741bc3e0f2713e39ca14';

const abi = parseAbi([
    'function usersHash(address user) view returns (bytes32)',
    'function mintBatch(address to, uint256[] nonces) external'
]);


export async function getSalt(user) {
    const data = await readContract(get(config), {
        address: CYBER_EGGS,
        abi,
        functionName: 'usersHash',
        args: [user],
        blockTag: 'latest',
    });

    return data;
}

export async function mintBatch(user, nonces) {
    const data = await writeContract(get(config), {
        address: CYBER_EGGS,
        abi,
        functionName: 'mintBatch',
        args: [user, nonces],
        //blockTag: 'latest',
    });

    return data;
}