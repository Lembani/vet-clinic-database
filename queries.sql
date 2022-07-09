/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM ANIMALS;
SELECT * FROM ANIMALS WHERE name LIKE '%mon';
SELECT name FROM ANIMALS WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name FROM ANIMALS WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM ANIMALS WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM ANIMALS WHERE weight_kg > 10.5;
SELECT * FROM ANIMALS WHERE neutered = true;
SELECT * FROM ANIMALS WHERE name NOT LIKE 'Gabumon';
SELECT * FROM ANIMALS WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


/*TRANSACTIONS*/

BEGIN;
UPDATE ANIMALS SET species = 'unspecified';
SELECT * FROM ANIMALS;
ROLLBACK;

BEGIN;
 UPDATE ANIMALS SET species = 'digimon' WHERE name LIKE '%mon';
 UPDATE ANIMALS SET species = 'pokemon' WHERE species IS null;
 SELECT * FROM ANIMALS;
COMMIT;

BEGIN;
DELETE FROM ANIMALS;
SELECT * FROM ANIMALS;
ROLLBACK;

SELECT * FROM ANIMALS;

BEGIN;
DELETE FROM ANIMALS WHERE date_of_birth > '2022-01-01';

SAVEPOINT savepoint;

UPDATE ANIMALS SET weight_kg = weight_kg * (-1);
ROLLBACK TO savepoint;
UPDATE ANIMALS SET weight_kg = weight_kg * (-1) WHERE weight_kg < 0;
COMMIT;

/*AGGREGATES*/

/*Total Animals*/
SELECT COUNT(*) FROM ANIMALS;

/*Animals which never tried to escape*/
SELECT COUNT(*) FROM ANIMALS WHERE escape_attempts = 0;

/*Average weight of animals*/
SELECT AVG(weight_kg) FROM ANIMALS;

/*Which animal escapes the most, neutered or not neutered animals*/
SELECT neutered, MAX(escape_attempts) FROM ANIMALS GROUP BY neutered;

/*Minimum and maximum weight of each type of animal*/
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM ANIMALS GROUP BY species;

/*Average number of escape attempts per animal type of those born between 1990 and 2000*/
SELECT species, AVG(escape_attempts) FROM ANIMALS WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


/*JOINS*/

SELECT name, full_name FROM ANIMALS JOIN OWNERS ON ANIMALS.owner_id = OWNERS.id WHERE full_name = 'Melody Pond';

SELECT ANIMALS.name as Name, SPECIES.name as Type FROM ANIMALS JOIN SPECIES ON SPECIES.id = species_id WHERE SPECIES.id = 1;

SELECT name AS Animals, full_name AS Owners FROM ANIMALS RIGHT JOIN OWNERS ON ANIMALS.owner_id = OWNERS.id;

SELECT COUNT(ANIMALS.name) AS Animals_count, SPECIES.name AS Specie FROM ANIMALS JOIN SPECIES ON ANIMALS.species_id = SPECIES.id GROUP BY SPECIES.name;

SELECT OWNERS.full_name, ANIMALS.name AS name_of_animals, SPECIES.name AS name_of_species FROM ANIMALS JOIN OWNERS ON OWNERS.id = ANIMALS.owner_id JOIN SPECIES ON SPECIES.id = ANIMALS.species_id WHERE OWNERS.full_name = 'Jennifer Orwell' AND SPECIES.name = 'Digimon';

SELECT name, escape_attempts, full_name FROM ANIMALS JOIN OWNERS ON OWNERS.id = ANIMALS.owner_id WHERE OWNERS.full_name = 'Dean Winchester' AND ANIMALS.escape_attempts = 0;

SELECT full_name, COUNT(animals.owner_id) AS Owns FROM OWNERS JOIN ANIMALS ON ANIMALS.owner_id = OWNERS.id GROUP BY full_name ORDER BY Owns DESC;

