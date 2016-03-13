-- Table definitions for the tournament project.
--
-- put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


-- I am well aware that some of this code could be condensed but I am having permission
-- issues and I'm not too familiar with vagrant yet. I couldn't get the super user
-- permissions correct with Vagrant )-:
DROP VIEW IF EXISTS standings;
DROP VIEW IF EXISTS count;
DROP VIEW IF EXISTS wins;
DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS players;


/* The tables below are changed based on advice, I kept my old tables for reference
   There are perhaps redudancies because I was having trouble getting instant feedback
   on different SQL queries.
*/

-- players Table
CREATE TABLE players (
	id SERIAL primary key,
	name VARCHAR(255)
);

-- matches Table
CREATE TABLE matches (
	id SERIAL primary key,
	player INT references players(id),
	opponent INT references players(id),
	result INT
);


/*
Old code, revised version above.

-- players Table
CREATE TABLE players (
	id  SERIAL  primary key ,
	name VARCHAR(100)
);

-- matches Table
CREATE TABLE matches (
	id SERIAL ,
	player INT references players(id),
	opponent INT references players(id),
	result INT);
*/


-- Constructs the number of wins for each player
CREATE VIEW wins AS
	SELECT players.id, COUNT(opponent) AS n	FROM players
	LEFT OUTER JOIN (SELECT * FROM matches WHERE result>0) as matches
	ON players.id = matches.player
	GROUP BY players.id;

-- Number of matches played by each player
CREATE VIEW count AS
	SELECT players.id, Count(DISTINCT matches.opponent) AS n
	FROM players
	LEFT OUTER JOIN matches
	ON players.id = matches.player
	GROUP BY players.id;

-- standings View shows number of wins and matches for each player
CREATE VIEW standings AS
	SELECT players.id,players.name,wins.n as wins,Count.n as matches
	FROM players,Count,wins
	WHERE players.id = wins.id and wins.id = Count.id
-- I fixed this based on the suggestion, changed form ASC to DESC
  ORDER BY wins DESC;

