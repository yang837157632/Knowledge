--创建单列索引
create index idx_ename on emp(ename);
 
--创建复合索引
create index idx_deptno_job on emp(deptno,job);
 
--创建唯一索引
create unique index idx_dname on dept(dname);
 
--创建非唯一索引
create index idx_job on emp(job);
 
--查询索引
select uic.index_name, uic.column_name, uic.column_position, ui.uniqueness
from user_indexes ui, user_ind_columns uic
where uic.index_name = ui.index_name and ui.table_name='EMP';
 
--删除索引
drop index idx_dname;
