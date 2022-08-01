/*SEGUNDA PROBLEMÁTICA*/

/*Crear una vista con las columnas id, numero sucursal, nombre, apellido, DNI y edad de la tabla cliente calculada a partir de la fecha de nacimiento*/
CREATE TEMP VIEW segunda_problematica
AS
SELECT customer_id as id, branch_id as numero_sucursal, customer_name as nombre, customer_surname as apellido,customer_DNI as DNI, date() - dob as edad
FROM cliente;

/*Mostrar las columnas de los clientes, ordenadas por el DNI de menor a mayor y cuya edad sea superior a 40 años*/
SELECT * FROM segunda_problematica
WHERE edad > 40
ORDER BY DNI;

/*Mostrar todos los clientes que se llaman “Anne” o “Tyler” ordenados por edad de menor a mayor*/
SELECT * FROM segunda_problematica
WHERE nombre = 'Anne' OR nombre = 'Tyler'
ORDER BY edad;

/*Dado el siguiente JSON. Insertar 5 nuevos clientes en la base de datos y verificar que se haya realizado con éxito la inserción*/
INSERT INTO cliente ("customer_name", "customer_surname", "customer_DNI", "dob", "branch_id") 
VALUES 
	("Lois", "Stout", "477305534", "1984-07-07", 80),
	("Hall", "Mcconnell", "52055464","1968-04-30", 45),
	("Hilel", "Mclean", "43625213", "1993-03-28", 77),
	("Jin", "Cooley", "21207908", "1959-08-24", 96),
	("Gabriel", "Harmon", "57063950", "1976-04-01", 27);

/*Actualizar 5 clientes recientemente agregados en la base de datos dado que hubo un error en el JSON que traía la información, la sucursal de todos es la 10*/
UPDATE cliente
	SET branch_id = 10
	WHERE customer_id BETWEEN (SELECT count(*) FROM cliente)- 4 AND (SELECT count(*) FROM cliente);

/*Eliminar el registro correspondiente a “Noel David” realizando la selección por el nombre y apellido*/
DELETE FROM cliente
	WHERE customer_name = "NOEL" AND customer_surname = "DAVID";

/*Consultar sobre cuál es el tipo de préstamo de mayor importe*/
SELECT loan_type FROM prestamo
ORDER BY loan_total DESC
LIMIT 1;
	


	


