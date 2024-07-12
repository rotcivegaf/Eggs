const {
  keccak256, encodePacked, createWalletClient, createPublicClient, http, getContract, numberToHex,
  defineChain
} = require('viem');
const { privateKeyToAccount } = require('viem/accounts');

const cyberTestnet = defineChain({
  id: 111557560,
  name: 'Cyber Testnet',
  nativeCurrency: {
    decimals: 18,
    name: 'Ether',
    symbol: 'ETH',
  },
  rpcUrls: {
    default: {
      http: ['https://cyber-testnet.alt.technology/'],
      webSocket: ['wss://cyber-testnet.alt.technology/'],
    },
  },
  blockExplorers: {
    default: { name: 'Explorer', url: 'https://testnet.cyberscan.co/' },
  },
});

const USER ='0x889558Ea3C7b58b544EB17a6Fc04044547837a77';
const Eggs = '0xc54ae1172a7e671002c3bf73c8d75e54c9d2effe';

const PUBLIC_CLIENT = createPublicClient({
  chain: cyberTestnet,
  transport: http()
});
const eggs = getContract({
  address: Eggs,
  abi: require('./ABI_Eggs.json'),
  // 1a. Insert a single client
  client: PUBLIC_CLIENT,
  // 1b. Or public and/or wallet clients
  client: { public: PUBLIC_CLIENT, walletClient: PUBLIC_CLIENT }
})

main();

async function main() {
  const minZeros = await eggs.read.minZeros();
  const userHash = await eggs.read.usersHash([USER]);

  // Mine some eggs
  const salts = mine(minZeros, USER, userHash, 0, 1);

  console.log(salts);
}

function checkSalts(to, userHash, salts) {
  const amounts = new Array(TYPES.length).fill(0);
  for(let i = 0; i < salts.length; i++) {
    let message = encodePacked(
      ['address', 'bytes32', 'uint256'],
      [to, userHash, salts[i]]
    );

    const zeros = countLeadingZeros(keccak256(message));
    if (zeros > TYPES[TYPES.length - 1]) zeros = TYPES[TYPES.length - 1];
    amounts[TYPES.findIndex(x => x == zeros)]++;
  }
  const ids = amounts.map((a, i) => { if(a != 0) return i; }).filter(x => x != undefined);
  const filterAmounts = amounts.map(a => { if(a != 0) return a; }).filter(x => x != undefined);

  return { ids, amounts: filterAmounts };
}

function countLeadingZeros(hash) {
  hash = hash.slice(2);
  let count = 0;
  for (let i = 0; i < hash.length; i++) {
    if (hash[i] === '0') {
      count++;
    } else {
      return count;
    }
  }
}


// Miner

function mine(minZeros, to, userHash, maxZerosType, amount) {
  const startArr = 32 + 20 + 32 + 20 + 32; // 'uint256', 'address', 'bytes32', 'address', 'uint256'
  const salts = [];

  let n = 0;
  let startTimestamp = +Date.now();
  //let salt = numberToHex(Math.floor(Math.random() * 1e10), { size: 32 });
  for (let i = 0; i < amount; i++) {
    while(true) {
      const salt = numberToHex(Math.floor(Math.random() * 1e14), { size: 32 });

      //abi.encodePacked(block.chainid, msg.sender, usersHash[to], to, i, nonces)
      let message = encodePacked(
        ['uint256', 'address', 'bytes32', 'address', 'uint256', 'bytes32'],
        [cyberTestnet.id, USER, userHash, to, i, salt]
      );
      const hash = keccak256(message);

      if(n % 10000 == 0) {
        //console.log(n, hash);
        // hash rate
        //console.log('hash rate 10k in', ((+Date.now() - startTimestamp)), 'ms');
        startTimestamp = +Date.now();
      }
      const zeros = countLeadingZeros(hash);
      if(zeros >= minZeros) {
          //console.log(`0x${toHexString(message)}`);

          //console.log("seed:", `0x${toHexString(message.slice(-32))}`);
          //console.log("hash:", hash);
          //salts.push("0x" + toHexString(message.slice(startArr)));

          if(zeros >= maxZerosType) {
            console.log("hash:", hash);
            salts.push(salt);
            break;
          }
      };
      message[startArr + (n & 31)] = (Math.random() * 256) | 0;
      n++;
    }
  }

  return salts;
}