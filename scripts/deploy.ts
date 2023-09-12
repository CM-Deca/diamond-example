import { ethers } from "hardhat";
import {getSelectors, FacetCutAction} from './utils';
import { ContractFactory } from "ethers";

// 다이아몬드에 추가할 facets 들 이름 설정d
const FacetNames = [
  'DiamondCutFacet',
  'DiamondLoupeFacet',
];
export async function main() { // base deploy
    const accounts = await ethers.getSigners();
    const deployer = accounts[0];

    // DiamondInit 배포, diamond 배포시 초기화할 용도로 사용
    const AppDiaInit:ContractFactory = await ethers.getContractFactory('AppDiaInit');
    const appDiaInit = await AppDiaInit.deploy();
    console.log('AppDiaInit deployed:', await appDiaInit.getAddress());


    // facetCuts은 실제로 Contract에 FaceCut[]에 추가될 함수 기능들을 담고있음
    const facetCuts = []
    for (const FacetName of FacetNames) {
      const Facet:ContractFactory = await ethers.getContractFactory(FacetName) // 각각 facets 배포 
      const facet = await Facet.deploy();
    
      console.log(`${FacetName} deployed: ${await facet.getAddress()}`) // 각각 facets 주소
      facetCuts.push({ // FaceCut 구조체 형채로 넣음
        facetAddress: await facet.getAddress(),
        action: FacetCutAction.Add,
        functionSelectors: await getSelectors(facet) // 하나의 컨트랙에 해당하는 여러 4바이트 함수들전부다 가져옴
      })
    }

    // 다이아몬드 init 호출할 준비
    let functionCall = appDiaInit.interface.encodeFunctionData('init')

    // 다이아몬드 생성자에 사용할 변수들 선언
    const diamondArgs = {
      owner: deployer.address,
      init: await appDiaInit.getAddress(),
      initCalldata: functionCall
    }

    // 다이아몬드 배포
    const AppDia:ContractFactory = await ethers.getContractFactory('AppDia')
    const diamond = await AppDia.deploy(facetCuts, diamondArgs) // 해당 다이아몬든에 사용할 facets 기능등, 초기화할 인수들
    console.log('Diamond deployed:', await diamond.getAddress());

    // returning the address of the diamond
    return diamond.getAddress();
};
main();