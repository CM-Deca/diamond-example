import { Contract, ContractFactory } from "ethers";
import { ethers } from "hardhat";
import { main } from '../scripts/deploy';
import { assert } from 'chai';
import { getSelectors,FacetCutAction } from '../scripts/utils';

/* 
// DiamondCut : DC
// DiamondLoupe : DL
// FunctionSelector : FC (4bytes 함수 해시)
*/

export default describe('#1 TEST', () => {
    let AppDiaAddress:any;
    let diamondCutFacet:any;
    let diamondLoupeFacet:any;
    let addresses:any = [];
    
    before(async () => {
        // base 다이아몬드 배포
        AppDiaAddress = await main(); // 다이아몬드랑 facets 전부 배포 셋팅, 그리고 다이아몬드 주소 반환해줌
    });

    // 스탠다드 Facet 배포
    it('deploy Standard Base Facet', async () => { 
        diamondCutFacet = await ethers.getContractAt('DiamondCutFacet', AppDiaAddress) // 다이아몬드에 배포된 DC 컨트랙트 가져옴 
        diamondLoupeFacet = await ethers.getContractAt('DiamondLoupeFacet', AppDiaAddress) // 다이아몬드에 배포된 DL 컨트랙트 가져옴
        // DL을 통해서 다이아몬드에 추가된 FACET GET
        for (const address of await diamondLoupeFacet.facetAddresses()) { 
            addresses.push(address)
        }
        assert.equal(addresses.length, 2) // 스탠다드 Facet 2개 제대로 배포 됐는지 체크
    });

    // 다이아몬드에 등록된 facet에 FS가 제대로 등록되어있는지 DL을 통해서 확인
    it('Facet should have right FS', async () => { 
        let selectors:any = await getSelectors(diamondCutFacet);
        const result:any = await diamondLoupeFacet.facetFunctionSelectors(addresses[0]); // Facets 있는 FS 전부 가져옴
        assert.equal(result[0], selectors[0]);
    });

    // 다이아몬드에 등록된 루페(facet)를 동해서 FS => facet을 찾을수있는지 확인
    it('Facet should have right FS', async () => { 
        const result:any = await diamondLoupeFacet.facetFunctionSelectors(addresses[0]);
        assert.equal(
            addresses[0],
            await diamondLoupeFacet.facetAddress(result[0]) // FS를 가지고 다이아몬드에 등록된 Facet 주소를 찾음 
        )
    });

    // TestFacet.Sol Facet -> AppDia 에 추가해보기
    it('TestFacet -> Appdia add', async () => { 
        // TestFacet 배포
        const TestFacet:ContractFactory = await ethers.getContractFactory('TestFacet')
        const testFacet = await TestFacet.deploy()
        addresses.push(await testFacet.getAddress())

        // TestFacet FS 얻기
        const selectors = await getSelectors(testFacet);

        // DC의 diamondCut 이용하여 기능 추가 
        const tx:any = await diamondCutFacet.diamondCut( 
            [{
                facetAddress: await testFacet.getAddress(),
                action: FacetCutAction.Add,
                functionSelectors: selectors
            }],
            ethers.ZeroAddress, // 생성자가 있는 컨트랙트 주소 -> 지금은 호출 안하기위해서 0어드레스
            '0x' // 생성자 파라미터 데이터 
        );
        
        // DL로 추가된 testFacet의 selectors들 조회
        const result = await diamondLoupeFacet.facetFunctionSelectors(await testFacet.getAddress()) 
        assert.equal(result[0], selectors[0]) // 제대로 추가됐는지 확인
    });

    // TestFacet2.Sol Facet -> AppDia 에 추가해보기
    it('TestFacet2 -> Appdia add', async () => { 
        // TestFacet 배포
        const TestFacet2:ContractFactory = await ethers.getContractFactory('TestFacet2')
        const testFacet2 = await TestFacet2.deploy()
        addresses.push(await testFacet2.getAddress())

        // TestFacet FS 얻기
        const selectors = await getSelectors(testFacet2);

        // DC의 diamondCut 이용하여 기능 추가 
        const tx:any = await diamondCutFacet.diamondCut( 
            [{
                facetAddress: await testFacet2.getAddress(),
                action: FacetCutAction.Add,
                functionSelectors: selectors
            }],
            ethers.ZeroAddress, // 생성자가 있는 컨트랙트 주소 -> 지금은 호출 안하기위해서 0어드레스
            '0x' // 생성자 파라미터 데이터 
        );
        
        // DL로 추가된 testFacet의 selectors들 조회
        const result = await diamondLoupeFacet.facetFunctionSelectors(await testFacet2.getAddress()) 
        assert.equal(result[0], selectors[0]) // 제대로 추가됐는지 확인
    });

    // TestFacet.Sol Facet -> 기능 호출해보기
    it('TestFacet -> Appdia add', async () => { 
        // ABI는 TestFact 사용, 호출 주소는 다이아몬드 주소 사용 해야함
        const testFacet = await ethers.getContractAt('TestFacet', AppDiaAddress)
        const testFacet2 = await ethers.getContractAt('TestFacet2', AppDiaAddress)
        // AppStroge 공유 확인
        await testFacet.test1Func2(25);
        console.log(await testFacet2.test2Func3());
        await testFacet2.test2Func2(11);
        console.log(await testFacet.test1Func3());
    });

});