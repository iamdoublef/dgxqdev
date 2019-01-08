-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------获取全部当前用户取到的所有问题------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--序号	水闸名称，所在地（县、镇），所在堤防（或河段），闸孔孔数，闸孔孔数总净高（米），设计过闸流量（m3/s）	受益面积(万亩)	行政责任人	技术责任人	
--溢洪道启闭系统是否配备备用电源	工程存在主要问题	应急除险处理措施
--缺字段：受益面积(万亩)；所在县和镇公用字段，没有分开,缺失字段是否配备备用电源

select gcgldw_mc, gcgldw_bh, gcdz, bsz.df_mc || bsz.hd_mc  szdf  , ks_sl, zkzjk, sjgzll,  '缺失字段受益面积' symj , fxxzzrr_xm ,fxjsfzr_xm , '缺失字段是否配备备用电源' sfpbbydy, 
       czzywt1 || decode(czzywt2,null,'', '; ' || czzywt2 ) || decode(czzywt3 ,null,'', '; ' || czzywt3 ) || decode(czzywt4  ,null,'', '; ' ||  czzywt4 ) 
       || decode( czzywt5 ,null,'', '; ' ||  czzywt5 ) || decode(czzywt6  ,null,'', '; ' || czzywt6  ) || decode(czzywt7  ,null,'', '; ' || czzywt7  )
        || decode(czzywt8  ,null,'', '; ' ||czzywt8   )  czzywt,
        clyj1 || decode(clyj2,null,'', '; ' || clyj2 ) || decode(clyj3 ,null,'', '; ' || clyj3 ) || decode(clyj4  ,null,'', '; ' ||  clyj4 ) 
       || decode( clyj5 ,null,'', '; ' ||  clyj5 ) || decode(clyj6  ,null,'', '; ' || clyj6  ) || decode(clyj7  ,null,'', '; ' || clyj7  )
        || decode(clyj8  ,null,'', '; ' ||clyj8   )  clyj,
         cl_ren , tb_sj
	 from (SELECT  REGEXP_SUBSTR(TZ_BH, '[^,]+', 1, lvl) WT_BH ,tb_dwbh, tb_dwmc, cl_ren , tb_sj 
          FROM (
          --把id,id,id,id的字符串转换成id列
               select tb_dwbh, tb_dwmc, cl_ren , tb_sj , tz_bh
                  from t_account_info
                 where tb_dwbh = 'DGXQSLGCGLC7' 
                   and extract(year from tb_sj) = '2018'
                   and gc_yh_lx ='SZ' ) a,
               (SELECT LEVEL lvl FROM dual CONNECT BY LEVEL < 1000) b
         WHERE b.lvl <= REGEXP_COUNT(a.TZ_BH, '\,') + 1) tai
  LEFT JOIN T_STANDBOOK_SZHA szha on tai.wt_bh = szha.id
  LEFT JOIN T_BASE_SZHA bsz on szha.SZHA_BH = bsz.id;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--测试数据


