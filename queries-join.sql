-- 1. Selezionare tutti i corsi del Corso di Laurea in Informatica (22)
SELECT * 
FROM `degrees` 
INNER JOIN `courses`
ON `courses`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Informatica";

-- 2. Selezionare le informazioni sul corso con id = 144, con tutti i relativi appelli d’esame
SELECT *
FROM `courses`
JOIN `exams` ON `courses`.`id` = `exams`.`course_id`
WHERE `courses`.`id` = 44;


-- 3. Selezionare a quale dipartimento appartiene il Corso di Laurea in Diritto dell'economia
-- dell'Economia (Dipartimento di Scienze politiche, giuridiche e studi internazionali)
SELECT * 
FROM `degrees`
JOIN `departments` ON `departments`.`id` `degrees`.`department_id`
WHERE `degrees`.`name` = "Corso di Laurea in Diritto dell'Economia";

-- 4. Selezionare tutti gli appelli d'esame del Corso di Laurea Magistrale in Fisica del primo anno
SELECT * 
FROM `degrees`
JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
JOIN `exams` ON `courses`.`id` = `exams`.`course_id`
WHERE `degrees`.`name` = "Corso di Laurea Magistrale in Fisica"
AND `courses`.`year` = 1;


-- 5. Selezionare tutti i docenti che insegnano nel Corso di Laurea in Lettere (21)
SELECT DISTINCT `teachers`.`name`, `teachers`.`surname`, `degrees`.`name` as `corso_di_laurea`
FROM `degrees`
JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Lettere"  
ORDER BY `teachers`.`name` ASC;

-- 6. Selezionare il libretto universitario di Mirco Messina (matricola n. 620320)
SELECT *
FROM `students`
JOIN `exam_student` ON `students`.`id` = `exam_student`.`student_id`
JOIN `exams` ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `courses` ON `courses`.`id` = `exams`.`course_id`
WHERE `students`.`registration_number` = 620320 
AND `exam_student`.`vote` >= 18;


-- 7. Selezionare il voto medio di superamento d'esame per ogni corso, con anche i dati del corso di laurea associato, ordinati per media voto decrescente
SELECT AVG(`exam_student`.`vote`), `courses`.`name` as `course_name`, `degrees`.`name` as `degree_name`
FROM `exam_student`
JOIN `exams` ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `courses`ON `courses`.`id` = `exams`.`course_id`
JOIN `degrees` ON `degrees`.`id` = `courses`.`degree_id`
WHERE `exam_student`.`vote` >= 18
GROUP BY `courses`.`id`;