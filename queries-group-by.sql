-- 1. Contare i corsi raggruppati per cfu
SELECT COUNT(`id`), `cfu`
FROM `courses`
GROUP BY `cfu`
ORDER BY `cfu`;

-- 2. Contare gli studenti raggruppati per anno di nascita
SELECT YEAR(`date_of_birth`) AS `anno_di_nascita`,  COUNT(*)
FROM `students`
GROUP BY `anno_di_nascita`;

-- 3. Selezionare il voto più basso dato ad ogni appello d'esame
SELECT MIN(`vote`) as `worst_vote`, `exam_id` 
FROM `exam_student`
GROUP BY `exam_id`  
ORDER BY `worst_vote` DESC

-- # custom query con HAVING = alternativa al WHERE quando uso funzioni di aggregazione NELLA CONDIZIONE 
-- % @link:  https://www.w3schools.com/mysql/mysql_having.asp
SELECT MIN(`vote`) as `worst_vote`, MAX(`vote`) as `best_vote`, AVG(`vote`) as `average_vote`, COUNT(*), `exam_id` 
FROM `exam_student`
GROUP BY `exam_id`  
HAVING COUNT(*) > 10  
ORDER BY `average_vote` DESC

-- 4. Contare gli appelli d'esame del mese di luglio raggruppati per giorno
SELECT COUNT(*) AS `numero_appelli_esame`, DAY(`date`) as `giorno_del_mese`
FROM `exams`
WHERE MONTH(`date`) = 7
GROUP BY `giorno_del_mese`
ORDER BY `giorno_del_mese`;