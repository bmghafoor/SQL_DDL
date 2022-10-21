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
  ('Gliese 876')


CREATE TABLE galaxy 
(
  id SERIAL PRIMARY KEY,
  name_ TEXT NOT NULL
);

INSERT INTO galaxy
  (name_)
VALUES
  ('Milky Way')


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT REFERENCES suns(id),
  galaxy INT REFERENCES galaxy(id),
  moons TEXT[]
);



INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, , 'Milky Way','The Sun','{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');