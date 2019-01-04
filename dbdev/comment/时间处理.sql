--取年份
Select to_number(to_char(sysdate,'yyyy')) from dual
select extract (year from sysdate) from dual

--取月份
Select to_number(to_char(sysdate,'mm')) from dual
select extract (month from sysdate) from dual

--取日期
Select to_number(to_char(sysdate,'dd')) from dual
select extract (day from sysdate) from dual

--如果字段本身就是date型
Select to_char(sysdate,'yyyy-mm') from dual
--如果字段本身不是date型
Select to_char(to_date(datechar,'yyyy-mm'),'yyyy-mm') from dual
--也可以用substr方法了，参数4表示从哪个字符开始截取，10表示截取多少个字符
select substr(to_char(sysdate,'yyyy-mm-dd'),4,6) from dual

--如果字段本身就是date型
to_char(date,'yyyy-mm')<=to_char(sysdate,'yyyy-mm')
--如果字段本身不是date型
to_char(to_date(date,’yyyy-mm’),'yyyy-mm')<=to_char(to_date(datechar),'yyyy-mm')
