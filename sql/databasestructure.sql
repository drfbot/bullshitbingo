SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE games (
  id int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_bin NOT NULL,
  size int(11) NOT NULL,
  admin int(11) NOT NULL,
  started tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  KEY admin (admin)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE players (
  id int(11) NOT NULL AUTO_INCREMENT,
  gameid int(11) NOT NULL,
  `name` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (id),
  KEY gameid (gameid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE solved_words (
  playerid int(11) NOT NULL,
  wordid int(11) NOT NULL,
  PRIMARY KEY (playerid,wordid),
  KEY wordid (wordid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE words (
  id int(11) NOT NULL AUTO_INCREMENT,
  word text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


ALTER TABLE `games`
  ADD CONSTRAINT games_ibfk_1 FOREIGN KEY (admin) REFERENCES players (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `players`
  ADD CONSTRAINT players_ibfk_1 FOREIGN KEY (gameid) REFERENCES games (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `solved_words`
  ADD CONSTRAINT solved_words_ibfk_1 FOREIGN KEY (playerid) REFERENCES players (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT solved_words_ibfk_2 FOREIGN KEY (wordid) REFERENCES words (id) ON DELETE CASCADE ON UPDATE CASCADE;

