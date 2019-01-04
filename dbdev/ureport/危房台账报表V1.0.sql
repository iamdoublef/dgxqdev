select * from user_tab_comments where comments like '%危%';
select * from user_col_comments where table_name like '%T_STANDBOOK_DANGEROUSHOUSE%';
select * from T_STANDBOOK_DANGEROUSHOUSE ;

--东经（度分秒）	北纬（度分秒）所在市	所在县（市、区）	所在乡镇（街道）	安全受威胁人数	隐患整治责任主体	责任人及电话	整治措施	整治目标及期限	目前进展情况	人员转移方案制定情况	抢险救援队伍（人）	抢险救援物资类型及数量
--单位对应的问题列表
       											
select ROWNUM rn,
       DJ_DFM,
       BW_DFM,
       CS_MC,
       QX_MC,
       XZ_MC,
       AQSWXRS,
       ZRZT,
       ZRR_XM,
       ZZCS,
       ZZMBQX,
       MQJZQK,
       FAZDQK,
       JYDW_RS,
       QXJZWZ_LX,
       tb_dwbh,
       tb_dwmc,
       TB_SJ
  from (SELECT tb_dwbh,
               tb_dwmc,
               TB_SJ,
               REGEXP_SUBSTR(TZ_BH, '[^,]+', 1, lvl) WT_BH
          FROM (
          --把id,id,id,id的字符串转换成id列
               select tb_dwbh, tb_dwmc, TB_SJ, tz_bh
                  from t_account_info
                 where tb_dwbh = 'DGXQSLGCGLC7'
                   and extract(year from tb_sj) = '2018'
                   and gc_yh_lx = 'WF') a,
               (SELECT LEVEL lvl FROM dual CONNECT BY LEVEL < 1000) b
         WHERE b.lvl <= REGEXP_COUNT(a.TZ_BH, '\,') + 1) tai
  LEFT JOIN t_standbook_dangeroushouse tsd on tai.wt_bh = tsd.id;
