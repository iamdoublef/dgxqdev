--��������

expdp system/123456@orcl schemas=dgxq dumpfile=dgxq20190228.dmp directory=data_dir logfile=dgxq20190228.log;

--��������
impdp system/123456@orcl  remap_schema=dgxq:dgxq190228 directory=data_dir dumpfile=dgxq20190228.dmp logfile=impdgxq20190228.log
