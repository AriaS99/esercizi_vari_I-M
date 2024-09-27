CREATE TABLE Istruttore(
	istruttoreID INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(250) NOT NULL,
	cogn VARCHAR(250) NOT NULL,
	spec VARCHAR(250) NOT NULL,
	orin TIME NOT NULL CHECK (orin BETWEEN '7:00' AND '22:00'),
	orfi TIME NOT NULL CHECK (orfi BETWEEN '8:00' AND '23:00')
);

CREATE TABLE Membro(
	membroID INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(250) NOT NULL,
	cogn VARCHAR(250) NOT NULL,
	datn DATE NOT NULL CHECK (datn >= '1900-01-01'),
	sess CHAR(1) NOT NULL CHECK (sess IN('F', 'M', 'A')),
	emai VARCHAR(250) NOT NULL,
	tele VARCHAR(20) NOT NULL,
	dain DATE CHECK (dain >= '1900-01-01'),
); 

ALTER TABLE Membro ADD CONSTRAINT CHK_Data CHECK (dain >= datn);

CREATE TABLE Abbonamento(
	abbonamentoID INT PRIMARY KEY IDENTITY(1,1),
	tipo VARCHAR(11) NOT NULL CHECK (tipo IN('Mensile', 'Trimestrale', 'Semestrale', 'Annuale', 'Biennale','Triennale')),
	prez DECIMAL(6,2) NOT NULL CHECK (prez > 0),
	membroRIF INT NOT NULL,
	FOREIGN KEY (membroRIF) REFERENCES Membro(membroID) ON DELETE CASCADE,
); 

CREATE TABLE Classe(
	classeID INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(250) NOT NULL,
	dscr TEXT NOT NULL,
	orar TIME NOT NULL CHECK (orar BETWEEN '7:00' AND '22:00'),
	gset VARCHAR(20) NOT NULL CHECK (gset IN('Lunedì', 'Martedì', 'Mercoledì', 'Giovedì', 'Venerdì','Sabato', 'Domenica')),
	nmax INT CHECK (nmax BETWEEN 0 AND 20),
	istruttoreRIF INT NOT NULL,
	FOREIGN KEY (istruttoreRIF) REFERENCES Istruttore(istruttoreID) ON DELETE CASCADE,
); 

CREATE TABLE Prenotazione(
	prenotazioneID INT PRIMARY KEY IDENTITY(1,1),
	dain DATE NOT NULL,
	orar TIME NOT NULL CHECK (orar BETWEEN '7:00' AND '22:00'),
	classeRIF INT NOT NULL,
	membroRIF INT NOT NULL,
	FOREIGN KEY (classeRIF) REFERENCES Classe(classeID) ON DELETE CASCADE,
	FOREIGN KEY (membroRIF) REFERENCES Membro(membroID) ON DELETE CASCADE,
);

CREATE TABLE Attrezzatura(
	attrezzaturaID INT PRIMARY KEY IDENTITY(1,1),
	dscr TEXT,
	daac DATE NOT NULL,
	stat VARCHAR(250) CHECK (stat IN('Disponibile', 'Fuori servizio', 'in Manutenzione')),
	classeRIF INT NOT NULL,
	FOREIGN KEY (classeRIF) REFERENCES Classe(classeID) ON DELETE CASCADE
);
-- ------------------------------------------------------------------------------------------

