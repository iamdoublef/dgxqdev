select * from user_tab_comments where comments like '%危%';
select * from user_col_comments where table_name like '%T_STANDBOOK_DANGEROUSHOUSE%';

获取表：
select table_name from user_tables; //当前用户拥有的表
select table_name from all_tables; //所有用户的表
select table_name from dba_tables; //包括系统表
select table_name from dba_tables where owner='用户名'

user_tables：
table_name,tablespace_name,last_analyzed等
dba_tables：
ower,table_name,tablespace_name,last_analyzed等
all_tables：
ower,table_name,tablespace_name,last_analyzed等
all_objects：
ower,object_name,subobject_name,object_id,created,last_ddl_time,timestamp,status等

 获取表字段：
select * from user_tab_columns where Table_Name='用户表';
select * from all_tab_columns where Table_Name='用户表';
select * from dba_tab_columns where Table_Name='用户表';
user_tab_columns：
table_name,column_name,data_type,data_length,data_precision,data_scale,nullable,column_id等
all_tab_columns ：
ower,table_name,column_name,data_type,data_length,data_precision,data_scale,nullable,column_id等
dba_tab_columns：
ower,table_name,column_name,data_type,data_length,data_precision,data_scale,nullable,column_id等

获取表注释：

select * from user_tab_comments
user_tab_comments：table_name,table_type,comments
相应的还有dba_tab_comments，all_tab_comments，这两个比user_tab_comments多了ower列。
获取字段注释：
select * from user_col_comments
user_col_comments：table_name,column_name,comments

相应的还有dba_col_comments，all_col_comments，这两个比user_col_comments多了ower列。

清空表字段注释操作：　　
现在提供一个比较简单的删除oracle表中comments的办法

在plsql中执行

select 'comment on column '||t.table_name||'.'||t.column_name||' is '''';' from user_col_comments t;

然后将结果列copy出来

在command中执行一下 ok。

select 'comment on table '||t.table_name||' is '''';' from user_tab_comments t; 清空表注释
select 'comment on column '||t.table_name||'.'||t.column_name||' is '''';' from user_col_comments t; 清空表字段注释
