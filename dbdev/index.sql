select * from T_TASK_INFO;
select * from T_QUESTION_INFO;
select * from T_QUESTION_TYPE;
select * from t_account_info;

SELECT * FROM SYS_OFFICE;

select * from t_company_info comp left join 

 select table_name,table_type,comments from user_tab_comments;

--����
SELECT DISTINCT TABLE_NAME,TABLE_ENAME FROM T_ACCOUNT_DICT  WHERE  DEL_FLAG='0' AND TYPE_ENAME1 IN ('a1','a2','a3','a4','a5');


with
    <!--����״ͼ��ò������ֵܽ�������-->
    ORG_TREE_ORDER as
   (select ORG.C_ORGNO ORGNO,
                   ORG.C_PARENTORGNO PARENTORGNO,
                   LPAD(' ', (level - 1) * 4) || ORG.C_ORGNAME as ORGNAME,
                   ROWNUM ORDERNO,
                   level LVL
              from BASE_ORG ORG
             start with ORG.C_ORGNO = '${model.bnkNum}'
            connect by prior ORG.C_ORGNO = ORG.C_PARENTORGNO
             order siblings by ORG.C_ORGNO),
             
             
<!--������ѡ�Ļ����Լ��û����µ��ӻ�����ɸ��ԵĻ�����������������-->
     ROOT_ORG_TREE as(
    select 
      c_orgno ,      <!--������-->
      c_parentorgno parentorgno,   <!--��������-->
      connect_by_root(c_orgno) rootNo   <!--�ҵ�ÿ�������ĸ����������ظ������ţ���������Ļ���-->
    from BASE_ORG org
    <!--����һʡ�ԣ�˵��ȡ��������������ֻȡ��Ҫ�������������ݣ�����ÿ�������µ������ӻ�����-->
    connect by prior org.c_orgno=org.c_parentorgno 
    start with ORG.C_ORGNO in (select ORGNO from ORG_TREE_ORDER)),   <!--���������̶�ģʽ��ǰһ�������Ǳ������ĸ�������-->



	WITH ALL_ACCT(ACCT_NM,ACCT_CD,PARNT_ACCT_CD,ACCT_TYP,STRT_TM,END_TM,ACCT_ORDR) as (
			  select A.ACCT_NM,A.ACCT_CD,A.PARNT_ACCT_CD,A.ACCT_TYP,A.STRT_TM,A.END_TM,DSPLY_ORDR from ALM_ACCT A 
				    where A.ACCT_BK_CD = 'AB24'
				),
				<!--  select * from ALL_ACCT --> 
				
				<!--   �����˻����� --> 
				ALL_TREE_ACCT(ACCT_NM,ACCT_CD,PARNT_ACCT_CD,ACCT_TYP,CD_STR,SPACE_STR,ACCT_ORDR) as (
				  select ACCT_NM,ACCT_CD,PARNT_ACCT_CD,ACCT_TYP,
				      cast(','||ACCT_CD||',' as varchar(500)) as "CD_STR",
				      cast(' '||' '||' '||' '||' '||' '||' '||' ' as varchar(120)) as "SPACE_STR",
				      cast( ACCT_ORDR as varchar(250)) as "ACCT_ORDR"  
				    from ALL_ACCT 
				    where PARNT_ACCT_CD = '0'
				  union all 
				  select B.SPACE_STR||A.ACCT_NM as "ACCT_NM",A.ACCT_CD,A.PARNT_ACCT_CD,A.ACCT_TYP,
				      B.CD_STR||A.ACCT_CD||',' as "CD_STR",
				      B.SPACE_STR||'        ' as "SPACE_STR",
				      cast(B.ACCT_ORDR||A.ACCT_ORDR as varchar(250)) as "ACCT_ORDR"  
				    from ALL_ACCT A, ALL_TREE_ACCT B 
				    where A.PARNT_ACCT_CD = B.ACCT_CD
				),
				<!--  select * from ALL_TREE_ACCT order by ACCT_ORDR --> 
        
        