-- Insert into Istruttore
INSERT INTO Istruttore (nome, cogn, spec, orin, orfi) VALUES 
('Mario', 'Rossi', 'Fitness', '07:00', '18:00'),
('Luca', 'Bianchi', 'Yoga', '08:00', '17:00'),
('Giulia', 'Verdi', 'Pilates', '09:00', '19:00'),
('Marco', 'Neri', 'Boxe', '07:00', '16:00'),
('Laura', 'Bruni', 'Spinning', '08:00', '20:00'),
('Andrea', 'Moretti', 'Bodybuilding', '10:00', '21:00'),
('Francesca', 'Conti', 'Zumba', '11:00', '22:00'),
('Alessandro', 'Riva', 'CrossFit', '08:00', '20:00'),
('Sara', 'Fontana', 'Fitness', '07:30', '18:30'),
('Lorenzo', 'Russo', 'Kickboxing', '09:00', '20:00');
-- Insert into Membro
INSERT INTO Membro (nome, cogn, datn, sess, emai, tele, dain) VALUES 
('Luca', 'Rossi', '1990-02-15', 'M', 'lr@ex.com', '1234567890', '2020-01-10'),
('Maria', 'Bianchi', '1985-05-20', 'F', 'mb@ex.com', '1234567891', '2023-02-15'),
('Francesco', 'Verdi', '1998-09-30', 'M', 'fv@ex.com', '1234567892', '2018-03-05'),
('Giulia', 'Neri', '1995-11-25', 'F', 'gn@ex.com', '1234567893', '2023-04-20'),
('Alessia', 'Bruni', '1992-12-10', 'F', 'ab@ex.com', '1234567894', '2018-05-15'),
('Matteo', 'Moretti', '1987-08-14', 'M', 'mm@ex.com', '1234567895', '2023-06-10'),
('Laura', 'Conti', '1991-03-22', 'F', 'lc@ex.com', '1234567896', '2022-07-01'),
('Andrea', 'Riva', '1994-07-18', 'M', 'ar@ex.com', '1234567897', '2023-08-10'),
('Sara', 'Fontana', '1999-06-09', 'F', 'sf@ex.com', '1234567898', '2019-09-15'),
('Elena', 'Russo', '1989-01-29', 'F', 'er@ex.com', '1234567899', '2020-10-01'),
('Roberto', 'Ferrari', '1990-04-17', 'M', 'rf@ex.com', '1234567890', '2023-01-11'),
('Paola', 'Martini', '1995-10-30', 'F', 'pm@ex.com', '1234567891', '2019-02-16'),
('Lorenzo', 'Lombardi', '1988-07-22', 'M', 'll@ex.com', '1234567892', '2023-03-06'),
('Federica', 'Greco', '1992-11-08', 'F', 'fg@ex.com', '1234567893', '2023-04-21'),
('Simone', 'Esposito', '1987-12-02', 'M', 'se@ex.com', '1234567894', '2021-05-16'),
('Giorgia', 'Costa', '1993-09-19', 'F', 'gc@ex.com', '1234567895', '2023-06-11'),
('Antonio', 'D’Amico', '1986-06-11', 'M', 'ad@ex.com', '1234567896', '2020-07-02'),
('Martina', 'Pellegrini', '1994-02-03', 'F', 'mp@ex.com', '1234567897', '2018-08-11'),
('Valerio', 'Barone', '1997-01-01', 'M', 'vb@ex.com', '1234567898', '2021-09-16'),
('Claudia', 'Mancini', '1990-05-21', 'F', 'cm@ex.com', '1234567899', '2022-10-02');
-- Insert into Abbonamento
INSERT INTO Abbonamento (tipo, prez, membroRIF) VALUES 
('Mensile', 50.00, 1),
('Trimestrale', 120.00, 2),
('Semestrale', 200.00, 3),
('Annuale', 350.00, 4),
('Biennale', 600.00, 5),
('Triennale', 800.00, 6),
('Mensile', 50.00, 7),
('Trimestrale', 120.00, 8),
('Semestrale', 200.00, 9),
('Annuale', 350.00, 10),
('Biennale', 600.00, 11),
('Triennale', 800.00, 12),
('Mensile', 50.00, 13),
('Trimestrale', 120.00, 14),
('Semestrale', 200.00, 15),
('Annuale', 350.00, 16),
('Biennale', 600.00, 17),
('Triennale', 800.00, 18),
('Mensile', 50.00, 19),
('Trimestrale', 120.00, 20);
-- Insert into Classe
INSERT INTO Classe (nome, dscr, orar, gset, nmax, istruttoreRIF) VALUES
('Yoga', 'Lezione di yoga per principianti', '08:00', 'Lunedì', 20, 2),
('Pilates', 'Lezione di pilates avanzato', '09:30', 'Mercoledì', 15, 3),
('Boxe', 'Lezione di boxe per intermedi', '07:00', 'Sabato', 20, 4),
('Spinning', 'Lezione di spinning ad alta intensità', '08:00', 'Venerdì', 20, 5),
('Fitness', 'Allenamento fitness completo', '07:30', 'Martedì', 15, 1),
('Zumba', 'Lezione di Zumba per divertirsi', '09:00', 'Lunedì', 20, 7),
('CrossFit', 'Lezione di CrossFit avanzato', '08:30', 'Giovedì', 10, 8),
('Bodybuilding', 'Corso di bodybuilding avanzato', '10:00', 'Domenica', 15, 6),
('Kickboxing', 'Lezione di kickboxing per principianti', '07:30', 'Martedì', 20, 9),
('Pilates', 'Lezione di pilates base', '09:00', 'Sabato', 20, 10),
('Yoga', 'Lezione di yoga per rilassamento', '10:00', 'Mercoledì', 15, 1),
('Spinning', 'Spinning con musica', '08:00', 'Domenica', 20, 9),
('Fitness', 'Allenamento completo corpo', '07:30', 'Venerdì', 10, 3),
('Zumba', 'Zumba per principianti', '09:00', 'Giovedì', 20, 4),
('CrossFit', 'Lezione intensa di CrossFit', '08:30', 'Sabato', 10, 5),
('Bodybuilding', 'Tecniche avanzate di bodybuilding', '10:00', 'Lunedì', 15, 2),
('Kickboxing', 'Kickboxing base', '07:30', 'Domenica', 20, 7),
('Pilates', 'Pilates intermedio', '09:00', 'Mercoledì', 20, 8),
('Yoga', 'Yoga intermedio', '10:00', 'Venerdì', 15, 6),
('Boxe', 'Boxe avanzato', '07:00', 'Martedì', 10, 10);
-- Insert into Prenotazione
INSERT INTO Prenotazione (dain, orar, classeRIF, membroRIF) VALUES 
('2023-12-01', '08:00', 1, 1), ('2023-12-02', '09:30', 2, 2),
('2023-12-03', '07:00', 3, 3), ('2023-12-04', '08:00', 4, 4),
('2023-12-05', '07:30', 5, 5), ('2023-12-06', '09:00', 6, 6),
('2023-12-07', '08:30', 7, 7), ('2023-12-08', '10:00', 8, 8),
('2023-12-09', '07:30', 9, 9), ('2023-12-10', '09:00', 10, 10),
('2023-12-11', '10:00', 11, 11), ('2023-12-12', '08:00', 12, 12),
('2023-12-13', '07:30', 13, 13), ('2023-12-14', '09:00', 14, 14),
('2023-12-15', '08:30', 15, 15), ('2023-12-16', '10:00', 16, 16),
('2023-12-17', '07:30', 17, 17), ('2023-12-18', '09:00', 18, 18),
('2023-12-19', '10:00', 19, 19), ('2023-12-20', '07:00', 20, 20),
('2023-12-01', '08:00', 1, 10), ('2023-12-02', '09:30', 2, 9),
('2023-12-03', '07:00', 3, 8), ('2023-12-04', '08:00', 4, 7),
('2023-12-05', '07:30', 5, 6), ('2023-12-06', '09:00', 6, 5),
('2023-12-07', '08:30', 7, 4), ('2023-12-08', '10:00', 8, 3),
('2023-12-09', '07:30', 9, 2), ('2023-12-10', '09:00', 10, 1),
('2023-12-11', '10:00', 11, 20), ('2023-12-12', '08:00', 12, 19),
('2023-12-13', '07:30', 13, 18), ('2023-12-14', '09:00', 14, 17),
('2023-12-15', '08:30', 15, 16), ('2023-12-16', '10:00', 16, 15),
('2023-12-17', '07:30', 17, 14), ('2023-12-18', '09:00', 18, 13),
('2023-12-19', '10:00', 19, 12), ('2023-12-20', '07:00', 20, 11),
('2023-12-01', '08:00', 1, 20), ('2023-12-02', '09:30', 2, 19),
('2023-12-03', '07:00', 3, 18), ('2023-12-04', '08:00', 4, 17),
('2023-12-05', '07:30', 5, 16), ('2023-12-06', '09:00', 6, 15),
('2023-12-07', '08:30', 7, 14), ('2023-12-08', '10:00', 8, 13),
('2023-12-09', '07:30', 9, 12), ('2023-12-10', '09:00', 10, 10),
('2023-12-11', '10:00', 11, 9), ('2023-12-12', '08:00', 12, 8),
('2023-12-13', '07:30', 13, 7), ('2023-12-14', '09:00', 14, 6),
('2023-12-15', '08:30', 15, 5), ('2023-12-16', '10:00', 16, 4),
('2023-12-17', '07:30', 17, 3), ('2023-12-18', '09:00', 18, 2),
('2023-12-19', '10:00', 19, 1), ('2023-12-20', '07:00', 20, 10),
('2023-12-01', '08:00', 1, 20), ('2023-12-02', '09:30', 2, 19),
('2023-12-03', '07:00', 3, 9), ('2023-12-04', '08:00', 4, 18),
('2023-12-05', '07:30', 5, 8), ('2023-12-06', '09:00', 6, 17),
('2023-12-07', '08:30', 7, 16), ('2023-12-08', '10:00', 8, 7),
('2023-12-09', '07:30', 9, 6), ('2023-12-10', '09:00', 10, 1),
('2023-12-11', '10:00', 11, 5), ('2023-12-12', '08:00', 12, 15),
('2023-12-13', '07:30', 13, 14), ('2023-12-14', '09:00', 14, 4),
('2023-12-15', '08:30', 15, 3), ('2023-12-16', '10:00', 16, 13),
('2023-12-17', '07:30', 17, 12), ('2023-12-18', '09:00', 18, 2),
('2023-12-19', '10:00', 19, 11), ('2023-12-20', '07:00', 20, 1);
-- Insert into Attrezzatura
INSERT INTO Attrezzatura (dscr, daac, stat, classeRIF) VALUES 
('Tapis roulant', '2023-01-01', 'Disponibile', 1),
('Cyclette', '2022-12-15', 'Disponibile', 5),
('Ellittica', '2023-02-10', 'Fuori servizio', 8),
('Panca piana', '2022-11-20', 'Disponibile', 11),
('Manubri', '2022-10-30', 'Disponibile', 15),
('Bilanciere olimpionico', '2023-03-05', 'in Manutenzione',13),
('Macchina per leg press', '2023-01-15', 'Disponibile', 19),
('Step', '2022-09-10', 'Disponibile', 6),
('Kettlebell', '2022-08-25', 'Disponibile', 2),
('Rower', '2023-04-12', 'in Manutenzione', 17),
('Lat machine', '2022-07-14', 'Disponibile', 20),
('Corda per saltare', '2022-06-01', 'Disponibile', 10),
('Smith machine', '2023-05-10', 'Fuori servizio', 18),
('Macchina per pettorali', '2022-05-20', 'Disponibile', 14),
('Macchina per dorsali', '2023-02-25', 'in Manutenzione', 3),
('Tappetini yoga', '2022-03-01', 'Disponibile', 16),
('Sacco da boxe', '2022-12-05', 'Disponibile', 9),
('TRX', '2023-01-30', 'Disponibile', 12),
('Panca inclinata', '2023-03-15', 'in Manutenzione', 4),
('Macchina per squat', '2022-04-22', 'Fuori servizio', 7);
-- -----------------------------------------------------------------
-- QUERY
-- 1.Recupera tutti i membri registrati nel sistema.
SELECT * FROM Membro;
-- 2.Recupera il nome e il cognome di tutti i membri che hanno un abbonamento mensile
SELECT nome, cogn, tipo
	FROM Membro
	JOIN Abbonamento ON Membro.membroID = Abbonamento.membroRIF
	WHERE tipo = 'Mensile'; 
