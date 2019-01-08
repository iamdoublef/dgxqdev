

---------------------------------------------------------------------------------------------------------------------------
------------------------ͳ�Ʊ���λ�������ϱ��������---------------------------------------------------------------------------
--ͨ��T_ACCOUT_INFO ���� T_SEND_INFO ��ȡ��ǰ�����Ѿ����ճɹ����¼����е�λ ��ͨ���Թ������Բ�ѯ����ǰ���еı���·��
--�������������1����T_SEND_INFO,���������Ϊ��ǰ��λΪҶ�ӵ�λ��δ�ύ�κ�̨�ˣ�����ʱ̨���Ѿ����ɣ���
--              2����T_SEND_INFO�������Ϊ�Ѿ����͹����б��͵ļ�¼
--��ǰ�������еı�����Ϣ
WITH PC_SEND_INFO AS(
  SELECT ACC.ID ACC_ID, SED.BS_DW_BH,SED.JS_DW_BH, ACC.TZ_TABLE_NAME FROM T_ACCOUNT_INFO ACC 
    LEFT JOIN T_SEND_INFO SED ON ACC.ID = SED.TZ_BH
    WHERE ACC.GC_YH_LX='YH'--TODO�������ͱ�ʶ
        AND ACC.PC_BH = (SELECT ID FROM T_FREQ_INFO WHERE STATUS ='2' )
         AND SED.STATUS = 'JS' --���н��ճɹ�����Ϣ
)
--select * from PC_SEND_INFO 
,
--���α���·��,��ȡ��ǰ�û������Ѿ����յ��¼���λ���Լ��ü���λ�����б���������·���ڵ�
ROOT_SEND_PATH as(
    select   BS_DW_BH, JS_DW_BH, connect_by_root(JS_DW_BH) ROOT_BH
      from PC_SEND_INFO psed 
      connect by prior psed.BS_DW_BH = psed.JS_DW_BH 
      start with psed.JS_DW_BH IN (SELECT BS_DW_BH FROM PC_SEND_INFO where JS_DW_BH = ( SELECT OFFICE_ID FROM SYS_USER WHERE ID = '1')) --TODO �滻Ϊ������û�ID����
    union all
    --һ���������û���ϱ��򵥶�����һ����λ��T_SEND_INFO�� JS_DW_BH �����Լ� ��ACCOUNT_INFO �������ݵ�λ
    SELECT OFFICE_ID BS_DW_BH , null JS_DW_BH, OFFICE_ID ROOT_BH  
           FROM SYS_USER t
           where t.id = '1'
           and t.office_id not in (SELECT DISTINCT JS_DW_BH FROM T_SEND_INFO WHERE STATUS ='JS' AND FREQ_ID = (SELECT ID FROM T_FREQ_INFO WHERE STATUS ='2' ))
           and t.office_id in (SELECT DISTINCT TB_DWBH FROM t_Account_Info WHERE PC_BH = (SELECT ID FROM T_FREQ_INFO WHERE STATUS ='2' ))
            -- TODO �滻Ϊ������û�ID����
    ) 
