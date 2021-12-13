use curso_sql;

show tables;

drop table productos;

create table if not exists productos(
id int unsigned not null auto_increment,
nombre varchar(50) not null,
descripcion text,
proveedorid int unsigned not null,
precio decimal(5,2),
cantidad smallint unsigned default 0,
primary key(id),
unique index (nombre),
foreign key(proveedorid) references proveedor(id) # Se design el FK y se referencia la tabla 
);
describe productos;

select * from productos;

drop table if exists proveedor;

create table if not exists proveedor(
id int unsigned not null auto_increment,
nombre varchar(50),
primary key(id),
unique index (nombre)
);

select * from proveedor;

insert into proveedor (nombre) values('Lenovo');
insert into proveedor (nombre) values('Logitech');
insert into proveedor (nombre) values('Microsoft'); 
insert into proveedor (nombre) values('HP');

insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Lenovo 310', 'La mejor laptop', 1, 100, 50);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Mouse', 'mouse inalambrico', 2, 15.96, 5);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Office 360', 'Paquete de Ofice', 3, 150.69, 30);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('HP Y700', 'La mejor laptop del mercado', 4, 10, 15);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Alfombra Lenovo', 'Alfombras asombrosas', 1, 300, 40);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('laptop HP 1000', 'No funciona muy bien',4 , 500, 3);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Volante Gamer', 'El mejor volante para jugar', 2, 800, 5);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Disco duro', 'Obten mas capacidad', 3, 70, 80);

#Estructura del Join basico
select * from productos join proveedor on productos.proveedorid=proveedor.id;

select p.nombre, p.descripcion, p.precio,pro.nombre from productos as p join proveedor as pro on p.proveedorid = pro.id; 
#as p = productos abreviado a p. Idem con proveedor. Aca se una una lista con otra a través del campo indicado (on)

select productos.nombre, productos.descripcion, productos.precio,proveedor.nombre 
from productos join proveedor on productos.proveedorid = proveedor.id;  #Esto es lo mismo sin el as

select * from productos left join proveedor on proveedor.id=productos.proveedorid; #Lee de izq a derecha
select * from productos right join proveedor on proveedor.id=productos.proveedorid; #Lee de derecha a derecha
select * from proveedor right join productos on proveedor.id=productos.proveedorid;
#inner join --> Si hay datos que no coinciden, no los muestra
select p.nombre, p.descripcion, p.precio, pro.nombre from proveedor as pro inner join productos as p on pro.id=p.proveedorid;
#straigh join --> Casi igual a inner

select pro.nombre, count(p.proveedorid) as 'cantidad de productos'
from proveedor as pro join productos as p on pro.id=p.proveedorid group by pro.nombre;

select pro.nombre, max(p.precio) as 'Mayor precio' 
from proveedor as pro join productos as p on pro.id=p.proveedorid group by pro.nombre;

 drop table if exists libros, socios, prestamos;
 
 create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  primary key (codigo)
 );

 create table socios(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  primary key (documento)
 );

 create table prestamos(
  documento char(8) not null,
  codigolibro int unsigned,
  fechaprestamo date not null,
  fechadevolucion date,
  primary key (codigolibro,fechaprestamo)
 );


insert into socios values('22333444','Juan Perez','Colon 345');
insert into socios values('23333444','Luis Lopez','Caseros 940');
insert into socios values('25333444','Ana Herrero','Sucre 120');

insert into libros values(1,'Manual de 2º grado','Molina Manuel');
insert into libros values(25,'Aprenda PHP','Oscar Mendez');
insert into libros values(42,'Martin Fierro','Jose Hernandez');

insert into prestamos values('22333444',1,'2016-08-10','2016-08-12');
insert into prestamos values('22333444',1,'2016-08-15',null);
insert into prestamos values('25333444',25,'2016-08-10','2016-08-13');
insert into prestamos values('25333444',42,'2016-08-10',null);
insert into prestamos values('25333444',25,'2016-08-15',null);
insert into prestamos values('30333444',42,'2016-08-02','2016-08-05');
insert into prestamos values('25333444',2,'2016-08-02','2016-08-05');
 
select * from prestamos;
 
select nombre,titulo,fechaprestamo from prestamos as p join socios as s on s.documento=p.documento join libros as l on codigolibro=codigo;
#Join con 3 tablas
select nombre,titulo,fechaprestamo from prestamos as p left join socios as s on p.documento=s.documento left join libros as l on codigolibro=l.codigo;
#Aca se ve que aparecen nulos (a diferencia del join clasico)

select nombre,titulo,fechaprestamo from prestamos as p left join socios as s on p.documento=s.documento join libros as l on l.codigo=p.codigolibro;

select pro.nombre, if(count(p.proveedorid)>0,'SI','NO') as hay from proveedor as pro left join productos as p on pro.id=p.proveedorid
group by pro.nombre;

select pro.nombre, case count(p.proveedorid) when 0 then 'NO' else 'SI' end as 'Hay'from proveedor as pro
left join productos as p on pro.id=p.proveedorid group by pro.nombre;


#Variables usuario --> @nombrevariable:=


select @preciomayor:=max(precio) from productos;
select * from productos where precio=@preciomayor; #El valor queda guardado en la variable