-- 3.Recupera l'elenco delle classi di yoga offerte dal centro fitness.
SELECT * FROM Classe WHERE nome = 'Yoga';
-- 4.Recupera il nome e cognome degli istruttori che insegnano Pilates.
SELECT Istruttore.nome, cogn, Classe.nome 
	FROM Istruttore
	JOIN Classe ON Istruttore.istruttoreID = Classe.istruttoreRIF
	WHERE Classe.nome = 'Pilates';

SELECT Istruttore.nome, cogn, spec FROM Istruttore WHERE spec = 'Pilates';
-- 5.Recupera i dettagli delle classi programmate per il lunedì.
SELECT * FROM Classe WHERE gset = 'lunedì';
-- 6.Recupera l'elenco dei membri che hanno prenotato una classe di spinning.
SELECT Membro.nome, cogn, Classe.nome 
	FROM Membro
	JOIN Prenotazione ON Membro.membroID = Prenotazione.membroRIF
	JOIN Classe ON Prenotazione.classeRIF = Classe.classeID
	WHERE Classe.nome = 'Spinning';
-- 7.Recupera tutte le attrezzature che sono attualmente fuori servizio
SELECT * FROM Attrezzatura WHERE stat = 'Fuori servizio';
-- 8.Conta il numero di partecipanti per ciascuna classe programmata per il mercoledì
SELECT COUNT(*) AS contatore
	FROM Classe
	JOIN Prenotazione ON Classe.classeID = Prenotazione.classeRIF
	JOIN Membro ON Prenotazione.membroRIF = Membro.membroID
	WHERE gset = 'Mercoledì';
