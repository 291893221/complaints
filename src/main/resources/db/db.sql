--创建表空间
CREATE TABLESPACE complaints
    DATAFILE 'D:\tablespace\complaints' size 800M  
    EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO; 

--查询所有表空间
select t.tablespace_name, round(sum(bytes / (1024 * 1024)), 0) ts_size
  from dba_tablespaces t, dba_data_files d
 where t.tablespace_name = d.tablespace_name
 group by t.tablespace_name;

--建帐号
create user complaints identified by complaintspw   
default tablespace complaints; 

--赋权
grant connect,resource,DBA to complaints;  
grant create any sequence to complaints;  
grant create any table to complaints;  
grant delete any table to complaints;  
grant insert any table to complaints;  
grant select any table to complaints;  
grant unlimited tablespace to complaints;  
grant execute any procedure to complaints;  
grant update any table to complaints;  
grant create any view to complaints; 

--备份：
exp complaints/complaintspw@ORCL file=D:\complaints\database_backup\oracle%date:~0,10%.dmp owner=complaints log=D:\complaints\database_backup\oracle%date:~0,10%.log 
