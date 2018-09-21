--[1]IS NULL与''的区别
--IS NULL:从未录入过数据，没有地址
--''：录入过数据，而后被删除，是有地址
 
 
--[2]查询返回限制的行数，使用TOP关键字
  --(1)返回限定的个数
  SELECT TOP 5 UserName AS 用户名,UserAddress AS 地址
  FROM UserInfo WHERE Gender=1
  --(2)返回限定百份比 20% PERCENT
  SELECT TOP 20 PERCENT UserName AS 用户名,UserAddress AS 地址
  FROM UserInfo WHERE Gender=1
 
--[3]IN 与 NOT IN
 
--[4]ALL   ANY   SOME