-- 9.Recupera l'elenco degli istruttori disponibili per tenere una lezione il sabato
SELECT Istruttore.nome , Classe.nome, gset
	FROM Istruttore
	JOIN Classe ON Classe.istruttoreRIF = Istruttore.istruttoreID
	WHERE gset = 'Sabato';
-- 10.Recupera tutti i membri che hanno un abbonamento attivo dal 2023.
SELECT nome, dain
	FROM Membro
	JOIN Abbonamento ON Membro.membroID = Abbonamento.membroRIF
	WHERE dain LIKE '%2023%';
-- 11.Trova il numero massimo di partecipanti per tutte le classi di BOXE
SELECT nmax AS numero_massimo, nome FROM Classe WHERE nome = 'boxe';
-- 12.Recupera le prenotazioni effettuate da un membro specifico.
SELECT * 
	FROM Prenotazione
	JOIN Membro ON Prenotazione.membroRIF = Membro.membroID
	WHERE nome = 'Paola' AND cogn = 'Martini';
-- 13.Recupera l'elenco degli istruttori che conducono più di 5 classi alla settimana
SELECT COUNT(*) AS contatore, Classe.nome
	FROM Classe
	JOIN Istruttore ON Classe.istruttoreRIF = Istruttore.istruttoreID 
	GROUP BY Classe.nome HAVING COUNT(*) >1
	ORDER BY contatore DESC;
