/* Drop das tabelas */
ALTER TABLE Cars DROP FOREIGN KEY FK_MODEL_IDMODEL;
ALTER TABLE Cars DROP FOREIGN KEY FK_CAR_IDMEMBER;
ALTER TABLE Models DROP FOREIGN KEY FK_MODEL_IDBRAND;
DROP TABLE IF EXISTS Brands;
DROP TABLE IF EXISTS Models;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Cars;

/* Criação das tabelas */
CREATE TABLE Brands 
(
	idBrand int(5) NOT NULL AUTO_INCREMENT, 
	brand varchar(120) NOT NULL, 
	CONSTRAINT PK_BRANDS PRIMARY KEY (idBrand), 
	CONSTRAINT BRANDS_UN_BRAND UNIQUE (brand)
) ENGINE = InnoDB CHARACTER SET UTF8;

CREATE TABLE Models 
(
	idModel int(10) NOT NULL AUTO_INCREMENT, 
	idBrand int(5) NOT NULL, 
	model varchar(120) NOT NULL, 
	productionStartYear int(4) NOT NULL, 
	productionEndYear int(4), 
	CONSTRAINT PK_MODELS PRIMARY KEY (idModel), 
	CONSTRAINT MODELS_UN_MODEL UNIQUE (model)
) ENGINE = InnoDB CHARACTER SET UTF8;

CREATE TABLE Members 
(
	idMember int(10) NOT NULL AUTO_INCREMENT, 
	firstName varchar(50) NOT NULL, 
	lastName varchar(50) NOT NULL, 
	email varchar(120) NOT NULL, 
	city varchar(120), 
	State varchar(120), 
	CONSTRAINT PK_MEMBERS PRIMARY KEY (idMember), 
	CONSTRAINT MEMBERS_UN_EMAIL UNIQUE (email)
) ENGINE = InnoDB CHARACTER SET UTF8;

CREATE TABLE Cars 
(
	idCard int(10) NOT NULL AUTO_INCREMENT, 
	idMember int(10) NOT NULL, 
	idModel int(10) NOT NULL, 
	year int(4) NOT NULL, 
	color varchar(50) NOT NULL, 
	CONSTRAINT PK_CARS PRIMARY KEY (idCard)
) ENGINE = InnoDB CHARACTER SET UTF8;

ALTER TABLE Cars ADD INDEX FK_MODEL_IDMODEL (idModel), ADD CONSTRAINT FK_MODEL_IDMODEL FOREIGN KEY (idModel) REFERENCES Models (idModel);
ALTER TABLE Cars ADD INDEX FK_CAR_IDMEMBER (idMember), ADD CONSTRAINT FK_CAR_IDMEMBER FOREIGN KEY (idMember) REFERENCES Members (idMember);
ALTER TABLE Models ADD INDEX FK_MODEL_IDBRAND (idBrand), ADD CONSTRAINT FK_MODEL_IDBRAND FOREIGN KEY (idBrand) REFERENCES Brands (idBrand);
