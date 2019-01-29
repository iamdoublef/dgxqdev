-------------------------------------------------------------------
----备份数据
-------------------------------------------------------------------
--create table sys_office_bak_20190226 as select * from sys_office;
--create table sys_user_bak_20190226 as select * from sys_user;
select * from sys_user for update;
select * from sys_office ;
select * from sys_office where  id not like '%DGXQ%';
--delete sys_office where id not like '%DGXQ%';
-------------------------------------------------------------------
----备份数据
-------------------------------------------------------------------
--删除无用的机构数据
/*truncate table sys_office;
insert into sys_office  select * from sys_office_bak_20190226;*/
delete sys_office where name like '%水库' or name like '%围%' or name like '%堤' or name like '%电排站' or id not like 'DGXQ%'


--删除无用的客户信息
select * from  sys_user where id  <> '1';
--delete sys_user where id  <> '1';
select * from sys_user_bak_20190226;


--为每个机构新增一个管理员，一个普通用户，一个审核用户
--insert into sys_user 
select SEQ_BASE_INFO.Nextval ,'Z' ,o.id, o.name ||decode(t.id, 1,'管理员', 2,'审核员', '检查员'), u.password, o.id||t.id , o.name ||decode(t.id, 1,'管理员', 2,'审核员', '检查员') as name,
null,  SEQ_BASE_INFO.Nextval, SEQ_BASE_INFO.Nextval,t.id ,null as photo,
null,sysdate,'1','1',sysdate ,'1',sysdate,null,'0' del_flag,
null, null, null, null, o.name ||decode(t.id, 1,'管理员', 2,'审核员', '检查员'),o.name ||decode(t.id, 1,'管理员', 2,'审核员', '检查员'),'1'
   from sys_user u
left join sys_office o on 1=1
left join (
     select 1 id from dual 
     union all select 2 from dual
     union all select 3 from dual
) t on 1=1;


--删除无机构的用户信息
--delete sys_user u where u.office_id not in (select id from sys_office);

select login_name, count(1) from sys_user group by login_name having count(1)>1 ;


-----------------------------------------------
--分组信息
----------------------------------------------
select * from t_group_info;
select * from t_group_rember_r;
select * from t_group_underline;

--truncate table t_group_info;
--truncate table t_group_rember_r;


-------------------------------------------
--报表链接相关
-------------------------------------------
select * from t_summary_code;
select * from t_report_index;
--清掉报表链接的无用字符
select substr(summary_url, 0 , instr(summary_url, '#amp') -1) from t_summary_code;
select substr(url, 0 , instr(url, '#amp') -1) from t_report_index;
--update t_summary_code set summary_url = substr(summary_url, 0 , instr(summary_url, '#amp') -1) ;

-----------------------------------------------
--清除批次数据
----------------------------------------------
select * from t_freq_info;
--delete t_freq_info t where t.del_flag ='1'; 
--truncate table t_freq_info;