-- 14.Recupera le classi che hanno ancora posti disponibili per nuove prenotazioni.
--					//
-- 15.Recupera l'elenco dei membri che hanno annullato una prenotazione negli ultimi 30 giorni
--					//
-- 16.Recupera tutte le attrezzature acquistate prima del 2022
SELECT * FROM Attrezzatura WHERE daac < '2022';
-- 17.Recupera l'elenco dei membri che hanno prenotato una classe in cui l'istruttore è "Mario Rossi".
SELECT Membro.nome, Classe.nome, Istruttore.nome, Istruttore.cogn
	FROM Istruttore 
	JOIN Classe ON Istruttore.istruttoreID = Classe.istruttoreRIF
	JOIN Prenotazione ON Classe.classeID = Prenotazione.classeRIF
	JOIN Membro ON Prenotazione.membroRIF = Membro.membroID
	WHERE Istruttore.nome = 'Mario' AND Istruttore.cogn = 'Rossi'
-- 18.Calcola il numero totale di prenotazioni per ogni classe per un determinato periodo di tempo.
--					//
-- 19.Trova tutte le classi associate a un istruttore specifico e i membri che vi hanno partecipato.
SELECT * 
	FROM Istruttore
	JOIN Classe ON Istruttore.istruttoreID = Classe.istruttoreRIF
	JOIN Prenotazione ON Classe.classeID = Prenotazione.classeRIF
	JOIN Membro ON Prenotazione.membroRIF = Membro.membroID
	WHERE Istruttore.nome = 'Luca' AND Istruttore.cogn = 'Bianchi';