select p.nombre, p.descripcion, pro.nombre from productos as p join proveedor as pro on p.proveedorid=pro.id where p.precio = @preciomayor;

drop table productos;
 drop table proveedor;
 
 create table if not exists productos(
id int unsigned not null auto_increment,
nombre varchar(50) not null,
descripcion text,
proveedor varchar(50),
precio decimal(5,2),
cantidad smallint unsigned default 0,
primary key(id),
unique index (nombre)
);

describe productos;

insert into productos(nombre, descripcion, proveedor, precio, cantidad) 
values('Lenovo 310', 'La mejor laptop', 'Lenovo', 100, 50);
insert into productos(nombre, descripcion, proveedor, precio, cantidad) 
values('Mouse', 'mouse inalambrico', 'Logitech', 15.96, 5);
insert into productos(nombre, descripcion, proveedor, precio, cantidad) 
values('Office 360', 'Paquete de Ofice', 'Microsoft', 150.69, 30);
insert into productos(nombre, descripcion, proveedor, precio, cantidad) 
values('HP Y700', 'La mejor laptop del mercado', 'HP', 10, 15);

create table proveedores
select distinct proveedor as nombre
from productos; 

select * from proveedores;

#Crear una tabla apartir de dos tablas(CREATE-INSERT-JOIN)

drop table productos;
create table if not exists productos(
id int unsigned not null auto_increment,
nombre varchar(50) not null,
descripcion text,
proveedorid int unsigned not null,
precio decimal(5,2),
cantidad smallint unsigned default 0,
primary key(id),
unique index (nombre),
foreign key(proveedorid) references proveedor(id)
);
describe productos;

select * from productos;

drop table if exists proveedor;

create table if not exists proveedor(
id int unsigned not null auto_increment,
nombre varchar(50),
primary key(id),
unique index (nombre)
);

select * from proveedor;

insert into proveedor (nombre) values('Lenovo');
insert into proveedor (nombre) values('Logitech');
insert into proveedor (nombre) values('Microsoft'); 
insert into proveedor (nombre) values('HP');

insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Lenovo 310', 'La mejor laptop', 1, 100, 50);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Mouse', 'mouse inalambrico', 2, 15.96, 5);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Office 360', 'Paquete de Ofice', 3, 150.69, 30);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('HP Y700', 'La mejor laptop del mercado', 4, 10, 15);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Alfombra Lenovo', 'Alfombras asombrosas', 1, 300, 40);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('laptop HP 1000', 'No funciona muy bien',4 , 500, 3);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Volante Gamer', 'El mejor volante para jugar', 2, 800, 5);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Disco duro', 'Obten mas capacidad', 3, 70, 80);

create table cantidadporproveedor
select pro.nombre,count(*) as cantidad
from productos as p
join proveedor as pro
on p.proveedorid=p.id
group by pro.nombre;

select * from cantidadporproveedor;

#Insertar datos buscando en valor en otra tabla
insert into productos(nombre,descripcion, precio, proveedorid, cantidad)
select 'Teclado', 'El mejor teclado', 100, id, 50
from proveedor where nombre='Logitech';


select * from productos;

alter table productos add proveedor varchar (50); #Creamos el campo proveedor
update productos join proveedor 
on productos.proveedorid=proveedor.id set productos.proveedor=proveedor.nombre;  #Le asignamos valor al nuevo campo a través de la otra tabla

alter table productos drop proveedorid;
drop table proveedor;

#Actualizacion en cascada (si actualizo una tabla que está relacionada con otra, también esta debe modificarse)
select * from proveedor;
update productos as p join proveedor as pro on p.proveedorid=pro.id set p.proveedorid=8, pro.id=8 where pro.nombre='Logitech';

#Borrar registros consultando otras tablas (delete-join)
delete productos from productos join proveedor on productos.proveedorid=proveedor.id where proveedor.nombre = 'HP';
select * from productos left join proveedor on proveedor.id=productos.proveedorid;

#Borrar registros en cascada
delete productos, proveedor from productos join proveedor on productos.proveedorid=proveedor.id where proveedor.nombre ='Lenovo';

#Check and repair table --> Verifica si la tabla tubo errores.
check table productos; #Hay distintas formas de chequeo quick, fast, changed, medium (por default), extended

check table productos fast quick;
repair table productos; #Si hay algún error.

#Cifrado de datos
#aes_encrypt('dato a encriptar','Clave para encriptar')
drop table if exists clientes;

create table clientes (
nombre varchar (50),
mail varchar (70),
tarjetacredito blob,
primary key (nombre)
);

insert into clientes values ('Marcos Luis','marcosluis@gmail.com',aes_encrypt('5390700823285988','xyz123'));
insert into clientes values ('Ganzalez Ana','gonzalesa@gmail.com',aes_encrypt('4567230823285445','xyz123'));
insert into clientes values ('Lopez German','lopezg@yahoo.com',aes_encrypt('7840704453285443','xyz123'));

select tarjetacredito from clientes; #Esto no muestra el valor de los campos

select cast(aes_decrypt(tarjetacredito,'xyz123')as char) from clientes; #Así se muestran los valores
  


