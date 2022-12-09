-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space



CREATE TABLE suns
(
  id SERIAL PRIMARY KEY,
  name_ TEXT NOT NULL,
  mass INT,
  age INT
);

INSERT INTO suns
  (name_)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

CREATE TABLE galaxy 
(
  id SERIAL PRIMARY KEY,
  name_ TEXT NOT NULL
);

INSERT INTO galaxy
  (name_)
VALUES
  ('Milky Way');


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name_ TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT REFERENCES suns(id),
  galaxy INT REFERENCES galaxy(id),
  moons TEXT[]
);



INSERT INTO planets
  (name_, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 1, 1,'{"The Moon"}')