-- 20.Recupera tutte le attrezzature in manutenzione e il nome degli istruttori che le utilizzano nelle loro classi
SELECT * 
	FROM Istruttore
	JOIN Classe ON Istruttore.istruttoreID = Classe.istruttoreRIF
	JOIN Attrezzatura ON  Classe.classeID = Attrezzatura.classeRIF
	WHERE stat = 'in manutenzione';
-- ------------------------------------------------------------------------------------------------------------
-- VIEW
-- 1.Crea una view che mostra l'elenco completo dei membri con il loro nome, cognome e tipo di abbonamento.
CREATE VIEW ElencoMembri AS
	SELECT nome, cogn AS cognome, tipo AS tipo_abbonamento
		FROM Membro
		JOIN Abbonamento ON Membro.membroID = Abbonamento.membroRIF;

SELECT * FROM ElencoMembri;
-- 2.Crea una view che elenca tutte le classi disponibili con i rispettivi nomi degli istruttori.
CREATE VIEW ClassiIstruttori AS
	SELECT Classe.* , Istruttore.nome + ' ' + cogn AS istruttore
		FROM Classe 
		JOIN Istruttore ON Classe.istruttoreRIF = Istruttore.istruttoreID;

SELECT * FROM ClassiIstruttori;
-- 3.Crea una view che mostra le classi prenotate dai membri insieme al nome della classe e alla data di prenotazione.
CREATE VIEW ClassiMembri AS
	SELECT Classe.nome AS nome_classe, Classe.dscr AS descrizione_classe, 
	Membro.nome + ' ' + cogn AS nominativo_membro, Prenotazione.dain AS data_prenotazione
		FROM Classe
		JOIN Prenotazione ON Classe.classeID = Prenotazione.classeRIF
		JOIN Membro ON Prenotazione.membroRIF = Membro.membroID

SELECT * FROM ClassiMembri;
-- 4.Crea una view che elenca tutte le attrezzature attualmente disponibili, con la descrizione e lo stato.
CREATE VIEW AttrezzatureDisponibili AS
	SELECT dscr AS descrizione, stat AS stato FROM Attrezzatura WHERE stat = 'Disponibile'

SELECT * FROM AttrezzatureDisponibili;
--  5.Crea una view che mostra i membri che hanno prenotato una classe di spinning negli ultimi 30 giorni.
CREATE VIEW MembriSpinning AS
	SELECT * 
		FROM Membro
		JOIN Prenotazione ON Membro.membroID = Prenotazione.membroRIF
		JOIN Classe ON Prenotazione.classeRIF = Classe.classeID
		WHERE Classe.nome = 'Spinning' 
	--incompleto.
-- 6.Crea una view che elenca gli istruttori con il numero totale di classi che conducono.
CREATE VIEW IstruttoriClassi AS
	SELECT Istruttore.nome AS istruttori, COUNT(*) AS classi
		FROM Classe 
		JOIN Istruttore ON Classe.istruttoreRIF = Istruttore.istruttoreID
		GROUP BY Istruttore.nome

SELECT * FROM IstruttoriClassi;
-- 7.Crea una view che mostri il nome delle classi e il numero di partecipanti registrati per ciascuna classe.
CREATE VIEW ClassiPartecipanti AS
	SELECT Classe.nome AS classi, COUNT(*) AS partecipanti
		FROM Membro 
		JOIN Prenotazione ON Membro.membroID = Prenotazione.membroRIF
		JOIN Classe ON Prenotazione.classeRIF = Classe.classeID
		GROUP BY Classe.nome

SELECT * FROM ClassiPartecipanti;
-- 8.Crea una view che elenca i membri che hanno un abbonamento attivo insieme alla data di inizio e la data di scadenza.
-- CREATE VIEW AbbonamentiAttivi AS

