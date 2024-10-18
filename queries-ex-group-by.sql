-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS `numero_di_iscritti`, YEAR(`enrolment_date`) AS `anno_di_iscrizione`
FROM `students`
GROUP BY `anno_di_iscrizione`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS `numero_professori`, `office_address` AS `edificio`
FROM `teachers`
GROUP BY `edificio`
ORDER BY `numero_professori` DESC;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`) as `media_voto`, `exam_id` 
FROM `exam_student`
GROUP BY `exam_id`;

-- 3v2:  andando a scrivere esplicitamente tutto
SELECT `exam_id`, `departments`.`name` , `degrees`.`name` ,`courses`.`name` , AVG(`vote`) as `media_voto`  
FROM `exam_student`
JOIN `exams` ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `courses` ON `courses`.`id` = `exams`.`course_id`
JOIN `degrees` ON `degrees`.`id` = `courses`.`degree_id`
JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `department_id`, COUNT(`degrees`.`id`) AS `numero_corsi`
FROM `degrees`
GROUP BY `department_id`;

-- 4v2 con nome del dipartimento 
SELECT `department_id`,  `departments`.`name`, COUNT(`degrees`.`id`) AS `numero_corsi`
FROM `degrees`
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
GROUP BY `department_id`;