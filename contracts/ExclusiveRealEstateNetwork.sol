// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Necessário instalar o oppenZeppelin na máquina, vamos combinar a versão dos Frameworks/Dependências antes de subir
//import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
//import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC1155, Ownable {
    string public constant name = "Exclusive Real Estate Network";
    string public constant symbol = "EREN";
    uint256 public constant EREN = 0;
    uint256 public constant totalSupply = 10**9;

    constructor() ERC1155("https://game.example/api/item/{id}.json") {
        _mint(msg.sender, EREN, totalSupply, "");     // endereço: msg.sender | id =  0 | amount(qtd) = totalSupply(10**9) | data (vazio)
    }

    // Para enviar Token é necessário confirmar que o usuário possui uma NFT do apt.
    // Somente possível realizar transação caso ambos possuam NFT
    // Token utilitário dentro do nosso ecossistema 

    function NftVerification(string memory _nft)public returns(string memory){
        
    }
    
}