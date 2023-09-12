// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// import { LibDiamond } from "../libraries/LibDiamond.sol";
// import { IDiamondLoupe } from "../interfaces/IDiamondLoupe.sol";
// import { IDiamondCut } from "../interfaces/IDiamondCut.sol";
// import { IERC173 } from "../interfaces/IERC173.sol";
// import { IERC165 } from "../interfaces/IERC165.sol";

// 배포 스크립트의 데이터로 다이아몬드 배포할려면 이방식을 사용해야함 
// 이거는 여러 다이아몬드에서 사용할수있음
contract AppDiaInit {    

    // 파라미터 설정가능
    function init() external {
        // adding ERC165 data
        // LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
        // ds.supportedInterfaces[type(IERC165).interfaceId] = true;
        // ds.supportedInterfaces[type(IDiamondCut).interfaceId] = true;
        // ds.supportedInterfaces[type(IDiamondLoupe).interfaceId] = true;
        // ds.supportedInterfaces[type(IERC173).interfaceId] = true;

    }
}