--��ȡ��λ����״�ṹ,��ÿ�����ڵ��·�������
WITH OFFICE_TREE(ID, NAME,ID_STR, P_NAME ) AS(
     select C1.ID AS ID, C1.NAME AS NAME ,cast(',' || ID || ',' as varchar(500)) as ID_STR , ','|| NAME ||',' AS P_NAME FROM SYS_OFFICE C1 WHERE C1.ID = '1'
     UNION ALL
     SELECT  A.ID AS ID,A.NAME AS NAME,A.ID || B.ID_STR || ',' AS ID_STR, A.NAME || B.P_NAME || ','  AS P_NAME FROM SYS_OFFICE A, OFFICE_TREE B ,T_GROUP_UNDERLINE C WHERE C.P_COMPANY_ID = B.ID AND C.COMPANY_ID = A.ID
)
SELECT * FROM OFFICE_TREE;

--��ȡ��λ����״�ṹ,��ÿ�����ڵ��·�������
WITH OFFICE_TREE(ROOT_ID,CURR_NODE_ID, NAME,ID_STR, NAME_STR  ) AS(
     select P_COMPANY_ID  AS ROOT_ID, COMPANY_ID AS CURR_NODE_ID, P_COMPANY_NAME AS NAME ,P_COMPANY_ID||','||COMPANY_ID||','  as ID_STR , P_COMPANY_NAME || ','|| COMPANY_NAME  AS NAME_STR FROM T_GROUP_UNDERLINE -- WHERE P_COMPANY_ID = 'DGXQ36'
     UNION ALL
     SELECT A.ROOT_ID AS ROOT_ID, B.COMPANY_ID AS CURR_NODE_ID, A.NAME AS NAME, A.ID_STR || B.COMPANY_ID || ',' AS ID_STR, A.NAME_STR || B.COMPANY_NAME || ','  AS NAME_STR FROM OFFICE_TREE A, T_GROUP_UNDERLINE B WHERE A.CURR_NODE_ID = B.P_COMPANY_ID
)
SELECT * FROM OFFICE_TREE;


---------------------------------------------
------------------��ȡ�߼�-------------------
---------------------------------------------


