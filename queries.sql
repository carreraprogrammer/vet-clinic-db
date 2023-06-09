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
WHERE weight_kg < 0;

SELECT * FROM animals;

-- QUERIES

SELECT COUNT(*) AS total_animals FROM animals;

SELECT COUNT(*) AS animals_no_scape FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS AVG_WEIGHT FROM animals;

SELECT neutered, COUNT(*) AS escape_count
FROM animals
GROUP BY neutered
ORDER BY escape_count DESC;

SELECT species, MIN(weight_kg) AS min_weight, 
MAX(weight_kg) AS max_weight 
FROM animals 
GROUP BY species;

SELECT species, AVG(escape_attempts) AS AVG_ESCAPE
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

SELECT o.full_name AS owner_name, a.name AS animal_name
FROM owners o
RIGHT JOIN animals a
ON o.id = a.owner_id
WHERE o.full_name = 'Melody Pond';

SELECT a.name, s.name AS species
FROM animals a
JOIN species s
ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name, a.name AS animal_name
FROM owners o
LEFT JOIN animals a
ON a.owner_id = o.id;

SELECT s.name AS specie_name, COUNT(*) AS total_animals
FROM animals a
JOIN species s
ON a.species_id = s.id
GROUP BY s.name;

SELECT o.full_name AS owner_name, a.name AS animal_name, s.name AS specie
FROM animals a
JOIN owners o
ON a.owner_id = o.id
JOIN species s
ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name ='Digimon';