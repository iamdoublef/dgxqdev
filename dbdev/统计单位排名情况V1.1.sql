------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------统计工程报送单位的排名情况-----------------------------------------------------------
--通过T_SEND_INFO报送痕迹表 和 T_ACCOUNT_INFO 台账预制表关联起来，如果当前机构接收成功，表示可以展示
WITH DW_WT_STR AS 
(  SELECT
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
				AND ACC.TB_DWBH = (SELECT OFFICE_ID FROM SYS_USER WHERE ID = '1') --TODO输入用户ID
			)
		)
)
--select * from CURR_DW
,
--单位对应的问题列表
DW_WT_LB AS(
		SELECT TB_DWBH, REGEXP_SUBSTR (TZ_BH, '[^,]+', 1, lvl) WT_BH
		FROM DW_WT_STR a, ( SELECT LEVEL lvl FROM dual CONNECT BY LEVEL < 1000 ) b
		WHERE b.lvl <= REGEXP_COUNT (a.TZ_BH, '\,') + 1
)
--select * from WT_LIST
,
--单位问题状态
DW_WT_ZT AS (
	SELECT TB_DWBH, COUNT(1) OVER(PARTITION BY TB_DWBH) SUMCOUNT, STATUS,COUNT(1) OVER(PARTITION BY TB_DWBH,STATUS) STATUSCOUNT  
	FROM  (SELECT TB_DWBH,WT_BH FROM DW_WT_LB GROUP BY TB_DWBH,WT_BH) DWL --去重复数据
	LEFT JOIN T_QUESTION_INFO TQI ON DWL.WT_BH = TQI.ID
)
--select * from DW_WT_ZT
--行转列统计,统计结果列表
SELECT TB_DWBH officeId,SUMCOUNT sumCount,FINISH finish,DOING doing,RANK() OVER(PARTITION BY TB_DWBH ORDER BY SUMCOUNT ASC) officeOrder
FROM (SELECT * FROM DW_WT_ZT PIVOT (COUNT(1) FOR STATUS IN ('2' FINISH,'1' DOING))) DWZ
;
-------------------------------------------------------------------------------------------------------------------------------------