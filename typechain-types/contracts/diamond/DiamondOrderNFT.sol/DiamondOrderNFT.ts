/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */
import type {
  BaseContract,
  BigNumberish,
  BytesLike,
  FunctionFragment,
  Interface,
  AddressLike,
  ContractRunner,
  ContractMethod,
  Listener,
} from "ethers";
import type {
  TypedContractEvent,
  TypedDeferredTopicFilter,
  TypedEventLog,
  TypedListener,
} from "../../../common";

export type DiamondOrderNFTArgsStruct = {
  _orderbook: AddressLike;
  _name: string;
  _symbol: string;
  _svg: AddressLike;
  _app: AddressLike;
};

export type DiamondOrderNFTArgsStructOutput = [
  _orderbook: string,
  _name: string,
  _symbol: string,
  _svg: string,
  _app: string
] & {
  _orderbook: string;
  _name: string;
  _symbol: string;
  _svg: string;
  _app: string;
};

export declare namespace IDiamond {
  export type FacetCutStruct = {
    facetAddress: AddressLike;
    action: BigNumberish;
    functionSelectors: BytesLike[];
  };

  export type FacetCutStructOutput = [
    facetAddress: string,
    action: bigint,
    functionSelectors: string[]
  ] & { facetAddress: string; action: bigint; functionSelectors: string[] };
}

export interface DiamondOrderNFTInterface extends Interface {}

export interface DiamondOrderNFT extends BaseContract {
  connect(runner?: ContractRunner | null): DiamondOrderNFT;
  waitForDeployment(): Promise<this>;

  interface: DiamondOrderNFTInterface;

  queryFilter<TCEvent extends TypedContractEvent>(
    event: TCEvent,
    fromBlockOrBlockhash?: string | number | undefined,
    toBlock?: string | number | undefined
  ): Promise<Array<TypedEventLog<TCEvent>>>;
  queryFilter<TCEvent extends TypedContractEvent>(
    filter: TypedDeferredTopicFilter<TCEvent>,
    fromBlockOrBlockhash?: string | number | undefined,
    toBlock?: string | number | undefined
  ): Promise<Array<TypedEventLog<TCEvent>>>;

  on<TCEvent extends TypedContractEvent>(
    event: TCEvent,
    listener: TypedListener<TCEvent>
  ): Promise<this>;
  on<TCEvent extends TypedContractEvent>(
    filter: TypedDeferredTopicFilter<TCEvent>,
    listener: TypedListener<TCEvent>
  ): Promise<this>;

  once<TCEvent extends TypedContractEvent>(
    event: TCEvent,
    listener: TypedListener<TCEvent>
  ): Promise<this>;
  once<TCEvent extends TypedContractEvent>(
    filter: TypedDeferredTopicFilter<TCEvent>,
    listener: TypedListener<TCEvent>
  ): Promise<this>;

  listeners<TCEvent extends TypedContractEvent>(
    event: TCEvent
  ): Promise<Array<TypedListener<TCEvent>>>;
  listeners(eventName?: string): Promise<Array<Listener>>;
  removeAllListeners<TCEvent extends TypedContractEvent>(
    event?: TCEvent
  ): Promise<this>;

  getFunction<T extends ContractMethod = ContractMethod>(
    key: string | FunctionFragment
  ): T;

  filters: {};
}
