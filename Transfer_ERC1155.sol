// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

/*
    Código de exemplo retirado de:
        https://docs.openzeppelin.com/contracts/3.x/erc1155
    
    No Remix, para rodá-lo descomentar o import.

    O Contrato inicializa:
     - com um token fungivel (EREN - Total Supply - 10 ** 18);
     - três tokens não-fungíveis (APART101, APART202, APART303);
    
*/
//import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract RealEstate is ERC1155 {
    uint256 public constant EREN = 0;
    uint256 public constant APART101 = 1;
    uint256 public constant APART202 = 2;
    uint256 public constant APART303 = 3;

    constructor() ERC1155("https://game.example/api/item/{id}.json") {
        _mint(msg.sender, EREN, 10**18, "");
        _mint(msg.sender, APART101, 1, "");
        _mint(msg.sender, APART202, 1, "");
        _mint(msg.sender, APART303, 1, "");
       
    }
    /*
        Realiza a transferencia da carteira onde houve mint para a carteira do cliente
        token e nft
    */
    function transferApartEndToken(address from, address to, uint256 amountToken, uint256 apart) public {
        _safeTransferFrom(from, to, 0, amountToken, "");
        _safeTransferFrom(from, to, apart, 1, "");
    }
}