/*************************************************************************
����ԭ�еĻ�������
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
ˮ����Ϣ
**************************************************************************/
--ˮ����Ϣ
select * from t_base_sk for update;
--update t_base_sk t set t.Jymj01 = REPLACE(T.XHHSW01, 'm','km2');
select sk.id id, o.id oid,o.name from t_base_sk sk inner join sys_office o  on o.name like '%'||sk.tbdwmc||'%����ָ�ӻ���';
/*update t_base_sk sk1 set (sk1.tbdwmc,sk1.tbdwbh)=(select o1.name ,o1.oid
from (select sk.id id, o.id oid,o.name from t_base_sk sk inner join sys_office o  on o.name like '%'||sk.tbdwmc||'%����ָ�ӻ���') o1  where sk1.id = o1.id)
*/

-----------------------------------------------------------------------
-------�̷�---------
-----------------------------------------------------------------------

select ID , MOD(ID , 33) +1,MC from t_base_df;
select rownum rn,id oid, name  from sys_office where  name like '%����ָ�ӻ���';
--����������
/*update t_base_df df set (df.tbdwbh, df.tbdwmc) = (select oo.oid, oo.name  from (select d.id, o.oid, o.name from t_base_df d left join 
(select rownum rn,id oid, name  from sys_office where  name like '%����ָ�ӻ���') o on o.rn = (mod(d.ID , 33) +1)) oo
where df.id = oo.id)*/

--����γ��
select * from t_base_df for update ;
select substr(JINGD, 0 , instr(JINGD, ',') -1) from t_base_df;
select substr(WEID, 0 , instr(WEID, ',') -1) from t_base_df;
--update t_base_df set JINGD =substr(JINGD, 0 , instr(JINGD, ',') -1);
--update t_base_df set WEID =substr(WEID, 0 , instr(WEID, ',') -1);


-----------------------------------------------------------------------
------��վ---------
-----------------------------------------------------------------------
select * from t_base_bz for update ;
--����������
/*update t_base_bz df set (df.tbdwbh, df.tbdwmc) = (select oo.oid, oo.name  from (select d.id, o.oid, o.name from t_base_bz d left join 
(select rownum rn,id oid, name  from sys_office where  name like '%����ָ�ӻ���') o on o.rn = (mod(d.ID , 33) +1)) oo
where df.id = oo.id)*/

-----------------------------------------------------------------------
------ˮբ---------
-----------------------------------------------------------------------
select * from t_base_bz;
select * from t_base_szha for update ;
--update t_base_szha set del_flag = '0';
--��γ�ȴ���
--update t_base_szha sz set  (sz.jingd,sz.weid) = (select bz.jingd , bz.weid from t_base_bz bz where sz.id = bz.id )
--���ڵ̷�����
--update t_base_szha sz set  (sz.df_bh,sz.df_mc) = (select bz.id , bz.mc from t_base_df bz where sz.id = bz.id )
--�����ֶδ���
--update t_base_szha sz set zmchic = gzsjliul ,  zdxxliul =  symj_gg ,xuhao= id  ;
--����������
/*update t_base_szha df set (df.tbdwbh, df.tbdwmc) = (select oo.oid, oo.name  from (select d.id, o.oid, o.name from t_base_szha d left join 
(select rownum rn,id oid, name  from sys_office where  name like '%����ָ�ӻ���') o on o.rn = (mod(d.ID , 33) +1)) oo
where df.id = oo.id)*/

