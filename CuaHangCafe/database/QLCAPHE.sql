
--drop database QLCAPHE
create database QLCAPHE
go

use QLCAPHE
go
--
--Drop table TableFood
create table  TableFood
(
ID int IDENTITY Primary key,
Name nvarchar(50) NOT NULL DEFAULT N'Ban Chau Co Ten',
Status nvarchar(100) NOT NULL DEFAULT N'Trống',---Trống/Có người
)
go
--Drop table Account
create table Account
(
Username nvarchar(100) NOT NULL Primary key,
Displayname nvarchar(100) NOT NULL DEFAULT N'NKERTER',
Password nvarchar(100) NOT NULL DEFAULT 0,
Type int NOT NULL DEFAULT 0--1.Admin&& 2.Staff
)
go

--Drop table FoodCategory
create table FoodCategory
(
ID int IDENTITY Primary key,
Name nvarchar(100) DEFAULT N'Chua Dat Ten',
)
go
--Drop Table Food
create table Food
(
ID int IDENTITY Primary key,
Name nvarchar(100) NOT NULL DEFAULT N'Chua Dat Ten',
IDCategory int NOT NULL,
Price Float NOT NULL,

FOREIGN KEY (IDCategory) REFERENCES dbo.FoodCategory(ID)
)
go

--drop table Bill
create table Bill
(
ID int IDENTITY Primary key,
DateCheackIn Date NOT NULL DEFAULT GETDATE(),
DateCheackOut Date,
idTable int NOT NULL,
Status int NOT NULL DEFAULT 0---1.Đã Thanh Toan&& 0.Chưa Thanh Toán
FOREIGN KEY (idTable) REFERENCES dbo.TableFood(ID)
)
go

--drop table Billinfo
CREATE TABLE BillInfo
(
	ID INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idBill) REFERENCES dbo.Bill(ID),
	FOREIGN KEY (idFood) REFERENCES dbo.Food(ID)
)
GO

INSERT INTO dbo.Account
        ( UserName ,
          DisplayName ,
          PassWord ,
          Type
        )
VALUES  ( N'Admin' , -- UserName - nvarchar(100)
          N'HoAnhKy' , -- DisplayName - nvarchar(100)
          N'1234556' , -- PassWord - nvarchar(1000)
          1  -- Type - int
        )
		INSERT INTO dbo.Account
        ( UserName ,
          DisplayName ,
          PassWord ,
          Type
        )
VALUES  ( N'staff' , -- UserName - nvarchar(100)
          N'staff' , -- DisplayName - nvarchar(100)
          N'1' , -- PassWord - nvarchar(1000)
          0  -- Type - int
        )
GO

CREATE PROC USP_GetAccountByUserName
@userName nvarchar(100)
AS 
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName
END
GO

EXEC dbo.USP_GetAccountByUserName @userName = N'Admin' -- nvarchar(100)



Select COUNT (*) From dbo.Account WHERE UserName = N'Admin' AND Password= N'1234556'

DECLARE @i INT = 0

WHILE @i <= 10
BEGIN
	INSERT dbo.TableFood ( Name)VALUES  ( N'Bàn ' + CAST(@i AS nvarchar(100)))
	SET @i = @i + 1
END

INSERT dbo.TableFood
( name, status )
VALUES  (N'Bàn 1')
INSERT dbo.TableFood
( name, status )
VALUES  (N'Bàn 2')
INSERT dbo.TableFood
( name, status )
VALUES  (N'Bàn 3')

GO
CREATE PROC USP_GetTableList
AS SELECT * FROM dbo.TableFood
GO
UPDATE dbo.TableFood SET STATUS = N'Có người' WHERE ID=9
EXEC dbo.USP_GetTableList

SELECT * FROM dbo.TableFood
-- thêm category
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Hải sản'  -- name - nvarchar(100)
          )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Nông sản' )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Lâm sản' )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Sản sản' )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Nước' )

-- thêm món ăn
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Mực một nắng nước sa tế', -- name - nvarchar(100)
          1, -- idCategory - int
          120000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Nghêu hấp xả', 1, 50000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Dú dê nướng sữa', 2, 60000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Heo rừng nướng muối ớt', 3, 75000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Cơm chiên mushi', 4, 999999)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'7Up', 5, 15000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Cafe', 5, 12000)

-- thêm bill
INSERT	dbo.Bill
        ( DateCheackIn ,
          DateCheackOut ,
          idTable ,
          status
        )
VALUES  ( GETDATE() , -- DateCheckIn - date
          NULL , -- DateCheckOut - date
          3 , -- idTable - int
          0  -- status - int
        )
        
