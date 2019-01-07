select * from user_tab_comments where comments like '%水电%';
select * from user_col_comments where table_name like '%T_STANDBOOK_SDZHAN%';
select * from user_col_comments where table_name like '%T_SDZ_INFO%';
select * from user_col_comments where table_name like '%T_ACCOUNT_INFO%';

select 
--水电站名称,工程所在地,工程管理单位,管理人员（人）,水电站附属水库（以发电为主）集雨面积（km2）,总库容（万m3）,坝型,坝长(m),最大坝高（m）
tss.SK_MC,tss.GCDZ,tss.GCGLDW_MC,tss.GLRYSL,tss.JYMJ,tss.ZKR,tss.BX,tss.BC,tss.ZDBG,
--大坝-坝体，反滤体，坝基，观测系统	，引水系统-引水渠道，压力管，启闭系统	，启闭设备备用电源配备情况
--泄洪闸-闸室,侧墙、陡坡,消力池,启闭系统,启闭设备备用电源配备情况,泄洪闸门抽查开启情况	,白蚁防治情况,其他
tss.CZZYWT1,tss.CLYJ1,tss.CZZYWT2,tss.CLYJ2,tss.CZZYWT3,tss.CLYJ3,tss.CZZYWT4,tss.CLYJ4,tss.CZZYWT5,tss.CLYJ5,tss.CZZYWT6,tss.CLYJ6,tss.CZZYWT7,tss.CLYJ7,
tss.CZZYWT8,tss.CLYJ8,tss.CZZYWT9,tss.CLYJ9,tss.CZZYWT10,tss.CLYJ10,tss.CZZYWT11,tss.CLYJ11,tss.CZZYWT12,tss.CLYJ12,tss.CZZYWT13,tss.CLYJ13,tss.CZZYWT14,tss.CLYJ14,
tss.CZZYWT15,tss.CLYJ15,tss.CZZYWT16,tss.CLYJ16,
--责任制落实情况，防汛行政责任人，防汛技术负责人，管理单位负责人，姓名 单位	 职务	 联系电话 整改措施
tss.FXXZZRR_XM,tss.FXJSFZR_XM,tss.GLDAFZR_XM,tss.FXXZZRR_DW,tss.FXJSFZR_DW,tss.GLDAFZR_DW,tss.FXXZZRR_ZW,tss.FXJSFZR_ZW,tss.GLDAFZR_ZW,tss.FXXZZRR_LXDH,tss.FXJSFZR_LXDH,tss.GLDAFZR_LXDH,tss.ZRLSQK_ZGCS,
--防洪预案--是否编制,审批机关	,防御超标准洪水预案,群众转移方案	,报警联络手段	, 整改措施
tss.FHYA_SFBZ,tss.FHYA_SPJG,tss.FHYA_FYCBZHSYA,tss.FHYA_QZZYFA,tss.FHYA_BJLLSD,tss.FHYA_ZGCS,
--防汛抢险队伍	人数（人）		负责人	联系人 姓名	电话	姓名电话
tss.QXDW_RS,tss.QXDW_FZR_XM,tss.QXDW_FZR_DH,tss.QXDW_LXR_XM,tss.QXDW_LXR_DH,tss.QXDW_ZGCS,
--防汛抢险物资储备现状情况 "袋类（条)"	"土工布（m2）"	"砂石（m3)"	块石（件)"	"存放点与坝距离(m)",整改措施
tss.QXWZ_DL,tss.QXWZ_TGB,tss.QXWZ_SS,tss.QXWZ_KS,tss.QXWZ_JSY,tss.QXWZ_CFD,tss.QXWZ_ZGCS,
--有无汛期调度运用计划		安全泄量（m3/s）		通讯方式		有无防汛公路		有无管理制度	
tss.XQDDJH_YW,tss.ANQUANXL,tss.TXFS,tss.FXGL_YW,tss.GLZD_YW,
--自检结论及拟采取的整改措施,管理负责人（签名）,单位（盖章）,检查结论及建议采取的措施,检查组组长（签名）,行政职务
tss.ZJJLJCS,tss.ZJJLJCS_FZR,tss.ZJJLJCS_DW,tss.JCJLCS,tss.JCJLCS_FZR,tss.JCJLCS_XZZW,
--防汛行政责任人（签名）,时间,防汛技术负责人（签名）,时间
tss.FXXZFZR_QM,tss.FXXZFZR_SJ,tss.FXJSZRR_QM,tss.FXJSZRR_SJ
from t_account_info tai
left join t_standbook_sdzhan  tss on tai.tz_bh = tss.id and tai.tz_table_name = 't_standbook_sdzhan'
where tss.sk_bh = '123456' and extract(year from tai.tb_sj) = '2019' and tai.tb_dwbh = 'DGXQSLGCGLC7'

