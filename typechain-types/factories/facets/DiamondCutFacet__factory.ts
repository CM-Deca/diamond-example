/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */
import {
  Contract,
  ContractFactory,
  ContractTransactionResponse,
  Interface,
} from "ethers";
import type { Signer, ContractDeployTransaction, ContractRunner } from "ethers";
import type { NonPayableOverrides } from "../../common";
import type {
  DiamondCutFacet,
  DiamondCutFacetInterface,
} from "../../facets/DiamondCutFacet";

const _abi = [
  {
    inputs: [
      {
        internalType: "bytes4",
        name: "_selector",
        type: "bytes4",
      },
    ],
    name: "CannotAddFunctionToDiamondThatAlreadyExists",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "bytes4[]",
        name: "_selectors",
        type: "bytes4[]",
      },
    ],
    name: "CannotAddSelectorsToZeroAddress",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "bytes4",
        name: "_selector",
        type: "bytes4",
      },
    ],
    name: "CannotRemoveFunctionThatDoesNotExist",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "bytes4",
        name: "_selector",
        type: "bytes4",
      },
    ],
    name: "CannotRemoveImmutableFunction",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "bytes4",
        name: "_selector",
        type: "bytes4",
      },
    ],
    name: "CannotReplaceFunctionThatDoesNotExists",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "bytes4",
        name: "_selector",
        type: "bytes4",
      },
    ],
    name: "CannotReplaceFunctionWithTheSameFunctionFromTheSameFacet",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "bytes4[]",
        name: "_selectors",
        type: "bytes4[]",
      },
    ],
    name: "CannotReplaceFunctionsFromFacetWithZeroAddress",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "bytes4",
        name: "_selector",
        type: "bytes4",
      },
    ],
    name: "CannotReplaceImmutableFunction",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "uint8",
        name: "_action",
        type: "uint8",
      },
    ],
    name: "IncorrectFacetCutAction",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_initializationContractAddress",
        type: "address",
      },
      {
        internalType: "bytes",
        name: "_calldata",
        type: "bytes",
      },
    ],
    name: "InitializationFunctionReverted",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_contractAddress",
        type: "address",
      },
      {
        internalType: "string",
        name: "_message",
        type: "string",
      },
    ],
    name: "NoBytecodeAtAddress",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_facetAddress",
        type: "address",
      },
    ],
    name: "NoSelectorsProvidedForFacetForCut",
    type: "error",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_facetAddress",
        type: "address",
      },
    ],
    name: "RemoveFacetAddressMustBeZeroAddress",
    type: "error",
  },
  {
    anonymous: false,
    inputs: [
      {
        components: [
          {
            internalType: "address",
            name: "facetAddress",
            type: "address",
          },
          {
            internalType: "enum IDiamond.FacetCutAction",
            name: "action",
            type: "uint8",
          },
          {
            internalType: "bytes4[]",
            name: "functionSelectors",
            type: "bytes4[]",
          },
        ],
        indexed: false,
        internalType: "struct IDiamond.FacetCut[]",
        name: "_diamondCut",
        type: "tuple[]",
      },
      {
        indexed: false,
        internalType: "address",
        name: "_init",
        type: "address",
      },
      {
        indexed: false,
        internalType: "bytes",
        name: "_calldata",
        type: "bytes",
      },
    ],
    name: "DiamondCut",
    type: "event",
  },
  {
    inputs: [
      {
        components: [
          {
            internalType: "address",
            name: "facetAddress",
            type: "address",
          },
          {
            internalType: "enum IDiamond.FacetCutAction",
            name: "action",
            type: "uint8",
          },
          {
            internalType: "bytes4[]",
            name: "functionSelectors",
            type: "bytes4[]",
          },
        ],
        internalType: "struct IDiamond.FacetCut[]",
        name: "_diamondCut",
        type: "tuple[]",
      },
      {
        internalType: "address",
        name: "_init",
        type: "address",
      },
      {
        internalType: "bytes",
        name: "_calldata",
        type: "bytes",
      },
    ],
    name: "diamondCut",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
] as const;

