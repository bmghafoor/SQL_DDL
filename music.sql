-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name_ TEXT
);

INSERT INTO artists
  (name_)
VALUES
  ('Jay Z'),('Beyonce');


CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name_ TEXT
);

INSERT INTO producers
  (name_)
VALUES
  ('Dust'),('Ricky');

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists INT REFERENCES artists(id) NOT NULL,
  album TEXT,
  producers INT REFERENCES producers(id)
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('New YorK', 276, '10-20-2009', 1, 'Nice Song Album', 1);



