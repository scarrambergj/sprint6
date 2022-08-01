CREATE TEMP VIEW segunda_problematica
AS
SELECT customer_id as id, branch_id as numero_sucursal, customer_name as nombre, customer_surname as apellido,customer_DNI as DNI, date() - dob as edad
FROM cliente;


SELECT * FROM segunda_problematica
WHERE edad > 40
ORDER BY DNI;

SELECT * FROM segunda_problematica
WHERE nombre = 'Anne' OR nombre = 'Tyler'
ORDER BY edad;

INSERT INTO cliente ("customer_name", "customer_surname", "customer_DNI", "dob", "branch_id") 
VALUES 
	("Lois", "Stout", "477305534", "1984-07-07", 80),
	("Hall", "Mcconnell", "52055464","1968-04-30", 45),
	("Hilel", "Mclean", "43625213", "1993-03-28", 77),
	("Jin", "Cooley", "21207908", "1959-08-24", 96),
	("Gabriel", "Harmon", "57063950", "1976-04-01", 27);
	
UPDATE cliente
	SET branch_id = 10
	WHERE customer_id BETWEEN (SELECT count(*) FROM cliente)- 4 AND (SELECT count(*) FROM cliente);
	
DELETE FROM cliente
	WHERE customer_name = "NOEL" AND customer_surname = "DAVID";
	
SELECT loan_type FROM prestamo
ORDER BY loan_total DESC
LIMIT 1;
	


	


