BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_collection_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_comic_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

  CREATE SEQUENCE seq_character_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE collections (
        collection_id int DEFAULT nextval('seq_collection_id'::regclass) NOT NULL,
        user_id int NOT NULL,
        name varchar(50) NOT NULL,
        isPublic boolean NOT NULL,
        CONSTRAINT PK_collection PRIMARY KEY (collection_id),
        CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE comics (
        comic_id int DEFAULT nextval('seq_comic_id'::regclass) NOT NULL,
        title varchar(50) NOT NULL,
        issue int NOT NULL,
        author varchar(50) NOT NULL,
        artist varchar(50) NOT NULL,
        publisher varchar(50) NOT NULL,
        comicURL varchar(200) NOT NULL,
        CONSTRAINT PK_comic PRIMARY KEY (comic_id)
);

CREATE TABLE characters (
  character_id int DEFAULT nextval('seq_character_id'::regclass) NOT NULL,
  characterName varchar(50) NOT NULL,
  CONSTRAINT PK_character PRIMARY KEY (character_id)
);

CREATE TABLE comic_character (
  comic_id int,
  character_id int,
  CONSTRAINT PK_comic_character PRIMARY KEY (comic_id,character_id),
        CONSTRAINT FK_comic_character_comic FOREIGN KEY (comic_id) REFERENCES comics(comic_id),
        CONSTRAINT FK_comic_character_character FOREIGN KEY (character_id) REFERENCES characters(character_id)
);

CREATE TABLE collection_comic (
        collection_id int,
        comic_id int,
        CONSTRAINT PK_collection_comic PRIMARY KEY (collection_id,comic_id),
        CONSTRAINT FK_collection_comic_collection FOREIGN KEY (collection_id) REFERENCES collections(collection_id),
        CONSTRAINT FK_collection_comic_comic FOREIGN KEY (comic_id) REFERENCES comics(comic_id)
        
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('premium','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_PREMIUM');

INSERT INTO collections (user_id, name, isPublic) VALUES (1, 'user collection', true);
INSERT INTO collections (user_id, name, isPublic) VALUES (3, 'premium collection', false);

INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Amazing Spider-Man (2018)', 15, 'Nick Spencer', 'Chris Bachalo', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608936901511');
INSERT INTO characters (characterName) VALUES ('Spider-Man');
INSERT INTO comic_character (comic_id, character_id) VALUES (1, 1);
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('Thor (2018)', 10, 'Jason Aaron', 'Mike Del Mundo', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608976501011');
INSERT INTO characters (characterName) VALUES ('Thor');
INSERT INTO characters (characterName) VALUES ('Odin');
INSERT INTO comic_character (comic_id, character_id) VALUES (2, 2);
INSERT INTO comic_character (comic_id, character_id) VALUES (2, 3);
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('Captain America (2018)', 8, 'Ta-Nehisi Coates', 'Adam Kubert', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608860700811');
INSERT INTO characters (characterName) VALUES ('Captain America');
INSERT INTO comic_character (comic_id, character_id) VALUES (3, 4);
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('X-Men (2019)', 8, 'Jonathan Hickman', 'Mahmud Asrar', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=759606094661000811');
INSERT INTO characters (characterName) VALUES ('Cyclops');
INSERT INTO characters (characterName) VALUES ('Storm');
INSERT INTO comic_character (comic_id, character_id) VALUES (4, 5);
INSERT INTO comic_character (comic_id, character_id) VALUES (4, 6);
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('Savage Avengers (2019)', 11, 'Gerry Duggan', 'Butch Guice', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960609261101111');
INSERT INTO characters (characterName) VALUES ('Dr. Strange');
INSERT INTO characters (characterName) VALUES ('Elektra');
INSERT INTO comic_character (comic_id, character_id) VALUES (5, 7);
INSERT INTO comic_character (comic_id, character_id) VALUES (5, 8);
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('Moon Knight Annual (2019)', 1, 'Cullen Bunn', 'Ibrahim Moustafa', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960609499800111');
INSERT INTO characters (characterName) VALUES ('Moon Knight');
INSERT INTO comic_character (comic_id, character_id) VALUES (6, 9);
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('Spider-Man (2019)', 2, 'Henry Abrams', 'Sara Pichelli', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=759606093541000211');
INSERT INTO comic_character (comic_id, character_id) VALUES (7, 1);
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('Thor (2018)', 9, 'Jason Aaron', 'Mike Del Mundo', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608976500911');
INSERT INTO comic_character (comic_id, character_id) VALUES (8, 2);
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 1, 'Ryan North', 'Erica Henderson', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340400111');
INSERT INTO characters (characterName) VALUES ('Squirrel Girl');
INSERT INTO comic_character (comic_id, character_id) VALUES (9, 10);

INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 49, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340404911');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 50, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340405011');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 48, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340404811');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 47, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340404711');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 46, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340404611');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 45, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340404511');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 44, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340404411');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 43, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340404311');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 42, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340404211');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 41, 'Ryan North', 'Erica Henderson', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340404111');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 40, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340404011');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 39, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340403911');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 38, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340403811');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 37, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340403711');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 36, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340403611');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 35, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340403511');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 34, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340403411');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 33, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340403311');
INSERT INTO comics (title, issue, author, artist, publisher, comicURL) VALUES ('The Unbeatable Squirrel Girl (2015)', 32, 'Ryan North', 'Derek Charm', 'Marvel', 'https://gateway.marvel.com/v1/public/comics?apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&upc=75960608340403211');
INSERT INTO comic_character (comic_id, character_id) VALUES (10, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (11, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (12, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (13, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (14, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (15, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (16, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (17, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (18, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (19, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (20, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (21, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (22, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (23, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (24, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (25, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (26, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (27, 10);
INSERT INTO comic_character (comic_id, character_id) VALUES (28, 10);

INSERT INTO collection_comic (collection_id,comic_id) VALUES (1,1);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (1,2);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (1,3);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (1,4);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,5);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,3);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,6);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,7);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,8);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,9);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,10);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,11);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,12);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,13);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,14);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,15);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,16);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,17);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,18);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,19);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,20);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,21);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,22);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,23);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,24);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,25);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,26);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,27);
INSERT INTO collection_comic (collection_id,comic_id) VALUES (2,28);



COMMIT TRANSACTION;
