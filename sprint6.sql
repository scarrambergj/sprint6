/* Primera problematica */

CREATE TABLE "tipos_de_cliente" ( 
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

CREATE TABLE "marcas_de_tarjeta" (
	marca_id INTEGER PRIMARY KEY AUTOINCREMENT,
	nombre_marca TEXT NOT NULL
);

INSERT INTO marcas_de_tarjeta (nombre_marca) VALUES ('MASTERCARD');
INSERT INTO marcas_de_tarjeta (nombre_marca) VALUES ('VISA');
INSERT INTO marcas_de_tarjeta (nombre_marca) VALUES ('AMERICAN EXPRESS');

CREATE TABLE "tarjetas" (
	tarjeta_id INTEGER PRIMARY KEY AUTOINCREMENT,
	numero INTEGER NOT NULL UNIQUE CHECK (numero > 99999999999999999999 and numero < 1000000000000000000000),
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


		





