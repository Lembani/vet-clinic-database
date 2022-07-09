/* Database schema to keep the structure of entire database. */

CREATE TABLE ANIMALS (
    id INT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

ALTER TABLE ANIMALS ADD COLUMN species VARCHAR(200);

CREATE TABLE OWNERS(id SERIAL PRIMARY KEY, full_name TEXT NOT NULL, age INT NOT NULL);

CREATE TABLE SPECIES(id SERIAL PRIMARY KEY, name TEXT NOT NULL);

ALTER TABLE ANIMALS DROP id;
ALTER TABLE ANIMALS ADD id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY;

ALTER TABLE ANIMALS DROP COLUMN species;

ALTER TABLE ANIMALS ADD species_id INT;

ALTER TABLE ANIMALS ADD CONSTRAINT fk_species_table FOREIGN KEY(species_id) REFERENCES SPECIES(id);

CREATE TABLE VETS (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
);

CREATE TABLE SPECIALIZATIONS (
  id SERIAL PRIMARY KEY,
  species_id INT,
  vets_id INT,
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES SPECIES(id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES VETS(id)
);

CREATE TABLE VISITS (
  id SERIAL PRIMARY KEY,
  animals_id INT,
  vets_id INT,
  date_of_visit DATE,
  CONSTRAINT fk_visit_animals FOREIGN KEY(animals_id) REFERENCES ANIMALS(id),
  CONSTRAINT fk_visits_vet FOREIGN KEY(vets_id) REFERENCES VETS(id)
);

