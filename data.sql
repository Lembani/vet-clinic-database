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

INSERT INTO VETS (name, age, date_of_graduation)
VALUES ('Vet William Tatcher', 45, 'Apr 23 2000'),
('Vet Maisy Smith', 26 ,'Jan 17 2019'),
('Vet Stephanie Mendez', 64, 'May 4 1981'),
('Vet Jack Harkness', 38,'Jun 8 2008');

INSERT INTO specializations (species_id, vet_id)
 VALUES ( (SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'William Tatcher'));

INSERT INTO VISITS (animals_id, vets_id, date_of_visit)
VALUES (4,1,'05/24/2020'),
 (4,3,'07/22/2020'),
 (5,4,'02/02/2021'),
 (10,2,'01/05/2020'),
 (10,2,'03/08/2020'),
 (10,2,'04/14/2020'),
 (6,3,'05/04/2021'),
 (7,4,'02/24/2021'),
 (1,2,'12/21/2019'),
 (1,1,'08/10/2020'),
 (1,2,'04/07/2021'),
 (8,3,'09/29/2019'),
 (2,4,'10/03/2020'),
 (2,4,'11/04/2020'),
 (3,2,'01/24/2019'),
 (3,2,'05/15/2019'),
 (3,2,'02/27/2020'),
 (3,2,'08/24/2020'),
 (9,3,'05/24/2020'),
 (9,1,'01/11/2021');



INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
