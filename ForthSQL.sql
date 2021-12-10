use curso_sql;

#Indices. 




#Primary -> Clave primaria
create table if not exists libro (
id int unsigned auto_increment not null,
titulo varchar (100),
autor varchar (50),
descripcion text,
editorial varchar (15),
primary key (id) #Indice primary -> Numerico o caracter. No pueden ser valores nulos y cada tabla acepta una sola PK
);

show index from libro;

#Index -> Aceptan valor nulo y no son únicos
create table if not exists libreria (
id int unsigned auto_increment not null,
titulo varchar (100),
autor varchar (50) not null,
descripcion text,
editorial varchar (15) not null,
primary key (id) ,
index i_autoreditorial (autor, editorial)
);

drop table libreria;

show index from libreria;

#Unique
create table if not exists librerias (
id int unsigned auto_increment not null,
titulo varchar (100),
autor varchar (50) not null,
descripcion text,
editorial varchar (15) not null,
primary key (id) ,
index i_autor (autor),
unique uq_titulo (titulo)
);

show index from librerias;

insert into librerias(titulo,autor,editorial) values('Java en 10 minutos','Alejandro','La maravilla');
insert into librerias(titulo,autor,editorial) values('Java en 10 minutos','Alejandro','La maravilla'); # Esto da error!
insert into librerias(titulo,autor,editorial) values('Java en 12 minutos','Alejandro','La maravilla');
select * from librerias;

drop index  i_autor on librerias; #Asi se eliminan los index. El PK es mas complejo
drop index  uq_titulo on librerias;

drop table librerias;

create table if not exists librerias (
id int unsigned auto_increment not null,
titulo varchar (100),
autor varchar (50) not null,
descripcion text,
editorial varchar (15) not null,
primary key (id)
);

create index i_editorial on librerias (editorial); #Asi se crea un indice despues de crear la tabla
create unique index uq_titulo on librerias (titulo);
