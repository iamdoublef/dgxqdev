--
select u.id,u.name,u.phone, o.name officeName from sys_user u left join sys_office o on u.office_id = o.id
where u.id =:userId
--date('yyyy��MM��dd��')
--row() - 7
--'���������' + count(B9) + '��'
--������
select lpad( name, lengthb(name)+ (level-1) ,'+' ) tname, level , t.* from t_question_type t 
start with t.p_id is null 
connect by prior id =  p_id;
--��ѯ��
select * from user_tab_comments where comments like '%ˮ��%';
select * from user_col_comments where table_name like '%T_STANDBOOK_SDZHAN%';