-------ͳ�ƹ��̱��͵�λ���������---------------
--ͨ��T_SEND_INFO���ȡ��ǰ��λ���ճɹ���̨����Ϣ
--��ͨ��T_ACCOUNT_INFǪ�˼�¼���ȡ�������¼����͵�����������¼���λ��Ϣ����Ӧ��̨�ˣ�
--ͨ��̨�˱�ɻ�ù���λ��Ϣ��
--��ȡ������λ����ͨ�������T_QUESTION_INFO �е���д�����ڵĵ�λ��Ҳ���Ǹù������ڵĹ���λ��������յ������б�
--��ͳ�Ʋ��漰��һ����ͳ�ƣ����������T_SEND_INFO�����ݵ��������
------------------------------------------------
select * from t_account_info;
select * from t_send_info;
select * from sys_office ;
select * from sys_user;
SELECT DONE.*,RANK() OVER(PARTITION BY DONE.BS_DW_BH ORDER BY DONE.SUMCOUNT DESC) QUES_ORDER FROM 
( SELECT * FROM 
  (
  SELECT BS_DW_BH,COUNT(1) OVER(PARTITION BY BS_DW_BH) SUMCOUNT, STATUS,COUNT(1) OVER(PARTITION BY BS_DW_BH,STATUS) STATUSCOUNT 
  FROM ( SELECT SED.BS_DW_BH, US.OFFICE_ID GCGLDW_BH , QUES.ID QUES_ID, QUES.STATUS, QUES.FREQ_ID  ,QUES.ENGINE_TABLE_NAME,QUES.ENGINE_ID
        FROM T_SEND_INFO SED 
        LEFT JOIN T_ACCOUNT_INFO ACC ON SED.TZ_BH = ACC.ID AND ACC.GC_YH_LX = 'GC' --TODO�ĳɹ�����������
        LEFT JOIN 
            ( 
            SELECT ID,BZ.SK_BH ENGINE_ID ,'T_BASE_BZ' ENGINE_TABLE_NAME,'T_STANDBOOK_BZHAN' TZ_TABLE_NAME ,GCGLDW_BH  FROM T_STANDBOOK_BZHAN BZ 
            UNION ALL 
            SELECT ID,SK.SK_BH ENGINE_ID ,'T_BASE_SK' ENGINE_TABLE_NAME,'T_STANDBOOK_RESERVOIR' TZ_TABLE_NAME,GCGLDW_BH  FROM  T_STANDBOOK_RESERVOIR SK
            UNION ALL 
            SELECT ID,DF.DF_BH ENGINE_ID ,'T_BASE_DF' ENGINE_TABLE_NAME,'T_STANDBOOK_DFANG' TZ_TABLE_NAME,GCGLDW_BH  FROM T_STANDBOOK_DFANG DF
            UNION ALL 
            SELECT ID,SZ.SZHA_BH ENGINE_ID ,'T_SD' ENGINE_TABLE_NAME,'T_STANDBOOK_SZHA' TZ_TABLE_NAME ,GCGLDW_BH FROM T_STANDBOOK_SZHA SZ
            UNION ALL 
            SELECT ID,SDZ.SK_BH ENGINE_ID ,'T_SDZ_INFO' ENGINE_TABLE_NAME,'T_STANDBOOK_SDZHAN' TZ_TABLE_NAME,GCGLDW_BH  FROM T_STANDBOOK_SDZHAN SDZ
            ) TZXX ON  TZXX.ID=ACC.TZ_BH AND ACC.TZ_TABLE_NAME = TZXX.TZ_TABLE_NAME  -- ��ȡ���еĹ���̨����Ϣ 
        LEFT JOIN T_QUESTION_INFO QUES ON QUES.FREQ_ID = ACC.PC_BH  
        LEFT JOIN SYS_USER US ON US.ID = QUES.CHIEF_ID AND TZXX.GCGLDW_BH = US.OFFICE_ID
        WHERE SED.JS_DW_BH = (SELECT US1.OFFICE_ID FROM SYS_USER US1 WHERE  US1.ID = '1')  --�������ӵ�������̨����Ϣ
          AND SED.STATUS ='1' --TODO �ĳ�̨���Ѿ����ճɹ�
          AND ACC.PC_BH = (select id from t_freq_info where STATUS ='2' ) --��ǰ������Ϣ,2���ڽ�����
          AND US.ID IS NOT NULL --������Ϊ�յ���Ϣ��˵��û�й��������⣬����ȥ��
          
        )
  )
   PIVOT (COUNT(1) FOR STATUS IN ('1' FINISH,'0' DOING)) --��ת��
) DONE 
;
---------------------------------------------------------------------------------------------------------------------------
------------------------ͳ�Ʊ���λ�Ĺ����������---------------------------------------------------------------------------
--ͨ��T_SEND_INFO���ȡ��ǰ��λ���ճɹ���̨����Ϣ
--��ͨ��T_ACCOUNT_INFǪ�˼�¼���ȡ�������¼����͵�����������¼���λ��Ϣ����Ӧ��̨�ˣ�
--ͨ��̨�˱�ɻ�ù���λ��Ϣ
--��ȡ������λ����ͨ�������T_QUESTION_INFO �е���д�����ڵĵ�λ��Ҳ���Ǹù������ڵĹ���λ��������յ������б�
--��ͳ����Ƶ���һ������ʱ��ʹ������̨����Ϣ���Լ�T_ACCOUNT_INFO��Ϣ��Ҳû��T_SEND_INFO��Ϣ����ʱ��Ҫ����ͨ��T_ACCOUNT_INFO ���ж�
--ͨ��T_ACCOUNT_INFO���ȡ��ǰ�Ѿ���������λ��̨�ˣ�������̨�˲�δ�ύ���κ���Ϣ
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
SELECT DONE.*,RANK() OVER(PARTITION BY DONE.ENGINE_TABLE_NAME ORDER BY DONE.SUMCOUNT DESC) QUES_ORDER FROM 
( SELECT * FROM 
  (
  SELECT ENGINE_TABLE_NAME , COUNT(1) OVER(PARTITION BY ENGINE_TABLE_NAME) SUMCOUNT, STATUS,COUNT(1) OVER(PARTITION BY ENGINE_TABLE_NAME,STATUS) STATUSCOUNT 
  FROM ( 
        SELECT ACC.TB_DWBH, US.OFFICE_ID GCGLDW_BH , QUES.ID QUES_ID, QUES.STATUS, QUES.FREQ_ID  , QUES.ENGINE_TABLE_NAME, QUES.ENGINE_ID
        FROM T_ACCOUNT_INFO ACC 
        LEFT JOIN T_SEND_INFO SED ON SED.TZ_BH = ACC.ID
        LEFT JOIN( 
            SELECT ID,BZ.SK_BH ENGINE_ID ,'T_BASE_BZ' ENGINE_TABLE_NAME,'T_STANDBOOK_BZHAN' TZ_TABLE_NAME ,GCGLDW_BH  FROM T_STANDBOOK_BZHAN BZ 
            UNION ALL 
            SELECT ID,SK.SK_BH ENGINE_ID ,'T_BASE_SK' ENGINE_TABLE_NAME,'T_STANDBOOK_RESERVOIR' TZ_TABLE_NAME,GCGLDW_BH  FROM  T_STANDBOOK_RESERVOIR SK
            UNION ALL 
            SELECT ID,DF.DF_BH ENGINE_ID ,'T_BASE_DF' ENGINE_TABLE_NAME,'T_STANDBOOK_DFANG' TZ_TABLE_NAME,GCGLDW_BH  FROM T_STANDBOOK_DFANG DF
            UNION ALL 
            SELECT ID,SZ.SZHA_BH ENGINE_ID ,'T_SD' ENGINE_TABLE_NAME,'T_STANDBOOK_SZHA' TZ_TABLE_NAME ,GCGLDW_BH FROM T_STANDBOOK_SZHA SZ
            UNION ALL 
            SELECT ID,SDZ.SK_BH ENGINE_ID ,'T_SDZ_INFO' ENGINE_TABLE_NAME,'T_STANDBOOK_SDZHAN' TZ_TABLE_NAME,GCGLDW_BH  FROM T_STANDBOOK_SDZHAN SDZ
        ) TZXX ON  TZXX.ID=ACC.TZ_BH AND ACC.TZ_TABLE_NAME = TZXX.TZ_TABLE_NAME  -- ��ȡ���еĹ���̨����Ϣ 
        LEFT JOIN T_QUESTION_INFO QUES ON QUES.FREQ_ID = ACC.PC_BH 
        LEFT JOIN SYS_USER US ON US.ID = QUES.CHIEF_ID AND TZXX.GCGLDW_BH = US.OFFICE_ID
        WHERE
             (CASE
              --������ǵ�һ������T_SEND_INFO�����ݣ�ͨ��T_SEND_INFO��ȡ���ܳɹ�����Ϣ
               WHEN SED.ID IS NOT NULL AND SED.JS_DW_BH = (SELECT US1.OFFICE_ID FROM SYS_USER US1 WHERE  US1.ID = '1')  --TODO userid�ĳ����룬�������ӵ�������̨����Ϣ
                   AND SED.STATUS ='1' --̨�˽��ճɹ�
              THEN 1
              --����ǵ�һ������T_SEND_INFO�����ݣ�ͨ��T_ACCOUNT_INFO���ȡ��ǰ�Ѿ���������λ��̨�ˣ�δ�ύ��
              WHEN SED.ID IS NULL AND acc.TB_DWBH = ( SELECT US1.OFFICE_ID FROM SYS_USER US1 WHERE  US1.ID = '1')--TODO userid�ĳ����룬
              THEN 1
              ELSE 0 
              END
            ) = 1
            AND ACC.PC_BH = (select id from t_freq_info where STATUS ='2' ) --��ǰ������Ϣ,2���ڽ�����
            AND US.ID IS NOT NULL --������Ϊ�յ���Ϣ��˵��û�й��������⣬����ȥ��
        )
  )
   PIVOT (COUNT(1) FOR STATUS IN ('1' FINISH,'0' DOING)) --��ת��
) DONE 
;




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
---------------------------------------------------------------------------------------------------------------------------



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
select * from (SELECT stdb.TABLE_NAME ,STATUS, COUNT(1) OVER(PARTITION BY TABLE_NAME) SUMCOUNT ,COUNT(1) OVER(PARTITION BY TABLE_NAME,STATUS) STATUSCOUNT
       FROM (SELECT DISTINCT BS_DW_BH FROM ROOT_SEND_PATH) rsp
           LEFT JOIN 
           (select * from (
                select ID, TBDWBH,'t_standbook_constructionsite' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_constructionsite
                UNION ALL select ID, TBDWBH,'t_standbook_rqgcqy' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_rqgcqy
                UNION ALL select ID, TBDWBH,'t_standbook_mudbrickhouse' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_mudbrickhouse
                UNION ALL select ID, TBDWBH,'t_standbook_ypyzc' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_ypyzc
                UNION ALL select ID, TBDWBH,'t_standbook_waterlogging' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_waterlogging
                UNION ALL select ID, TBDWBH,'t_standbook_dangeroushouse' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_dangeroushouse
                UNION ALL select ID, TBDWBH,'t_standbook_bhyc' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_bhyc
                UNION ALL select ID, TBDWBH,'t_standbook_swcb' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_swcb
                UNION ALL select ID, TBDWBH,'t_standbook_nissenhut' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_nissenhut
                UNION ALL select ID, TBDWBH,'t_standbook_xpjf' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_xpjf
                UNION ALL select ID, TBDWBH,'t_standbook_yfqnc' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_yfqnc
                UNION ALL select ID, TBDWBH,'t_standbook_yugg' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_yugg
                UNION ALL select ID, TBDWBH,'t_standbook_bottomland' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_bottomland
                UNION ALL select ID, TBDWBH,'t_standbook_syhgqy' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_syhgqy
                UNION ALL select ID, TBDWBH,'t_standbook_zhyfqlc' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_zhyfqlc
                UNION ALL select ID, TBDWBH,'t_standbook_mountainflood' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_mountainflood
                UNION ALL select ID, TBDWBH,'t_standbook_dzgy' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_dzgy
                UNION ALL select ID, TBDWBH,'t_standbook_zrbhq' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_zrbhq
                UNION ALL select ID, TBDWBH,'t_standbook_ajjqu' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_ajjqu
                UNION ALL select ID, TBDWBH,'t_standbook_yc' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_yc
                UNION ALL select ID, TBDWBH,'t_standbook_wzsbck' TABLE_NAME, kzl1 PC_BH, kzl2 STATUS from t_standbook_wzsbck
           ) where PC_BH = (SELECT ID FROM T_FREQ_INFO WHERE STATUS ='2'))
             stdb on stdb.TBDWBH = rsp.BS_DW_BH

 )PIVOT (SUM(STATUSCOUNT) FOR STATUS IN ('1' FINISH,'0' DOING))
  ) 
 select * from DW_SUM;

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------



