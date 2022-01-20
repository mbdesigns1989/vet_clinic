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
    SPECIES VARCHAR(500);

CREATE TABLE owners(
    ID SERIAL PRIMARY KEY,
    FULL_NAME VARCHAR(500),
    AGE INT
);

CREATE TABLE species(ID SERIAL PRIMARY KEY, NAME VARCHAR(500));

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

CREATE TABLE vets(
    ID SERIAL PRIMARY KEY,
    NAME TEXT,
    AGE INT,
    DATE DATE
);

CREATE TABLE specializations (
    SPECIES_ID INT,
    VETS_ID INT,
    CONSTRAINT FK_SPECIES FOREIGN KEY(SPECIES_ID) REFERENCES species(ID) ON DELETE CASCADE,
    CONSTRAINT FK_VETS FOREIGN KEY(VETS_ID) REFERENCES vets(ID) ON DELETE CASCADE
);

CREATE TABLE visits (
    ANIMALS_ID INT,
    VETS_ID INT,
    DATE DATE,
    CONSTRAINT FK_ANIMALS FOREIGN KEY(ANIMALS_ID) REFERENCES animals(ID),
    CONSTRAINT FK_VETS FOREIGN KEY(VETS_ID) REFERENCES vets(ID)
);