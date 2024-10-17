-- Selezionare tutti gli studenti nati nel 1990
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

-- 1b Selezionare tutti gli studenti dopo il 1990
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) > 1990;

-- 2.Selezionare tutti i corsi che valgono più di 10 crediti
SELECT * 
FROM `courses`
WHERE `cfu` > 10;


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT * 
FROM `students`
WHERE YEAR(CURRENT_DATE) - YEAR(`date_of_birth`) > 30;

SELECT * 
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT * 
FROM `courses`
WHERE `period` = "I semestre"
AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
-- ! no buena
-- SELECT * 
-- FROM `exams`
-- WHERE `date` = '2020-06-20'
-- AND `hour` > '14%';

-- SELECT * 
-- FROM `exams` 
-- WHERE `date` = "2020/06/20"
-- AND `hour` >"14:00:00"

SELECT * 
FROM `exams`
WHERE `date` = '2020-06-20'
AND HOUR(`hour`) >= 14;

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
-- Selezionare tutti i corsi di laurea magistrale (38)
SELECT *
FROM `degrees`
WHERE `level` = "Magistrale";

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(`id`) 
FROM `students`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(`id`) 
FROM `teachers`
WHERE `phone` IS NULL;

-- 9. Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo degree_id, inserire un valore casuale)
INSERT INTO `students` ( `degree_id`, `name`, `surname`, `date_of_birth`, `fiscal_code`, `enrolment_date`,  `registration_number`, `email` ) VALUES ( "29", "Nino", "Ninetti",  "1993-10-17", "NIN22NDIWNDIQNWCX", "2024-10-17", 701111,"email@boolean.careers" );

-- 10. Cambiare il numero dell’ufficio del professor Pietro Rizzo in 126
UPDATE `teachers`
SET `office_number` = 126
WHERE `name` = "Pietro" AND `surname` = "Rizzo";

-- 11. Eliminare dalla tabella studenti il record creato precedentemente al punto 9
DELETE FROM `students`
WHERE `name` = "Nino" AND `surname` = "Ninetti";