INSERT	dbo.Bill
        ( DateCheackIn ,
          DateCheackOut ,
          idTable ,
          status
        )
VALUES  ( GETDATE() , -- DateCheckIn - date
          NULL , -- DateCheckOut - date
          4, -- idTable - int
          0  -- status - int
        )
INSERT	dbo.Bill
        ( DateCheackIn ,
          DateCheackOut ,
          idTable ,
          status
        )
VALUES  ( GETDATE() , -- DateCheckIn - date
          GETDATE() , -- DateCheckOut - date
          5 , -- idTable - int
          1  -- status - int
        )

-- thêm bill info
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 5, -- idBill - int
          1, -- idFood - int
          2  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 5, -- idBill - int
          3, -- idFood - int
          4  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 5, -- idBill - int
          5, -- idFood - int
          1  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 6, -- idBill - int
          1, -- idFood - int
          2  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 6, -- idBill - int
          6, -- idFood - int
          2  -- count - int
          )
INSERT	dbo.Billinfo
        ( idBill, idFood, count )
VALUES  ( 7, -- idBill - int
          5, -- idFood - int
          2  -- count - int
          )         
          
GO
SELECT * FROM  dbo.Billinfo
GO

CREATE PROC USP_InsertBill
@idTable INT
AS
BEGIN
	INSERT dbo.Bill 
	        ( DateCheackIn ,
	          DateCheackOut ,
	          idTable ,
	          status
	          
	        )
	VALUES  ( GETDATE() , -- DateCheckIn - date
	          NULL , -- DateCheckOut - date
	          @idTable , -- idTable - int
	          0,  -- status - int
	          0
	        )
END
GO

SELECT f.name, bi.count, f.price, f.price*bi.count AS totalPrice FROM dbo.BillInfo AS bi, dbo.Bill AS b, dbo.Food AS f 
WHERE bi.idBill = b.id AND bi.idFood = f.id AND b.idTable = 3

select * from FoodCategory
select * from Food 
where idCategory =3
GO
CREATE PROC USP_InsertBillInfo
@idBill INT, @idFood INT, @count INT
AS
BEGIN

	DECLARE @isExitsBillInfo INT
	DECLARE @foodCount INT = 1
	
	SELECT @isExitsBillInfo = id, @foodCount = b.count 
	FROM dbo.BillInfo AS b 
	WHERE idBill = @idBill AND idFood = @idFood

	IF (@isExitsBillInfo > 0)
	BEGIN
		DECLARE @newCount INT = @foodCount + @count
		IF (@newCount > 0)
			UPDATE dbo.BillInfo	SET count = @foodCount + @count WHERE idFood = @idFood
		ELSE
			DELETE dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood
	END
	ELSE
BEGIN
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
		VALUES  ( @idBill, -- idBill - int
          @idFood, -- idFood - int
          @count  -- count - int
          )
END
END
GO



CREATE TRIGGER UTG_UpdateBillInfo
ON dbo.BillInfo FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = idBill FROM Inserted
	
	DECLARE @idTable INT
	
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill AND status = 0	
	
	DECLARE @count INT
	SELECT @count = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idBill
	
	IF (@count > 0)
	BEGIN
	
		PRINT @idTable
		PRINT @idBill
		PRINT @count
		
		UPDATE dbo.TableFood SET status = N'Có người' WHERE id = @idTable		
		
	END		
	ELSE
	BEGIN
	PRINT @idTable
		PRINT @idBill
		PRINT @count
	UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable	
	end
	
END
GO

CREATE TRIGGER UTG_UpdateBill
ON dbo.Bill FOR UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = id FROM Inserted	
	
	DECLARE @idTable INT
	
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill
	
	DECLARE @count int = 0
	
	SELECT @count = COUNT(*) FROM dbo.Bill WHERE idTable = @idTable AND status = 0
	
	IF (@count = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable
END
GO

ALTER TABLE dbo.Bill
ADD discount INT

ALTER TABLE dbo.Bill
ADD totalPrice Float 

drop PROC USP_GetListBillByDate
GO
CREATE PROC USP_GetListBillByDate
@checkIn date, @checkOut date
AS 
BEGIN
	SELECT t.name AS [Tên bàn], b.totalPrice AS [Tổng tiền], DateCheackIn AS [Ngày vào], DateCheackOut AS [Ngày ra], discount AS [Giảm giá]
	FROM dbo.Bill AS b,dbo.TableFood AS t
	WHERE DateCheackIn >= @checkIn AND DateCheackOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable
END
GO
SELECT * FROM dbo.Bill

INSERT dbo.Food ( name, idCategory, Price )VALUES  ( N'', 0, 0.0)
select * from Food