const _bytecode =
  "0x6080806040523461001657610db8908161001c8239f35b600080fdfe6080604052600436101561001257600080fd5b6000803560e01c631f931c1c1461002857600080fd5b346100b15760603660031901126100b15760043567ffffffffffffffff8082116100ad57366023830112156100ad578160040135918183116100a9573660248460051b830101116100a95761007b6100b4565b6044359283116100a5576100a29361009960249436906004016100e3565b949093016101f7565b80f35b8480fd5b8380fd5b8280fd5b80fd5b602435906001600160a01b03821682036100ca57565b600080fd5b35906001600160a01b03821682036100ca57565b9181601f840112156100ca5782359167ffffffffffffffff83116100ca57602083818601950101116100ca57565b634e487b7160e01b600052604160045260246000fd5b604051906060820182811067ffffffffffffffff82111761014757604052565b610111565b604051906040820182811067ffffffffffffffff82111761014757604052565b6040519190601f01601f1916820167ffffffffffffffff81118382101761014757604052565b67ffffffffffffffff81116101475760051b60200190565b67ffffffffffffffff811161014757601f01601f191660200190565b9291926101da6101d5836101aa565b61016c565b93828552828201116100ca57816000926020928387013784010152565b94939092946102086101d585610192565b9081948083526020809301600591821b8301923684116100ca5780915b84831061024a5750505050505061024893946102429136916101c6565b916104df565b565b67ffffffffffffffff83358181116100ca5783016060813603126100ca57610270610127565b9161027a826100cf565b83528882013560038110156100ca5789840152604091828101359182116100ca57019036601f830112156100ca5781356102b66101d582610192565b928a808584815201928a1b820101903682116100ca57908b809694929795939701905b8082106102f3575050849550820152815201920191610225565b91939550919395823563ffffffff60e01b811681036100ca57818d92918392520192018b959391969492966102d9565b634e487b7160e01b600052601160045260246000fd5b60001981146103485760010190565b610323565b634e487b7160e01b600052603260045260246000fd5b80518210156103775760209160051b010190565b61034d565b6003111561038657565b634e487b7160e01b600052602160045260246000fd5b5160038110156103865790565b919082519283825260005b8481106103d5575050826000602080949584010152601f8019910116010190565b6020818301810151848301820152016103b4565b93929093606092838201848352865180915260809485840191868160051b860101966020809a01936000915b83831061044a5750505050505061043a90610447959683019060018060a01b03169052565b60408184039101526103a9565b90565b909192939498607f198882030183528951908681019060018060a01b0383511681528d830151600381101561038657848f9493928592838201528a604080960151958201528451809452019201906000905b8082106104bb5750505090806001929b01930193019194939290610415565b82516001600160e01b03191684528f9493840193909201916001919091019061049c565b92909160005b84518110156105f6576040806104fb8388610363565b5101519061051a61050c8489610363565b51516001600160a01b031690565b908251156105d4576105386020610531868b610363565b510161039c565b906105428261037c565b8161056157505061055c9291610557916107aa565b610339565b6104e5565b61056a8261037c565b6001820361058257505061055c929161055791610945565b61058b8261037c565b600282036105a357505061055c929161055791610add565b6105d092506105b18261037c565b51633ff4d20f60e11b815260ff90911660048201529081906024820190565b0390fd5b5163e767f91f60e01b81526001600160a01b0391909116600482015260249150fd5b509092917f8faa70878671ccd212d20771b795c50af8fd3ff6cf27f4bde57e5d4de0aeb673816102489461063085604051938493846103e9565b0390a1610ca5565b6020908160408183019282815285518094520193019160005b82811061065f575050505090565b83516001600160e01b03191685529381019392810192600101610651565b610685610127565b906024825263636f646560e01b6040837f4c69624469616d6f6e644375743a2041646420666163657420686173206e6f2060208201520152565b63ffffffff60e01b166000527fc8fcad8db84d3cc18b4c41d551ea0ee66dd599cde068d998e57d5e09332c131c602052604060002090565b90600080516020610d63833981519152805483101561037757600052601c8260031c7fc0d727610ea16241eff4447d08bb1b4595f7d2ec4515282437a13b7d0df4b922019260021b1690565b600080516020610d638339815191529081549168010000000000000000831015610147578261077a916001610248950190556106f7565b90919063ffffffff83549160031b9260e01c831b921b1916179055565b61ffff8091169081146103485760010190565b91906001600160a01b038316156108e257600080516020610d638339815191525461ffff16906107e16107db61067d565b85610d23565b6000915b81518310156108db576108096107fb8484610363565b516001600160e01b03191690565b610831610825610818836106bf565b546001600160a01b031690565b6001600160a01b031690565b6108b7576108b1916108a66108ab926108a161084b61014c565b6001600160a01b038b16815261ffff8516602082015261086a836106bf565b8151815460209093015161ffff60a01b60a09190911b166001600160b01b03199093166001600160a01b0390911617919091179055565b610743565b610797565b92610339565b916107e5565b60405163ebbf5d0760e01b81526001600160e01b0319919091166004820152602490fd5b5050509050565b6040516302b8da0760e21b81529081906105d09060048301610638565b610907610127565b906028825267206e6f20636f646560c01b6040837f4c69624469616d6f6e644375743a205265706c6163652066616365742068617360208201520152565b6001600160a01b03811692918315610a40576109686109626108ff565b83610d23565b60005b81518110156108db576109816107fb8284610363565b610990610825610818836106bf565b308114610a1e578681146109fc57156109d85790610557846109b46109d3946106bf565b80546001600160a01b0319166001600160a01b03909216919091179055565b61096b565b604051637479f93960e01b81526001600160e01b0319919091166004820152602490fd5b604051631ac6ce8d60e11b81526001600160e01b031983166004820152602490fd5b604051632901806d60e11b81526001600160e01b031983166004820152602490fd5b60405163cd98a96f60e01b81529081906105d09060048301610638565b9061ffff610a6961014c565b92546001600160a01b038116845260a01c166020830152565b8015610348576000190190565b600080516020610d6383398151915280548015610ac7576000190190610ab4826106f7565b63ffffffff82549160031b1b1916905555565b634e487b7160e01b600052603160045260246000fd5b600080516020610d63833981519152549291906001600160a01b038116610c605750600090815b81518110156108db57610b1a6107fb8284610363565b94610b2c610b27876106bf565b610a5d565b8051909190610b43906001600160a01b0316610825565b15610c3e5781513090610b5e906001600160a01b0316610825565b14610c1c57610ba2602097610ba89493610b788894610a82565b998a91018161ffff610b8c835161ffff1690565b1603610bad575b5050610b9d610a8f565b6106bf565b55610339565b610b04565b610bf6610bf0610bcf610bc2610c15956106f7565b90549060031b1c60e01b90565b92610be88461077a610be3845161ffff1690565b6106f7565b5161ffff1690565b916106bf565b805461ffff60a01b191660a09290921b61ffff60a01b16919091179055565b8838610b93565b604051630df5fd6160e31b81526001600160e01b031988166004820152602490fd5b604051637a08a22d60e01b81526001600160e01b031988166004820152602490fd5b60405163d091bc8160e01b81526001600160a01b03919091166004820152602490fd5b6001600160a01b039091168152604060208201819052610447929101906103a9565b906001600160a01b03821615610d1f57600080825160208401855af4913d15610d17573d92610cd66101d5856101aa565b9384523d6000602086013e5b15610cec57505050565b825115610cfb57825160208401fd5b6105d060405192839263192105d760e01b845260048401610c83565b606092610ce2565b5050565b803b15610d2e575050565b6040805163919834b960e01b81526001600160a01b03909216600483015260248201529081906105d09060448301906103a956fec8fcad8db84d3cc18b4c41d551ea0ee66dd599cde068d998e57d5e09332c131da26469706673582212206c4d57efb4c9ffc55d105a7fdab75b90c461a0ad1f15d3a14b106decf703c7ff64736f6c63430008130033";

