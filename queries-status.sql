-- Query che interrogano il databse per visualizzare, incrociare (talvolta anche modificare) i dati in esso presenti

-- Keyword che seleziona record dal nostro database ~ SELECT
-- Keyword per indicare tutte le colonne ~ *

-- Mostrami tutte le colonne per ogni dato presente nella tabella studenti
SELECT * 
FROM `students`;


-- Mostrami solo ed esclusivamente nome, cognome, data di nascita e codice fiscale per ogni dato presente nella tabella studenti
SELECT `name`, `surname`, `date_of_birth`, `fiscal_code`
FROM `students`;

-- === OPERATORI IN MYSQL:  
--# maggiore o maggiore uguale -> > o > = 
--# minore o minore uguale -> < o < =
--!!! disuguaglianza -> <> 
--%%% uguaglianza -> = 
--# or -> OR
--# and -> AND

-- Mostrami tutte le colonne per ogni dato presente nella tabella studenti il cui nome sia "Marco"
SELECT * 
FROM `students` 
WHERE `name` = "Marco";

-- Mostrami tutte le colonne per ogni dato presente nella tabella studenti il cui nome sia "Marco" e l'id del corso di laura minore di 40
SELECT * 
FROM `students` 
WHERE `name` = "Marco"
AND `degree_id` < 40;

-- Mostrami tutte le colonne per ogni dato presente nella tabella studenti il cui nome sia "Marco" e l'id del corso di laura minore di 40, ordinati in ordine alfabetico per cognome in ordine ascendente
SELECT * 
FROM `students` 
WHERE `name` = "Marco"
AND `degree_id` < 40
ORDER BY `surname` ASC;


-- Contami il numero delle studentesse chiamate Maria
SELECT COUNT(`id`)
FROM `students`
WHERE `name` = "Maria";


-- Mostrami tutte le colonne per ogni dato presente nella tabella teachers il cui nome inizi per la lettera "a" 
SELECT * 
FROM `teachers` 
WHERE `name` LIKE "a%";

-- Mostrami tutte le colonne per ogni dato presente nella tabella studenti la cui data di iscrizione sia nell'anno 2020 
SELECT * 
FROM `students`
WHERE YEAR(`enrolment_date`) = 2020;

-- % Esercizio in LC 
-- Selezionare tutti gli insegnanti
SELECT *
FROM `teachers`;

--Selezionare tutti i referenti per ogni dipartimento
SELECT `head_of_department`
FROM `departments`;

--Selezionare tutti gli studenti il cui nome inizia per "E"
SELECT *
FROM `students` 
WHERE name LIKE "E%";

-- Selezionare tutti gli studenti che si sono iscritti nel 2021
SELECT * 
FROM `students`
WHERE YEAR(`enrolment_date`) = 2021;

-- Selezionare tutti i corsi che non hanno un sito web (676)
SELECT *
FROM `courses`
WHERE `website` IS NULL; -- ! ATTENZIONE = non vale per null, abbiamo bisogno di IS NULL o IS NOT NULL

-- Selezionare tutti gli insegnanti che hanno un numero di telefono
SELECT *
FROM `teachers`
WHERE `phone` IS NOT NULL;

-- Selezionare tutti gli appelli d'esame dei mesi di giugno e luglio 2020
SELECT *
FROM `exams`
WHERE `date` BETWEEN "2020-06-01" AND "2020-07-31";

-- Qual è il numero totale degli studenti iscritti?
SELECT COUNT(*)
FROM `students`;