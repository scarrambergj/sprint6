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


SELECT avg(cantidad) as "Promedio de prestamos", branch_name as "Sucursal" FROM cliente, (SELECT count(loan_type) AS cantidad FROM prestamo)
INNER JOIN sucursal ON sucursal.branch_id = cliente.branch_id
INNER JOIN prestamo ON prestamo.customer_id = cliente.customer_id
GROUP BY sucursal.branch_name



