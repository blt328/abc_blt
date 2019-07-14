begin
  -- Call the procedure
  p_abc_bsl_cost_base(date '2019-06-01');
end;

--区部利润分析
select t.rec_area_code,
       t.rec_area_name,
       t.income_amt,
       t.cost_all_amt,
       t.income_amt - t.cost_all_amt prof_amt,
       (t.income_amt - t.cost_all_amt) / t.income_amt prof_rt
  from (select a.rec_area_code,
               a.rec_area_name,
               sum(case
                     when a.rn = 1 then
                      a.income_amt
                     else
                      0
                   end) income_amt,
               sum(a.cost_all_amt) cost_all_amt
          from abc_bsl_cost_base a
         where a.month_code = '201905'
         group by a.rec_area_code, a.rec_area_name) t;

--北京区部流向利润分析
select t.rec_area_code,
       t.rec_area_name,
       t.city_flow,
       t.income_amt,
       t.cost_all_amt,
       t.income_amt - t.cost_all_amt prof_amt,
       (t.income_amt - t.cost_all_amt) / t.income_amt prof_rt
  from (select a.rec_area_code,
               a.rec_area_name,
               a.rec_city || '-' || a.send_city city_flow,
               sum(case
                     when a.rn = 1 then
                      a.income_amt
                     else
                      0
                   end) income_amt,
               sum(a.cost_all_amt) cost_all_amt
          from abc_bsl_cost_base a
         where a.month_code = '201905'
           and a.rec_area_code = '010Y'
         group by a.rec_area_code,
                  a.rec_area_name,
                  a.rec_city || '-' || a.send_city) t;

--北京区部010-021流向下的客户利润分析
select t.rec_area_code,
       t.rec_area_name,
       t.city_flow,
       t.cust_code,
       t.cust_name,
       t.income_amt,
       t.cost_all_amt,
       t.income_amt - t.cost_all_amt prof_amt,
       (t.income_amt - t.cost_all_amt) / t.income_amt prof_rt
  from (select a.rec_area_code,
               a.rec_area_name,
               a.rec_city || '-' || a.send_city city_flow,
               a.cust_code,
               a.cust_name,
               sum(case
                     when a.rn = 1 then
                      a.income_amt
                     else
                      0
                   end) income_amt,
               sum(a.cost_all_amt) cost_all_amt
          from abc_bsl_cost_base a
         where a.month_code = '201905'
           and a.rec_area_code = '010Y'
           and a.rec_city || '-' || a.send_city = '010-021'
         group by a.rec_area_code,
                  a.rec_area_name,
                  a.rec_city || '-' || a.send_city,
                  a.cust_code,
                  a.cust_name) t;