-- 9.Crea una view che mostra l'elenco degli istruttori che conducono classi il lunedì e il venerdì.
CREATE VIEW IstruttoriLunVen AS
	SELECT Istruttore.nome + ' ' + cogn AS istruttori, Classe.nome AS tipo_lezione, gset AS giorno
		FROM Istruttore
		JOIN Classe ON Istruttore.istruttoreID = Classe.istruttoreRIF
		WHERE Classe.gset = 'lunedì' OR Classe.gset = 'venerdì'

SELECT * FROM IstruttoriLunVen;
--10.Crea una view che elenca tutte le attrezzature acquistate nel 2023 insieme al loro stato attuale.
CREATE VIEW Attrezzature2023 AS
	SELECT dscr AS tipo_attrezzatura, daac AS data_acquisto, stat AS stato
		FROM Attrezzatura 
		WHERE daac LIKE '%2023%'

SELECT * FROM Attrezzature2023;
-- ---------------------------------------------------------------------------------------------------------
-- SP
-- 1.Scrivi una stored procedure che permette di inserire un nuovo membro nel sistema con tutti i suoi dettagli,
-- come nome, cognome, data di nascita, tipo di abbonamento, ecc.
CREATE PROCEDURE InsertMembro
	@Nome VARCHAR(250),
	@Cogn VARCHAR(250),
	@Datn DATE,
	@Sess CHAR(1),
	@Emai VARCHAR(250),
	@Tele VARCHAR(20),
	@Dain DATE
AS
BEGIN

	INSERT INTO Membro (nome, cogn, datn, sess, emai, tele, dain) VALUES
		(@Nome, @Cogn, @Datn, @Sess, @Emai, @Tele, @Dain);
END;
--inserimento:
EXEC InsertMembro @Nome = 'Arianna', @Cogn = 'Scorc', @Datn = '1999-04-30', @Sess = 'F', @Emai = 'ari@sco.com', @Tele = '333714992', @Dain = '2024-09-21';
-- 2.Scrivi una stored procedure per aggiornare lo stato di un'attrezzatura (ad esempio, disponibile, in manutenzione, fuori servizio).
CREATE PROCEDURE AggiornaStatoAttrezzatura
	@AttrezzaturaID INT,
	@stato VARCHAR(250)
AS
BEGIN
	UPDATE Attrezzatura
	SET stat = @stato
	WHERE attrezzaturaID = @AttrezzaturaID

END;

EXEC AggiornaStatoAttrezzatura @AttrezzaturaID = '1', @stato = 'Fuori servizio'
-- 3.Scrivi una stored procedure che consenta a un membro di prenotare una classe specifica.
CREATE PROCEDURE PrenotazioneClasse
	@Dain DATE,
	@Orar TIME,
	@classeRIF INT,
	@membroRIF INT
AS
BEGIN

	INSERT INTO Prenotazione (dain, orar, classeRIF, membroRIF) VALUES
		(@Dain, @Orar, @classeRIF, @membroRIF);
END;

EXEC PrenotazioneClasse @Dain = '2024-09-21', @Orar = '10:00', @classeRIF = '9', @membroRIF = '21'
-- 5.Scrivi una stored procedure per permettere ai membri di cancellare una prenotazione esistente.
--		//

-- 6.Scrivi una stored procedure che restituisce il numero di classi condotte da un istruttore specifico.
CREATE PROCEDURE NumClassiIstruttore 
	@NomeIstruttore VARCHAR(250),
	@CognIstruttore VARCHAR(250)
AS
BEGIN
	SELECT Istruttore.nome + ' ' + Istruttore.Cogn AS istruttore, COUNT(*) AS num_classi
		FROM Classe 
		JOIN Istruttore ON Classe.istruttoreRIF = Istruttore.istruttoreID
		WHERE Istruttore.nome = @NomeIstruttore AND Istruttore.Cogn = @CognIstruttore
		GROUP BY Istruttore.nome, Istruttore.Cogn;
END;

EXEC NumClassiIstruttore @NomeIstruttore = 'Mario', @CognIstruttore = 'Rossi';
