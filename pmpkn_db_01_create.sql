-- create and select the database
DROP DATABASE IF EXISTS pmpkn_db;
CREATE DATABASE pmpkn_db;
flush privileges;
USE pmpkn_db;
-- create a user and grant CRUD privileges to that user
DROP USER IF EXISTS pmpkn_user@localhost;
CREATE USER pmpkn_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON pmpkn_db.* TO pmpkn_user@localhost;
-- create aadmin user and grant CRUD & CREATE privileges to that user
DROP USER IF EXISTS pmpkn_adm@localhost;
CREATE USER pmpkn_adm@localhost IDENTIFIED BY 'sesame';
GRANT ALL PRIVILEGES ON pmpkn_db.* TO pmpkn_adm@localhost;