select * from user_tab_comments where comments like '%Σ%';
select * from user_col_comments where table_name like '%T_STANDBOOK_DANGEROUSHOUSE%';
select * from T_STANDBOOK_DANGEROUSHOUSE ;

--�������ȷ��룩	��γ���ȷ��룩������	�����أ��С�����	�������򣨽ֵ���	��ȫ����в����	����������������	�����˼��绰	���δ�ʩ	����Ŀ�꼰����	Ŀǰ��չ���	��Աת�Ʒ����ƶ����	���վ�Ԯ���飨�ˣ�	���վ�Ԯ�������ͼ�����
--��λ��Ӧ�������б�
       											
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
          --��id,id,id,id���ַ���ת����id��
               select tb_dwbh, tb_dwmc, TB_SJ, tz_bh
                  from t_account_info
                 where tb_dwbh = 'DGXQSLGCGLC7'
                   and extract(year from tb_sj) = '2018'
                   and gc_yh_lx = 'WF') a,
               (SELECT LEVEL lvl FROM dual CONNECT BY LEVEL < 1000) b
         WHERE b.lvl <= REGEXP_COUNT(a.TZ_BH, '\,') + 1) tai
  LEFT JOIN t_standbook_dangeroushouse tsd on tai.wt_bh = tsd.id;
