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

INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('The Amazing Spider-Man', 1, 'Tom DeFalco', 'Joe Bennett', 'Marvel');
INSERT INTO characters (characterName) VALUES ('Spider-Man');
INSERT INTO comic_character (comic_id, character_id) VALUES (1, 1);
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('All Star Superman', 1, 'Grant Morrison', 'Frank Quitely', 'DC');
INSERT INTO characters (characterName) VALUES ('Superman');
INSERT INTO characters (characterName) VALUES ('Lois Lane');
INSERT INTO comic_character (comic_id, character_id) VALUES (2, 2);
INSERT INTO comic_character (comic_id, character_id) VALUES (2, 3);
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Spawn', 1, 'Todd McFarlane', 'Todd McFarlane', 'Image');
INSERT INTO characters (characterName) VALUES ('Spawn');
INSERT INTO comic_character (comic_id, character_id) VALUES (3, 4);
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('X-Men', 50, 'Arnold Drake', 'Jim Steranko', 'Marvel');
INSERT INTO characters (characterName) VALUES ('Wolverine');
INSERT INTO characters (characterName) VALUES ('Storm');
INSERT INTO comic_character (comic_id, character_id) VALUES (4, 5);
INSERT INTO comic_character (comic_id, character_id) VALUES (4, 6);
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Batman: The Killing Joke', 1, 'Alan Moore', 'Brian Bolland', 'DC');
INSERT INTO characters (characterName) VALUES ('Batman');
INSERT INTO characters (characterName) VALUES ('Joker');
INSERT INTO comic_character (comic_id, character_id) VALUES (5, 7);
INSERT INTO comic_character (comic_id, character_id) VALUES (5, 8);
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Moon Knight', 1, 'Warren Ellis', 'Declan Shalvey', 'Marvel');
INSERT INTO characters (characterName) VALUES ('Moon Knight');
INSERT INTO comic_character (comic_id, character_id) VALUES (6, 9);
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Secret Wars', 8, 'Jim Shooter', 'Mike Zeck', 'Marvel');
INSERT INTO comic_character (comic_id, character_id) VALUES (7, 1);
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Action Comics', 1, 'Jerry Siegel', 'Joe Shuster', 'DC');
INSERT INTO comic_character (comic_id, character_id) VALUES (8, 2);
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 1, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO characters (characterName) VALUES ('Penance');
INSERT INTO comic_character (comic_id, character_id) VALUES (9, 10);
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 2, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 3, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 4, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 5, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 6, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 7, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 8, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 9, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 10, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 11, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 12, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 13, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 14, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 15, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 16, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 17, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 18, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 19, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 20, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');
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
