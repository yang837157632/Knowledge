--system用户的演示代码
--给scott用户授予创建公共同义词的权限
grant  create public synonym to scott;
 
--给scott用户授予创建私有同义词的权限
grant  create  synonym to scott;
 
--测试
--使用scott用户下的私有同义词
select * from scott.en;
 
--使用scott用户下的公共同义词
select * from dn;
 
--给scott用户授予删除公共同义词的权限
grant drop public synonym to scott;
 
 
--scott用户的演示代码
 
--创建公共同义词
create public synonym dn for scott.deptnew;
 
--使用公共同义词
select * from dn;
 
--创建私有同义词
create synonym en for scott.empnew;
 
--使用私有同义词
select * from en;
 
--查看私有同义词
select synonym_name,table_owner,table_name
from syn
where synonym_name = 'EN';
 
--查看公共同义词
select synonym_name,table_owner,table_name
from all_synonyms
where synonym_name = 'DN';
 
--删除公共同义词
drop public synonym dn;
 
--删除私有同义词
drop synonym en;
