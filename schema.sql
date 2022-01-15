/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    ID INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    NAME VARCHAR(500),
    DATE_OF_BIRTH DATE,
    ESCAPE_ATTEMPTS INT,
    NEUTERED BOOLEAN,
    WEIGHT_KG FLOAT
);

ALTER TABLE
    animals
ADD
    SPECIES VARCHAR(500) CREATE TABLE owners(
        ID SERIAL PRIMARY KEY,
        FULL_NAME VARCHAR(500),
        AGE INT
    ) CREATE TABLE species(ID SERIAL PRIMARY KEY, NAME VARCHAR(500))
ALTER TABLE
    animals DROP COLUMN ID;

ALTER TABLE
    animals
ADD
    COLUMN ID SERIAL PRIMARY KEY;

ALTER TABLE
    animals DROP COLUMN SPECIES;

ALTER TABLE
    animals
ADD
    COLUMN SPECIES_ID INT,
ADD
    CONSTRAINT FK_SPECIES FOREIGN KEY (SPECIES_ID) REFERENCES SPECIES (ID);

ALTER TABLE
    animals
ADD
    COLUMN OWNER_ID INT,
ADD
    CONSTRAINT FK_OWNERS FOREIGN KEY (OWNER_ID) REFERENCES owners (ID);