/* Populate database with sample data. */

INSERT INTO ANIMALS(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(1, 'Agumon', 'Feb 3 2020', 0, true, 10.23);

INSERT INTO ANIMALS(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(2, 'Gabumon', 'Nov 15 2018', 2, true, 8);

INSERT INTO ANIMALS(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(3, 'Pikachu', 'Jan 7 2021', 1, false, 15.04);

INSERT INTO ANIMALS(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(4, 'Devimon', 'May 12 2017', 5, true, 11);
 

INSERT INTO  ANIMALS(id, name, date_of_birth, escape_attempts, neutered , weight_kg) 
VALUES(5, 'Charmander', 'Feb 8 2020', 0, false, 11),
(6, 'Plantmon', 'Nov 15 2021', 2, true, 5.7),
(7, 'Squirtle', 'Apr 2 1993', 3, false, 12.13),
(8, 'Angemon', 'Jun 12 2005', 1, true, 45), 
(9, 'Boarmon', 'Jun 7 2005', 7, true, 20.4),
(10, 'Blossom', 'Oct 13 1998', 3, true, 17),
(11, 'Ditto', 'May 14 2022', 4, true, 22);


INSERT INTO  OWNERS(full_name, age) 
VALUES('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO SPECIES(name) VALUES('Pokemon'), ('Digimon');

UPDATE ANIMALS SET species_id = (SELECT id FROM SPECIES WHERE name = 'Digimon') WHERE name LIKE '%mon';

UPDATE ANIMALS SET species_id = (SELECT id FROM SPECIES WHERE name = 'Pokemon') WHERE name NOT LIKE '%mon';

UPDATE ANIMALS SET owner_id = 1 WHERE name = 'Agumon';
UPDATE ANIMALS SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE ANIMALS SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE ANIMALS SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE ANIMALS SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';
