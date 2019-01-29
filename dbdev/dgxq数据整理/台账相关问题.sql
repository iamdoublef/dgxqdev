select * from t_question_info;
select * from t_send_info;
select * from t_account_info;
select * from t_picture_info;
select * from t_voice_info;

/*truncate table t_question_info;
truncate table t_send_info;
truncate table t_account_info;
truncate table t_picture_info;
truncate table t_voice_info;*/


select * from t_report_index;
select * from t_question_type;
select * from t_account_dict;

-----------------------
--台账接收重复问题处理
-------------------------
--回复原始状态
--删除接收信息
/*delete  t_account_info t where t.TB_DWBH='DGXQ3';
delete T_SEND_INFO WHERE JS_DW_BH='DGXQ3';*/
SELECT * FROM T_SEND_INFO;
