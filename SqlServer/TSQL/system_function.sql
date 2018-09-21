--系统函数CONVERT用于数据类型转换
--将字符型转为数值型
SELECT CONVERT(int,'12')+CONVERT(int,'10')  --+号起的是算术运算，相加运算
 
--将数值型转为字符型
SELECT CONVERT(varchar(2),12)+CONVERT(varchar(2),10)--+号是连接运算符，起连接作用
 
--将日期型转为字符型
SELECT CONVERT(varchar(10),GETDATE(),102)
SELECT CONVERT(varchar(10),GETDATE(),112)
