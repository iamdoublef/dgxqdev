--导出数据

expdp system/123456@orcl schemas=dgxq20190228 dumpfile=dgxq20190229.dmp directory=data_dir logfile=dgxq20190229.log;

--导入数据
impdp system/123456@orcl remap_schema=dgxq190228:dgxq directory=data_dir dumpfile=dgxq20190229.dmp logfile=impdgxq20190229.log

--覆盖选项
--table_exists_action选项：{skip 是如果已存在表，则跳过并处理下一个对象；append是为表增加数据；truncate是截断表，然后为其增加新数据；replace是删除已存在表，重新建表并追加数据}

