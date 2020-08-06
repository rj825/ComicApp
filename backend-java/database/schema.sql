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
        maincharacter varchar(50) NOT NULL,
        CONSTRAINT PK_comic PRIMARY KEY (comic_id)
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

INSERT INTO comics (title, issue, author, artist, publisher, maincharacter) VALUES ('The Amazing Spider-Man', 1, 'Tom DeFalco', 'Joe Bennett', 'Marvel', 'Spider-Man');
INSERT INTO comics (title, issue, author, artist, publisher, maincharacter) VALUES ('All Star Superman', 1, 'Grant Morrison', 'Frank Quitely', 'DC', 'Superman');
INSERT INTO comics (title, issue, author, artist, publisher, maincharacter) VALUES ('Spawn', 1, 'Todd McFarlane', 'Todd McFarlane', 'Image', 'Spawn');
INSERT INTO comics (title, issue, author, artist, publisher, maincharacter) VALUES ('X-Men', 50, 'Arnold Drake', 'Jim Steranko', 'Marvel', 'Wolverine');
INSERT INTO comics (title, issue, author, artist, publisher, maincharacter) VALUES ('Batman: The Killing Joke', 1, 'Alan Moore', 'Brian Bolland', 'DC', 'Batman');
INSERT INTO comics (title, issue, author, artist, publisher, maincharacter) VALUES ('Moon Knight', 1, 'Warren Ellis', 'Declan Shalvey', 'Marvel', 'Moon Knight');
INSERT INTO comics (title, issue, author, artist, publisher, maincharacter) VALUES ('Secret Wars', 8, 'Jim Shooter', 'Mike Zeck', 'Marvel', 'Spider-Man');
INSERT INTO comics (title, issue, author, artist, publisher, maincharacter) VALUES ('Action Comics', 1, 'Jerry Siegel', 'Joe Shuster', 'DC', 'Superman');
INSERT INTO comics (title, issue, author, artist, publisher, maincharacter) VALUES ('Penance: Relentless', 1, 'Paul Jenkins', 'Paul Gulacy', 'Marvel', 'Penance');

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



COMMIT TRANSACTION;
