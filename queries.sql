/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals
WHERE name LIKE '%mon';

SELECT name FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals
WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals
WHERE name LIKE 'Agumon' OR name LIKE 'Pikachu';

SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;

SELECT * FROM animals
WHERE neutered= TRUE;

SELECT * FROM animals
WHERE name NOT LIKE 'Gabumon';

SELECT * FROM animals
WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- TRANSACTIONS

-- TRANSACTION 1

BEGIN;
UPDATE animals SET species = 'unespecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- TRANSACTION 2

BEGIN;

UPDATE animals
SET species = 'Digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'Pokemon'
WHERE name NOT LIKE '%mon';

SELECT * FROM animals;

COMMIT;

SELECT * FROM animals;

-- TRANSACTION 3

BEGIN;

DELETE FROM animals;

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

-- TRANSACTION 4

BEGIN;

DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE wheight_kg < 0;

SELECT * FROM animals;