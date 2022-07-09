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
