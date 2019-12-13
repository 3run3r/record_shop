DROP TABLE albums;
DROP TABLE artists;
DROP TABLE labels;

CREATE TABLE labels
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  label_id INT REFERENCES labels(id)
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  stock_quantity INT,
  buying_cost DECIMAL(4, 2),
  selling_price DECIMAL(4, 2)
)
