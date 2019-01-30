--
select u.id,u.name,u.phone, o.name officeName from sys_user u left join sys_office o on u.office_id = o.id
where u.id =:userId
--date('yyyy年MM月dd日')
--row() - 7
--'检查总数：' + count(B9) + '座'
--隐患类
select lpad( name, lengthb(name)+ (level-1) ,'+' ) tname, level , t.* from t_question_type t 
start with t.p_id is null 
connect by prior id =  p_id;
--查询表
select * from user_tab_comments where comments like '%水库%';
select * from user_col_comments where table_name like '%T_STANDBOOK_SDZHAN%';
