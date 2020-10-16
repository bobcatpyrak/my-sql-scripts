use sys;
drop database if exists BcDb;
create database BcDb;
use BcDb;

drop table Customers;
CREATE TABLE Customers (
    ID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ID),
    Code VARCHAR(10) NOT NULL UNIQUE,
    Name VARCHAR(30) NOT NULL,
    Sales DECIMAL(9 , 2 ) NOT NULL DEFAULT 0 CHECK (Sales >= 0),
    Active BIT NOT NULL DEFAULT 1,
    Created DATETIME NOT NULL DEFAULT NOW()
);

insert Customers
	(ID, Code, Name, Sales)
	VALUES
	(0, 0000, 'Bruce Wayne', 1000000.88),
	(0, 0001, 'Jim Gordon', 864.99),
	(0, 0002, 'Arthur Brown', 103948.22)
    -- (0, 0003, 'The Joker', -30) -- returns error
;
insert Customers
	(Code, Name)
    VALUES
    (0003, 'Oswald Cobblepot')
;
drop table if exists orders;
CREATE TABLE Orders (
    ID INT NOT NULL AUTO_INCREMENT, PRIMARY KEY (ID),
    CustomerID INT NOT NULL, FOREIGN KEY (CustomerID) REFERENCES Customers(ID),
    Description VARCHAR(30) NOT NULL,
    Total DECIMAL(9,2) NOT NULL,
    Created datetime not null default now()
);
select * from Orders;

select * from customers;
BEGIN;
set @cust1 = 2;
set @cust1price = 10.99;
set @cust2 = 1;
set @cust2price = 1023.93;

insert Orders
	(CustomerID, Description, Total)
    VALUES
    (@cust1, 'Tobacco Pipe', @cust1price),
    (@cust2, 'Bat Costume', @cust2price)
;

update Customers set
	Sales = Sales + @cust1price where ID = @cust1;
update Customers set
    Sales = Sales + @cust2price where ID = @cust2;
-- how does transaction work? need rollback

 ERROR <>0
	Rollback
else
	COMMIT;
SELECT * FROM Customers c
	join Orders o on o.CustomerID = c.ID;
    
    use bcdb;
BEGIN;
insert Customers (Code, Name)
	values ('aaaa', 'Joker');
select * from Customers;

select * from Customers;