
CREATE TABLE instrument (
                name VARCHAR NOT NULL,
                pitch VARCHAR NOT NULL,
                CONSTRAINT name PRIMARY KEY (name)
);


CREATE TABLE address (
                AddressID VARCHAR NOT NULL,
                street1 VARCHAR NOT NULL,
                street2 VARCHAR NOT NULL,
                city VARCHAR NOT NULL,
                state VARCHAR NOT NULL,
                zipcode VARCHAR NOT NULL,
                telephone VARCHAR NOT NULL,
                number INTEGER NOT NULL,
                CONSTRAINT address_id PRIMARY KEY (AddressID)
);


CREATE TABLE Musician (
                ssn VARCHAR NOT NULL,
                AddressID VARCHAR NOT NULL,
                name VARCHAR(400) NOT NULL,
                CONSTRAINT ssn PRIMARY KEY (ssn)
);


CREATE TABLE album (
                albumID VARCHAR NOT NULL,
                title VARCHAR NOT NULL,
                release_date DATE NOT NULL,
                format VARCHAR NOT NULL,
                producer_ssn VARCHAR NOT NULL,
                age INTEGER NOT NULL,
                CONSTRAINT albumid PRIMARY KEY (albumID)
);


CREATE TABLE song (
                title VARCHAR NOT NULL,
                author_ssn VARCHAR NOT NULL,
                albumID VARCHAR NOT NULL,
                length INTEGER NOT NULL,
                CONSTRAINT song_pk PRIMARY KEY (title)
);


CREATE TABLE uses (
                name VARCHAR NOT NULL,
                title VARCHAR NOT NULL,
                CONSTRAINT uses_pk PRIMARY KEY (name, title)
);


CREATE TABLE performs (
                ssn VARCHAR NOT NULL,
                title VARCHAR NOT NULL,
                CONSTRAINT performs_pk PRIMARY KEY (ssn, title)
);


CREATE TABLE plays (
                ssn VARCHAR NOT NULL,
                name VARCHAR NOT NULL,
                CONSTRAINT plays_pk PRIMARY KEY (ssn, name)
);


ALTER TABLE plays ADD CONSTRAINT instrument_plays_fk
FOREIGN KEY (name)
REFERENCES instrument (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE uses ADD CONSTRAINT instrument_uses_fk
FOREIGN KEY (name)
REFERENCES instrument (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Musician ADD CONSTRAINT address_musician_fk
FOREIGN KEY (AddressID)
REFERENCES address (AddressID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE plays ADD CONSTRAINT musician_plays_fk
FOREIGN KEY (ssn)
REFERENCES Musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE album ADD CONSTRAINT musician_album_fk
FOREIGN KEY (producer_ssn)
REFERENCES Musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE song ADD CONSTRAINT musician_song_fk
FOREIGN KEY (author_ssn)
REFERENCES Musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE performs ADD CONSTRAINT musician_performs_fk
FOREIGN KEY (ssn)
REFERENCES Musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE song ADD CONSTRAINT album_song_fk
FOREIGN KEY (albumID)
REFERENCES album (albumID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE performs ADD CONSTRAINT song_performs_fk
FOREIGN KEY (title)
REFERENCES song (title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE uses ADD CONSTRAINT song_uses_fk
FOREIGN KEY (title)
REFERENCES song (title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
