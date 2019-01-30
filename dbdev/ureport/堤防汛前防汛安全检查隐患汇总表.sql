select DF_MC,SZX_MC,MJ,RK,CZ,ZRR_XZ,ZRR_JS,CZWT,YJCXCLCS,ZS_JCZS,ZS_CZYH,TBR_XM,SHR_XM from t_hzong_dfxqyhjc where TBDWBH= and year_id=;

select u.id,u.name,u.phone, o.name officeName from sys_user u left join sys_office o on u.office_id = o.id
where u.id = 
