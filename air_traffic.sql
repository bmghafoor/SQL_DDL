-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE airlines 
(
  id SERIAL PRIMARY KEY,
  name_ TEXT NOT NULL
);

CREATE TABLE city 
(
  id SERIAL PRIMARY KEY,
  name_ TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE flight
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airlines INT REFERENCES airlines(id),
  from_city INT REFERENCES city(id),
  to_city INT REFERENCES city(id)

);

CREATE TABLE ticket
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  flight INT REFERENCES flight(id),
  seat TEXT NOT NULL
);


INSERT INTO airlines
  (name_)
VALUES
  ('JetBlue');

INSERT INTO city
  (name_,country)
VALUES
  ('NY','USA'),('DC','USA');

INSERT INTO flight
  (departure,arrival,airlines,from_city,to_city)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00',1,1,2);



INSERT INTO ticket
  (first_name, last_name, flight, seat)
VALUES
  ('Jennifer', 'Finch', 1,'22A');