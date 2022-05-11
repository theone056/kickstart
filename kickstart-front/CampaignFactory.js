import web3 from "./web3";
import compiledFactory from "../ethereum/build/CampaignFactory.json";

const address = "0x571E4736f2a0962A0cebb8a3EB8eFD34b3d9E6A8";

const abi = compiledFactory.abi;

export default new web3.eth.Contract(abi, address);
