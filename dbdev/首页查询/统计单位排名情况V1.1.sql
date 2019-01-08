------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------ͳ�ƹ��̱��͵�λ���������-----------------------------------------------------------
--ͨ��T_SEND_INFO���ͺۼ���T_ACCOUNT_INFO ̨��Ԥ�Ʊ���������������ǰ�������ճɹ�����ʾ����չ
WITH DW_WT_STR AS 
(  SELECT
 ACC.ID, ACC.TB_DWBH, ACC.TZ_BH --�����ö��ŷֿ���������Ի��������
 FROM T_ACCOUNT_INFO ACC 
  LEFT JOIN T_SEND_INFO SED ON SED.TZ_BH = ACC.ID
  LEFT JOIN T_FREQ_INFO FREQ ON FREQ.ID = ACC.PC_BH 
  --LEFT JOIN SYS_USER USR ON USR.OFFICE_ID = SED.JS_DW_BH
  WHERE FREQ.STATUS = '2'
    AND ACC.GC_YH_LX = 'GC' --TODO �滻�ɴ���Ĺ�������
    --AND USR.ID = '1'--TODO�����û�ID
    AND (
      --1���ǵײ㵥λ����ȡ�����н��ͳɹ���̨�˼���
      (SED.STATUS = '4' --TODO�滻���ճɹ���״
      AND SED.JS_DW_BH = (SELECT OFFICE_ID FROM SYS_USER WHERE ID = '1')) --TODO�����û�ID
      OR
      --2����ײ㵥λͳ�ƣ�ȡ������Ԥ�Ƴɹ���̨�˼���
      (ACC.TB_DWBH NOT IN (SELECT P_COMPANY_ID FROM T_GROUP_UNDERLINE GROUP BY P_COMPANY_ID)
        AND ACC.TB_DWBH = (SELECT OFFICE_ID FROM SYS_USER WHERE ID = '1') --TODO�����û�ID
      )
    )
)
--select * from DW_WT_STR
,
--��λ��Ӧ��������
DW_WT_LB AS(
    SELECT TB_DWBH, REGEXP_SUBSTR (TZ_BH, '[^,]+', 1, lvl) WT_BH
    FROM DW_WT_STR a, ( SELECT LEVEL lvl FROM dual CONNECT BY LEVEL < 1000 ) b
    WHERE b.lvl <= REGEXP_COUNT (a.TZ_BH, '\,') + 1
)
--select * from DW_WT_LB
,
--��λ����״
DW_WT_ZT AS (
  SELECT TB_DWBH, COUNT(1) OVER(PARTITION BY TB_DWBH) SUMCOUNT, STATUS,COUNT(1) OVER(PARTITION BY TB_DWBH,STATUS) STATUSCOUNT  
  FROM  (SELECT TB_DWBH,WT_BH FROM DW_WT_LB GROUP BY TB_DWBH,WT_BH) DWL --ȥ�ظ���
   LEFT JOIN T_QUESTION_INFO TQI ON DWL.WT_BH = TQI.ID
)
--select * from DW_WT_ZT
--��ת��ͳͳ�ƽ���б�
SELECT TB_DWBH officeId,SUMCOUNT sumCount,FINISH finish,DOING doing,RANK() OVER(PARTITION BY TB_DWBH ORDER BY SUMCOUNT ASC) officeOrder
FROM (SELECT * FROM DW_WT_ZT PIVOT (COUNT(1) FOR STATUS IN ('2' FINISH,'1' DOING))) DWZ
------------------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------
--��������
------------------------------------------------------------------------------------------------------------------------------------
SELECT '25' officeId,'����' officeName, 20 sumCount,20 finish,10 doing,1 officeOrder
FROM dual 
union all 
SELECT '20' officeId,'�ǹ�' officeName, 50 sumCount,40 finish,10 doing,2 officeOrder
FROM dual 
union all 
SELECT '22' officeId,'����' officeName, 50 sumCount,40 finish,10 doing,2 officeOrder
FROM dual 



