select*from venta
select*from empleados
--Procedimiento almacenado que retorne las cantidad de veces
--que un empleado realiza ventas en una fecha.
create or replace function ventasEmpleado(varchar,date)
returns bigint
as
$$
SELECT
	count(id_empleado_venta) as ventasRealizadas
	
FROM venta
	INNER JOIN empleados ON empleados.id_empleado = venta.id_empleado_venta 
where
	empleados.nombre_empleado= $1
	and DATE(venta.fecha_venta) = $2
$$
LANGUAGE SQL;
select ventasEmpleado('David','2020-12-13');
