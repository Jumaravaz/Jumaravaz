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
            bool _diponivel
            //bool _negociavel
    
            
        ) public 
        {
            require(msg.sender == incorporador, "apenas o incorporador pode criar um lote");
            require(loteamento[_numeromatricula].numeromatricula == 0, "matricula registrada");
            require(numerodacasa[_numerocasa] == false, "casa ja existe");
            require(_valordolote > 0, "favor inserir um valor diferente de zero");
            loteamento[_numeromatricula]= lote( _numeromatricula, _numerocasa, _valordolote, _areaprivativa, _primeiroproprietario, _diponivel, true);
            numerodacasa[_numerocasa] = true;
        }
        
        function comprarlote
        (
            uint _numeromatricula
        ) 
        public payable returns (address, string memory)
        
        {
            require(loteamento[_numeromatricula].disponivel == true, "o imovel nao disponivel");
            require(loteamento[_numeromatricula].negociavel == true, "o imovel nao negociavel");
            require(loteamento[_numeromatricula].valordolote == msg.value, "valor errado");
            require(msg.sender != loteamento[_numeromatricula].proprietario, "o dono nao pode comprar o seu imovel");
            // o lote tem q estar negociavel
            address _antigoproprietario = loteamento[_numeromatricula].proprietario;
            loteamento[_numeromatricula].disponivel = false;
            loteamento[_numeromatricula].negociavel = false;
            loteamento[_numeromatricula].proprietario = msg.sender;
            payable(_antigoproprietario).transfer(msg.value);
            return(loteamento[_numeromatricula].proprietario, "este eh o novo proprietario");
            
        }
        
        
        function doarlote
        (
            uint _numeromatricula,
            address _novoProprietario
        )
        public returns (address, string memory)
        
        {
            require (msg.sender == loteamento[_numeromatricula].proprietario , "apenas o proprietario pode fazer a transferencia");
            require (loteamento[_numeromatricula].disponivel, "o imovel deve estar disponivel" );
            loteamento[_numeromatricula].proprietario = _novoProprietario;
            return ( loteamento[_numeromatricula].proprietario , " voce doou o imovel para a carteira");
        
        }
        
        function alterarstatuslote
        (
            uint _numeromatricula, 
            uint _valordolote, 
            bool _diponivel 
        )  
        public  returns (uint, string memory) 
        
        {
        
        require(msg.sender == loteamento[_numeromatricula].proprietario, "o status do imovel so pode ser alterado pelo proprietario do imovel");
        require(_valordolote > 0, "O Valor do lote nao pode ser 0");
        loteamento[_numeromatricula].valordolote = _valordolote;
        loteamento[_numeromatricula].disponivel = _diponivel;

        return(loteamento[_numeromatricula].valordolote, "esse e o novo valor do lote");
      }
        
    function bloquear
        (
            uint _numeromatricula,
            address _estado
        )  
        public  returns (uint, string memory) 
        
        {
        
        require(msg.sender == _estado, "o status do imovel so pode ser alterado pelo proprietario estado");
        if (loteamento[_numeromatricula].negociavel == true)
        loteamento[_numeromatricula].negociavel = false;
        return(loteamento[_numeromatricula].numeromatricula, "esse lote nao esta negociavel");
        
      }
       
    function desbloquear
        (
            uint _numeromatricula,
            address _estado
        )  
        public  returns (uint, string memory) 
        
        {
        
        require(msg.sender == _estado, "o status do imovel so pode ser alterado pelo proprietario estado");
        if (loteamento[_numeromatricula].negociavel == false)
        loteamento[_numeromatricula].negociavel = true;
        return(loteamento[_numeromatricula].numeromatricula, "esse lote esta negociavel");
        
      } 
      
      
    }
