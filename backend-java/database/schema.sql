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

INSERT INTO collections (user_id, name) VALUES (1, 'user collection');
INSERT INTO collections (user_id, name) VALUES (3, 'premium collection');

INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('The Amazing Spider-Man', 1, 'Tom DeFalco', 'Joe Bennett', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('All Star Superman', 1, 'Grant Morrison', 'Frank Quitely', 'DC');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Spawn', 1, 'Todd McFarlane', 'Todd McFarlane', 'Image');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('X-Men', 50, 'Arnold Drake', 'Jim Steranko', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Batman: The Killing Joke', 1, 'Alan Moore', 'Brian Bolland', 'DC');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Moon Knight', 1, 'Warren Ellis', 'Declan Shalvey', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Secret Wars', 8, 'Jim Shooter', 'Mike Zeck', 'Marvel');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Action Comics', 1, 'Jerry Siegel', 'Joe Shuster', 'DC');
INSERT INTO comics (title, issue, author, artist, publisher) VALUES ('Penance: Relentless', 1, 'Paul Jenkins', 'Paul Gulacy', 'Marvel');

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
