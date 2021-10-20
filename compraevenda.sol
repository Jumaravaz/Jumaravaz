pragma solidity 0.8.9;

contract CompraeEVenda 
{
    // Autor: Jumara Vaz
     string comprador;
     string vendedor;
     string public matricula;
     string public cartorio;
     string datadevencimento;
     
     bool quitado = false;
     
     uint public valortotal ;
     uint public valordaentrada;
     uint public numerodeparcelas;
     uint public valoremaberto;
     uint porcentagemdamulta;
     
    constructor (uint _valortotal, uint _valordaentrada, uint _numerodeparcelas, string memory _matricula)
    {
        valortotal = _valortotal;
        valordaentrada = _valordaentrada;
        numerodeparcelas = _numerodeparcelas;
        matricula = _matricula;
    }
    
    function pagaraentrada(uint _valorpagamento) public returns (uint, string memory)
    {
        valoremaberto = valortotal - _valorpagamento;
        return(valoremaberto, "valor em aberto");
    }
    
    function pagarparcela(uint _valordaparcela) public returns(uint, string memory)
    {
        valoremaberto = valoremaberto - _valordaparcela;
        return(valoremaberto, "valor em aberto");
        
    }
    
    function valordaparcela() public view returns(uint, string memory)  
    {
        uint calculovalordaparcela = (valortotal-valordaentrada)/numerodeparcelas;
        return(calculovalordaparcela, "valor da parcela");
    }
    
    function valordamulta(uint _porcentagemdamulta) public view returns(uint, string memory)
    {
        uint multa = _porcentagemdamulta*valortotal/100;
        return (multa, "valor da multa");
    }
    
}