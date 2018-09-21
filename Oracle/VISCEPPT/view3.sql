--创建复杂视图
create view job_view(job, avgsal, sumsal, maxsal, minsal)
as
select job,avg(sal),sum(sal),max(sal),min(sal) from emp group by job;
 
--查看复杂视图
select * from job_view;
 
--通过with read only子句为复杂视图屏蔽DML操作
create view job_view
as
select job,avg(sal) avgsal,sum(sal) sumsal,max(sal) maxsal,min(sal) minsal from emp group by job
with read only;
