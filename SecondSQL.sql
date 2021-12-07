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


*/
