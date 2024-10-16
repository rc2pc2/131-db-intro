-- Query che modificano lo schema del datbase (la sua struttura)
-- === Creare la tabella rooms
CREATE TABLE `rooms` (
   `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL,
    `number` TINYINT NOT NULL,
    `building_name` VARCHAR(90) NOT NULL,
    PRIMARY KEY (`id`)
);

-- === Creare la tabella revervations
CREATE TABLE `revervations` (
   `id` INT NOT NULL AUTO_INCREMENT,
    `room_id` INT NOT NULL,
    `date` DATE NOT NULL,
    `starting_hour` TIME NOT NULL,
    `ending_hour` TIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`room_id`) REFERENCES rooms(`id`)
);

-- === Modificare il nome di una tabella
ALTER TABLE `revervations` 
RENAME `reservations`;

-- === Aggiungere colonna
ALTER TABLE `rooms`
ADD `period` VARCHAR(50) NOT NULL; 

-- === Modificare il tipo di dato di una colonna
ALTER TABLE `rooms`
MODIFY COLUMN `period` CHAR(72) NOT NULL; 

-- === Modificare il nome di una colonna
ALTER TABLE `rooms`
RENAME COLUMN `period` TO `semester`; 

-- === Cancellare una colonna dalla nostra tabella
ALTER TABLE `rooms`
DROP COLUMN `semester`; 

-- === Cancellare un'intera tabella (attenzione ai vincoli)
DROP TABLE `rooms`;