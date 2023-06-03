CREATE TABLE IF NOT EXISTS USER(
    id BIGINT primary key auto_increment,
    uuid VARCHAR(40),
    username VARCHAR(50),
    password VARCHAR(50),
    address VARCHAR(50),
    sex VARCHAR(6),
    age INT,
    email VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS RefreshTokenHistory(
    id BIGINT primary key auto_increment,
    token VARCHAR(100)
)