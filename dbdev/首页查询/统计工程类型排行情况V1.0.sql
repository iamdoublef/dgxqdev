------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------统计工程类型的问题排名情况-----------------------------------------------------------
--通过T_SEND_INFO报送痕迹表 和 T_ACCOUNT_INFO 台账预制表关联起来，如果当前机构接收成功，表示可以展示
--通过对应单位的时候有两种情况：1、非底层单位，则取出所有接送成功的台账即可；2、最底层单位统计，取出所有预制成功的台账即可
WITH DW_WT_STR AS 
( SELECT
 ACC.ID, ACC.TB_DWBH, ACC.TZ_BH --问题用逗号分开从这里可以获得问题数量
FROM
  T_ACCOUNT_INFO ACC 
  LEFT JOIN T_SEND_INFO SED ON SED.TZ_BH = ACC.ID
  LEFT JOIN T_FREQ_INFO FREQ ON FREQ.ID = ACC.PC_BH 
  --LEFT JOIN SYS_USER USR ON USR.OFFICE_ID = SED.JS_DW_BH
  WHERE FREQ.STATUS = '2'
    AND ACC.GC_YH_LX = 'GC' --TODO 替换成传入的工程类型
    --AND USR.ID = '1'--TODO输入用户ID
    AND (
      --1、非底层单位，则取出所有接送成功的台账即可；
      (SED.STATUS = '4' --TODO替换接收成功的状态
        AND SED.JS_DW_BH = (SELECT OFFICE_ID FROM SYS_USER WHERE ID = '1')) --TODO输入用户ID
      OR
      --2、最底层单位统计，取出所有预制成功的台账即可
      (ACC.TB_DWBH NOT IN (SELECT P_COMPANY_ID FROM T_GROUP_UNDERLINE GROUP BY P_COMPANY_ID)
        AND ACC.TB_DWBH = (SELECT OFFICE_ID FROM SYS_USER WHERE ID = '1')
      )
    )
)
--select * from CURR_DW
,
--单位对应的问题列表，分号分隔符转列
DW_WT_LB AS(
    SELECT TB_DWBH, REGEXP_SUBSTR (TZ_BH, '[^,]+', 1, lvl) WT_BH
    FROM DW_WT_STR a, ( SELECT LEVEL lvl FROM dual CONNECT BY LEVEL < 1000 ) b
    WHERE b.lvl <= REGEXP_COUNT (a.TZ_BH, '\,') + 1
)
--select * from WT_LIST
,
--统计
DW_WT_ZT AS (
  SELECT TQI.ENGINE_TABLE_NAME, COUNT(1) OVER(PARTITION BY ENGINE_TABLE_NAME) SUMCOUNT, STATUS,COUNT(1) OVER(PARTITION BY ENGINE_TABLE_NAME, STATUS) STATUSCOUNT  
    FROM  (SELECT WT_BH FROM DW_WT_LB GROUP BY WT_BH) DWL --去重复数据
    LEFT JOIN T_QUESTION_INFO TQI ON DWL.WT_BH = TQI.ID
)
--select * from DW_WT_ZT
--行转列统计,统计结果列表
SELECT ENGINE_TABLE_NAME engineType,SUMCOUNT sumCount,FINISH finish,DOING doing,RANK() OVER(PARTITION BY ENGINE_TABLE_NAME ORDER BY SUMCOUNT ASC) engineOrder
FROM (SELECT * FROM DW_WT_ZT PIVOT (COUNT(1) FOR STATUS IN ('2' FINISH,'1' DOING))) DWZ

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------测试数据-------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
 select 'SK' engineType, '水库' engineTypeName,58 sumCount,20 finish,38 doing,1 engineOrder from dual
union all select 'DF' engineType, '堤防' engineTypeName,56 sumCount,30 finish,26 doing,2 engineOrder from dual
union all select 'SZ' engineType, '水闸（闸坝）' engineTypeName,54 sumCount,10 finish,44 doing,3 engineOrder from dual
union all select 'SDZ' engineType, '水电站' engineTypeName,52 sumCount,15 finish,37 doing,4 engineOrder from dual
union all select 'BZ' engineType, '泵站' engineTypeName,50 sumCount,44 finish,6 doing,5 engineOrder from dual
union all select 'SHANT' engineType, '山塘（1万方库容及以上）' engineTypeName,48 sumCount,33 finish,14 doing,6 engineOrder from dual
---------------------------------------------------------------------------------------------------------------------------


SELECT DISTINCT TABLE_NAME,TABLE_ENAME FROM T_ACCOUNT_DICT  WHERE  DEL_FLAG='0' AND TYPE_ENAME1 IN ('a1','a2','a3','a4','a5');
select * from t_question_type where p_id=2;
select * from SPR_WEBS_MGR for update;
















