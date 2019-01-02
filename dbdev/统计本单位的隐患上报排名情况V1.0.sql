

---------------------------------------------------------------------------------------------------------------------------
------------------------统计本单位的隐患上报排名情况---------------------------------------------------------------------------
--通过T_ACCOUT_INFO 关联 T_SEND_INFO 获取当前批次已经接收成功的下级所有单位 ，通过自关联可以查询到当前所有的报送路径
--存在两种情况：1、无T_SEND_INFO,该情况是因为当前单位为叶子单位，未提交任何台账，但此时台账已经生成，所
--              2、有T_SEND_INFO，该情况为已经报送过，有报送的记录
--当前批次所有的报送信息
WITH PC_SEND_INFO AS(
  SELECT ACC.ID ACC_ID, SED.BS_DW_BH,SED.JS_DW_BH, ACC.TZ_TABLE_NAME FROM T_ACCOUNT_INFO ACC 
    LEFT JOIN T_SEND_INFO SED ON ACC.ID = SED.TZ_BH
    WHERE ACC.GC_YH_LX='YH'--TODO隐患类型标识
        AND ACC.PC_BH = (SELECT ID FROM T_FREQ_INFO WHERE STATUS ='2' )
         AND SED.STATUS = 'JS' --所有接收成功的信息
)
--select * from PC_SEND_INFO 
,
--批次报送路径,获取当前用户所有已经接收的下级单位，以及该级别单位的所有报送上来的路径节点
ROOT_SEND_PATH as(
    select   BS_DW_BH, JS_DW_BH, connect_by_root(JS_DW_BH) ROOT_BH
      from PC_SEND_INFO psed 
      connect by prior psed.BS_DW_BH = psed.JS_DW_BH 
      start with psed.JS_DW_BH IN (SELECT BS_DW_BH FROM PC_SEND_INFO where JS_DW_BH = ( SELECT OFFICE_ID FROM SYS_USER WHERE ID = '1')) --TODO 替换为传入的用户ID参数
    union all
    --一级机构如果没有上报则单独处理，一级单位是T_SEND_INFO无 JS_DW_BH 数据以及 在ACCOUNT_INFO 中有数据单位
    SELECT OFFICE_ID BS_DW_BH , null JS_DW_BH, OFFICE_ID ROOT_BH  
           FROM SYS_USER t
           where t.id = '1'
           and t.office_id not in (SELECT DISTINCT JS_DW_BH FROM T_SEND_INFO WHERE STATUS ='JS' AND FREQ_ID = (SELECT ID FROM T_FREQ_INFO WHERE STATUS ='2' ))
           and t.office_id in (SELECT DISTINCT TB_DWBH FROM t_Account_Info WHERE PC_BH = (SELECT ID FROM T_FREQ_INFO WHERE STATUS ='2' ))
            -- TODO 替换为传入的用户ID参数
    ) 
--select * from ROOT_SEND_PATH ;   
--统计信息，根据机构路径，找出对应隐患台账表中所有的隐患类型
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
---------------------------------------------------------------------------------------------------------------------------

