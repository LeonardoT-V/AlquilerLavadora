--trigger que no permita registrar a un usuario con 
--una cedula ya creada
	
select * from clientes
--creacion de la funcion
CREATE OR REPLACE FUNCTION cedulaCliente() RETURNS TRIGGER
AS $cedulaCliente$
DECLARE
	cedula varchar;
BEGIN
	if exists(select ci_cliente from clientes where ci_cliente = new.ci_cliente)then
		RAISE EXCEPTION 'Ya hay un usuario registrado con este numero de cedula';
	END IF;
	RETURN new;
END;
$cedulaCliente$
LANGUAGE plpgsql;
--creacion del trigger
CREATE TRIGGER tg_cedulaCliente BEFORE INSERT 
ON clientes for each row
execute procedure cedulaCliente();

insert into Clientes(ci_cliente,nombre_cliente,apellido_cliente,direccion_cliente,telefono_cliente)
									values('1315962249','Jose','Vera','calle13','094657934');
select * from clientes
insert into Clientes(ci_cliente,nombre_cliente,apellido_cliente,direccion_cliente,telefono_cliente)
									values('1315962249','Marco','Cedeño','calle14','094657934');
