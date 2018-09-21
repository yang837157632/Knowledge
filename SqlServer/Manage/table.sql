--将当前数据库设置为E_Market，以便在E_Market数据库中创建表
USE E_Market
GO
 
--创建会员信息表
IF EXISTS(SELECT * FROM sysobjects WHERE name='UserInfo')
DROP TABLE UserInfo
GO
CREATE TABLE UserInfo
(
	UserId VARCHAR(20) NOT NULL,--会员号
	UserPwd VARCHAR(50) NOT NULL,--会员密码
	UserName VARCHAR(50) NOT NULL,--会员名
	Gender INT NOT NULL,--性别
	Email VARCHAR(50),--邮箱
	UserAddress NVARCHAR(200),--联系地址
	Phone VARCHAR(20) NOT NULL--联系电话
)
GO
 
--创建订单表
IF EXISTS(SELECT * FROM sysobjects WHERE name='OrderInfo')
DROP TABLE OrderInfo
GO
CREATE TABLE OrderInfo
(
	OrderId INT IDENTITY(1,1) NOT NULL,--订单编号
	UserId VARCHAR(20) NOT NULL,--外键，引用UserInfo表的主键
	CommodityId INT NOT NULL,--外键，引用商品信息表的主键
	Amount INT NOT NULL,--数量
	PayMoney BIGINT NOT NULL,--付货总金额
	PayWay VARCHAR(50) NOT NULL,--付款方式
	OrderTime DATETIME NOT NULL,--下单日期
	Confirm INT NOT NULL,--是否确认收，1表示确认，0表示没有确认，默认0
	SendGoods INT NOT NULL --是否发货，0没发，1发货，默认0
)
GO
 
--删除表中的所有数据
TRUNCATE TABLE Test          不能用于有外键约束的表
DELETE UserInfo
 
 
--删除表
DROP TABLE CommodityInfo