select * from t_hzong_fxftf; --��Ѵ��̨���ص����������ܱ�
select * from T_HZONG_XGXDFY; --�չ��նη����������
select * from T_HZONG_YGBHCK; --��Ѵ��̨����ۡ��ܻ��㡢�������ʲֿ���ܱ�

-------ͳ���������͵�λ���������---------------
select * from t_account_info;
select * from t_send_info;
select * from sys_office ;
select * from sys_user;
--ͨ���û���ȡ��ǰ�û���¼�ĵ�λ
--ͨ����������ȡ��Ӧ�ĵ�ǰ̨�˱�
--ͨ��̨�˱���Ի�ȡ��Ӧ������
SELECT DONE.*,RANK() OVER(PARTITION BY DONE.BS_DW_BH ORDER BY DONE.SUMCOUNT DESC) QUES_ORDER FROM 
( SELECT * FROM 
  (
  SELECT BS_DW_BH,COUNT(1) OVER(PARTITION BY BS_DW_BH) SUMCOUNT, STATUS,COUNT(1) OVER(PARTITION BY BS_DW_BH,STATUS) STATUSCOUNT 
  FROM ( SELECT SED.BS_DW_BH, US.OFFICE_ID GCGLDW_BH , QUES.ID QUES_ID, QUES.STATUS, QUES.FREQ_ID  ,QUES.ENGINE_TABLE_NAME,QUES.ENGINE_ID
        FROM T_SEND_INFO SED 
        LEFT JOIN T_ACCOUNT_INFO ACC ON SED.TZ_BH = ACC.ID
        LEFT JOIN  ( SELECT ID,BZ.SK_BH ENGINE_ID ,'t_standbook_constructionsite' TZ_TABLE_NAME ,TBDWBH  FROM t_standbook_constructionsite cst
        ) TZXX ON  TZXX.ID=ACC.TZ_BH AND ACC.TZ_TABLE_NAME = TZXX.TZ_TABLE_NAME  -- ��ȡ���еĹ���̨����Ϣ 
        LEFT JOIN T_QUESTION_INFO QUES ON QUES.FREQ_ID = ACC.PC_BH  
        LEFT JOIN SYS_USER US ON US.ID = QUES.CHIEF_ID AND TZXX.ZRDW = US.OFFICE_ID
        WHERE SED.JS_DW_BH = (SELECT US1.OFFICE_ID FROM SYS_USER US1 WHERE  US1.ID = '1')  --�������ӵ�������̨����Ϣ
          AND SED.STATUS ='1' --̨���Ѿ����ճɹ�
          AND ACC.PC_BH = (select id from t_freq_info where STATUS ='2' ) --��ǰ������Ϣ,2���ڽ�����
          AND US.ID IS NOT NULL --������Ϊ�յ���Ϣ��˵��û�й��������⣬����ȥ��
        )
  )
   PIVOT (COUNT(1) FOR STATUS IN ('1' FINISH,'0' DOING)) --��ת��
) DONE 
;


    
/*create table ZYH_TEST_TREE
(
  ACC_ID          VARCHAR2(64),
  BS_DW_BH    VARCHAR2(200),
  JS_DW_BH    VARCHAR2(200)
);


    select 
      ACC_ID ,
      BS_DW_BH t_dw,
      JS_DW_BH p_dw,
      connect_by_root(ACC_ID) root_ID  
    from ZYH_TEST_TREE psed 
    connect by prior psed.BS_DW_BH = psed.JS_DW_BH
    start with psed.JS_DW_BH IN (SELECT BS_DW_BH FROM ZYH_TEST_TREE WHERE  JS_DW_BH = 'D1');
    
*/
--ͨ�����͵�λ�õ��·��



