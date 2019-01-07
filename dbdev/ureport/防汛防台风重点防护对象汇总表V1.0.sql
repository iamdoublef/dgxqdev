-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------获取全部当前用户取到的所有问题------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM (
select QX_BH,QX_MC, XZ_BH, XZ_MC, YH_TYPE	 from (SELECT tb_dwbh,
               tb_dwmc,
               TB_SJ,
               gc_yh_lx,
               REGEXP_SUBSTR(TZ_BH, '[^,]+', 1, lvl) WT_BH
          FROM (
          --把id,id,id,id的字符串转换成id列
               select tb_dwbh, tb_dwmc, TB_SJ, tz_bh,gc_yh_lx
                  from t_account_info
                 where tb_dwbh = 'DGXQSLGCGLC7'  --本级以及下级机构
                   and extract(year from tb_sj) = '2018'
                   and gc_yh_lx in ('AJJQ','DZGY','ZRBHQ','SYHGQY','RQGCQY','LC','NC','BHYC','YPYZC' ,'YC' ,'SWCB' )) a,
               (SELECT LEVEL lvl FROM dual CONNECT BY LEVEL < 1000) b
         WHERE b.lvl <= REGEXP_COUNT(a.TZ_BH, '\,') + 1) tai
  LEFT JOIN (
       select ID, QX_BH , QX_MC,  XZ_BH, XZ_MC, KZL3 TB_DWBH, 't_standbook_ajjqu' TB_NAME, 'AJJQ' YH_TYPE FROM t_standbook_ajjqu
        UNION ALL select ID, QX_BH , QX_MC,  XZ_BH, XZ_MC, KZL3 TB_DWBH, 't_standbook_dzgy' TB_NAME, 'DZGY' YH_TYPE FROM t_standbook_dzgy
        UNION ALL select ID, QX_BH , QX_MC,  XZ_BH, XZ_MC, KZL3 TB_DWBH, 't_standbook_zrbhq' TB_NAME, 'ZRBHQ' YH_TYPE FROM t_standbook_zrbhq
        UNION ALL select ID, QX_BH , QX_MC,  XZ_BH, XZ_MC, KZL3 TB_DWBH, 't_standbook_syhgqy' TB_NAME, 'SYHGQY' YH_TYPE FROM t_standbook_syhgqy
        UNION ALL select ID, QX_BH , QX_MC,  XZ_BH, XZ_MC, KZL3 TB_DWBH, 't_standbook_rqgcqy' TB_NAME, 'RQGCQY' YH_TYPE FROM t_standbook_rqgcqy
        UNION ALL select ID, QX_BH , QX_MC,  XZ_BH, XZ_MC, KZL3 TB_DWBH, 't_standbook_zhyfqlc' TB_NAME, 'LC' YH_TYPE FROM t_standbook_zhyfqlc
        UNION ALL select ID, QX_BH , QX_MC,  XZ_BH, XZ_MC, KZL3 TB_DWBH, 't_standbook_yfqnc' TB_NAME, 'NC' YH_TYPE FROM t_standbook_yfqnc
        UNION ALL select ID, QX_BH , QX_MC,  XZ_BH, XZ_MC, KZL3 TB_DWBH, 't_standbook_bhyc' TB_NAME, 'BHYC' YH_TYPE FROM t_standbook_bhyc
        UNION ALL select ID, QX_BH , QX_MC,  XZ_BH, XZ_MC, KZL3 TB_DWBH, 't_standbook_ypyzc' TB_NAME, 'YPYZC' YH_TYPE FROM t_standbook_ypyzc
        UNION ALL select ID, QX_BH , QX_MC,  XZ_BH, XZ_MC, KZL3 TB_DWBH, 't_standbook_yc' TB_NAME, 'YC' YH_TYPE FROM t_standbook_yc
        UNION ALL select ID, QX_BH , QX_MC,  XZ_BH, XZ_MC, KZL3 TB_DWBH, 't_standbook_swcb' TB_NAME, 'SWCB' YH_TYPE FROM t_standbook_swcb
  ) yhl on tai.wt_bh = yhl.id and tai.gc_yh_lx = yhl.YH_TYPE
) PIVOT (COUNT(1) FOR YH_TYPE IN ('AJJQ' AJJQ,'DZGY' DZGY,'ZRBHQ' ZRBHQ,'SYHGQY' SYHGQY,'RQGCQY' RQGCQY,'LC' LC,'NC' NC,'BHYC' BHYC,'YPYZC' YPYZC,'YC' YC,'SWCB' SWCB));

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select * from user_tab_comments where comments like '%危%';
select * from user_col_comments where table_name like '%T_STANDBOOK_DANGEROUSHOUSE%';
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME IN ('T_STANDBOOK_AJJQU','T_STANDBOOK_DZGY','T_STANDBOOK_ZRBHQ',
'T_STANDBOOK_SYHGQY','T_STANDBOOK_RQGCQY','T_STANDBOOK_ZHYFQLC','T_STANDBOOK_YFQNC','T_STANDBOOK_BHYC');
select * from T_STANDBOOK_DANGEROUSHOUSE ;

SELECT DISTINCT TABLE_NAME,TABLE_ENAME    FROM   T_ACCOUNT_DICT  WHERE  DEL_FLAG='0'   
AND TYPE_ENAME1 IN ('a6','a7','a8','a9','a10','a11','a12','a13','a14','a15','a16','a17','a18','a19','a20','a21','a22','a23','a24','a25','a26','a27');
SELECT * FROM T_QUESTION_TYPE;

