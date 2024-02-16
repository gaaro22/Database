insert into clients (Fname, Mname, Lname, CPF, Birthday, Street, Neighborhood, Zipcode, Complement, City, UF, Country) values
	('Pedro', '', 'Silva', '05623430787', '1989-04-21','Das Flores, 4', 'Dumont', '22070970','','São Gonçalo', 'RJ', 'Brasil'),
    ('Tayná', 'P', 'Teixeira', '12345678910', '1995-06-20','Rua 01, 36', 'Parque das Árvores', '14000000','','Orlândia', 'SP', 'Brasil'),
    ('Guilherme', '', 'Silva', '00004444123', '1975-03-15','Capitão Morais, 72', 'Das Palmas', '04006100','','São Paulo', 'SP', 'Brasil'),
    ('Katarina', 'M', 'Sanchez', '10101020301', '1999-07-11','Tenente Horácio, 15', 'Parque Oliveira', '22010111','','Rio de Janeiro', 'RJ', 'Brasil'),
    ('Gabriel', '', 'Pedroso', '55566699911', '1980-12-21','Rua 15, 1010', 'Canto dos Passáros', '04005970','','São Paulo', 'SP', 'Brasil'),
    ('Érika', 'F', 'Almeida', '35623330760', '1999-03-21','Rua 21, 388', 'Morros Alados', '30010100','','Três Corações', 'MG', 'Brasil'),
    ('Érica', '', 'Plínio', '11111111111', '1964-05-22','Das Lacunas, 2', 'Jardim Perfum', '85140000','torre 01 - apê 26','Londrina', 'PR', 'Brasil'),
    ('Fabiola', 'T', 'Andrade', '98765432100', '1970-09-11','Vereador Vencilho de Albuquerque, 1250', 'Centro', '86160010','','Curitiba', 'PR', 'Brasil'),
    ('Maycon', 'B', 'Silva', '15151515151', '2003-01-05','Rua do bar, 71', 'Vila Formosa', '05001000','','São Paulo', 'SP', 'Brasil');
    select * from clients;
  
  insert into product (Category, Description_, ProductValue, Assessment) values
	('ELECTRONICS', 'Celular Moto G100', '2800.00', '4.1'),
    ('ELECTRONICS', 'Celular NOTE 12', '3100.00', '4.3'),
    ('ELECTRONICS', 'Iphone 13', '5900.00', '4.8'),
    ('ELECTRONICS', 'Playstation 5', '3800.00', '4.9'),
    ('TOYS', 'Boneco Max Steel', '220.00', '3.8'),
    ('TOYS', 'Boneca Barbie Professora', '250.00', '3.7'),
    ('ELECTRONICS', 'Controle Xbox S', '520.00', '4.1'),
    ('BOOKS', 'Cão Come Cão', '45.00', '4.5'),
    ('CLOTHES', 'Bermuda de Sarja Masculina', '80.00', '4.0'),
    ('ELECTRONICS', 'GO Pro 4K', '400.00', '3.9');
    
    insert into orders (Idorder, IdorderClient, OrderStatus) values
		('1', '1', default),
        ('2', '1', default),
        ('3', '1', default),
        ('4', '1', default),
        ('5', '1', default),
        ('6', '1', default),
        ('7', '1', default),
        ('8', '1', default);
    
    insert into productOrder (IdPOproduct, IdPOorder, POquantity) values
		('1', '1', default),
        ('4', '2', '2'),
        ('8', '3', default),
        ('1', '4', default),
        ('8', '4', '1'),
        ('5', '5', default),
        ('6', '5', default),
        ('4', '6', default),
        ('7', '7', '2'),
        ('9', '8', '4');
	select * from product;
insert into stock (Idstock, Location, Quantity) values
	('1', 'São Paulo', '500'),
    ('2', 'São Paulo', '100'),
    ('3', 'Rio de Janeiro', '400'),
    ('4', 'Belo Horizonte', '450'),
    ('5', 'Curitiba', '300');
select * from stock;

insert into productstock (IdPSstock, IdPSproduct, PSLocation) values
	('1', '1', 'SP'),
    ('2', '3', 'SP'),
    ('3', '5', 'RJ'),
    ('4', '9', 'BH'),
    ('5', '8', 'PR');
    
insert into supplier (FantasyName, Reason, CNPJ, Contact, Street, Neighborhood, Zipcode, Complement, City, UF, Country) values
	('Família e Cia','Família e Cia Transportadora', '056234307870001', '21991191010','Das Flores, 4', 'Dumont', '22070970','','São Gonçalo', 'RJ', 'Brasil'),
    ('Fornecedores LTDA', 'Fornecedores LTDA', '123456789101235', '16921011012','Rua 01, 36', 'Parque das Árvores', '14000000','','Orlândia', 'SP', 'Brasil'),
    ('Eletrônicos Detudo', 'Eletrônicos Detudo LTDA', '000044441231001', '11941410202','Capitão Morais, 72', 'Das Palmas', '04006100','','São Paulo', 'SP', 'Brasil'),
    ('Katarina Presentes', 'Katarina Presentes e Utilidades', '101010203010002', '11921122121','Tenente Horácio, 15', 'Parque Oliveira', '04005200','','São Paulo', 'SP', 'Brasil');
    
insert into seller (FantasyName, Reason, CPF_CNPJ, Contact, Street, Neighborhood, Zipcode, Complement, City, UF, Country) values
	('Andre Tavares','Andre Tavares Vendas', '056234307870001', '21991191010','Das Flores, 4', 'Dumont', '22070970','','São Gonçalo', 'RJ', 'Brasil'),
    ('Paula Cristina', 'Paula Cristina', '12345678910', '16921011012','Rua 01, 36', 'Parque das Árvores', '14000000','','Orlândia', 'SP', 'Brasil'),
    ('Gui Eletrônicos', 'Guilherme Eletrônicos e Cia', '000044441231001', '11941410202','Capitão Morais, 72', 'Das Palmas', '04006100','','São Paulo', 'SP', 'Brasil'),
    ('Fernanda Moraes', 'Fernanda Moraes', '10101020301', '11921122121','Tenente Horácio, 15', 'Parque Oliveira', '04005200','','São Paulo', 'SP', 'Brasil');
    
    insert into productSupplier (IdPSsupplier, IdPSproduct, PSquantity) values
		('4', '5', '2'),
        ('4', '6', '2'),
        ('3', '1', '1'),
        ('3', '3', '1'),
        ('1', '9', '3'),
        ('2', '8', '4');

insert into productseller (IdPseller, IdPproduct, ProdQuantity) values
		('4', '5', '2'),
        ('4', '6', '2'),
        ('3', '2', '1'),
        ('3', '4', '1'),
        ('1', '9', '3'),
        ('2', '8', '4');
        
 insert into formPayment (IdPayOrder, IdPayClient, CardNumber, expirationDate, securityCode, NameOnCard) values
	('2', '4', '1234 5678 9100 0123 4567', '12/30', '321', 'Guilherme Silva'),
    ('3', '3', '4567 5678 9100 0123 1234', '10/29', '500', 'Tayná Pereira Teixeira'),
    ('4', '2', '9100 4567 1234 0123 5678', '05/31', '987', 'Pedro Silva'),
    ('6', '7', '4321 6758 9100 0000 1015', '01/32', '222', 'Érika Ferreira de Almeida');