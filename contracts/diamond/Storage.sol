// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

 import { IDiamond } from "../interfaces/IDiamond.sol";
 import { IDiamondCut } from "../interfaces/IDiamondCut.sol";

library Storage {
    bytes32 constant key = keccak256('coinmeca.market.storage');

    struct Props {
        address contracts;
    }

    function load() internal pure returns (Props storage s) {
        bytes32 __ = key;
        assembly {
            s.slot := __
        }
    }

    // function market(address _base, address _quote) internal pure returns (address) {
    //     return load().market[_base][_quote] = _addr;
    // }

    function push(address addr) internal pure {
        Props storage s = load();
        s.contracts = addr;
    }

    bytes32 constant privateKey = keccak256('coinmeca.market.private.storage');

    struct Facet {
        address facet;
        uint16 position;
    }

    struct Private {
        address owner;
        mapping(bytes4 => Facet) facet;
        bytes4[] functs;
        mapping(bytes4 => bool) interfaces;
    }

    function _this() internal pure returns (Private storage s) {
        bytes32 __ = privateKey;
        assembly {
            s.slot := __
        }
    }

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function setContractOwner(address _owner) internal {
        Private storage s = _this();
        emit OwnershipTransferred(s.owner, _owner);
        s.owner = _owner;
    }

    function owner() internal view returns (address _owner) {
        _owner = _this().owner;
    }

    function enforceIsContractOwner() internal view {
        if (msg.sender != _this().owner) {
            revert ('a');
        }
    }

    event DiamondCut(IDiamondCut.FacetCut[] _diamondCut, address _init, bytes _calldata);

    // Internal function version of diamondCut
    function diamondCut(IDiamondCut.FacetCut[] memory _diamondCut, address _init) internal {
        for (uint i; i < _diamondCut.length; ++i) {
            bytes4[] memory functs = _diamondCut[i].functionSelectors;
            address facet = _diamondCut[i].facetAddress;
            if (functs.length == 0) {
                revert('a');
            }
            IDiamondCut.FacetCutAction action = _diamondCut[i].action;
            if (action == IDiamond.FacetCutAction.Add) {
                addFunctions(facet, functs);
            } else if (action == IDiamond.FacetCutAction.Replace) {
                replaceFunctions(facet, functs);
            } else if (action == IDiamond.FacetCutAction.Remove) {
                removeFunctions(facet, functs);
            } else {
                revert('s');
            }
        }
       // emit DiamondCut(_diamondCut, _init, _calldata);
       // initializeDiamondCut(_init, _calldata);
    }

    function addFunctions(address _facet, bytes4[] memory _funct) internal {
        if (_facet == address(0)) {
            revert('s');
        }
        Private storage s = _this();
        uint16 position = uint16(s.functs.length);
        enforceHasContractCode(_facet, 'LibDiamondCut: Add facet has no code');
        for (uint i; i < _funct.length; ++i) {
            bytes4 funct = _funct[i];
            address facet = s.facet[funct].facet;
            if (facet != address(0)) {
                revert('s');
            }
            s.facet[funct] = Facet(_facet, position);
            s.functs.push(funct);
            ++position;
        }
    }

    function replaceFunctions(address _facet, bytes4[] memory _funct) internal {
        Private storage s = _this();
        if (_facet == address(0)) {
            revert('a');
        }
        enforceHasContractCode(_facet, 'LibDiamondCut: Replace facet has no code');
        for (uint i; i < _funct.length; ++i) {
            bytes4 funct = _funct[i];
            address facet = s.facet[funct].facet;
            // can't replace immutable functions -- functions defined directly in the diamond in this case
            if (facet == address(this)) {
                revert('a');
            }
            if (facet == _facet) {
                revert ('a');
            }
            if (facet == address(0)) {
                revert ('a');
            }
            // replace old facet address
            s.facet[funct].facet = _facet;
        }
    }

    function removeFunctions(address _facet, bytes4[] memory _funct) internal {
        Private storage s = _this();
        uint position = s.functs.length;
        if (_facet != address(0)) {
            revert ('a');
        }
        for (uint i; i < _funct.length; ++i) {
            bytes4 funct = _funct[i];
            Facet memory old = s.facet[funct];
            if (old.facet == address(0)) {
                revert ('a');
            }

            // can't remove immutable functions -- functions defined directly in the diamond
            if (old.facet == address(this)) {
                revert ('a');
            }
            // replace funct with last funct
            --position;
            if (old.position != position) {
                bytes4 last = s.functs[position];
                s.functs[old.position] = last;
                s.facet[last].position = old.position;
            }
            // delete last funct
            s.functs.pop();
            delete s.facet[funct];
        }
    }

    function initializeDiamondCut(address _init, bytes memory _calldata) internal {
        if (_init == address(0)) {
            return;
        }
        enforceHasContractCode(_init, 'LibDiamondCut: _init address has no code');
        (bool success, bytes memory error) = _init.delegatecall(_calldata);
        if (!success) {
            if (error.length > 0) {
                // bubble up error
                /// @solidity memory-safe-assembly
                assembly {
                    let returndata_size := mload(error)
                    revert(add(32, error), returndata_size)
                }
            } else {
                revert ('a');
            }
        }
    }

    function enforceHasContractCode(address _contract, string memory _errorMessage) internal view {
        uint size;
        assembly {
            size := extcodesize(_contract)
        }
        if (size == 0) {
            revert ('a');
        }
    }
}
