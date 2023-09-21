CREATE TABLE IF NOT EXISTS clienti(
id_cliente int UNSIGNED not null AUTO_INCREMENT REFERENCES rapporto_clienti(id_cliente),
denominazione varchar(255) not null,
p_iva varchar(16) not null unique,
indirizzo varchar(255) not null,
telefono varchar(10) not null unique,
PRIMARY KEY(id_cliente),
);

/* ----------------------------- */

INSERT INTO clienti (id_cliente, denominazione, p_iva, indirizzo, telefono)
VALUE (0, "Xyz Impianti", "0123456789", "Via Roma, Cesena", "3332221110");

INSERT INTO clienti (id_cliente, denominazione, p_iva, indirizzo, telefono)
VALUE (1, "Altra denominazione", "9876543210", "Via Liberazione, Milano", "3332221234");

-- AUTO_INCREMENT per far incrementare automaticamente il valore dell'id_ 