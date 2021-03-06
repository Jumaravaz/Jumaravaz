// SPDX-License-Identifier: MIT

 pragma solidity 0.8.9;

 contract tokenizacaoimobiliaria 
    {
        string nomecartorio;
        string nomecondominio;
        address incorporador;
        address estado;
        
        struct lote
        {
        uint numeromatricula;
        uint numerocasa;
        uint valordolote;
        uint areaprivativa;
        address proprietario;
        bool disponivel;
        bool negociavel;
        }
        
        mapping (uint => lote) public loteamento;
        mapping (uint => bool) public numerodacasa;
        
        constructor 
        (
            string memory _nomecartorio, 
            string memory _nomecondominio,
            address _estado
        )
        {
               nomecartorio = _nomecartorio;
               nomecondominio = _nomecondominio;
               estado = _estado;
               incorporador = msg.sender;
        }    
        
        function criarlote
        (
            uint _numeromatricula,
            uint _numerocasa,
            uint _valordolote,
            uint _areaprivativa,
            address _primeiroproprietario,
            bool _negociavel
        ) public 
        {
            require(msg.sender == incorporador, "apenas o incorporador pode criar um lote");
            require(loteamento[_numeromatricula].numeromatricula == 0, "matricula registrada");
            require(numerodacasa[_numerocasa] == false, "casa ja existe");
            require(_valordolote == 0, "favor inserir um valor diferente de zero");
            loteamento[_numeromatricula]= lote( _numeromatricula, _numerocasa, _valordolote, _areaprivativa, _primeiroproprietario, _negociavel, false);
            
        }
    }
        
        
   