SELECT ID, QX_BH ,XZ_BH,KZL3 TB_DWBH, 'T_STANDBOOK_AJJQU' TB_NAME, 'AJJQ' YH_TYPE FROM T_STANDBOOK_AJJQU
UNION ALL SELECT ID, QX_BH ,XZ_BH,KZL3 TB_DWBH, 'T_STANDBOOK_DZGY' TB_NAME, 'DZGY' YH_TYPE FROM T_STANDBOOK_DZGY
UNION ALL SELECT ID, QX_BH ,XZ_BH,KZL3 TB_DWBH, 'T_STANDBOOK_ZRBHQ' TB_NAME, 'ZRBHQ' YH_TYPE FROM T_STANDBOOK_ZRBHQ
UNION ALL SELECT ID, QX_BH ,XZ_BH,KZL3 TB_DWBH, 'T_STANDBOOK_SYHGQY' TB_NAME, 'SYHGQY' YH_TYPE FROM T_STANDBOOK_SYHGQY
UNION ALL SELECT ID, QX_BH ,XZ_BH,KZL3 TB_DWBH, 'T_STANDBOOK_RQGCQY' TB_NAME, 'RQGCQY' YH_TYPE FROM T_STANDBOOK_RQGCQY
UNION ALL SELECT ID, QX_BH ,XZ_BH,KZL3 TB_DWBH, 'T_STANDBOOK_ZHYFQLC' TB_NAME, 'LC' YH_TYPE FROM T_STANDBOOK_ZHYFQLC
UNION ALL SELECT ID, QX_BH ,XZ_BH,KZL3 TB_DWBH, 'T_STANDBOOK_YFQNC' TB_NAME, 'NC' YH_TYPE FROM T_STANDBOOK_YFQNC
UNION ALL SELECT ID, QX_BH ,XZ_BH,KZL3 TB_DWBH, 'T_STANDBOOK_BHYC' TB_NAME, 'BHYC' YH_TYPE FROM T_STANDBOOK_BHYC

/*
--灾害易发区A级景区数量（个）	
--灾害易发区地质公园数量（个）	
--灾害易发区自然保护区数量（处）	
--灾害易发区石油、化工企业数量（个）	
--灾害易发区燃气罐储企业数量（个）	
--灾害易发区林场数量（个）	
--灾害易发区农场数量（个）	
--灾害易发区滨海浴场数量（处）
灾害易发区渔排养殖场数量（处）	渔船数量（艘）	“三无”船舶数量（艘）*/
/*AJJQ
DZGY
ZRBHQ
SYHGQY
RQGCQY
LC
NC
BHYC
YPYZC
YC
SWCB
*/
/*
t_standbook_ajjqu
t_standbook_dzgy
t_standbook_zrbhq
t_standbook_syhgqy
t_standbook_rqgcqy
t_standbook_zhyfqlc
t_standbook_yfqnc
t_standbook_bhyc
t_standbook_ypyzc
t_standbook_yc
t_standbook_swcb
*/
---测试数据

select 'AA' QX_BH, 'AA' QX_MC,'AAAA' XZ_BH,'AAAA' XZ_MC, 23 AJJQ,55 DZGY,98 ZRBHQ,68 SYHGQY,72 RQGCQY,66 LC,35 NC,13 BHYC,18 YPYZC,82 YC,96 SWCB FROM DUAL
UNION ALL select  'AA','AA','BBBB','BBBB',24,52,32,12,56,41,21,25,35,21,25 FROM DUAL
UNION ALL select  'AA','AA','CCCC','CCCC',24,52,32,12,56,41,21,25,35,21,25 FROM DUAL
UNION ALL select  'AA','AA','DDDD','DDDD',24,52,32,12,56,41,21,25,35,21,25 FROM DUAL

UNION ALL select  'BB','BB','df','dfds',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'BB','BB','dfs','dfd',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'BB','BB','df','dfdsa',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'BB','BB','adf','dfs',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'BB','BB','df','fds',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'BB','BB','dfdf','df',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL

UNION ALL select  'cc','cc','RRRRR','RRRRR',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'cc','cc','ffff','ffff',5,4,5,4,8,9,9,5,5,1,4 FROM DUAL
UNION ALL select  'cc','cc','RRRRR','dddd',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'cc','cc','dfddf','dddd',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'cc','cc','ddd','dd',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'cc','cc','dd','dd',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL

UNION ALL select  'cc','cc','hghfg','hhhh',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'BB','BB','RRRRR','hhhgg',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'BB','BB','RRRRR','hhhghf',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'BB','BB','RRRRR','ghgfg',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'BB','BB','RRRRR','hgfff',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL
UNION ALL select  'BB','BB','RRRRR','ghgf',2,3,5,3,4,4,3,3,3,3,3 FROM DUAL

UNION ALL 'AA','AA','BBBB','BBBB',24,52,32,12,56,41,21,25,35,21,25 FROM DUAL
UNION ALL 'AA','AA','BBBB','BBBB',24,52,32,12,56,41,21,25,35,21,25 FROM DUAL
UNION ALL 'AA','AA','BBBB','BBBB',24,52,32,12,56,41,21,25,35,21,25 FROM DUAL
UNION ALL 'AA','AA','BBBB','BBBB',24,52,32,12,56,41,21,25,35,21,25 FROM DUAL
UNION ALL 'AA','AA','BBBB','BBBB',24,52,32,12,56,41,21,25,35,21,25 FROM DUAL
UNION ALL 'AA','AA','BBBB','BBBB',24,52,32,12,56,41,21,25,35,21,25 FROM DUAL
UNION ALL 'AA','AA','BBBB','BBBB',24,52,32,12,56,41,21,25,35,21,25 FROM DUAL
UNION ALL 'AA','AA','BBBB','BBBB',24,52,32,12,56,41,21,25,35,21,25 FROM DUAL
UNION ALL 'AA','AA','BBBB','BBBB',24,52,32,12,56,41,21,25,35,21,25 FROM DUAL

