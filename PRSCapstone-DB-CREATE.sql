CREATE DATABASE PRSCapstone
--DROP DATABASE PRSCapstone

GO

USE PRSCapstone

CREATE TABLE [User]
(
Id INT PRIMARY KEY IDENTITY(1,1),
Username VARCHAR(30) NOT NULL UNIQUE, 
Password VARCHAR(30) NOT NULL,
Firstname NVARCHAR(30) NOT NULL,
Lastname NVARCHAR(30) NOT NULL,
Phone VARCHAR(12) NULL,
Email NVARCHAR(255) NULL,
IsReviewer BIT NOT NULL,
IsAdmin BIT NOT NULL
)

GO

INSERT INTO [User] (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
VALUES ('JWitte', 'password', 'Jake', 'Witte', '555-444-3333', 'jake@email.com', 1, 1);

--SELECT * FROM [User];

CREATE TABLE Vendor
(
Id INT PRIMARY KEY IDENTITY(1,1),
Code NVARCHAR(30) NOT NULL UNIQUE,
Name NVARCHAR(30) NOT NULL,
Address NVARCHAR(30) NOT NULL,
City NVARCHAR(30) NOT NULL,
State NVARCHAR(2) NOT NULL,
Zip NVARCHAR(5) NOT NULL,
Phone VARCHAR(12) NULL,
Email NVARCHAR(255) NULL
)

GO
INSERT INTO Vendor (Code, Name, Address, City, State, Zip, Phone, Email)
VALUES ('BB', 'Bob''s Burgers', '2001 Vine St.', 'Cincinnati', 'OH', '45202', '513-451-7777', 'bobsburgers@email.com');

--SELECT * FROM Vendor
--DROP TABLE Product
CREATE TABLE Product
(
Id INT PRIMARY KEY IDENTITY(1,1),
PartNbr VARCHAR(30) NOT NULL UNIQUE,
Name NVARCHAR(30) NOT NULL,
Price DEC(11,2) NOT NULL,
Unit NVARCHAR(30) NOT NULL,
PhotoPath NVARCHAR(255) NULL,
VendorId INT NOT NULL REFERENCES Vendor (Id)
)

GO

INSERT INTO Product (PartNbr, Name, Price, Unit, PhotoPath, VendorId)
VALUES ('001', 'Bob''s Classic Burger', 5.95 , 'Burger1', NULL, 1);

GO

SELECT * FROM Product