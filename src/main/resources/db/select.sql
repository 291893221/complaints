--4	用户投诉原因分析
select temp.*,
(temp.field1-temp.field2)*100 || '%' as field5,
(temp.field1-temp.field2)*100 || '%' as field6
from (
select 
(select count(*)  from t_ori_net_investment_v600 t1 where t1.field36 >= #{startDate1} and t1.field36 <= #{endDate1} )as field1,--今年上周
(select count(*)  from t_ori_net_investment_v600 t2 where t2.field36 >= #{startDate2} and t2.field36 <= #{endDate2} )as field2,--今年本周
(select count(*)  from t_ori_net_investment_v600 t3 where t3.field36 >= #{startDate3} and t3.field36 <= #{endDate3} )as field3,--去年上周
(select count(*)  from t_ori_net_investment_v600 t4 where t4.field36 >= #{startDate4} and t4.field36 <= #{endDate4} )as field4--去年本周
from dual ) temp;

--6	多次投诉与重复投诉分析
with temp as
 (select *
    from t_ori_net_v600
   where field26 <= '2014-1-16'
     and '2014-1-1' <= field26)
select table1.*,
       --table1.field3 / table1.field2 * 100 || '%',
       --table1.field4 / table1.field2 * 100 || '%',
       substr(table1.field3 / table1.field2 * 100, 0, 5) || '%' as field5,
       substr(table1.field4 / table1.field2 * 100, 0, 5) || '%' as field6
  from (select t.field41 as field1,
               count(*) as field2,
               (select count(*)
                  from (select field28
                          from temp
                         group by field28
                        having count(*) >= 2)) as field3,
               (select count(*)
                  from (select field42
                          from temp
                         group by field42
                        having count(*) >= 2)) as field4
          from temp t
         group by t.field41) table1;
