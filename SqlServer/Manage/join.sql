--[1]WHERE
SELECT OrderInfo.OrderId,UserInfo.UserName,
OrderInfo.Amount,OrderInfo.CommodityId
FROM OrderInfo,UserInfo
WHERE OrderInfo.UserId=UserInfo.UserId
 
--[2]使用INNER JOIN..ON
SELECT OrderId,UserName,O.Amount,CommodityName
 FROM UserInfo AS U
INNER JOIN OrderInfo AS O ON U.UserId=O.UserId
INNER JOIN CommodityInfo AS C ON O.CommodityId=C.CommodityId
WHERE U.UserName='赵可以'
 
--[3]左外连接 LEFT JOIN 以左表为主，返回左表的所有记录，
--如果左表中的某些行在右表中没有匹配的将用NULL值代替
--查询各类商品的库存情况，所有的类别都要显示出来，以类别表为主表
SELECT SortName AS 商品类别,Amount AS 库存量,CommodityName AS 商品名称
  FROM CommoditySort
LEFT JOIN CommodityInfo
ON CommoditySort.SortId=CommodityInfo.SortId
 
--[4]右外连接，RIGHT JOIN..ON,以右表为主
--无用户下单的商品信息
SELECT CommodityName AS 商品名称,
OrderId AS 订单号 FROM OrderInfo RIGHT JOIN CommodityInfo
ON OrderInfo.CommodityId =CommodityInfo.CommodityId
 
