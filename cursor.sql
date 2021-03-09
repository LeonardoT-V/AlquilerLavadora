
-----------Cursor que muestre el nombre, lavadora y el mantenimiento que se han realizado
-----------en una fecha
do $$
declare
	registro RECORD;
	Cur_mant Cursor for 
		select 
		lavadoras.codigo_lavadora as lavadora,
		Empleados.nombre_empleado||' '||Empleados.apellido_empleado as NombreApellido,
		tipo_mantenimiento as mantenimiento
		from mantenimiento
			INNER JOIN empleados on empleados.id_empleado = mantenimiento.id_empleado_mantenimiento
			INNER JOIN lavadoras on lavadoras.id_lavadora = mantenimiento.id_lavadora_mantenimiento
			where date(fin_mantenimiento)='2020-12-13';
			--where date(fin_mantenimiento)='2020-12-14';
begin
OPEN Cur_mant;
Fetch Cur_mant into registro;
WHILE (FOUND) LOOP
Raise notice 'Nombre: % | Lavadora: % | tipo mantenimiento: %'
,registro.NombreApellido,registro.lavadora,registro.mantenimiento;
Fetch Cur_mant into registro;
end loop;
end $$
Language 'plpgsql';


