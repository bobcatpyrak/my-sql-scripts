create table Students (
	ID int not null auto_increment, primary key(ID),
    FirstName varchar(16) not null,
    LastName varchar(16) not null,
    Email varchar(100) not null,
    Phone varchar(12),
    Course varchar(10)
    );
    
insert Students
(ID, FirstName, LastName, Email)
VALUES
(0, 'Jonathan', "Pyrak", "something@gmail.com");

select * from students