-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------��ȡȫ����ǰ�û�ȡ������������------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--���	ˮբ���ƣ����ڵأ��ء��򣩣����ڵ̷�����ӶΣ���բ�׿�����բ�׿����ܾ��ߣ��ף�����ƹ�բ������m3/s��	�������(��Ķ)	����������	����������	
--��������ϵͳ�Ƿ��䱸���õ�Դ	���̴�����Ҫ����	Ӧ�����մ����ʩ
--ȱ�ֶΣ��������(��Ķ)�������غ������ֶΣ�û�зֿ�,ȱʧ�ֶ��Ƿ��䱸���õ�Դ

select gcgldw_mc, gcgldw_bh, gcdz, bsz.df_mc || bsz.hd_mc  szdf  , ks_sl, zkzjk, sjgzll,  'ȱʧ�ֶ��������' symj , fxxzzrr_xm ,fxjsfzr_xm , 'ȱʧ�ֶ��Ƿ��䱸���õ�Դ' sfpbbydy, 
       czzywt1 || decode(czzywt2,null,'', '; ' || czzywt2 ) || decode(czzywt3 ,null,'', '; ' || czzywt3 ) || decode(czzywt4  ,null,'', '; ' ||  czzywt4 ) 
       || decode( czzywt5 ,null,'', '; ' ||  czzywt5 ) || decode(czzywt6  ,null,'', '; ' || czzywt6  ) || decode(czzywt7  ,null,'', '; ' || czzywt7  )
        || decode(czzywt8  ,null,'', '; ' ||czzywt8   )  czzywt,
        clyj1 || decode(clyj2,null,'', '; ' || clyj2 ) || decode(clyj3 ,null,'', '; ' || clyj3 ) || decode(clyj4  ,null,'', '; ' ||  clyj4 ) 
       || decode( clyj5 ,null,'', '; ' ||  clyj5 ) || decode(clyj6  ,null,'', '; ' || clyj6  ) || decode(clyj7  ,null,'', '; ' || clyj7  )
        || decode(clyj8  ,null,'', '; ' ||clyj8   )  clyj,
         cl_ren , tb_sj
	 from (SELECT  REGEXP_SUBSTR(TZ_BH, '[^,]+', 1, lvl) WT_BH ,tb_dwbh, tb_dwmc, cl_ren , tb_sj 
          FROM (
          --��id,id,id,id���ַ���ת����id��
               select tb_dwbh, tb_dwmc, cl_ren , tb_sj , tz_bh
                  from t_account_info
                 where tb_dwbh = 'DGXQSLGCGLC7' 
                   and extract(year from tb_sj) = '2018'
                   and gc_yh_lx ='SZ' ) a,
               (SELECT LEVEL lvl FROM dual CONNECT BY LEVEL < 1000) b
         WHERE b.lvl <= REGEXP_COUNT(a.TZ_BH, '\,') + 1) tai
  LEFT JOIN T_STANDBOOK_SZHA szha on tai.wt_bh = szha.id
  LEFT JOIN T_BASE_SZHA bsz on szha.SZHA_BH = bsz.id;
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


