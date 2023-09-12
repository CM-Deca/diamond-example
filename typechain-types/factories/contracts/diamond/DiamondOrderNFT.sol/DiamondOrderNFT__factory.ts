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
import type { NonPayableOverrides } from "../../../../common";
import type {
  DiamondOrderNFT,
  DiamondOrderNFTInterface,
  IDiamond,
  DiamondOrderNFTArgsStruct,
} from "../../../../contracts/diamond/DiamondOrderNFT.sol/DiamondOrderNFT";

const _abi = [
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
        components: [
          {
            internalType: "address",
            name: "_orderbook",
            type: "address",
          },
          {
            internalType: "string",
            name: "_name",
            type: "string",
          },
          {
            internalType: "string",
            name: "_symbol",
            type: "string",
          },
          {
            internalType: "address",
            name: "_svg",
            type: "address",
          },
          {
            internalType: "address",
            name: "_app",
            type: "address",
          },
        ],
        internalType: "struct DiamondOrderNFTArgs",
        name: "_args",
        type: "tuple",
      },
    ],
    stateMutability: "nonpayable",
    type: "constructor",
  },
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
        internalType: "bytes4",
        name: "_functionSelector",
        type: "bytes4",
      },
    ],
    name: "FunctionNotFound",
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
    stateMutability: "payable",
    type: "fallback",
  },
  {
    stateMutability: "payable",
    type: "receive",
  },
] as const;

const _bytecode =
  "0x6080604052346108fa57610d118038038061001981610a4d565b92833960408282810103126108fa578151906001600160401b0382116108fa57808301601f8385010112156108fa57818301519261005e61005985610a72565b610a4d565b9360208582815201809484840160208460051b8387010101116108fa57602081850101915b60208460051b838701010183106108ff575050505060208101516001600160401b0381116108fa5781019160a08382840103126108fa576040519260a084016001600160401b03811185821017610357576040526100e081610a89565b845260208101516001600160401b0381116108fa5761010490838501908301610ac0565b60208501526040810151926001600160401b0384116108fa57610150936080936101349298969801908301610ac0565b604087015261014560608201610a89565b606087015201610a89565b60808401526000915b815183101561079357604061016e8484610b1f565b510151906001600160a01b036101848585610b1f565b5151169282511561077a57602061019b8683610b1f565b510151600381101561076457806103c55750831561039f5761ffff600080516020610cf18339815191525416916102106101d3610a2e565b602481527f4c69624469616d6f6e644375743a2041646420666163657420686173206e6f20602082015263636f646560e01b604082015286610bb7565b6000925b8451841015610385576001600160e01b03196102308587610b1f565b51166000818152600080516020610cd183398151915260205260409020546001600160a01b031661036d576102c6610266610a0f565b88815261ffff9390931660208085018281526000858152600080516020610cd183398151915290925260409091209451855491516001600160b01b03199092166001600160a01b03919091161760a09190911b61ffff60a01b1617909355565b600080516020610cf1833981519152549068010000000000000000821015610357576103279061030a600193848101600080516020610cf183398151915255610b87565b90919063ffffffff83549160031b9260e01c831b921b1916179055565b61ffff82146103415761033b910193610b10565b92610214565b634e487b7160e01b600052601160045260246000fd5b634e487b7160e01b600052604160045260246000fd5b6024906040519063ebbf5d0760e01b82526004820152fd5b509491509492506103969150610b10565b91929092610159565b6040516302b8da0760e21b815260206004820152806103c16024820186610b49565b0390fd5b939592939091906001810361053557508515610513576104276103e6610a2e565b602881527f4c69624469616d6f6e644375743a205265706c61636520666163657420686173602082015267206e6f20636f646560c01b604082015287610bb7565b60005b8451811015610503576001600160e01b03196104468287610b1f565b51166000818152600080516020610cd183398151915260205260409020546001600160a01b03163081146104ea578881146104d157156104b9576000908152600080516020610cd18339815191526020526040902080546001600160a01b031916881790556104b490610b10565b61042a565b60249060405190637479f93960e01b82526004820152fd5b604051631ac6ce8d60e11b815260048101839052602490fd5b604051632901806d60e11b815260048101839052602490fd5b5093909450610396919250610b10565b60405163cd98a96f60e01b815260206004820152806103c16024820187610b49565b929592600281036107485750600080516020610cf183398151915254928061073057506000925b8451841015610720576001600160e01b03196105788587610b1f565b51169384600052600080516020610cd183398151915260205260406000209461059f610a0f565b95546001600160a01b03811680885260a09190911c61ffff166020880152156107085785516001600160a01b031630146106f05782156103415760001980930180968161ffff60208301511603610675575b5050600080516020610cf18339815191525492831561065f57610659930161061881610b87565b63ffffffff82549160031b1b19169055600080516020610cf183398151915255600052600080516020610cd183398151915260205260006040812055610b10565b9261055c565b634e487b7160e01b600052603160045260246000fd5b61ffff60206106866106e994610b87565b90549060031b1c60e01b926106a38461030a858585015116610b87565b01516001600160e01b03199092166000908152600080516020610cd183398151915260205260409020805461ffff60a01b19169190921660a01b61ffff60a01b16179055565b38806105f1565b60249060405190630df5fd6160e31b82526004820152fd5b60249060405190637a08a22d60e01b82526004820152fd5b5093909492506103969150610b10565b6024906040519063d091bc8160e01b82526004820152fd5b604051633ff4d20f60e11b815260ff9091166004820152602490fd5b634e487b7160e01b600052602160045260246000fd5b60405163e767f91f60e01b815260048101859052602490fd5b90915060405191602083019060208452518091526040830160408260051b850101929160005b81811061089a57867f2e97860c6f47eab0292d51fa3ceec7e373c62af1e7eb2a28ae82998b80de6cfd87870388a180517f47ad57f62d7b9f1ab5be70076cd57c3f556adb1350b2d9124c0974ac5948e05c80546001600160a01b03199081166001600160a01b039384161790915560608301517f47ad57f62d7b9f1ab5be70076cd57c3f556adb1350b2d9124c0974ac5948e05d80548316918416919091179055608092909201517f47ad57f62d7b9f1ab5be70076cd57c3f556adb1350b2d9124c0974ac5948e05b8054909316911617905560405160bb9081610c168239f35b858503603f19018352835180516001600160a01b031686526020810151949593949293919291906003831015610764576108ee82606060406020959460019787809701520151918160408201520190610b49565b960194019291016107b9565b600080fd5b82516001600160401b0381116108fa578286010160609081601f19828a8a010301126108fa57604051918083016001600160401b038111848210176109fa5760405261094d60208301610a89565b8352604082015160038110156108fa576020840152810151906001600160401b0382116108fa5701878701603f820112156108fa5760208101519061099461005983610a72565b91602083828152018a8a0160408360051b850101116108fa5760408301905b60408360051b85010182106109d957505050506040820152815260209283019201610083565b81516001600160e01b0319811681036108fa578152602091820191016109b3565b60246000634e487b7160e01b81526041600452fd5b60408051919082016001600160401b0381118382101761035757604052565b60405190606082016001600160401b0381118382101761035757604052565b6040519190601f01601f191682016001600160401b0381118382101761035757604052565b6001600160401b0381116103575760051b60200190565b51906001600160a01b03821682036108fa57565b60005b838110610ab05750506000910152565b8181015183820152602001610aa0565b81601f820112156108fa5780516001600160401b03811161035757610aee601f8201601f1916602001610a4d565b92818452602082840101116108fa57610b0d9160208085019101610a9d565b90565b60001981146103415760010190565b8051821015610b335760209160051b010190565b634e487b7160e01b600052603260045260246000fd5b90815180825260208080930193019160005b828110610b69575050505090565b83516001600160e01b03191685529381019392810192600101610b5b565b90600080516020610cf18339815191528054831015610b3357600052601c60206000208360031c019260021b1690565b803b15610bc2575050565b6040805163919834b960e01b81526001600160a01b039092166004830152602482015281516044820181905290916064918391610c0790829084860190602001610a9d565b601f01601f19168101030190fdfe60806040523615608357600080356001600160e01b0319168082527f47ad57f62d7b9f1ab5be70076cd57c3f556adb1350b2d9124c0974ac5948e05560205260408220546001600160a01b0316908115606f5750818091368280378136915af43d82803e15606b573d90f35b3d90fd5b630a82dd7360e31b60805260845260246080fd5b00fea264697066735822122017fa7053fbbe36d1bab7387898c118c10fffffdb23a3ce627adf97bd9cdccac064736f6c6343000813003347ad57f62d7b9f1ab5be70076cd57c3f556adb1350b2d9124c0974ac5948e05547ad57f62d7b9f1ab5be70076cd57c3f556adb1350b2d9124c0974ac5948e056";

