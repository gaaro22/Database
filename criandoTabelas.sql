-- Criação Banco de Dados Cenário Ecommerce
show databases;
create database ecommerce;
use ecommerce;

-- tabela cliente
create table clients(
	CC int auto_increment primary key,
    Fname varchar(11) not null,
    Mname varchar(3),
    Lname varchar(20) not null,
    CPF char(11) not null,
    Birthday date not null,
    Street varchar(45) not null,
    Neighborhood varchar(25) not null,
    Zipcode Varchar(8) not null,
    Complement varchar(45),
    City varchar(32) not null,
    UF char(2),
    Country varchar(20) not null,
    constraint unique_cpf_client unique (CPF)
);

-- tabela produto
create table product(
	Idproduct int auto_increment primary key,
    Category ENUM('ELECTRONICS', 'CLOTHES', 'TOYS', 'FOODS', 'BOOKS') not null,
    Description_ varchar(255),
    ProductValue float not null,
    Assessment float
);

-- tabela pedido
create table orders(
	Idorder int auto_increment primary key,
    IdorderClient int,
    OrderStatus ENUM('Em andamento', 'Processando', 'Enviado', 'Entregue', 'Cancelado') not null default 'Processando',
    Description_ varchar(255),
    SendValue float default 0,
    constraint fk_order_client foreign key (IdorderClient) references clients(Idclient)
);

-- tabela estoque
create table stock(
	Idstock int auto_increment primary key,
    Location varchar(45) not null,
    Quantity int default 0
);

-- tabela fornecedor
create table supplier(
	Idsupplier int auto_increment primary key,
    FantasyName varchar(45) not null,
    Reason varchar(45) not null,
    CNPJ char(15) not null,
    Contact varchar(11) not null,
    Street varchar(45) not null,
    Neighborhood varchar(25) not null,
    Zipcode Varchar(8) not null,
    Complement varchar(45),
    City varchar(32) not null,
    UF char(2),
    Country varchar(20) not null,
    constraint unique_CNPJ_supplier unique (CNPJ)
);

-- tabela vendedor
create table seller(
	Idseller int auto_increment primary key,
    FantasyName varchar(45) not null,
    Reason varchar(45) not null,
    CPF_CNPJ varchar(15) not null,
    Contact varchar(11) not null,
    Street varchar(45) not null,
    Neighborhood varchar(25) not null,
    Zipcode Varchar(8) not null,
    Complement varchar(45),
    City varchar(32) not null,
    UF char(2),
    Country varchar(20) not null,
    constraint unique_CPForCNPJ_seller unique (CPF_CNPJ)
);

-- Tabela Produto/Vendedor
create table productSeller(
	IdPseller int,
    IdPproduct int,
    ProdQuantity int default 1,
    primary key (IdPseller, IdPproduct),
    constraint fk_product_seller foreign key (IdPseller) references seller(Idseller),
    constraint fk_product_product foreign key (IdPproduct) references product(Idproduct)
);

-- Tabela Produto/Pedido
create table productOrder(
	IdPOproduct int,
    IdPOorder int,
    POquantity int default 1,
    primary key (IdPOproduct, IdPOorder),
    constraint fk_product_product_ foreign key (IdPOproduct) references product(Idproduct),
    constraint fk_product_order foreign key (IdPOorder) references orders(Idorder)
);

-- Tabela Produto/Estoque
create table productstock(
	IdPSstock int,
    IdPSproduct int,
    PSlocation varchar(45),
    primary key (IdPSstock, IdPSproduct),
    constraint fk_product_stock foreign key (IdPSstock) references stock(Idstock),
    constraint fk_product_product__ foreign key (IdPSproduct) references product(Idproduct)
);

-- Tabela Produto/Fornecedor
create table productSupplier(
	IdPSsupplier int,
    IdPSproduct int,
    PSquantity int not null,
    primary key (IdPSsupplier, IdPSproduct),
    constraint fk_product_supplier foreign key (IdPSsupplier) references supplier(Idsupplier),
    constraint fk_product_PSproduct foreign key (IdPSproduct) references product(Idproduct)
);

-- Tabela Forma de Pagamento
create table formPayment(
    IdPayOrder int,
    IdPayClient int,
    IdCard int not null auto_increment,
    CardNumber varchar(24) not null,
    expirationDate char(5),
    securityCode char(3),
    NameOnCard varchar(25) not null,
    primary key (IdCard, IdPayOrder, IdPayClient),
    constraint fk_payment_order foreign key (IdPayOrder) references orders(IdOrder),
    constraint fk_payment_client foreign key (IdPayClient) references clients(IdClient)
);
show tables;
select * from orders;
select * from clients;