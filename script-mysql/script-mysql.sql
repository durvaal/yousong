DROP DATABASE IF EXISTS projeto1;

CREATE DATABASE projeto1;

USE projeto1;

CREATE TABLE users(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

USE projeto1;

CREATE TABLE songs(
	id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    favorite BOOLEAN NOT NULL DEFAULT FALSE,
    song JSON DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
