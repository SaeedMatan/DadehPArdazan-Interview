

--FirstName : Saeed	
--LastName : Matan
--Email: Saeed.Matan@gmail.com	
--Mobile : 09113106546
--Date OF Test : 1401/11/11


--1
SELECT @@VERSION AS 'SQL Server Version Details'
GO;

--2
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'
GO;

--3
create table T2(
	CustomerID int identity(1,1) PRIMARY KEY,
	CustomerName nvarchar(1000),
	Province nvarchar(500),
	Quantity int,
	TotalPrice decimal(18,2),
	Profit decimal(18, 2),
	PresenterCustomerID int
		)
GO;

--4
CREATE LOGIN matin1995 WITH PASSWORD = 'matin1995';
CREATE ROLE  Role_OnlySelect;
GRANT SELECT ON [dbo].[T2] TO Role_OnlySelect;
SP_ADDROLEMEMBER  Role_OnlySelect ,matin1995;

--5
INSERT INTO T2([CustomerName], [Province], [Quantity], [TotalPrice], [Profit], [PresenterCustomerID])

--6
ALTER TABLE T2
ADD CusType int;

--7
DELETE FROM T2
WHERE [TotalPrice] < 10000000.00

--8
ALTER TABLE T2 WITH NOCHECK
	ADD FOREIGN KEY (CustomerID) REFERENCES [dbo].[T1] (CustomerID)
GO
UPDATE T2
SET CusType = 3
WHERE CustomerID IN(
					SELECT T2.CustomerID FROM T1
					JOIN T2 ON T1.CustomerID = T2.CustomerID
					WHERE T2.Quantity>3
					);

--9
SELECT*,
RANK() OVER(ORDER BY QUANTITY*TotalPrice) AS RANK
FROM T1;

--10

--11

--12

--13

--14

--15

--16