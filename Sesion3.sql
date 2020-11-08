							                 ### RETO 1 ###
use tienda;
show tables;
describe venta;
describe empleado;
describe articulo;
describe puesto;

# ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000? # 
select nombre from empleado where id_puesto in (select id_puesto from puesto where salario > 10000);

# ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
select id_empleado, min(total_ventas), max(total_ventas)
FROM
(select id_empleado, clave, count(*) as total_ventas from venta group by id_empleado, clave) as sq
group by id_empleado;

# ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
describe venta;
describe articulo;
select distinct clave from venta where id_articulo in (select id_articulo from articulo where precio>5000) order by clave;

                                              ### RETO 2 ###


# ¿Cuál es el nombre de los empleados que realizaron cada venta?
select nombre, id_venta from venta as v JOIN empleado as e ON v.id_empleado=e.id_empleado;

# ¿Cuál es el nombre de los artículos que se han vendido?
select clave, a.nombre from venta as v JOIN articulo as a on v.id_articulo=a.id_articulo order by clave;

# ¿Cuál es el total de cada venta?
select clave, round(sum(precio),2) as 'Total de venta' 
from venta as v JOIN articulo as a ON v.id_articulo=a.id_articulo 
group by clave;

                     
                                           ### RETO 3 ###
                               
# Usando la base de datos tienda, define las siguientes vistas que permitan obtener la siguiente información.

# Obtener el puesto de un empleado.
CREATE VIEW puesto082 AS
select concat(e.nombre,' ',e.apellido_paterno,' ',e.apellido_materno) as 'Nombre empleado', p.nombre as 'Puesto' from empleado as e INNER JOIN puesto as p USING(id_puesto);

# Saber qué artículos ha vendido cada empleado. 
CREATE VIEW articulos_vendidos082 AS
select concat(e.nombre,' ',e.apellido_paterno,' ',e.apellido_materno) as NombreEmpleado, a.nombre from venta as v JOIN articulo as a using(id_articulo) JOIN empleado as e using(id_empleado) order by NombreEmpleado;

# Saber qué puesto ha tenido más ventas.
CREATE VIEW ventas_082 AS 
select p.nombre as NombrePuesto, count(*) as Ventas 
from venta as v 
JOIN empleado as e using(id_empleado) 
JOIN puesto as p using(id_puesto) group by NombrePuesto order by Ventas desc;