--select * from ROOT_SEND_PATH ;   
--ͳ����Ϣ�����ݻ���·�����ҳ���Ӧ����̨�˱������е���������
,DW_SUM AS (
SELECT rsp.ROOT_BH, stdb.TABLE_NAME ,COUNT(1) OVER(PARTITION BY ROOT_BH, TABLE_NAME) SUMCOUNT  ,RANK() OVER(PARTITION BY ROOT_BH, TABLE_NAME) SUMCOUNT  
      -- FROM (
       --SELECT ROOT_BH,TABLE_NAME,TBDWBH,stdb.id 
       FROM ROOT_SEND_PATH rsp
           LEFT JOIN 
           (select * from (
                select ID, TBDWBH,'t_standbook_constructionsite' TABLE_NAME, kzl1 PC_BH from t_standbook_constructionsite
                UNION ALL select ID, TBDWBH,'t_standbook_rqgcqy' TABLE_NAME, kzl1 PC_BH from t_standbook_rqgcqy
                UNION ALL select ID, TBDWBH,'t_standbook_mudbrickhouse' TABLE_NAME, kzl1 PC_BH from t_standbook_mudbrickhouse
                UNION ALL select ID, TBDWBH,'t_standbook_ypyzc' TABLE_NAME, kzl1 PC_BH from t_standbook_ypyzc
                UNION ALL select ID, TBDWBH,'t_standbook_waterlogging' TABLE_NAME, kzl1 PC_BH from t_standbook_waterlogging
                UNION ALL select ID, TBDWBH,'t_standbook_dangeroushouse' TABLE_NAME, kzl1 PC_BH from t_standbook_dangeroushouse
                UNION ALL select ID, TBDWBH,'t_standbook_bhyc' TABLE_NAME, kzl1 PC_BH from t_standbook_bhyc
                UNION ALL select ID, TBDWBH,'t_standbook_swcb' TABLE_NAME, kzl1 PC_BH from t_standbook_swcb
                UNION ALL select ID, TBDWBH,'t_standbook_nissenhut' TABLE_NAME, kzl1 PC_BH from t_standbook_nissenhut
                UNION ALL select ID, TBDWBH,'t_standbook_xpjf' TABLE_NAME, kzl1 PC_BH from t_standbook_xpjf
                UNION ALL select ID, TBDWBH,'t_standbook_yfqnc' TABLE_NAME, kzl1 PC_BH from t_standbook_yfqnc
                UNION ALL select ID, TBDWBH,'t_standbook_yugg' TABLE_NAME, kzl1 PC_BH from t_standbook_yugg
                UNION ALL select ID, TBDWBH,'t_standbook_bottomland' TABLE_NAME, kzl1 PC_BH from t_standbook_bottomland
                UNION ALL select ID, TBDWBH,'t_standbook_syhgqy' TABLE_NAME, kzl1 PC_BH from t_standbook_syhgqy
                UNION ALL select ID, TBDWBH,'t_standbook_zhyfqlc' TABLE_NAME, kzl1 PC_BH from t_standbook_zhyfqlc
                UNION ALL select ID, TBDWBH,'t_standbook_mountainflood' TABLE_NAME, kzl1 PC_BH from t_standbook_mountainflood
                UNION ALL select ID, TBDWBH,'t_standbook_dzgy' TABLE_NAME, kzl1 PC_BH from t_standbook_dzgy
                UNION ALL select ID, TBDWBH,'t_standbook_zrbhq' TABLE_NAME, kzl1 PC_BH from t_standbook_zrbhq
                UNION ALL select ID, TBDWBH,'t_standbook_ajjqu' TABLE_NAME, kzl1 PC_BH from t_standbook_ajjqu
                UNION ALL select ID, TBDWBH,'t_standbook_yc' TABLE_NAME, kzl1 PC_BH from t_standbook_yc
                UNION ALL select ID, TBDWBH,'t_standbook_wzsbck' TABLE_NAME, kzl1 PC_BH from t_standbook_wzsbck
           ) where PC_BH = (SELECT ID FROM T_FREQ_INFO WHERE STATUS ='2' ))
             stdb on stdb.TBDWBH = rsp.BS_DW_BH
 )
 select * from DW_SUM;

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------��������-------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
select '�ܹ�' officeName,'1150' officeId, 1 yhOrder,58 sumCount  from dual
union all select '���ܹ�' officeName,'1151' officeId, 2 yhOrder,56 sumCount  from dual
union all select '�������İ칫��' officeName,'1152' officeId, 3 yhOrder,54 sumCount  from dual
union all select '�ƻ���Ӫ��' officeName,'1153' officeId, 4 yhOrder,52 sumCount  from dual
union all select '������' officeName,'1154' officeId, 5 yhOrder,50 sumCount  from dual
union all select '�滮�о���' officeName,'1155' officeId, 6 yhOrder,48 sumCount  from dual
union all select '���̼�����' officeName,'1156' officeId, 7 yhOrder,46 sumCount  from dual
union all select '�ۺ���Ϣ��' officeName,'1157' officeId, 8 yhOrder,44 sumCount  from dual
union all select '�칫��' officeName,'1158' officeId, 9 yhOrder,42 sumCount  from dual
union all select '������' officeName,'1159' officeId, 10 yhOrder,40 sumCount  from dual
union all select '������' officeName,'1160' officeId, 11 yhOrder,38 sumCount  from dual
union all select '����' officeName,'1601' officeId, 12 yhOrder,36 sumCount  from dual
union all select '��������' officeName,'1685' officeId, 13 yhOrder,34 sumCount  from dual
union all select '�칫��' officeName,'1161' officeId, 14 yhOrder,32 sumCount  from dual
union all select '����' officeName,'1162' officeId, 15 yhOrder,30 sumCount  from dual
union all select '�ۺϲ�' officeName,'1600' officeId, 16 yhOrder,28 sumCount  from dual
union all select '�칫��' officeName,'1163' officeId, 17 yhOrder,26 sumCount  from dual
union all select '������' officeName,'1164' officeId, 18 yhOrder,24 sumCount  from dual
union all select '��Ӫ��' officeName,'1168' officeId, 19 yhOrder,22 sumCount  from dual
union all select '����' officeName,'1169' officeId, 20 yhOrder,20 sumCount  from dual
union all select '����' officeName,'1400' officeId, 21 yhOrder,18 sumCount  from dual
union all select '��������' officeName,'1420' officeId, 22 yhOrder,16 sumCount  from dual
union all select '����' officeName,'1725' officeId, 23 yhOrder,14 sumCount  from dual

-----------------------------------
select * from spr_webs_mgr for update ;

