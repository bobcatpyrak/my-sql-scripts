-- Recreate database when script is run (warning: deletes database)
use sys;
drop database if exists bootcamp;
create database bootcamp;
use bootcamp;

CREATE TABLE Students (
    ID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ID),
    FirstName VARCHAR(16) NOT NULL,
    LastName VARCHAR(16) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(12),
    Course VARCHAR(10)
);
    
insert Students
(ID, FirstName, LastName, Email)
VALUES
(0, 'Jonathan', "Pyrak", "something@gmail.com");

SELECT 
    *
FROM
    students