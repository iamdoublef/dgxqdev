select * from user_tab_comments where comments like '%ˮբ%';
select * from user_col_comments where table_name like '%T_STANDBOOK_SDZHAN%';
select * from user_col_comments where table_name like '%T_SDZ_INFO%';
select * from user_col_comments where table_name like '%T_ACCOUNT_INFO%';

select 
--ˮ��վ����,�������ڵ�,���̹���λ,������Ա���ˣ�,��������Ա���ˣ�, ��ƹ�բ������m3/s��, բ���ܾ���m��, ���բ�Ӹߣ�m��, ����, ���ܷ�ʽ
tss.SZHA_MC,tss.GCDZ,tss.GCGLDW_MC,tss.GLRYSL,tss.SJGZLL,tss.zkzjk, tss.zdzbg, tss.ks_sl, tss.xnfs,
tss.CZZYWT1,tss.CLYJ1,tss.CZZYWT2,tss.CLYJ2,tss.CZZYWT3,tss.CLYJ3,tss.CZZYWT4,tss.CLYJ4,tss.CZZYWT5,tss.CLYJ5,tss.CZZYWT6,tss.CLYJ6,tss.CZZYWT7,tss.CLYJ7,
tss.CZZYWT8,tss.CLYJ8,
--��������ʵ�������Ѵ���������ˣ���Ѵ���������ˣ�����λ�����ˣ����� ��λ	 ְ��	 ��ϵ�绰 ���Ĵ�ʩ
tss.FXXZZRR_XM,tss.FXJSFZR_XM,tss.GLDAFZR_XM,tss.FXXZZRR_DW,tss.FXJSFZR_DW,tss.GLDAFZR_DW,tss.FXXZZRR_ZW,tss.FXJSFZR_ZW,tss.GLDAFZR_ZW,tss.FXXZZRR_LXDH,tss.FXJSFZR_LXDH,tss.GLDAFZR_LXDH,tss.ZRLSQK_ZGCS,
--����Ԥ��--�Ƿ����,��������	,��������׼��ˮԤ��,Ⱥ��ת�Ʒ���	,���������ֶ�	, ���Ĵ�ʩ
tss.FHYA_SFBZ,tss.FHYA_SPJG,tss.FHYA_FYCBZHSYA,tss.FHYA_QZZYFA,tss.FHYA_BJLLSD,tss.FHYA_ZGCS,
--��Ѵ���ն���	�������ˣ�		������	��ϵ�� ����	�绰	�����绰
tss.QXDW_RS,tss.QXDW_FZR_XM,tss.QXDW_FZR_DH,tss.QXDW_LXR_XM,tss.QXDW_LXR_DH,tss.QXDW_ZGCS,
--��Ѵ�������ʴ�����״��� "���ࣨ��)"	"��������m2��"	"ɰʯ��m3)"	��ʯ����)"	"��ŵ���Ӿ���(m)",���Ĵ�ʩ
tss.QXWZ_DL,tss.QXWZ_TGB,tss.QXWZ_SS,tss.QXWZ_KS,tss.QXWZ_JSY,tss.QXWZ_CFD,tss.QXWZ_ZGCS,
--ͨѶ��ʽ		���޷�Ѵ��·		���޹����ƶ�	
tss.TXFS,tss.FXGL_YW,tss.GLZD_YW,
--�Լ���ۼ����ȡ�����Ĵ�ʩ,�������ˣ�ǩ����,��λ�����£�,�����ۼ������ȡ�Ĵ�ʩ,������鳤��ǩ����,����ְ��
tss.ZJJLJCS,tss.ZJJLJCS_FZR,tss.ZJJLJCS_DW,tss.JCJLCS,tss.JCJLCS_FZR,tss.JCJLCS_XZZW,
--��Ѵ���������ˣ�ǩ����,ʱ��,��Ѵ���������ˣ�ǩ����,ʱ��
tss.FXXZFZR_QM,tss.FXXZFZR_SJ,tss.FXJSZRR_QM,tss.FXJSZRR_SJ
from t_account_info tai
left join T_STANDBOOK_SZHA tss on tai.tz_bh = tss.id and tai.tz_table_name = 't_standbook_szha'
where  tai.id = '7b7a3ce448b6488caaab54861fb96d1f'



--and extract(year from tai.tb_sj) = '2019' and tai.tb_dwbh = 'DGXQSLGCGLC7'


--------------------------------------------------------------------------------------------------------
--��������
select 
'20190104' SK_MC,'20190104' GCDZ,'20190104' GCGLDW_MC,'20190104' GLRYSL,'20190104' JYMJ,'20190104' ZKR,'20190104' BX,'20190104' BC,'20190104' ZDBG,
'20190104' CZZYWT1,'20190104' CLYJ1,'20190104' CZZYWT2,'20190104' CLYJ2,'20190104' CZZYWT3,'20190104' CLYJ3,'20190104' CZZYWT4,'20190104' CLYJ4,'20190104' CZZYWT5,'20190104' CLYJ5,'20190104' CZZYWT6,'20190104' CLYJ6,'20190104' CZZYWT7,'20190104' CLYJ7,
'20190104' CZZYWT8,'20190104' CLYJ8,'20190104' CZZYWT9,'20190104' CLYJ9,'20190104' CZZYWT10,'20190104' CLYJ10,'20190104' CZZYWT11,'20190104' CLYJ11,'20190104' CZZYWT12,'20190104' CLYJ12,'20190104' CZZYWT13,'20190104' CLYJ13,'20190104' CZZYWT14,'20190104' CLYJ14,'20190104' CZZYWT15,'20190104' CLYJ15,
'20190104' FXXZZRR_XM,'20190104' FXJSFZR_XM,'20190104' GLDAFZR_XM,'20190104' FXXZZRR_DW,'20190104' FXJSFZR_DW,'20190104' GLDAFZR_DW,'20190104' FXXZZRR_ZW,'20190104' FXJSFZR_ZW,'20190104' GLDAFZR_ZW,'20190104' FXXZZRR_LXDH,'20190104' FXJSFZR_LXDH,'20190104' GLDAFZR_LXDH,'20190104' ZRLSQK_ZGCS,
'20190104' FHYA_SFBZ,'20190104' FHYA_SPJG,'20190104' FHYA_FYCBZHSYA,'20190104' FHYA_QZZYFA,'20190104' FHYA_BJLLSD,'20190104' FHYA_ZGCS,
'20190104' QXDW_RS,'20190104' QXDW_FZR_XM,'20190104' QXDW_FZR_DH,'20190104' QXDW_LXR_XM,'20190104' QXDW_LXR_DH,'20190104' QXDW_ZGCS,
'20190104' QXWZ_DL,'20190104' QXWZ_TGB,'20190104' QXWZ_SS,'20190104' QXWZ_KS,'20190104' QXWZ_JSY,'20190104' QXWZ_CFD,'20190104' QXWZ_ZGCS,
'20190104' XQDDJH_YW,'20190104' ANQUANXL,'20190104' TXFS,'20190104' FXGL_YW,'20190104' GLZD_YW,
'20190104' ZJJLJCS,'20190104' ZJJLJCS_FZR,'20190104' ZJJLJCS_DW,'20190104' JCJLCS,'20190104' JCJLCS_FZR,'20190104' JCJLCS_XZZW,
'20190104' FXXZFZR_QM,'20190104' FXXZFZR_SJ,'20190104' FXJSZRR_QM,'20190104' FXJSZRR_SJ
from dual;



