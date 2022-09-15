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

    //strings sao informacoes extras para adicionar nas funcoes _mint e no _safeTransferFrom
    string  public constant brand = "https://www.condominioeren.com.br/metadata.json";
    string public constant brandApart = "Voce eh dono de um ape";

    constructor() ERC1155("https://game.example/api/item/{id}.json") {
        _mint(msg.sender, EREN, 10**18, "");
    }

    /*
        @dev realiza mint de um apartamento;
        @params to - endereco do remetente; apart - apartamento a ser mintado
    */
    function mintApart(address to, uint256 apart) public {
        require(apart > 0 && apart < 3, "Apartamento nao existe");
        bytes memory msgApart = bytes(brandApart);
        _mint(to, apart, 1, msgApart);
    }

    /*
        Realiza a transferencia da carteira onde houve mint para a carteira do cliente
        token e nft
        @params from - endereco remetente, to - endereco da carteira de quem ira receber
        amountToken - quantidade de token, apart - apartamento;
    */
    function transferApartEndToken(address from, address to, uint256 amountToken, uint256 apart) public {
        bytes memory msgCond = bytes(brand);
        _safeTransferFrom(from, to, 0, amountToken, msgCond);
        _safeTransferFrom(from, to, apart, 1, msgCond);
    }
}