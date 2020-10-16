use sys;
drop database if exists prs;
create database prs;
use prs;

-- create 5 tables: User (username, password, IsReviewer(bit), IsAdmin(bit)), Vendor, Product, Request, LineItem
drop table if exists User;
create table User (
	ID int not null auto_increment, primary key (ID),
    Username varchar(20) unique not null,
    Password varchar(10) not null,
    FirstName varchar(20) not null,
    LastName varchar(20) not null,
    PhoneNumber varchar(12) not null,
    Email varchar(75) not null,
    IsReviewer bit not null default 0,
    IsAdmin bit not null default 0
);

insert User
values
(0, 'bobcatpyrak', 'ouohyeah', 'Jonathan', 'Pyrak', '513-555-1234', 'bobcatpyrak@gmail.com', 1, 1),
(0, 'hellothere', 'kenobi', 'Ewan', 'McGregor', '111-555-5555', 'fakeemail@email.com', 0, 0)
-- (0, 'bobcatpyrak', 'aef', 'Jon', 'P', 'nope lol', 'no way', 0, 0)
;
select * from User;

drop table if exists Vendor;
create table Vendor (
	ID int not null auto_increment, primary key (ID),
    Code varchar(10) unique not null,
    Name varchar(255) not null,
    Address varchar(255) not null,
    City varchar(255) not null,
    State varchar(2) not null,
    Zip varchar(5) not null,
    PhoneNumber varchar(12) not null,
    Email varchar(100) not null
);

insert Vendor
values
(0, '1234', 'Rhinegeist', '79 Over The Rhine Road', 'Cincinnati', 'OH', '45625', '5555555', 'rhinegeist@email.com'),
(0, '1235', "Jackie O's", '75 Union Street', 'Athens', 'OH', '45741', '5551234', 'jackieos@email.net')
-- (0, '1234', 'Rhinegeist', '79 Over The Rhine Road', 'Cincinnati', 'OH', '45625', '5555555', 'rhinegeist@email.com')

;
select * from Vendor;

drop table if exists Product;
create table Product (
	ID int not null auto_increment, primary key (ID),
    VendorID int not null, foreign key (VendorID) references Vendor(ID),
    PartNumber varchar(50) not null,
    Name varchar(150) not null,
    Price decimal(10,2) not null,
    Unit varchar(255),
    PhotoPath varchar(255),
    Constraint vendor_part unique (VendorID, PartNumber)
);
insert Product
	values
	(0, 1, 'AC30', 'Dad 6-pack', 13.99, '6', 'something/blah.png');
insert Product
	(VendorID, PartNumber, Name, Price)
	values
	(1, 'BCC504', 'Razz Wheat 6-pack', 14.99)
    ;
select * from Product;

drop table if exists Request;
create table Request (
	ID int not null auto_increment, primary key (ID),
    UserID int not null, foreign key (UserID) references User(ID),
    Description varchar(100) not null,
    Justification varchar(255) not null,
    DateNeeded date not null,
    DeliveryMode varchar(25) not null,
    Status varchar(20) not null default 'New',
    Total decimal(10,2) not null,
    SubmittedDate datetime not null default now(),
    ReasonForRejection varchar(100)
);

insert Request
values
(0, 1, 'Ordering some Dad from Rhinegeist', 'We thirsty', now(), 'In person', 'New', 13.99, now(), null);
insert Request
(UserID, Description, Justification, DateNeeded, DeliveryMode, Total)
values
(2, 'Need some ale, mate', 'Celebration', now(), 'Send Anakin to pick it up', 14.99);

select * from Request;

drop table if exists LineItem;
create table LineItem (
	ID int not null auto_increment, primary key (ID),
    RequestID int not null, foreign key (RequestID) references Request(ID),
    ProductID int not null, foreign key (ProductID) references Product(ID),
    Quantity int not null default 1,
    Constraint req_pdt unique (RequestID, ProductID)
);

insert LineItem
values
(0, 1, 1, 1),
(0, 2, 2, 1)
;
select * from LineItem;

select * from User;
select * from Vendor;
select * from Product;
select * from Request;
select * from LineItem;

drop user if exists prs_user@localhost;
create user prs_user@localhost identified by 'sesame';
grant select, insert, delete, update on prs.* to prs_user@localhost;