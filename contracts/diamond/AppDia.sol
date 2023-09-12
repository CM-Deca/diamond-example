// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

 import { LibDiamond } from "../storage/LibDiamond.sol";
 import { IDiamondCut } from "../interfaces/IDiamondCut.sol";
// import { IDiamondLoupe } from  "./interfaces/IDiamondLoupe.sol";
// import { IERC173 } from "./interfaces/IERC173.sol";
// import { IERC165} from "./interfaces/IERC165.sol";

// When no function exists for function called
error FunctionNotFound(bytes4 _functionSelector);

// 다이아몬드 생성자 초기화에 사용되는 변수
struct DiamondArgs {
    address owner;
    address init;
    bytes initCalldata;
}

contract AppDia {    

    constructor(IDiamondCut.FacetCut[] memory _diamondCut, DiamondArgs memory _args) payable {
        // 기능추가할 facets , init 주소, init 에 사용할 인터페이스
        LibDiamond.diamondCut(_diamondCut, _args.init, _args.initCalldata); 
        LibDiamond.DiamondStorage storage ds = LibDiamond.getStorage();
        ds.name = "asd";
        // 생성할때 작업 추가하거나 상태 변수 설정 여기서하면됨
    }

    // 호출된 함수에 facet을 찾아서 함수를 실행후 값 반환
    fallback() external payable {
        LibDiamond.DiamondStorage storage ds;
        bytes32 position = LibDiamond.DIAMOND_STORAGE_POSITION;
        // get diamond storage
        assembly {
            ds.slot := position
        }
        // msg.sig == 호출한 함수의 4바이트 셀렉터
        address facet = ds.facetAddressAndSelectorPosition[msg.sig].facetAddress;
        if(facet == address(0)) {
            revert FunctionNotFound(msg.sig);
        }
        // facet 함수 실행및 결과값 리턴
        assembly {
            // 전송된 args 변수들 복사
            calldatacopy(0, 0, calldatasize())
             // 함수 delegate call 
            let result := delegatecall(gas(), facet, 0, calldatasize(), 0, 0)
            // 결과값 복사 
            returndatacopy(0, 0, returndatasize())
            // return any return value or error back to the caller
            switch result
                case 0 {
                    revert(0, returndatasize())
                }
                default {
                    return(0, returndatasize())
                }
        }
    }

    receive() external payable {}
}
