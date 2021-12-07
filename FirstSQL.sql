use curso;
create table usuario(
nombre varchar(50),
edad int (15)
);

show tables;
describe usuario;
drop table usuario;

create table alumnos(
nombre varchar (50),
apellido varchar (50),
direccion varchar (100),
telefono varchar (15),
edad int(11)
);

insert into alumnos (nombre,apellido,direccion,telefono,edad) values('juan', 'martinez','Barrio Duarte', '1553535',35);
insert into alumnos values('Pedro', 'Montero','27 de Febrero', '1453542',15);
insert into alumnos (nombre,telefono,edad) values ('Miguel','12563355',36);
insert into alumnos values('Sebastian', 'Polter','Arenales', '1452542',65);

select* from alumnos;
select nombre, direccion from alumnos;
select edad, apellido from alumnos;
select * from alumnos where nombre = 'juan';
select nombre,edad from alumnos where edad > 18;
select * from alumnos where nombre <> 'juan'; /* El != aca se escribe <>*/

delete from alumnos; /* Esto borra todos los datos de la lista*/
delete from alumnos where nombre = 'juan';

update alumnos set edad = 33;
update alumnos set edad = 6 where nombre = 'Pedro';
update alumnos set telefono = '156467312',edad=18 where nombre = 'Pedro';





