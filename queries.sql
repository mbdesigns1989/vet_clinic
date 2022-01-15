/*Queries that provide answers to the questions from all projects.*/
SELECT
     *
FROM
     animals
WHERE
     NAME LIKE '%mon';

SELECT
     NAME
FROM
     animals
WHERE
     DATE_OF_BIRTH BETWEEN '2016-01-01'
     AND '2019-12-31';

SELECT
     NAME
FROM
     animals
WHERE
     NEUTERED = true
     AND ESCAPE_ATTEMPTS < 3;

SELECT
     DATE_OF_BIRTH
from
     animals
WHERE
     NAME = 'Agumon'
     OR NAME = 'Pikachu';

SELECT
     NAME,
     ESCAPE_ATTEMPTS
FROM
     animals
WHERE
     WEIGHT_KG > 10.5;

SELECT
     *
FROM
     animals
WHERE
     NEUTERED != true;

SELECT
     *
FROM
     animals
WHERE
     NAME != 'Gabumon';

SELECT
     *
FROM
     animals
WHERE
     WEIGHT_KG >= 10.4
     AND WEIGHT_KG <= 17.3;

BEGIN;

UPDATE
     animals
SET
     SPECIES = 'unspecified';

SELECT
     *
FROM
     animals;

ROLLBACK;

SELECT
     SPECIES
FROM
     animals;

BEGIN;

UPDATE
     animals
SET
     SPECIES = 'digimon'
WHERE
     name LIKE '%mon';

UPDATE
     animals
SET
     SPECIES = 'pokemon'
WHERE
     SPECIES IS NULL;

COMMIT;

SELECT
     *
FROM
     animals;

BEGIN;

DELETE FROM
     animals;

ROLLBACK;

SELECT
     *
FROM
     animals BEGIN;

DELETE FROM
     animals
WHERE
     DATE_OF_BIRTH > '2022-01-01';

SAVEPOINT DOB;

UPDATE
     animals
SET
     WEIGHT_KG = -1 * WEIGHT_KG;

ROLLBACK TO DOB;

UPDATE
     animals
SET
     WEIGHT_KG = -1 * WEIGHT_KG
WHERE
     WEIGHT_KG < 0;

COMMIT;

SELECT
     *
FROM
     animals
SELECT
     COUNT(*)
FROM
     animals;

SELECT
     COUNT(*)
FROM
     animals
WHERE
     ESCAPE_ATTEMPTS = 0;

SELECT
     AVG(WEIGHT_KG)
FROM
     animals;

SELECT
     NEUTERED,
     count(NEUTERED) as NEUTERED_RESULT
FROM
     animals
GROUP BY
     NEUTERED
ORDER BY
     NEUTERED_RESULT DESC
LIMIT
     1;

SELECT
     SPECIES,
     MAX(WEIGHT_KG) AS MAX_WEIGHT,
     MIN(WEIGHT_KG) AS MIN_WEIGHT
FROM
     animals
GROUP BY
     SPECIES;

SELECT
     SPECIES,
     AVG(ESCAPE_ATTEMPTS)
FROM
     animals
WHERE
     DATE_OF_BIRTH BETWEEN '1990-01-01'
     AND '2000-12-31'
GROUP BY
     SPECIES;