CREATE DATABASE IF NOT EXISTS cs208demo;

USE cs208demo;

CREATE TABLE IF NOT EXISTS menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item VARCHAR(255) NOT NULL,
    price_sm DECIMAL(5,2),
    price_md DECIMAL(5,2),
    price_lg DECIMAL(5,2),
    `description` VARCHAR(1000),
    `type` VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    review VARCHAR(255) NOT NULL,
    `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO menu (item, price_sm, price_md, price_lg, `description`, `type`)
VALUES('Coffee', 2.50, 0, 0, 'A yummy drink', 'coffee');

INSERT INTO reviews(review)
VALUES('Pretty good coffee');