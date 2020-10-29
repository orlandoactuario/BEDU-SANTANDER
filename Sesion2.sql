use tienda;
show tables;
describe articulo;
describe venta;
describe puesto;


				 # RETO 1 #
#¿Qué artículos incluyen la palabra Pasta en su nombre?
select nombre from articulo Where nombre LIKE '%Pasta%';
#¿Qué artículos incluyen la palabra Cannelloni en su nombre?
select nombre from articulo Where nombre LIKE '%Cannelloni%';
#¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
select nombre from articulo Where nombre LIKE '%-%';
#¿Qué puestos incluyen la palabra Designer?
select nombre from puesto Where nombre LIKE '%DESIGNER%';
#¿Qué puestos incluyen la palabra Developer?
select nombre from puesto Where nombre LIKE '%Developer'; 

                     # RETO 2 # 
#¿Cuál es el promedio de salario de los puestos?
select avg(salario) from puesto;
#¿Cuántos artículos incluyen la palabra Pasta en su nombre?
select count(*) from articulo where nombre LIKE '%Pasta%';
#¿Cuál es el salario mínimo y máximo?
select min(salario),max(salario) from puesto;
#¿Cuál es la suma del salario de los últimos cinco puestos agregados?
select sum(salario) from (select salario from puesto order by id_puesto desc LIMIT 5) as subconsulta;

					# RETO 3 #

                    
#¿Cuántos registros hay por cada uno de los puestos?
select nombre, count(*) from puesto group by nombre;
#¿Cuánto dinero se paga en total por puesto?
select nombre, sum(salario) from puesto group by nombre;
#¿Cuál es el número total de ventas por vendedor?
select id_empleado, count(*) from venta group by id_empleado;
#¿Cuál es el número total de ventas por artículo?
select a.id_articulo, a.nombre, count(*) as "Numero de Ventas" from venta as v INNER JOIN articulo as a on v.id_articulo = a.id_articulo group by v.id_articulo;
                    