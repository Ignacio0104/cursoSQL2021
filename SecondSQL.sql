#drop database if exists curso; //*Eliminar base de datos anterior*/

create database if not exists curso_sql;
use curso_sql;

/*Primary Key*/

create table if not exists usuario(
nombre varchar (50),
apellido varchar (50),
correo varchar (100),
primary key(nombre)
);

insert into usuario values('Juan','Perez','juan@juan.com');
insert into usuario values('Juan','Lopez','juan@lopez.com'); /*No se puede, se genera un dato duplicado de PK. No se recomienda usar nombres*/
describe usuario;

create table if not exists producto (
id int(11) auto_increment,
producto varchar (50),
descripcion text,
precio float(11,2),
primary key (id)
);
describe producto;
insert into producto values(null,'Laptop','La mejor laptop del mercado',128.6);
insert into producto values(null,'Mouse','Prende Luz',5.6);
select * from producto;

truncate table producto; /*Vacia la tabla y se reinicia la secuencia auto incremental*/
delete from producto; /*Esta opcion borra toda la tabla, pero mantiene la secuencia auto incremental*/ 

delete from producto where id = 1;

create table persona(
id integer unsigned not null, /*unsigned = numero positivo*/
nombre varchar (50),
edad integer unsigned,
primary key(id)
);

describe persona;

/*Tipo de datos
Enteros:
- tinyint (-127 hasta 128) >>> con UNSIGNED seria de 0 a 257 >>> Recomendado para edad;
- smallint (rango de 60000) >>> Recomendado para las id de base de datos pequeña mediana
- mediumint (rango 5000000) >>> Recomendado para las id de base de datos grandes
- int (rango 200000000)
- bigint (rango 2000000000)

Decimales:
- float: precio float (6.2) 6 longitud, 2 cantidad decimales
- double: tiene mayor precisión que el float. precio double (4.53)
- decimal: el decimal no redondea, es el mas preciso. 

Cadenas o Alfanuméricos:
- char: 255 caracteres como maximo >>> No se usa mucho a no ser que sea algo muy específico como M o F (masc o fem)
- varchar: No sabemos la longitud del campo. Longitud max 65534. Este es el mas utilizado. Guarda solo los espacios usados, a diferencia del char
- binary y varbinary: simil a char y varchar 
- text: Para información larga
- blob, tinyblob, mediumblob y longblob: Guarda la información en formato binario >>> No se usa mucho
- enum: Crea lista de valores permitidos. Ej el usuario solo puedo elegir una opción del 1 al 6. Permite elegir una sola, y hay que elegir si o si
- set: simil enum pero de 64 opciones solamente. Puede no elegirse nada, una o varias cosas

Fecha:
- date: AAAA-MM-DD
- datetime: AAAA-MM-DD HH:MM:SS
- time: HH:MM:SS
- timestamp: Similar al date time pero distintos formatos. Se puede poner incompleta o de otras maneras AA-MM-DD
on update current_timestamp: guarda la fecha y hora exacta de algún hecho que le indiquemos
- year: AAAA o AA
*/

create table if not exists libros(
id int (6) zerofill auto_increment, #zerofill completa con ceros a la izquierda
titulo varchar (40) not null,
editorial varchar (15),
autor varchar (30) default 'Desconocido', #Se le indica que si no se completa, se pone Desconocido por default
precio decimal (5,2) unsigned default 8.25,
cantidad mediumint zerofill not null,
primary key (id)
);
drop table libros;

insert into libros values (null,'C# en una hora', 'SQL', 'Miguel', 15.2, 50);
delete from libros where titulo = '';
insert into libros (titulo,editorial, autor, cantidad) values ('Java', 'KDK', 'Juan', 30);
insert into libros(titulo,cantidad)values('SQL',200);
select * from libros;

drop table producto;

create table if not exists productos (
id integer unsigned not null auto_increment,
nombre varchar (50),
proveedor varchar (50),
descripcion text,
precio decimal (5,2) unsigned,
cantidad smallint unsigned,
primary key (id)
);

insert into productos (nombre,proveedor, descripcion,precio,cantidad) values ('Laptop HP','HP', 'Las mejores laptop', 155.69,50);
insert into productos (nombre,proveedor, descripcion,precio,cantidad) values ('Mouse','Logitech', 'Los mejores mouse', 20.86,30);
insert into productos (nombre,proveedor, descripcion,precio,cantidad) values ('Teclado','Logitech', 'Los mejores teclados', 80.12,100);
insert into productos (nombre,proveedor, descripcion,precio,cantidad) values ('Laptop DELL','Dell', 'Las mejores laptop', 200.8,15);
insert into productos (nombre,proveedor, descripcion,precio,cantidad) values ('Pantalla','HP', 'Las mejores pantallas', 155.69,50);
insert into productos (nombre,proveedor, descripcion,precio,cantidad) values ('Camaras','Logitech', 'Las mejores camaras', 500,20);
insert into productos (nombre,proveedor, descripcion,precio,cantidad) values ('Xbox 360','Xbox Microsoft', 'Las mejores consolas', 103.69,10);
insert into productos (nombre,proveedor, descripcion,precio,cantidad) values ('PlayStation 4','Sony', 'Las mejores play', 15.69,50);
insert into productos (nombre,proveedor, descripcion,precio,cantidad) values ('Lenovo 310','Lenovo', 'Las mejores laptop', 155.69,50);

select * from productos;
select nombre, precio, cantidad from productos;
select nombre,precio,cantidad, precio*cantidad from productos;
select nombre,precio, precio*0.1,precio-(precio*0.1)from productos;

select concat ('Hola',' ','como estas?'); #Concatena texto
select concat_ws('-','Miguel', 'Martinez', 'Lopez') ;#ws=with separador, primer argumento que le pasamos es el que va a usar para separar
select length('Hola a todos'); #Devuelve la longitud de la cadena
select left ('Buenas Noches',8);#Cantidad de caracteres comenzando de la izquierda. El ultimo argumento es la cantidad de carc que va a leer
select right ('Buenas Tardes',10); #Idem derecha
select ltrim('      UDEMY     '); #Quita los espacios del lado derecho
select rtrim('      UDEMY     '); #Quita los espacios del lado izquierdo
select trim('       UDEMY     '); #Quita los espacios de ambos lados
select replace('mmm.udemy.com','mmm','www'); #Primer parametro cadena, segundo caracter a reemplazar, tercero reemplazo
select repeat('SQL',3); #Cantidad de veces a repetir
select reverse('Hola');
select lower('Hola CoMO EstAS');
select lcase('Hola CoMO EstAS');
select upper('Hola CoMO EstAS');
select ucase('Hola CoMO EstAS');

select concat_ws('/',nombre,precio) from productos;
select left(nombre,5) from productos;
select lower(nombre), upper(descripcion) from productos;