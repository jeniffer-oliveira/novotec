create database Imoveis 
go 
use Imoveis 

create table Imovel (
    cd_Imovel int NOT NULL,
    cd_Vendedor int NOT NULL,
    cd_Bairro int NOT NULL,
    cd_Cidade int NOT NULL,
    sg_Estado Char(02),
    ds_Endereco varchar(40),
    qt_AreaUtil decimal(10,2),
    qt_AreaTotal decimal(10,2),
    ds_Imovel varchar(300),
    vl_Imovel money,
    qt_Ofertas int,
    ic_Vendido Char(1),
    dt_Lancto datetime, 
    qt_ImovelIndicado int
)
go 

create table Vendedor(
    cd_Vendedor int NOT NULL,
    nm_Vendedor VARCHAR(40),
    ds_Endereco VARCHAR(40),
    cd_CPF VARCHAR(15),
    nm_Cidade VARCHAR(40),
    nm_Bairro VARCHAR(40),
    sg_Estado CHAR(02),
    cd_Telefone VARCHAR(20),
    ds_Email VARCHAR(60)
)
go

create table Comprador(
    cd_Comprador int NOT NULL,
    nm_Comprador varchar(40),
    ds_Endereco varchar(40),
    cd_CPF varchar(15),
    nm_Cidade varchar(40),
    nm_Bairro varchar(40),
    sg_Estado char(02),
    cd_Telefone varchar(20),
    ds_Email varchar(60)
)
go

create table Estado(
    sg_Estado char(02) NOT NULL,
    nm_Estado varchar(40)
)
go 

create table Cidade(
    cd_Cidade int NOT NULL,
    sg_Estado char(02) NOT NULL
)
go

create table Bairro(
    cd_Bairro int NOT NULL,
    cd_Cidade int NOT NULL,
    sg_Estado char(02) NOT NULL,
    nm_Bairro varchar(40)
)
go

create table Faixa_Imovel(
    cd_Faixa int NOT NULL,
    nm_Faixa varchar(20),
    vl_Maximo money,
    vl_Minimo money
)
go

create table Oferta(
    cd_Comprador int NOT NULL,
    cd_Imovel int NOT NULL,
    vl_Oferta money,
    dt_Oferta datetime
)
go 

Alter Table Bairro 
    Add Primary Key (cd_Bairro, cd_Cidade, sg_Estado)
go 

Alter Table Imovel 
    Add Primary Key (cd_Imovel)
go 

Alter Table Vendedor 
    Add Primary Key (cd_Vendedor)
go 

Alter Table Oferta
    Add Primary Key (cd_Comprador, cd_Imovel)
go 

Alter Table Comprador 
    Add Primary Key (cd_Comprador)
go 

Alter Table Cidade 
    Add Primary Key (cd_Cidade, sg_Estado)
go 

Alter Table Estado
    Add Primary Key (sg_Estado)
go 

Alter Table Faixa_Imovel
    Add Primary Key (cd_Faixa)
go 

-- Chaves secundárias 

Alter Table Imovel 
    Add Foreign Key (cd_Bairro, cd_Cidade, sg_Estado)
    References Bairro 
go

Alter Table Bairro 
    Add Foreign Key (cd_Cidade, sg_Estado)
    References Cidade 
go 

Alter Table Cidade 
    Add Foreign Key (sg_Estado)
    References Estado
go 

Alter Table Imovel 
    Add Foreign Key (cd_Vendedor)
    References Vendedor 
go 

Alter Table Oferta 
    Add Foreign Key (cd_Comprador)
    References Comprador
go 

Alter Table Oferta 
    Add Foreign Key (cd_Imovel)
    References Imovel
go 

Create Index indImovelOferta
    On Oferta(cd_Imovel)
go 

Create Index indValorOferta
    On Oferta(vl_Oferta Desc)
go