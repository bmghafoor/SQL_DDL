DROP DATABASE IF EXISTS medical;

CREATE DATABASE medical;

\c medical

-- Medical Center

CREATE TABLE center
(
  id SERIAL PRIMARY KEY,
  _name TEXT NOT NULL,
  city TEXT NOT NULL,
  num_docs INT NOT NULL,
);


CREATE TABLE doctor
(
  id SERIAL PRIMARY KEY,
  _name TEXT NOT NULL,
  specialty TEXT NOT NULL,
);

CREATE TABLE center_doctor
(
    id SERIAL PRIMARY KEY,
    center_id INT NOT NULL REFERENCES center(id),
    doctor_id INT NOT NULL REFERENCES doctor(id),
);

CREATE TABLE patient
(
    id SERIAL PRIMARY KEY,
    _name TEXT NOT NULL,
    age TEXT NOT NULL,
);

CREATE TABLE visit
(
    id SERIAL PRIMARY KEY,
    center_doctor INT NOT NULL REFERENCES center_doctor(id),
    pat_id INT NOT NULL REFERENCES patient(id),
);

CREATE TABLE disease
(
    id SERIAL PRIMARY KEY,
    _name TEXT NOT NULL,
);

CREATE TABLE diagnosis
(
    id SERIAL PRIMARY KEY,
    disease_id INT NOT NULL REFERENCES disease(id),
    visit_id INT NOT NULL REFERENCES visit(id)
);

-- Craiglist

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    region_ TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    preffered_region INT REFERENCES region(id)
);

CREATE TABLE category
(
    id SERIAL PRIMARY KEY,
    cat TEXT NOT NULL
);

CREATE TABLE post 
(
    id SERIAL PRIMARY KEY,
    title TEXT,
    txt TEXT,
    user_ INT REFERENCES users(id),
    region_ INT REFERENCES region(id)
    category_ INT REFERENCES category(id)
);

-- Soccer

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    city TEXT,
    name_ TEXT,
    league TEXT
);

CREATE TABLE player
(
    id SERIAL PRIMARY KEY,
    name_ TEXT,
    team INT REFERENCES teams(id)

);

CREATE TABLE referee
( 
    id SERIAL PRIMARY KEY,
    name_ TEXT
);

CREATE TABLE game
(
    id SERIAL PRIMARY KEY,
    season_id REFERENCES season(id),
    team1 INT REFERENCES teams(id),
    team2 INT REFERENCES teams(id),
    referee INT REFERENCES referees(id),
    ref2 INT REFERENCES referees(id),
    ref3 INT REFERENCES referees(id).
    team1_num_goals INT,
    team2_num_goals INT,
    result TEXT
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    game INT REFERENCES game(id),
    goal_scorer INT REFERENCES player(id),
    num_goals INT,
)