---------------------------------------------------------------------------------
select * from (
       select 'a' bs_dw_bh, 4 sumcount, '1' status1 from dual 
       union all 
       select 'a' bs_dw_bh, 2 sumcount, '1' status1 from dual 
       union all 
       select 'a' bs_dw_bh, 2 sumcount, '1' status1 from dual 
       union all 
       select 'b' bs_dw_bh, 3 sumcount, '1' status1 from dual
       union all 
       select 'a' bs_dw_bh, 2 sumcount, '1' status1 from dual 
       union all 
       select 'b' bs_dw_bh, 3 sumcount, '0' status1 from dual
) pivot (count(1) for status1 in ('1' success,'0' fail))


--ͨ������λ��Ӧ�ı��ͱ�t_send_info����ȡ����ǰ�ڱ���λ�����Ѿ����ͳɹ�������


--��ѯ�������湤�̶�Ӧ���������
select count(1) cot, company_id, TZ_TABLE_NAME, CL_ZT from
(
select ques.id, us.company_id , tzxx.TZ_TABLE_NAME, nvl(acc.CL_ZT,'0')   from T_QUESTION_INFO ques  --���Ϊ����Ϊ����̨�ˣ����䴦��״̬Ĭ��Ϊδ����
LEFT JOIN SYS_USER us on us.id = ques.chief_id
LEFT JOIN 
( 
select ID,bz.sk_bh ENGINE_id ,'t_base_bz' ENGINE_TABLE_NAME,'t_standbook_bzhan' TZ_TABLE_NAME ,GCGLDW_BH  from t_standbook_bzhan bz 
union all 
select ID,sk.sk_bh ENGINE_id ,'t_base_sk' ENGINE_TABLE_NAME,'t_standbook_reservoir' TZ_TABLE_NAME,GCGLDW_BH  from  t_standbook_reservoir sk
union all 
select ID,df.df_bh ENGINE_id ,'t_base_df' ENGINE_TABLE_NAME,'t_standbook_dfang' TZ_TABLE_NAME,GCGLDW_BH  from t_standbook_dfang df
union all 
select ID,sz.szha_bh ENGINE_id ,'t_sd' ENGINE_TABLE_NAME,'t_standbook_szha' TZ_TABLE_NAME ,GCGLDW_BH from t_standbook_szha sz
union all 
select ID,sdz.sk_bh ENGINE_id ,'t_sdz_info' ENGINE_TABLE_NAME,'t_standbook_sdzhan' TZ_TABLE_NAME,GCGLDW_BH  from t_standbook_sdzhan sdz
) tzxx 
on ques.engine_id = tzxx.ENGINE_id and ques.engine_table_name = tzxx.ENGINE_TABLE_NAME and us.company_id = tzxx.GCGLDW_BH
left join t_account_info acc on tzxx.id=acc.TZ_BH and acc.tz_table_name = tzxx.TZ_TABLE_NAME and us.company_id = acc.TB_DWMC
where tzxx.ID IS NULL -- ���δ����̨��
      OR ( tzxx.id is not null and acc.id is not null )  --������̨�ˣ�����̨��ֻȡ���͵�λ�ǹ��̸���λ������
) group by company_id, TZ_TABLE_NAME, CL_ZT;

