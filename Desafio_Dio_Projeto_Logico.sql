create database ecommerce;
use ecommerce;
create table cliente(
        IdCliente int auto_increment primary key,
        Fnome varchar(10),
        Lnome varchar(20),
        CPF char(11) not null,
        Endereco varchar(30),
        Ativo bit,
        constraint unique_cpf_cliente unique (CPF)
);

show tables;
insert into Cliente  (Fnome, Lnome, CPF,  Endereco)
       values('José','Camargo', '16785438945', 'rua Andradina 706 Lagos Altos PR') ;
        
   create table ProdutoEstoque(
        IdProdEstoque int auto_increment primary key,
        LocalizacaoEstoque varchar(255),
        Quantidade int default 0
);
   
insert into ProdutoEstoque (LocalizacaoEstoque, Quantidade) values
            ('Guaiba', 536);
     
     create table Fornecedor(
        IdFornecedor int auto_increment primary key,
        RazaoSocial varchar(255) not null,
        CNPJ char(15) not null,
        Telefone char(11) not null,
        constraint unique_cnpj_Fornecedor unique (CNPJ)
);
insert into Fornecedor (RazaoSocial, CNPJ, Telefone) values
            ('tecnologic', '123765890768543', '99843567865');
            
create table Pagamento(
        IdCliente int,
        IdPagamento int,
        TipoPagamento enum('Boleto', 'Cartao'), 
         primary key(IdCliente,   IdPagamento)
);
insert into Pagamento(IdCliente, IdPagamento,TipoPagamento) values
		('1', '2', 'cartao');
        
        create table Pedido(
        IdPedido int auto_increment primary key,
        IdPedidoCliente int,
        PedidoStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
        Valor float default 10,
        PagamentoDinheiro bool default false,
        constraint fk_Pedido_Cliente foreign key( IdPedidoCliente) references Cliente( IdCliente)
);
insert into Pedido (     IdPedido,    IdPedidoCliente,    PedidoStatus , Valor ) values
            (1,1,'Confirmado', 1530);
            
 create table Produto(
        IdProduto int auto_increment primary key,
        Pnome varchar(10),
        Categoria enum('Eletrônico', 'Eletrodomestico', 'Alimentos', 'Móveis') not null,
        Descricao varchar(45));  
        
 insert into Produto (Pnome,Categoria,Descricao) values
             ('computador',  'Eletrônico', 'Desktop');
              
create table Vendedor(
	   IdVendedor int auto_increment primary key,
       RazaoSocial varchar(255) not null,
       CNPJ char(15),
       CPF char(9),
       Localizacao varchar(255),
       Telefone char(11) not null,     
       constraint unique_cnpj_Vendedor unique (CNPJ),
	   constraint unique_cpf_Vendedor unique (CPF)
);
insert into Vendedor(  RazaoSocial, CNPJ,CPF,Localizacao,Telefone)values 
			('terabyte', '126543678907865','254367896','Belém','96843278659');
    
  create table ProdutoFornecedor(
        IdProdFornecedor int,
        IdProdFornProduto int,
        Quantidade int not null,
        primary key (  IdProdFornecedor, IdProdFornProduto),
        constraint fk_ProdutoFornecedor_Fornecedor foreign key (IdProdFornecedor ) references Fornecedor(IdFornecedor),
        constraint fk_ProdutoFornecedor_Produto foreign key (  IdProdFornProduto) references Produto(IdProduto)

);
insert into  ProdutoFornecedor(IdProdFornecedor,IdProdFornProduto,Quantidade) values
			(1,1,'239');
            
 
 show tables;
 select * from Cliente;
 select * from Produto;
 select * from Fornecedor;
 select * from Vendedor;
 select count(*) from Cliente;
 select Fnome ,CPF from Cliente where Fnome= 'José' AND Lnome= 'Camargo';