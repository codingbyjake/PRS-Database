CREATE DATABASE PRSCapstone
--DROP DATABASE PRSCapstone

GO

USE PRSCapstone

--DROP TABLE [User]
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

--DROP TABLE [User]
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
--SELECT * FROM Product

--DROP TABLE Request
CREATE TABLE Request
(
Id INT PRIMARY KEY IDENTITY(1,1),
Description NVARCHAR(80) NOT NULL,
Justification NVARCHAR(80) NOT NULL,
RejectionReason NVARCHAR(80) NULL,
DeliveryMode NVARCHAR(20) NOT NULL DEFAULT 'Pickup',
Status NVARCHAR(10) NOT NULL DEFAULT 'NEW',
Total DEC(11,2) NOT NULL DEFAULT 0,
UserId INT NOT NULL REFERENCES [User] (Id)
)
GO
INSERT INTO Request (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)
VALUES ('Two burgers for supper.', 'I''m hungry and it''s suppertime!!', NULL ,DEFAULT , DEFAULT , 777.77, 1);
--SELECT * FROM Request

--DROP TABLE RequestLine
CREATE TABLE RequestLine
(
Id INT PRIMARY KEY IDENTITY(1,1),
RequestId INT NOT NULL REFERENCES Request (Id),
ProductId INT NOT NULL REFERENCES Product (Id),
Quantity INT NOT NULL DEFAULT 1
)

INSERT INTO RequestLine (RequestId, ProductId, Quantity)
VALUES (1, 1, 2);
GO
--SELECT * FROM RequestLine