import { Web3, defaultEvmStores } from "svelte-web3";

let web3;

if (typeof window !== "undefined" && typeof window.ethereum !== "undefined") {
  web3 = new Web3(window.ethereum);
} else {
  web3 = new Web3(
    "https://rinkeby.infura.io/v3/c6f54b615e024f2ab3a1c065accc087c"
  );
}

export default web3;
