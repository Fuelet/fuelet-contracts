import { Wallet, WalletUnlocked } from "fuels";
import { TokenContractAbi, TokenContractAbi__factory } from "./types";
import { TokenInitializeConfigOutput } from "./types/TokenContractAbi";

// DO NOT USE THIS PRIVATE KEY
// It's present here only for the purpose of reading data from blockchain, cause currently you
// must provide an instance of wallet to interact with smart contracts
const READ_WALLET_PRIVATE_KEY: string =
    "e5e05a4ab2919dc01b97c90a48853fd4dfbd204e92e44327375702ab09bb184e";

class TokenContract {
    private readonly wallet: WalletUnlocked;
    private readonly contractInstance: TokenContractAbi;

    constructor(nodeUrl: string, contractId: string) {
        this.wallet = Wallet.fromPrivateKey(READ_WALLET_PRIVATE_KEY, nodeUrl);
        this.contractInstance = TokenContractAbi__factory.connect(
            contractId,
            this.wallet
        );
    }

    async config(): Promise<TokenInitializeConfigOutput> {
        const { value } = await this.contractInstance.functions.config().get();
        return value;
    }
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

injectObject(window, TokenContract, "flutter_fuelet_token_contract");
