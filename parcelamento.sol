//contrato para parcelamento de financiamento de veiculo

pragma solidity 0.8.9;

contract parcelamentodeveiculo 
{
    // Autor: Jumara Vaz
     string public comprador;
     string public renavan;
     string public consercionaria;
     string public marca;
     string public modelo;
     
     uint public valortotal;
     uint public qtdparcela;
     uint public valordaparcela;
     
     constructor (
         string memory _comprador,
         string memory _renavan,
         string memory _consercionaria,
         string memory _marca,
         string memory _modelo)
    {
       comprador = _comprador;
       renavan = _renavan;
       consercionaria = _consercionaria;
       marca = _marca;
       modelo = _modelo;
    }
    
    function calculovalordaparcela (uint _valordaparcela) public returns (uint)
    {
        _valordaparcela = valortotal / qtdparcela;
        valordaparcela = _valordaparcela;
        return(valordaparcela);
    } 
}

