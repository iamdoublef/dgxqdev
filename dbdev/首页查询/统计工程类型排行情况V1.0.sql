------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------ͳ�ƹ������͵������������-----------------------------------------------------------
--ͨ��T_SEND_INFO���ͺۼ��� �� T_ACCOUNT_INFO ̨��Ԥ�Ʊ���������������ǰ�������ճɹ�����ʾ����չʾ
--ͨ����Ӧ��λ��ʱ�������������1���ǵײ㵥λ����ȡ�����н��ͳɹ���̨�˼��ɣ�2����ײ㵥λͳ�ƣ�ȡ������Ԥ�Ƴɹ���̨�˼���
WITH DW_WT_STR AS 
( SELECT
 ACC.ID, ACC.TB_DWBH, ACC.TZ_BH --�����ö��ŷֿ���������Ի����������
FROM
  T_ACCOUNT_INFO ACC 
  LEFT JOIN T_SEND_INFO SED ON SED.TZ_BH = ACC.ID
  LEFT JOIN T_FREQ_INFO FREQ ON FREQ.ID = ACC.PC_BH 
  --LEFT JOIN SYS_USER USR ON USR.OFFICE_ID = SED.JS_DW_BH
  WHERE FREQ.STATUS = '2'
    AND ACC.GC_YH_LX = 'GC' --TODO �滻�ɴ���Ĺ�������
    --AND USR.ID = '1'--TODO�����û�ID
    AND (
      --1���ǵײ㵥λ����ȡ�����н��ͳɹ���̨�˼��ɣ�
      (SED.STATUS = '4' --TODO�滻���ճɹ���״̬
        AND SED.JS_DW_BH = (SELECT OFFICE_ID FROM SYS_USER WHERE ID = '1')) --TODO�����û�ID
      OR
      --2����ײ㵥λͳ�ƣ�ȡ������Ԥ�Ƴɹ���̨�˼���
      (ACC.TB_DWBH NOT IN (SELECT P_COMPANY_ID FROM T_GROUP_UNDERLINE GROUP BY P_COMPANY_ID)
        AND ACC.TB_DWBH = (SELECT OFFICE_ID FROM SYS_USER WHERE ID = '1')
      )
    )
)
--select * from CURR_DW
,
--��λ��Ӧ�������б��ֺŷָ���ת��
DW_WT_LB AS(
    SELECT TB_DWBH, REGEXP_SUBSTR (TZ_BH, '[^,]+', 1, lvl) WT_BH
    FROM DW_WT_STR a, ( SELECT LEVEL lvl FROM dual CONNECT BY LEVEL < 1000 ) b
    WHERE b.lvl <= REGEXP_COUNT (a.TZ_BH, '\,') + 1
)
--select * from WT_LIST
,
--ͳ��
DW_WT_ZT AS (
  SELECT TQI.ENGINE_TABLE_NAME, COUNT(1) OVER(PARTITION BY ENGINE_TABLE_NAME) SUMCOUNT, STATUS,COUNT(1) OVER(PARTITION BY ENGINE_TABLE_NAME, STATUS) STATUSCOUNT  
    FROM  (SELECT WT_BH FROM DW_WT_LB GROUP BY WT_BH) DWL --ȥ�ظ�����
    LEFT JOIN T_QUESTION_INFO TQI ON DWL.WT_BH = TQI.ID
)
--select * from DW_WT_ZT
--��ת��ͳ��,ͳ�ƽ���б�
SELECT ENGINE_TABLE_NAME engineType,SUMCOUNT sumCount,FINISH finish,DOING doing,RANK() OVER(PARTITION BY ENGINE_TABLE_NAME ORDER BY SUMCOUNT ASC) engineOrder
FROM (SELECT * FROM DW_WT_ZT PIVOT (COUNT(1) FOR STATUS IN ('2' FINISH,'1' DOING))) DWZ

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------��������-------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
 select 'SK' engineType, 'ˮ��' engineTypeName,58sunCount,20 finish,38 doing,1 engineOrder from dual
union all select 'DF' engineType, '�̷�' engineTypeName,56sunCount,30 finish,26 doing,2 engineOrder from dual
union all select 'SZ' engineType, 'ˮբ��բ�ӣ�' engineTypeName,54sunCount,10 finish,44 doing,3 engineOrder from dual
union all select 'SDZ' engineType, 'ˮ��վ' engineTypeName,52sunCount,15 finish,37 doing,4 engineOrder from dual
union all select 'BZ' engineType, '��վ' engineTypeName,50sunCount,44 finish,6 doing,5 engineOrder from dual
union all select 'SHANT' engineType, 'ɽ����1�򷽿��ݼ����ϣ�' engineTypeName,48sunCount,33.7 finish,14.3 doing,6 engineOrder from dual
---------------------------------------------------------------------------------------------------------------------------


SELECT DISTINCT TABLE_NAME,TABLE_ENAME FROM T_ACCOUNT_DICT  WHERE  DEL_FLAG='0' AND TYPE_ENAME1 IN ('a1','a2','a3','a4','a5');
select * from t_question_type where p_id=2;
















