--�������õı�
/*

drop table SYS_AREA_1;  
drop table SYS_AREA_bak;                   
drop table TB_AREA;                      
drop table T_RIVER_CHIEF;                
drop table AYNCJ;                        
drop table T_RIVER_INFO_BAK;             
drop table T_RIVER_CARD;                 
drop table T_RIVER_INFO;                 
drop table SYS_AREA_bak;                 
drop table TEST_DATA;                    
drop table TEST_DATA_CHILD;              
drop table TEST_DATA_MAIN;               
drop table TEST_TREE;                    
drop table AAA;                          
drop table AYN;
*/

--����ϵͳ��Ϣ
/*truncate table SPR_LOG;                      
truncate table SYS_LOG;*/

--����ҵ������
/*truncate table t_question_info;
truncate table t_send_info;
truncate table t_account_info;
truncate table t_picture_info;
truncate table t_voice_info;
truncate table T_TASK_INFO;
--��������̨����Ϣ

*/

--��������С�����Ϣ
/*truncate table t_freq_info;
truncate table t_group_info;
truncate table t_group_rember_r;*/

--���±��������ֶΣ����棬��Ҫȷ��url���Ǻ���#amp;�ֶΣ�Ŀ����������������ֶ�
select * from t_summary_code;
select * from t_report_index;
/*
update t_summary_code set summary_url = substr(summary_url, 0 , instr(summary_url, '#amp') -1) ;
update t_report_index set url = substr(url, 0 , instr(url, '#amp') -1) ;
*/
