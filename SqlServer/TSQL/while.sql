--使用循环求1-10之间的累加和
DECLARE @sum int ,@i int
SET @sum=0
SET @i=1
--使用循环结构累加求和
WHILE(@i<=10)
	BEGIN
		SET @sum=@i+@sum
		SET @i=@i+1
	END
PRINT '1-10之间的累加和为:'+CAST(@sum AS varchar(4))
GO
 
 
--【1】在循环中使用CONTINUE  ,遇到CONTINUE回到WHILE的条件判断处
--求1-10之间的偶数和
DECLARE @sum int ,@i int
SET @sum=0
SET @i=1
WHILE(@i<=10)
	BEGIN
		IF(@i%2=1)
			BEGIN
				SET @i=@i+1
				CONTINUE
			END
		ELSE
			BEGIN
				SET @sum=@sum+@i
				SET @i=@i+1
			END
	END--WHILE的结束
PRINT '1-10之间的偶数和为:'+CONVERT(varchar(2),@sum)
GO
 
 
--【2】在循环中使用BREAK
DECLARE @i int
SET @i=1
WHILE(@i<=10)
	BEGIN
		IF(@i=5)
			BEGIN
				BREAK   --退出循环结构，即使条件成立也不去判断了
			END
		ELSE
			SET @i=@i+1
	END
PRINT '@i的值为:@x='+CAST(@i AS varchar(2))
GO
--【3】RETURN实现退出功能
DECLARE @i int
SET @i=1
WHILE(@i<=10)
	BEGIN
		IF(@i=5)
			BEGIN
				RETURN     --退出功能可以执行批处理后的代码
			END
		ELSE
			SET @i=@i+1
	END
PRINT '@i的值为:@x='+CAST(@i AS varchar(2))
GO
PRINT '我是批处理后的代码'
 
 
DECLARE @x int    --@x控制行数
DECLARE @y int  --@y每行打印输出的个数
SET @x=1
SET @y=1
DECLARE @str varchar(100) --用来输出的字符串
SET @str=''
PRINT '***************************九九乘法表***********************************'
WHILE(@x<=9)   --行数
	BEGIN
		WHILE(@y<=@x)  --个数
			BEGIN
				SET @str=@str+CONVERT(varchar(2),@x)+'*'+CONVERT(varchar(2),@y)+'='+CONVERT(varchar(2),@y*@x)+'  '
				SET @y=@y+1
			END--内层循环的结束
		PRINT @str
		--再进行下一轮循环之前将字符串清空
		SET @str=''
		SET @x=@x+1
		SET @y=1
		PRINT ''
		 
	END
GO
