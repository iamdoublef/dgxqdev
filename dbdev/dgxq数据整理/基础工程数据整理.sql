/*************************************************************************
备份原有的基础数据
**************************************************************************/
select distinct t.r_table_ename1 from t_account_dict t ;

/*create table t_base_bz_bak_20190226 as select * from t_base_bz;
create table t_base_df_bak_20190226 as select * from t_base_df;
create table t_base_sk_bak_20190226 as select * from t_base_sk;
create table t_base_szha_bak_20190226 as select * from t_base_szha;
create table t_base_yhd_bak_20190226 as select * from t_base_yhd;
create table t_base_ylhd_bak_20190226 as select * from t_base_ylhd;
create table t_sdz_info_bak_20190226 as select * from t_sdz_info;
create table t_stang_info_bak_20190226 as select * from t_stang_info;
*/


/*************************************************************************
水库信息
**************************************************************************/
--水库信息
select * from t_base_sk for update;
--update t_base_sk t set t.Jymj01 = REPLACE(T.XHHSW01, 'm','km2');
select sk.id id, o.id oid,o.name from t_base_sk sk inner join sys_office o  on o.name like '%'||sk.tbdwmc||'%三防指挥机构';
/*update t_base_sk sk1 set (sk1.tbdwmc,sk1.tbdwbh)=(select o1.name ,o1.oid
from (select sk.id id, o.id oid,o.name from t_base_sk sk inner join sys_office o  on o.name like '%'||sk.tbdwmc||'%三防指挥机构') o1  where sk1.id = o1.id)
*/

-----------------------------------------------------------------------
-------堤防---------
-----------------------------------------------------------------------

select ID , MOD(ID , 33) +1,MC from t_base_df;
select rownum rn,id oid, name  from sys_office where  name like '%三防指挥机构';
--处理管理机构
/*update t_base_df df set (df.tbdwbh, df.tbdwmc) = (select oo.oid, oo.name  from (select d.id, o.oid, o.name from t_base_df d left join 
(select rownum rn,id oid, name  from sys_office where  name like '%三防指挥机构') o on o.rn = (mod(d.ID , 33) +1)) oo
where df.id = oo.id)*/

--处理经纬度
select * from t_base_df for update ;
select substr(JINGD, 0 , instr(JINGD, ',') -1) from t_base_df;
select substr(WEID, 0 , instr(WEID, ',') -1) from t_base_df;
--update t_base_df set JINGD =substr(JINGD, 0 , instr(JINGD, ',') -1);
--update t_base_df set WEID =substr(WEID, 0 , instr(WEID, ',') -1);


-----------------------------------------------------------------------
------坝站---------
-----------------------------------------------------------------------
select * from t_base_bz for update ;
--处理管理机构
/*update t_base_bz df set (df.tbdwbh, df.tbdwmc) = (select oo.oid, oo.name  from (select d.id, o.oid, o.name from t_base_bz d left join 
(select rownum rn,id oid, name  from sys_office where  name like '%三防指挥机构') o on o.rn = (mod(d.ID , 33) +1)) oo
where df.id = oo.id)*/

-----------------------------------------------------------------------
------水闸---------
-----------------------------------------------------------------------
select * from t_base_bz;
select * from t_base_szha for update ;
--update t_base_szha set del_flag = '0';
--经纬度处理
--update t_base_szha sz set  (sz.jingd,sz.weid) = (select bz.jingd , bz.weid from t_base_bz bz where sz.id = bz.id )
--所在堤防处理
--update t_base_szha sz set  (sz.df_bh,sz.df_mc) = (select bz.id , bz.mc from t_base_df bz where sz.id = bz.id )
--其他字段处理
--update t_base_szha sz set zmchic = gzsjliul ,  zdxxliul =  symj_gg ,xuhao= id  ;
--处理管理机构
/*update t_base_szha df set (df.tbdwbh, df.tbdwmc) = (select oo.oid, oo.name  from (select d.id, o.oid, o.name from t_base_szha d left join 
(select rownum rn,id oid, name  from sys_office where  name like '%三防指挥机构') o on o.rn = (mod(d.ID , 33) +1)) oo
where df.id = oo.id)*/

