--清理业务数据
/*truncate table t_question_info;
truncate table t_send_info;
truncate table t_account_info;
truncate table t_picture_info;
truncate table t_voice_info;*/

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
