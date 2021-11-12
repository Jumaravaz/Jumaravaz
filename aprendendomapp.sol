// SPDX-License-Identifier: MIT

 pragma solidity 0.8.9;
 
 contract Meucontrato
 {
     struct registro
     {
         uint matricula;
         string endereco;
         address proprietario;
         bool disponivel;
     }
     
     mapping(uint => registro) public listaderegistros;
     
     
     function criarregistro
     (
         uint _matricula,
         string memory _endereco,
         address _proprietario,
         bool _disponivel
    ) public
    {
        listaderegistros [_matricula] = registro(_matricula, _endereco, _proprietario, _disponivel);
    }
    
    
    function editarproprietario
    (
    uint _matricula,
    address _novoproprietario
    ) public
    {
        listaderegistros[_matricula].proprietario = _novoproprietario;
    }
    
    
    function editarenderecoedisponibilidade
    (
    uint _matricula,
    string memory _novoendereco,
    bool _disponivel
    ) public
    {
        listaderegistros[_matricula] = registro(_matricula, _novoendereco, listaderegistros[_matricula].proprietario, _disponivel);
        
    }
 }