select '常平镇大水闸' gcgldw_mc, 'cpdsz' gcgldw_bh, '常平县，常平镇' gcdz, '缺失字段所在堤防' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  '缺失字段受益面积' symj ,'这是中文吗？' fxxzzrr_xm ,'这是中文吗？' fxjsfzr_xm , '缺失字段是否配备备用电源' sfpbbydy, 
       '好几个问题；好几个问题；好几个问题；'  czzywt, '几个处理方式；几个处理方式；几个处理方式；几个处理方式'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '常平镇大水闸' gcgldw_mc, 'cpdsz' gcgldw_bh, '常平县，常平镇' gcdz, '缺失字段所在堤防' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  '缺失字段受益面积' symj ,'这是中文吗？' fxxzzrr_xm ,'这是中文吗？' fxjsfzr_xm , '缺失字段是否配备备用电源' sfpbbydy, 
       '好几个问题；好几个问题；好几个问题；'  czzywt, '几个处理方式；几个处理方式；几个处理方式；几个处理方式'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '常平镇大水闸' gcgldw_mc, 'cpdsz' gcgldw_bh, '常平县，常平镇' gcdz, '缺失字段所在堤防' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  '缺失字段受益面积' symj ,'这是中文吗？' fxxzzrr_xm ,'这是中文吗？' fxjsfzr_xm , '缺失字段是否配备备用电源' sfpbbydy, 
       '好几个问题；好几个问题；好几个问题；'  czzywt, '几个处理方式；几个处理方式；几个处理方式；几个处理方式'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '常平镇大水闸' gcgldw_mc, 'cpdsz' gcgldw_bh, '常平县，常平镇' gcdz, '缺失字段所在堤防' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  '缺失字段受益面积' symj ,'这是中文吗？' fxxzzrr_xm ,'这是中文吗？' fxjsfzr_xm , '缺失字段是否配备备用电源' sfpbbydy, 
       '好几个问题；好几个问题；好几个问题；'  czzywt, '几个处理方式；几个处理方式；几个处理方式；几个处理方式'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '常平镇大水闸' gcgldw_mc, 'cpdsz' gcgldw_bh, '常平县，常平镇' gcdz, '缺失字段所在堤防' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  '缺失字段受益面积' symj ,'这是中文吗？' fxxzzrr_xm ,'这是中文吗？' fxjsfzr_xm , '缺失字段是否配备备用电源' sfpbbydy, 
       '好几个问题；好几个问题；好几个问题；'  czzywt, '几个处理方式；几个处理方式；几个处理方式；几个处理方式'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '常平镇大水闸' gcgldw_mc, 'cpdsz' gcgldw_bh, '常平县，常平镇' gcdz, '缺失字段所在堤防' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  '缺失字段受益面积' symj ,'这是中文吗？' fxxzzrr_xm ,'这是中文吗？' fxjsfzr_xm , '缺失字段是否配备备用电源' sfpbbydy, 
       '好几个问题；好几个问题；好几个问题；'  czzywt, '几个处理方式；几个处理方式；几个处理方式；几个处理方式'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '常平镇大水闸' gcgldw_mc, 'cpdsz' gcgldw_bh, '常平县，常平镇' gcdz, '缺失字段所在堤防' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  '缺失字段受益面积' symj ,'这是中文吗？' fxxzzrr_xm ,'这是中文吗？' fxjsfzr_xm , '缺失字段是否配备备用电源' sfpbbydy, 
       '好几个问题；好几个问题；好几个问题；'  czzywt, '几个处理方式；几个处理方式；几个处理方式；几个处理方式'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '常平镇大水闸' gcgldw_mc, 'cpdsz' gcgldw_bh, '常平县，常平镇' gcdz, '缺失字段所在堤防' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  '缺失字段受益面积' symj ,'这是中文吗？' fxxzzrr_xm ,'这是中文吗？' fxjsfzr_xm , '缺失字段是否配备备用电源' sfpbbydy, 
       '好几个问题；好几个问题；好几个问题；'  czzywt, '几个处理方式；几个处理方式；几个处理方式；几个处理方式'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '常平镇大水闸' gcgldw_mc, 'cpdsz' gcgldw_bh, '常平县，常平镇' gcdz, '缺失字段所在堤防' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  '缺失字段受益面积' symj ,'这是中文吗？' fxxzzrr_xm ,'这是中文吗？' fxjsfzr_xm , '缺失字段是否配备备用电源' sfpbbydy, 
       '好几个问题；好几个问题；好几个问题；'  czzywt, '几个处理方式；几个处理方式；几个处理方式；几个处理方式'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual
union all select '常平镇大水闸' gcgldw_mc, 'cpdsz' gcgldw_bh, '常平县，常平镇' gcdz, '缺失字段所在堤防' szdf  ,8 ks_sl,10 zkzjk,12 sjgzll,  '缺失字段受益面积' symj ,'这是中文吗？' fxxzzrr_xm ,'这是中文吗？' fxjsfzr_xm , '缺失字段是否配备备用电源' sfpbbydy, 
       '好几个问题；好几个问题；好几个问题；'  czzywt, '几个处理方式；几个处理方式；几个处理方式；几个处理方式'  clyj
	 ,'11' cl_ren ,to_date('20190101','yyyyMMdd') tb_sj from dual


