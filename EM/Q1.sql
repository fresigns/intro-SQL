-- Query per recuperare dipendenti per stipendio 1800
SELECT nome, data_assunzione, stipendio 
FROM dipendenti 
WHERE stipendio > 1800;
/* ----------------------------- */
CREATE TABLE nometabella(
nome_campo tipo_di_dato costraint);
/* ----------------------------- */
CREATE DATABASE db_prova; /*crea DB*/
DROP DATABASE db_prova; /*elimina DB*/

/* ----------------------------- */
/* ----------------------------- */
/* ----------------------------- */

/* costraint */ 
-- condizioni che possiamo aggiungere su una colonna

CREATE TABLE IF NOT EXISTS dipendenti(
id int,
nome varchar(255),
cognome varchar(255),
data_assunzionem date,
stipendio decimal
);
/* ----------------------------- */
CREATE TABLE IF NOT EXISTS dipendenti(
id int not null,
nome varchar(255) not null,
cognome varchar(255) not null,
data_assunzionem date not null,
stipendio decimal
);
-- pseudo codice:
/* inserisci in dipendenti id, nome=marco, cognome=rossi */
--					       non può essere nullo, devo assegnare sempre un valore
/* ----------------------------- */
/* PRIMARY KEY */
/*chiave primaria*/
-- identificazione univoca (es. targa, codice fiscale etc..)
-- chiave importantissima per la tabella
/* ----------------------------- */
CREATE TABLE IF NOT EXISTS dipendenti(
id_dipendente int not null,
nome varchar(255) not null,
cognome varchar(255) not null,
data_assunzionem date not null,
stipendio decimal not null check (stipendio >= 1200 AND stipendio <= 5000),
telefono varchar(10) not null unique,
mansione varchar(255) not null default 'impiegato'
PRIMARY KEY(id_dipendente),
FOREIGN KEY(id_dipendente) REFERENCES rapporto_clienti(id_dipendente)
);
/* ----------------------------- */
/* UNIQUE */ 
-- campo che deve essere unico, ma non è una primary key
/* ----------------------------- */
-- pseudo codice:
/* inserisci in dipendenti id=1, nome=luca, cognome=rossi, mansione,  */
--                                                         possiamo lasciarlo vuoto, visto che c'è il default!
/* ----------------------------- */
/* CHECK */
-- serve a verificare un campo in fase di inserimento o di modifica
-- es. verifica lo stipendio tra 1200 e 5000
/* ----------------------------- */
-- pseudo codice:
/* inserimento stipendio=5000 */
/* ----------------------------- */
/* FOREIGN KEY */
-- chiave esterna (straniera)
/* ----------------------------- */
CREATE TABLE clienti(
id_cliente int not null,
denominazione varchar(255) not null unique,
p_iva varchar(16) not null,
indirizzo varchar(255) not null,
telefono varchar(10) not null unique,
PRIMARY KEY(id_cliente),
FOREIGN KEY(id_cliente) REFERENCES rapporto_clienti(id_cliente)
);
/* ----------------------------- */
CREATE TABLE rapporto_clienti(
id_rapporto int not null,
id_cliente int not null,
id_dipendente int not null
);

/*
DB RELAZIONALI --------------------------
diverse tabelle, che fanno parte di un DB,
che costruiscono delle relazioni tra di loro
*/

INSERT INTO nome_tabella (colonna1, colonna2, colonna3, ...)
VALUE (valore1, valore2, valore3, ...);