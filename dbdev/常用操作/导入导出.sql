--��������

expdp system/123456@orcl schemas=dgxq20190228 dumpfile=dgxq20190229.dmp directory=data_dir logfile=dgxq20190229.log;

--��������
impdp system/123456@orcl remap_schema=dgxq190228:dgxq directory=data_dir dumpfile=dgxq20190229.dmp logfile=impdgxq20190229.log

--����ѡ��
--table_exists_actionѡ�{skip ������Ѵ��ڱ���������������һ������append��Ϊ���������ݣ�truncate�ǽضϱ�Ȼ��Ϊ�����������ݣ�replace��ɾ���Ѵ��ڱ����½���׷������}

