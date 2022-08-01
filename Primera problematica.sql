/* PRIMERA PROBLEMÁTICA */

/*Crear en la base de datos los tipos de cliente, de cuenta y marcas de tarjeta. Insertar los valores según la información provista en el Sprint 5*/
CREATE TABLE tipos_de_cliente ( 
	tipo_id INTEGER PRIMARY KEY AUTOINCREMENT, 
	nombre_tipo TEXT NOT NULL, 
	tarjetas_de_debito INTEGER RESTRICT DEFAULT 1, 
	caja_de_ahorro TEXT RESTRICT DEFAULT 'TRUE', 
	caja_de_ahorro_usd TEXT NOT NULL CHECK (caja_de_ahorro_usd = 'TRUE' or caja_de_ahorro_usd = 'FALSE'), 
	descubierto INTEGER NOT NULL, 
	tarjetas_de_credito INTEGER NOT NULL, 
	retiro_de_efectivo INTEGER NOT NULL, 
	chequeras INTEGER NOT NULL, 
	comision_por_transferencia INTEGER NOT NULL, 
	max_transferencias INTEGER
	);

INSERT INTO tipos_de_cliente (nombre_tipo, caja_de_ahorro_usd, descubierto, tarjetas_de_credito, retiro_de_efectivo, chequeras, comision_por_transferencia, max_transferencias) 
VALUES ('CLASSIC', 'FALSE', 0, 0, 10000, 0, 1, 150000);
INSERT INTO tipos_de_cliente (nombre_tipo, caja_de_ahorro_usd, descubierto, tarjetas_de_credito, retiro_de_efectivo, chequeras, comision_por_transferencia, max_transferencias) 
VALUES ('GOLD', 'TRUE', 10000, 1, 20000, 1, 0.50, 500000);
INSERT INTO tipos_de_cliente (nombre_tipo, caja_de_ahorro_usd, descubierto, tarjetas_de_credito, retiro_de_efectivo, chequeras, comision_por_transferencia, max_transferencias) 
VALUES ('BLACK', 'TRUE', 10000, 5, 100000, 2, 0, null);


CREATE TABLE tipos_de_cuenta(
  tipo_id INTEGER PRIMARY KEY AUTOINCREMENT, 
  nombre_cuenta TEXT NOT NULL
);

INSERT INTO tipos_de_cuenta (nombre_cuenta) VALUES ('Caja de ahorro en pesos');
INSERT INTO tipos_de_cuenta (nombre_cuenta) VALUES ('Caja de ahorro en dólares');
INSERT INTO tipos_de_cuenta (nombre_cuenta) VALUES ('Cuenta Corriente');


CREATE TABLE marcas_de_tarjeta (
	marca_id INTEGER PRIMARY KEY AUTOINCREMENT,
	nombre_marca TEXT NOT NULL
);

INSERT INTO marcas_de_tarjeta (nombre_marca) VALUES ('MASTERCARD');
INSERT INTO marcas_de_tarjeta (nombre_marca) VALUES ('VISA');
INSERT INTO marcas_de_tarjeta (nombre_marca) VALUES ('AMERICAN EXPRESS');

/*Agregar la entidad tarjeta teniendo en cuenta los atributos necesarios para la operación del home banking (se sugieren los siguientes campos Numero (único e irrepetible, con una restricción ante cada inserción que no debe superar 20 números/espacios), CVV, Fecha de otorgamiento, Fecha Expiración). Almacenar si es una tarjeta de crédito o débito.*/
/*Relacionar las tarjetas con la tabla donde se guardan las marcas de tarjeta*/
/*Relacionar las tarjetas con el cliente al que pertenecen*/
CREATE TABLE tarjetas (
	tarjeta_id INTEGER PRIMARY KEY AUTOINCREMENT,
	numero INTEGER NOT NULL UNIQUE CHECK (length(numero <= 20)),
	cvv INTEGER NOT NULL,
	fecha_otorgamiento TEXT NOT NULL,
	fecha_expiracion TEXT NOT NULL,
	tipo TEXT NOT NULL CHECK (tipo = 'DEBITO' or tipo = 'CREDITO'),
	marca_id INTEGER,
	cliente_id INTEGER,
	FOREIGN KEY (marca_id)
		REFERENCES marcas_de_tarjeta(marca_id)
		ON UPDATE NO ACTION
		ON DELETE CASCADE,
	FOREIGN KEY (cliente_id)
		REFERENCES "cliente"(customer_id)
		ON UPDATE NO ACTION
		ON DELETE CASCADE
);

/*Agregar la entidad direcciones, que puede ser usada por los clientes, empleados y sucursales con los campos utilizados en el SPRINT 5*/
CREATE TABLE direcciones(
  direcciones_id INTEGER PRIMARY KEY,
  cliente_id INTEGER DEFAULT NULL,
  employee_id INTEGER DEFAULT NULL,
  branch_id INTEGER DEFAULT NULL,
  calle TEXT NOT NULL,
  numero INTEGER NOT NULL,
  ciudad TEXT NOT NULL,
  provincia TEXT NOT NULL,
  pais TEXT NOT NULL,
  FOREIGN KEY (cliente_id)
		REFERENCES "cliente"(customer_id)
		ON UPDATE NO ACTION
		ON DELETE CASCADE
   FOREIGN KEY (employee_id)
		REFERENCES "empleado"(employee_id)
		ON UPDATE NO ACTION
		ON DELETE CASCADE
   FOREIGN KEY (branch_id)
		REFERENCES "sucursal"(branch_id)
		ON UPDATE NO ACTION
		ON DELETE CASCADE
);

/*Ampliar el alcance de la entidad cuenta para que identifique el tipo de la misma*/
ALTER TABLE cuenta
ADD COLUMN tipo_id INTEGER DEFAULT NULL;

/*Asignar un tipo de cuenta a cada registro de cuenta de forma
aleatoria*/
CREATE TABLE new_cuenta (
"account_id" INTEGER NOT NULL,
 "customer_id" INTEGER NOT NULL,
 "balance" INTEGER NOT NULL,
 "iban" TEXT NOT NULL,
 "tipo_id" INTEGER,
 PRIMARY KEY("account_id" AUTOINCREMENT)
 FOREIGN KEY (tipo_id)
	REFERENCES tipos_de_cuenta(tipo_id)
	ON UPDATE NO ACTION
	ON DELETE CASCADE
);

INSERT INTO new_cuenta SELECT * FROM cuenta;

DROP TABLE cuenta;

ALTER TABLE new_cuenta RENAME TO cuenta;

/*Corregir el campo employee_hire_date de la tabla empleado con la fecha en formato YYYY-MM-DD*/
UPDATE empleado
  SET employee_hire_date = SUBSTR(employee_hire_date, 7, 4)
     || '-' || SUBSTR(employee_hire_date, 4, 2)
     || '-' || SUBSTR(employee_hire_date, 1, 2);

UPDATE cuenta
	SET tipo_id = abs(random()) % (4 - 1) + 1;
	


		





