-----------------------------------------------------------------------
-----    TOPICs 
-----  Table Valuated Fucntions
-----  Temp Table
--- Cration table
CREATE TABLE table1
(id int,
number int,
summa int)


--Creation table function
   CREATE FUNCTION [dbo].[fun_test_tabl_new]  
   (	
   --входящие параметры
   @number INT
   )
   --возвращающее значение, т.е. таблица с перечислением полей и их типов
   RETURNS @tabl TABLE (id INT, number INT, summa MONEY)
   AS
   BEGIN
	   --объявляем переменные
	   DECLARE @var MONEY
	   --выполняем какие-то действия на Transact-SQL
	   IF @number <=0 
	   BEGIN 
		SET @var=1
	   END
	   ELSE
			SET @var=@number
		--вставляем данные в возвращающий результат
		INSERT @tabl
			SELECT id, number, summa 
			FROM table1
			WHERE summa > @var
	   --возвращаем результат
	   RETURN
   END

IF EXISTS (
    SELECT * FROM sysobjects WHERE id = object_id(N'fun_test_tabl_new') 
    AND xtype IN (N'FN', N'IF', N'TF')
)
    DROP FUNCTION fun_test_tabl_new
GO

-- Run function
SELECT * FROM dbo.fun_test_tabl_new (1)

-------------------------------------------------------------------------
--- Temp table
   CREATE TABLE #tmp(column1 INT, column2 INT, column3 MONEY)
	INSERT INTO #tmp(column1, column2, column3)
		SELECT id, number, summa 
		FROM table1
   --Затем по коду ниже Вы ее можете использовать, а в конце процедуры удалить ее 
   DROP TABLE #tmp