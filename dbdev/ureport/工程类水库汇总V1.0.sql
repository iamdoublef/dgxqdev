select * from user_tab_comments where comments like '%ˮ��%';
select * from user_col_comments where table_name like '%T_STANDBOOK_SDZHAN%';
select * from user_col_comments where table_name like '%T_SDZ_INFO%';
select * from user_col_comments where table_name like '%T_ACCOUNT_INFO%';
select lpad( name, lengthb(name)+ (level-1) ,'+' ) tname, level , t.* from t_question_type t 
start with t.p_id is null 
connect by prior id =  p_id;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------��ȡȫ����ǰ�û�ȡ������������------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--ˮ������	������   (�С�����	"���������ƽ�����"	"�ܿ��ݣ���m3��"	"�����˿�(����)"	"������(��Ķ)"	
--"����������",	"����������",	���̴�����Ҫ����,	Ӧ�����մ����ʩ
select SK_MC, SK_BH, gcdz,  JYMJ,ZKR, '�����˿�(����)' bhrk,'������(��Ķ)' ggmj,fxxzzrr_xm ,fxjsfzr_xm ,FHYA_SFBZ,
       czzywt1 || decode(czzywt2, null,'', '; ' || czzywt2 ) || decode(czzywt3 ,null,'', '; ' || czzywt3 ) || decode(czzywt4  ,null,'', '; ' ||  czzywt4 ) 
       || decode( czzywt5 ,null,'', '; ' ||  czzywt5 ) || decode(czzywt6  ,null,'', '; ' || czzywt6  ) || decode(czzywt7  ,null,'', '; ' || czzywt7  )
        || decode(czzywt8  ,null,'', '; ' ||czzywt8   ) || decode(czzywt9  ,null,'', '; ' ||czzywt9   )|| decode(czzywt10  ,null,'', '; ' ||czzywt10   )
        || decode(czzywt11  ,null,'', '; ' ||czzywt11   ) || decode(czzywt12  ,null,'', '; ' ||czzywt12   )|| decode(czzywt13  ,null,'', '; ' ||czzywt13   )
        || decode(czzywt14  ,null,'', '; ' ||czzywt14   ) || decode(czzywt15  ,null,'', '; ' ||czzywt15   )  czzywt,
        clyj1 || decode(clyj2,null,'', '; ' || clyj2 ) || decode(clyj3 ,null,'', '; ' || clyj3 ) || decode(clyj4  ,null,'', '; ' ||  clyj4 ) 
       || decode( clyj5 ,null,'', '; ' ||  clyj5 ) || decode(clyj6  ,null,'', '; ' || clyj6  ) || decode(clyj7  ,null,'', '; ' || clyj7  )
        || decode(clyj8  ,null,'', '; ' ||clyj8   ) || decode(clyj9  ,null,'', '; ' ||clyj9   )|| decode(clyj10  ,null,'', '; ' ||clyj10   )
        || decode(clyj11  ,null,'', '; ' ||clyj11   ) || decode(clyj12  ,null,'', '; ' ||clyj12   )|| decode(clyj13  ,null,'', '; ' ||clyj13   )
        || decode(clyj14  ,null,'', '; ' ||clyj14   ) || decode(clyj15  ,null,'', '; ' ||clyj15   ) clyj,
        cl_ren , tb_sj
	 from t_account_info tai
  LEFT JOIN T_STANDBOOK_RESERVOIR stb on tai.tz_bh = stb.id and  and tai.tz_table_name = 't_standbook_reservoir'
  where 
  
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--��������


select '��ƽ���ˮբ' gcgldw_mc, 'cpdsz' gcgldw_bh, '��ƽ�أ���ƽ��' gcdz, 'ȱʧ�ֶ����ڵ̷�' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  'ȱʧ�ֶ��������' symj ,'����������' fxxzzrr_xm ,'����������' fxjsfzr_xm , 'ȱʧ�ֶ��Ƿ��䱸���õ�Դ' sfpbbydy, 
       '�ü������⣻�ü������⣻�ü������⣻'  czzywt, '��������ʽ����������ʽ����������ʽ����������ʽ'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '��ƽ���ˮբ' gcgldw_mc, 'cpdsz' gcgldw_bh, '��ƽ�أ���ƽ��' gcdz, 'ȱʧ�ֶ����ڵ̷�' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  'ȱʧ�ֶ��������' symj ,'����������' fxxzzrr_xm ,'����������' fxjsfzr_xm , 'ȱʧ�ֶ��Ƿ��䱸���õ�Դ' sfpbbydy, 
       '�ü������⣻�ü������⣻�ü������⣻'  czzywt, '��������ʽ����������ʽ����������ʽ����������ʽ'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '��ƽ���ˮբ' gcgldw_mc, 'cpdsz' gcgldw_bh, '��ƽ�أ���ƽ��' gcdz, 'ȱʧ�ֶ����ڵ̷�' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  'ȱʧ�ֶ��������' symj ,'����������' fxxzzrr_xm ,'����������' fxjsfzr_xm , 'ȱʧ�ֶ��Ƿ��䱸���õ�Դ' sfpbbydy, 
       '�ü������⣻�ü������⣻�ü������⣻'  czzywt, '��������ʽ����������ʽ����������ʽ����������ʽ'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '��ƽ���ˮբ' gcgldw_mc, 'cpdsz' gcgldw_bh, '��ƽ�أ���ƽ��' gcdz, 'ȱʧ�ֶ����ڵ̷�' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  'ȱʧ�ֶ��������' symj ,'����������' fxxzzrr_xm ,'����������' fxjsfzr_xm , 'ȱʧ�ֶ��Ƿ��䱸���õ�Դ' sfpbbydy, 
       '�ü������⣻�ü������⣻�ü������⣻'  czzywt, '��������ʽ����������ʽ����������ʽ����������ʽ'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '��ƽ���ˮբ' gcgldw_mc, 'cpdsz' gcgldw_bh, '��ƽ�أ���ƽ��' gcdz, 'ȱʧ�ֶ����ڵ̷�' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  'ȱʧ�ֶ��������' symj ,'����������' fxxzzrr_xm ,'����������' fxjsfzr_xm , 'ȱʧ�ֶ��Ƿ��䱸���õ�Դ' sfpbbydy, 
       '�ü������⣻�ü������⣻�ü������⣻'  czzywt, '��������ʽ����������ʽ����������ʽ����������ʽ'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '��ƽ���ˮբ' gcgldw_mc, 'cpdsz' gcgldw_bh, '��ƽ�أ���ƽ��' gcdz, 'ȱʧ�ֶ����ڵ̷�' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  'ȱʧ�ֶ��������' symj ,'����������' fxxzzrr_xm ,'����������' fxjsfzr_xm , 'ȱʧ�ֶ��Ƿ��䱸���õ�Դ' sfpbbydy, 
       '�ü������⣻�ü������⣻�ü������⣻'  czzywt, '��������ʽ����������ʽ����������ʽ����������ʽ'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '��ƽ���ˮբ' gcgldw_mc, 'cpdsz' gcgldw_bh, '��ƽ�أ���ƽ��' gcdz, 'ȱʧ�ֶ����ڵ̷�' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  'ȱʧ�ֶ��������' symj ,'����������' fxxzzrr_xm ,'����������' fxjsfzr_xm , 'ȱʧ�ֶ��Ƿ��䱸���õ�Դ' sfpbbydy, 
       '�ü������⣻�ü������⣻�ü������⣻'  czzywt, '��������ʽ����������ʽ����������ʽ����������ʽ'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '��ƽ���ˮբ' gcgldw_mc, 'cpdsz' gcgldw_bh, '��ƽ�أ���ƽ��' gcdz, 'ȱʧ�ֶ����ڵ̷�' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  'ȱʧ�ֶ��������' symj ,'����������' fxxzzrr_xm ,'����������' fxjsfzr_xm , 'ȱʧ�ֶ��Ƿ��䱸���õ�Դ' sfpbbydy, 
       '�ü������⣻�ü������⣻�ü������⣻'  czzywt, '��������ʽ����������ʽ����������ʽ����������ʽ'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '��ƽ���ˮբ' gcgldw_mc, 'cpdsz' gcgldw_bh, '��ƽ�أ���ƽ��' gcdz, 'ȱʧ�ֶ����ڵ̷�' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  'ȱʧ�ֶ��������' symj ,'����������' fxxzzrr_xm ,'����������' fxjsfzr_xm , 'ȱʧ�ֶ��Ƿ��䱸���õ�Դ' sfpbbydy, 
       '�ü������⣻�ü������⣻�ü������⣻'  czzywt, '��������ʽ����������ʽ����������ʽ����������ʽ'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '��ƽ���ˮբ' gcgldw_mc, 'cpdsz' gcgldw_bh, '��ƽ�أ���ƽ��' gcdz, 'ȱʧ�ֶ����ڵ̷�' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  'ȱʧ�ֶ��������' symj ,'����������' fxxzzrr_xm ,'����������' fxjsfzr_xm , 'ȱʧ�ֶ��Ƿ��䱸���õ�Դ' sfpbbydy, 
       '�ü������⣻�ü������⣻�ü������⣻'  czzywt, '��������ʽ����������ʽ����������ʽ����������ʽ'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual


