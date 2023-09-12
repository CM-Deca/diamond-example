// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "../../storage/OrderNFTStorage.sol"; // app다이아몬드에 있는 저장소에 접근하기위해서 선언 , 다이아몬드 스토리지 -> libdiamond를 사용 ;
import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract OrderNFT721 is ERC721 {

    function mint(address _to, bytes32 _key) public auth {
        OrderNFTStorage.DiamondStorage storage ds = OrderNFTStorage.getStorage();
        ds.tokenIdCounter.increment();
        uint n = ds.tokenIdCounter.current();
        ds.id[_key] = n;
        ds.key[n] = _key;
        _safeMint(_to, n);
    }


}