--������
SELECT DISTINCT TABLE_NAME,TABLE_ENAME    FROM   T_ACCOUNT_DICT  WHERE  DEL_FLAG='0'   
AND TYPE_ENAME1 IN ('a6','a7','a8','a9','a10','a11','a12','a13','a14','a15','a16','a17','a18','a19','a20','a21','a22','a23','a24','a25','a26','a27');

SELECT TBDWBH,'t_standbook_constructionsite' TABLE_ENAME, FROM t_standbook_constructionsite;


t_standbook_constructionsite
select * from t_standbook_constructionsite; --��ι�����


with  t1  as  (
select   a.*   
from  t_question_type   a   
left   join  t_question_type  b  on  a.p_id =  b.id   
left   join  t_question_type  c  on  b.p_id =  c.id 
   where  c.ename = 'SK'   
union  all  
select   a.*   from  t_question_type   a   
left   join  t_question_type  b  on  a.p_id =  b.id   where  b.ename = 'SK'   
),
base as (
select   a.* ,g.company_id  
from  t_question_info   a  
 left   join     t_group_info   g   
 on  a.group_id  =  g.id   
left   join  t1  t   on   t.ename =  a.check_type_id
where   a.del_flag='0'   and  a.freq_id = '39e3362571484e779b1effe91c41e076'   and   g.company_id = '1'  and  a.engine_id = '51d64481cba345b6bfabbb9c9a9004e9'
)
select freq_id,company_id,engine_id, check_type_id,
     LISTAGG( to_char(content), ';') WITHIN GROUP(ORDER BY update_date) AS dataValue   
     from  base   group  by  freq_id,company_id,engine_id, check_type_id;

t_standbook_constructionsite
t_standbook_rqgcqy
t_standbook_mudbrickhouse
t_standbook_ypyzc
t_standbook_waterlogging
t_standbook_dangeroushouse
t_standbook_bhyc
t_standbook_swcb
t_standbook_nissenhut
t_standbook_xpjf
t_standbook_yfqnc
t_standbook_yugg
t_standbook_bottomland
t_standbook_syhgqy
t_standbook_zhyfqlc
t_standbook_mountainflood
t_standbook_dzgy
t_standbook_zrbhq
t_standbook_ajjqu
t_standbook_yc
t_standbook_wzsbck
t_standbook_bhcs