type DiamondOrderNFTConstructorParams =
  | [signer?: Signer]
  | ConstructorParameters<typeof ContractFactory>;

const isSuperArgs = (
  xs: DiamondOrderNFTConstructorParams
): xs is ConstructorParameters<typeof ContractFactory> => xs.length > 1;

export class DiamondOrderNFT__factory extends ContractFactory {
  constructor(...args: DiamondOrderNFTConstructorParams) {
    if (isSuperArgs(args)) {
      super(...args);
    } else {
      super(_abi, _bytecode, args[0]);
    }
  }

  override getDeployTransaction(
    _diamondCut: IDiamond.FacetCutStruct[],
    _args: DiamondOrderNFTArgsStruct,
    overrides?: NonPayableOverrides & { from?: string }
  ): Promise<ContractDeployTransaction> {
    return super.getDeployTransaction(_diamondCut, _args, overrides || {});
  }
  override deploy(
    _diamondCut: IDiamond.FacetCutStruct[],
    _args: DiamondOrderNFTArgsStruct,
    overrides?: NonPayableOverrides & { from?: string }
  ) {
    return super.deploy(_diamondCut, _args, overrides || {}) as Promise<
      DiamondOrderNFT & {
        deploymentTransaction(): ContractTransactionResponse;
      }
    >;
  }
  override connect(runner: ContractRunner | null): DiamondOrderNFT__factory {
    return super.connect(runner) as DiamondOrderNFT__factory;
  }

  static readonly bytecode = _bytecode;
  static readonly abi = _abi;
  static createInterface(): DiamondOrderNFTInterface {
    return new Interface(_abi) as DiamondOrderNFTInterface;
  }
  static connect(
    address: string,
    runner?: ContractRunner | null
  ): DiamondOrderNFT {
    return new Contract(address, _abi, runner) as unknown as DiamondOrderNFT;
  }
}
