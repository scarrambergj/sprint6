/*CUARTA PROBLEMÁTICA*/

/*Listar la cantidad de clientes por nombre de sucursal ordenando de mayor a menor*/
SELECT count(*), branch_name FROM cliente 
INNER JOIN sucursal ON sucursal.branch_id = cliente.branch_id
GROUP BY branch_name 
ORDER BY count(*) DESC

/*Obtener la cantidad de empleados por cliente por sucursal en un número real*/
SELECT count(cliente.branch_id) as clientes, count(empleado.branch_id), branch_name FROM sucursal 
INNER JOIN cliente ON cliente.branch_id = sucursal.branch_id 
INNER JOIN empleado ON empleado.branch_id = sucursal.branch_id 
GROUP BY sucursal.branch_name
ORDER BY clientes DESC

/*Obtener la cantidad de tarjetas de crédito por tipo por sucursal*/
SELECT tarjetas.tipo ,count(tarjetas.tipo) as "Cantidad de tarjetas", branch_name as "Sucursal" FROM cliente
INNER JOIN sucursal ON sucursal.branch_id = cliente.branch_id
INNER JOIN tarjetas ON tarjetas.cliente_id = cliente.customer_id
GROUP BY  tarjetas.tipo, sucursal.branch_name


SELECT avg(prestamo.loan_total) as "Promedio de prestamos", branch_name as "Sucursal" FROM cliente
INNER JOIN sucursal ON sucursal.branch_id = cliente.branch_id
INNER JOIN prestamo ON prestamo.customer_id = cliente.customer_id
GROUP BY sucursal.branch_name

CREATE TABLE auditoria_cuenta (
	auditoria_id INTEGER PRIMARY KEY AUTOINCREMENT,
	old_id INTEGER,
	new_id INTEGER,
	old_balance INTEGER,
	new_balance INTEGER,
	old_iban TEXT,
	new_iban TEXT,
	old_type INTEGER,
	new_type INTEGER,
	user_action TEXT,
	created_at TEXT
);

CREATE TRIGGER IF NOT EXISTS "auditoria"
AFTER UPDATE
ON cuenta
BEGIN
	  INSERT INTO auditoria_cuenta (old_id, new_id, old_balance, new_balance, old_iban, new_iban, old_type, new_type, user_action, created_at) VALUES (OLD.account_id, NEW.account_id, OLD.balance, NEW.balance, OLD.iban, NEW.iban, OLD.tipo_id, NEW.tipo_id, "UPDATE", datetime("now"));
END;


UPDATE cuenta
	SET balance = 100
	WHERE account_id BETWEEN 10 AND 14

BEGIN TRANSACTION 

UPDATE cuenta 
	


/* Mediante índices mejorar la performance la búsqueda de clientes por DNI*/
CREATE UNIQUE INDEX indice_DNI cliente (customer_DNI);

/*Crear la tabla “movimientos” con los campos de identificación del
movimiento, número de cuenta, monto, tipo de operación y hora*/
CREATE TABLE movimientos(
movimiento_id INTEGER PRIMARY KEY AUTOINCREMENT,
numero_de_cuenta INTEGER,
monto INTEGER,
tipo_de_operacion TEXT,
hora TEXT
);






