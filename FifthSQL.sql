use curso_sql;

create table if not exists materiales (
id int unsigned not null auto_increment,
nombre varchar (50),
primary key (id)
);

describe materiales;
alter table materiales add precio int; #Aca se agrega el campo precio
alter table materiales add cantidad smallint unsigned not null;

alter table materiales drop precio; #Aca se borra el campo precio. Si se borra un campo que es indice, se borra el indice también

alter table materiales modify nombre varchar (100) not null; #Se cambia el tipo de dato
alter table materiales modify precio decimal (5,2) not null;

alter table materiales change precio stock int; #primero va el campo actual, y despues la modificacion
alter table materiales change nombre titulop varchar (50) not null;

create table if not exists produccion (
id int unsigned not null,
nombre varchar (50)
);

alter table produccion add primary key(id);
alter table produccion modify id int unsigned auto_increment not null; #Primero PK y luego auto incremental
alter table produccion add primary key(nombre); #Esto da error, PK ya esta definida

alter table produccion drop primary key;#Esto da error, hay que sacar el auto increment primero
alter table produccion modify id int unsigned;
alter table produccion add precio int (11) unsigned;
alter table produccion add cantidad smallint(5) unsigned not null;
describe produccion;

alter table produccion add index i_precio (precio); #Agregar index
alter table produccion drop index i_precio;

show index from produccion;

show tables;

alter table produccion rename producciones; #Cambiar el nombre de la table
rename table producciones to produccion;

rename table produccion to auxiliar,
visitantes to produccion,
auxiliar to visitantes; #Intercambiar nombre de 2 tablas

describe produccion;
describe visitantes;