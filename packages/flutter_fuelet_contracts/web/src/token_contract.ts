import {Provider, Wallet} from "fuels";
import {TokenContractAbi, TokenContractAbi__factory} from "./types";

// DO NOT USE THIS PRIVATE KEY
// It's present here only for the purpose of reading data from blockchain, cause currently you
// must provide an instance of wallet to interact with smart contracts
const READ_WALLET_PRIVATE_KEY: string =
  "e5e05a4ab2919dc01b97c90a48853fd4dfbd204e92e44327375702ab09bb184e";

class TokenContract {
  private async create_contract(nodeUrl: string, contractId: string): Promise<TokenContractAbi> {
    const provider = await Provider.create(nodeUrl);
    const wallet = Wallet.fromPrivateKey(READ_WALLET_PRIVATE_KEY, provider);
    return TokenContractAbi__factory.connect(
      contractId,
      wallet
    );
  }

  async total_assets(
    nodeUrl: string,
    contractId: string
  ): Promise<number> {
    const contract = await this.create_contract(nodeUrl, contractId);
    const {value} = await contract.functions.total_assets().simulate();
    return value.toNumber();
  }

  async total_supply(
    nodeUrl: string,
    contractId: string,
    assetId: string
  ): Promise<number | undefined> {
    const contract = await this.create_contract(nodeUrl, contractId);
    const {value} = await contract.functions.total_supply({value: assetId}).simulate();
    return value?.toNumber();
  }

  async name(
    nodeUrl: string,
    contractId: string,
    assetId: string
  ): Promise<string | undefined> {
    const contract = await this.create_contract(nodeUrl, contractId);
    const {value} = await contract.functions.name({value: assetId}).simulate();
    // TODO: convert value to string once it's known how to do
    return value ? "Unknown" : undefined;
  }

  async symbol(
    nodeUrl: string,
    contractId: string,
    assetId: string
  ): Promise<string | undefined> {
    const contract = await this.create_contract(nodeUrl, contractId);
    const {value} = await contract.functions.symbol({value: assetId}).simulate();
    // TODO: convert value to string once it's known how to do
    return value ? "UNKN" : undefined;
  }

  async decimals(
    nodeUrl: string,
    contractId: string,
    assetId: string
  ): Promise<number | undefined> {
    const contract = await this.create_contract(nodeUrl, contractId);
    const {value} = await contract.functions.decimals({value: assetId}).simulate();
    return value;
  }

  // TODO: implement once it's known how to construct StringInput from string
  // async metadata(
  //   nodeUrl: string,
  //   contractId: string,
  //   assetId: string,
  //   key: string
  // ): Promise<number | undefined> {
  //   const a: StringInput
  //   const contract = await this.create_contract(nodeUrl, contractId);
  //   const {value} = await contract.functions.metadata({value: assetId}, key).simulate();
  //   return value;
  // }
}

function injectObject(target: object, obj: object, name: PropertyKey) {
  Object.defineProperty(target, name, {
    value: obj,
    writable: false,
    enumerable: true,
    configurable: false,
  });

  if (typeof document !== "undefined") {
    const loadedEvent = new CustomEvent(`${String(name)} loaded`, {
      detail: obj,
    });
    document.dispatchEvent(loadedEvent);
  }
}

injectObject(window, new TokenContract(), "flutter_fuelet_token_contract");
