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

/*Obtener el promedio de créditos otorgado por sucursal*/
SELECT avg(cantidad) as "Promedio de prestamos", branch_name as "Sucursal" FROM cliente, (SELECT count(loan_type) AS cantidad FROM prestamo)
INNER JOIN sucursal ON sucursal.branch_id = cliente.branch_id
INNER JOIN prestamo ON prestamo.customer_id = cliente.customer_id
GROUP BY sucursal.branch_name



