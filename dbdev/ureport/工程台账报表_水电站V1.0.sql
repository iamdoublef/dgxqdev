select * from user_tab_comments where comments like '%ˮ��%';
select * from user_col_comments where table_name like '%T_STANDBOOK_SDZHAN%';
select * from user_col_comments where table_name like '%T_SDZ_INFO%';
select * from user_col_comments where table_name like '%T_ACCOUNT_INFO%';

select 
--ˮ��վ����,�������ڵ�,���̹���λ,������Ա���ˣ�,ˮ��վ����ˮ�⣨�Է���Ϊ�������������km2��,�ܿ��ݣ���m3��,����,�ӳ�(m),���Ӹߣ�m��
tss.SK_MC,tss.GCDZ,tss.GCGLDW_MC,tss.GLRYSL,tss.JYMJ,tss.ZKR,tss.BX,tss.BC,tss.ZDBG,
--���-���壬�����壬�ӻ����۲�ϵͳ	����ˮϵͳ-��ˮ������ѹ���ܣ�����ϵͳ	�������豸���õ�Դ�䱸���
--й��բ-բ��,��ǽ������,������,����ϵͳ,�����豸���õ�Դ�䱸���,й��բ�ų�鿪�����	,���Ϸ������,����
tss.CZZYWT1,tss.CLYJ1,tss.CZZYWT2,tss.CLYJ2,tss.CZZYWT3,tss.CLYJ3,tss.CZZYWT4,tss.CLYJ4,tss.CZZYWT5,tss.CLYJ5,tss.CZZYWT6,tss.CLYJ6,tss.CZZYWT7,tss.CLYJ7,
tss.CZZYWT8,tss.CLYJ8,tss.CZZYWT9,tss.CLYJ9,tss.CZZYWT10,tss.CLYJ10,tss.CZZYWT11,tss.CLYJ11,tss.CZZYWT12,tss.CLYJ12,tss.CZZYWT13,tss.CLYJ13,tss.CZZYWT14,tss.CLYJ14,
tss.CZZYWT15,tss.CLYJ15,tss.CZZYWT16,tss.CLYJ16,
--��������ʵ�������Ѵ���������ˣ���Ѵ���������ˣ�����λ�����ˣ����� ��λ	 ְ��	 ��ϵ�绰 ���Ĵ�ʩ
tss.FXXZZRR_XM,tss.FXJSFZR_XM,tss.GLDAFZR_XM,tss.FXXZZRR_DW,tss.FXJSFZR_DW,tss.GLDAFZR_DW,tss.FXXZZRR_ZW,tss.FXJSFZR_ZW,tss.GLDAFZR_ZW,tss.FXXZZRR_LXDH,tss.FXJSFZR_LXDH,tss.GLDAFZR_LXDH,tss.ZRLSQK_ZGCS,
--����Ԥ��--�Ƿ����,��������	,��������׼��ˮԤ��,Ⱥ��ת�Ʒ���	,���������ֶ�	, ���Ĵ�ʩ
tss.FHYA_SFBZ,tss.FHYA_SPJG,tss.FHYA_FYCBZHSYA,tss.FHYA_QZZYFA,tss.FHYA_BJLLSD,tss.FHYA_ZGCS,
--��Ѵ���ն���	�������ˣ�		������	��ϵ�� ����	�绰	�����绰
tss.QXDW_RS,tss.QXDW_FZR_XM,tss.QXDW_FZR_DH,tss.QXDW_LXR_XM,tss.QXDW_LXR_DH,tss.QXDW_ZGCS,
--��Ѵ�������ʴ�����״��� "���ࣨ��)"	"��������m2��"	"ɰʯ��m3)"	��ʯ����)"	"��ŵ���Ӿ���(m)",���Ĵ�ʩ
tss.QXWZ_DL,tss.QXWZ_TGB,tss.QXWZ_SS,tss.QXWZ_KS,tss.QXWZ_JSY,tss.QXWZ_CFD,tss.QXWZ_ZGCS,
--����Ѵ�ڵ������üƻ�		��ȫй����m3/s��		ͨѶ��ʽ		���޷�Ѵ��·		���޹����ƶ�	
tss.XQDDJH_YW,tss.ANQUANXL,tss.TXFS,tss.FXGL_YW,tss.GLZD_YW,
--�Լ���ۼ����ȡ�����Ĵ�ʩ,�������ˣ�ǩ����,��λ�����£�,�����ۼ������ȡ�Ĵ�ʩ,������鳤��ǩ����,����ְ��
tss.ZJJLJCS,tss.ZJJLJCS_FZR,tss.ZJJLJCS_DW,tss.JCJLCS,tss.JCJLCS_FZR,tss.JCJLCS_XZZW,
--��Ѵ���������ˣ�ǩ����,ʱ��,��Ѵ���������ˣ�ǩ����,ʱ��
tss.FXXZFZR_QM,tss.FXXZFZR_SJ,tss.FXJSZRR_QM,tss.FXJSZRR_SJ
from t_account_info tai
left join t_standbook_sdzhan  tss on tai.tz_bh = tss.id and tai.tz_table_name = 't_standbook_sdzhan'
where tss.sk_bh = '123456' and extract(year from tai.tb_sj) = '2019' and tai.tb_dwbh = 'DGXQSLGCGLC7'

