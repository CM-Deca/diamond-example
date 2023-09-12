// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import { OrderNFTStorage } from "../storage/OrderNFTStorage.sol";
import { IDiamondCut } from "../interfaces/IDiamondCut.sol";

error FunctionNotFound(bytes4 _functionSelector);
// 생성자 변수
struct DiamondOrderNFTArgs {
   address _orderbook;
   string _name;
   string _symbol;
   address _svg;
   address _app;
}


interface IOrderSVG {
    function get_svg(bytes32 _key, address _orderbook, string memory _market, address _app) external view returns (string memory);
}

contract DiamondOrderNFT {    

    constructor(IDiamondCut.FacetCut[] memory _diamondCut, DiamondOrderNFTArgs memory _args) {
        OrderNFTStorage.diamondCut(_diamondCut);
        OrderNFTStorage.DiamondStorage storage ds = OrderNFTStorage.getStorage();
        ds.orderbook = _args._orderbook;
        ds.svg = _args._svg;
        ds.app = _args._app;
        //(address b, address q, , , , , , ) = IOrderbook(orderbook).get_info();
        //market = string(abi.encodePacked(b.symbol(), '/', q.symbol())); //네이티브 토큰처리1
    }

    // 호출된 함수에 facet을 찾아서 함수를 실행후 값 반환
    fallback() external payable {
        OrderNFTStorage.DiamondStorage storage ds;
        bytes32 position = OrderNFTStorage.DIAMOND_STORAGE_POSITION;
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