type DiamondCutFacetConstructorParams =
  | [signer?: Signer]
  | ConstructorParameters<typeof ContractFactory>;

const isSuperArgs = (
  xs: DiamondCutFacetConstructorParams
): xs is ConstructorParameters<typeof ContractFactory> => xs.length > 1;

export class DiamondCutFacet__factory extends ContractFactory {
  constructor(...args: DiamondCutFacetConstructorParams) {
    if (isSuperArgs(args)) {
      super(...args);
    } else {
      super(_abi, _bytecode, args[0]);
    }
  }

  override getDeployTransaction(
    overrides?: NonPayableOverrides & { from?: string }
  ): Promise<ContractDeployTransaction> {
    return super.getDeployTransaction(overrides || {});
  }
  override deploy(overrides?: NonPayableOverrides & { from?: string }) {
    return super.deploy(overrides || {}) as Promise<
      DiamondCutFacet & {
        deploymentTransaction(): ContractTransactionResponse;
      }
    >;
  }
  override connect(runner: ContractRunner | null): DiamondCutFacet__factory {
    return super.connect(runner) as DiamondCutFacet__factory;
  }

  static readonly bytecode = _bytecode;
  static readonly abi = _abi;
  static createInterface(): DiamondCutFacetInterface {
    return new Interface(_abi) as DiamondCutFacetInterface;
  }
  static connect(
    address: string,
    runner?: ContractRunner | null
  ): DiamondCutFacet {
    return new Contract(address, _abi, runner) as unknown as DiamondCutFacet;
  }
}
