SELECT count(*), branch_name FROM cliente 
INNER JOIN sucursal ON sucursal.branch_id = cliente.branch_id
GROUP BY branch_name 
ORDER BY count(*) DESC

SELECT count(cliente.branch_id) as clientes, count(empleado.branch_id), branch_name FROM sucursal 
INNER JOIN cliente ON cliente.branch_id = sucursal.branch_id 
INNER JOIN empleado ON empleado.branch_id = sucursal.branch_id 
GROUP BY sucursal.branch_name
ORDER BY clientes DESC

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

DROP TRIGGER auditoria

UPDATE cuenta
	SET balance = 100
	WHERE account_id BETWEEN 10 AND 14
	

ROLLBACK





