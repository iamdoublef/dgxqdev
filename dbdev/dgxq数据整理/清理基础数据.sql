--����ҵ������
/*truncate table t_question_info;
truncate table t_send_info;
truncate table t_account_info;
truncate table t_picture_info;
truncate table t_voice_info;*/

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
