--ȡ���
Select to_number(to_char(sysdate,'yyyy')) from dual
select extract (year from sysdate) from dual

--ȡ�·�
Select to_number(to_char(sysdate,'mm')) from dual
select extract (month from sysdate) from dual

--ȡ����
Select to_number(to_char(sysdate,'dd')) from dual
select extract (day from sysdate) from dual

--����ֶα������date��
Select to_char(sysdate,'yyyy-mm') from dual
--����ֶα�����date��
Select to_char(to_date(datechar,'yyyy-mm'),'yyyy-mm') from dual
--Ҳ������substr�����ˣ�����4��ʾ���ĸ��ַ���ʼ��ȡ��10��ʾ��ȡ���ٸ��ַ�
select substr(to_char(sysdate,'yyyy-mm-dd'),4,6) from dual

--����ֶα������date��
to_char(date,'yyyy-mm')<=to_char(sysdate,'yyyy-mm')
--����ֶα�����date��
to_char(to_date(date,��yyyy-mm��),'yyyy-mm')<=to_char(to_date(datechar),'yyyy-mm')
