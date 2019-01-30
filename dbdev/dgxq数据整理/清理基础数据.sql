--清理无用的表
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

--清理系统信息
/*truncate table SPR_LOG;                      
truncate table SYS_LOG;*/

--清理业务数据
/*truncate table t_question_info;
truncate table t_send_info;
truncate table t_account_info;
truncate table t_picture_info;
truncate table t_voice_info;
truncate table T_TASK_INFO;
--清理所有台账信息

*/

--清理批次小组等信息
/*truncate table t_freq_info;
truncate table t_group_info;
truncate table t_group_rember_r;*/

--更新报表链接字段，警告，需要确认url中是含有#amp;字段，目的是清除该类无用字段
select * from t_summary_code;
select * from t_report_index;
/*
update t_summary_code set summary_url = substr(summary_url, 0 , instr(summary_url, '#amp') -1) ;
update t_report_index set url = substr(url, 0 , instr(url, '#amp') -1) ;
*/
