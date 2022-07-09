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
