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

SELECT * FROM [User];