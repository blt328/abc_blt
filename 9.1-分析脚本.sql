--产品利润分析
select to_char(a.rec_dt, 'YYYYMM') month_code,
       a.prod_code,
       a.prod_name,
       sum(a.amt) income_amt,
       sum(b.amt) cost_amt
  from abc_bsl_waybill a
  left join (select a.waybill_no, sum(a.to_amt) amt
               from abc_fct_ao_dist a
              where a.month_code = '201905'
              group by a.waybill_no) b
    on a.waybill_no = b.waybill_no
 where a.rec_dt >= date '2019-05-01'
   and a.rec_dt < date '2019-06-01'
 group by to_char(a.rec_dt, 'YYYYMM'), a.prod_code, a.prod_name;

--流向利润分析
select to_char(a.rec_dt, 'YYYYMM') month_code,
       a.rec_city || '-' || a.send_city city_flow,
       sum(a.amt) income_amt,
       sum(b.amt) cost_amt,
       sum(a.amt) - sum(b.amt) proj_amt
  from abc_bsl_waybill a
  left join (select a.waybill_no, sum(a.to_amt) amt
               from abc_fct_ao_dist a
              where a.month_code = '201905'
              group by a.waybill_no) b
    on a.waybill_no = b.waybill_no
 where a.rec_dt >= date '2019-05-01'
   and a.rec_dt < date '2019-06-01'
 group by to_char(a.rec_dt, 'YYYYMM'), a.rec_city || '-' || a.send_city;

-- 客户利润分析
select to_char(a.rec_dt, 'YYYYMM') month_code,
       a.cust_code,
       c.cust_name,
       sum(a.amt) income_amt,
       sum(b.amt) cost_amt,
       sum(a.amt) - sum(b.amt) proj_amt
  from abc_bsl_waybill a
  left join (select a.waybill_no, sum(a.to_amt) amt
               from abc_fct_ao_dist a
              where a.month_code = '201905'
              group by a.waybill_no) b
    on a.waybill_no = b.waybill_no
  left join abc_rel_cust c
    on a.cust_code = c.cust_code
 where a.rec_dt >= date '2019-05-01'
   and a.rec_dt < date '2019-06-01'
 group by to_char(a.rec_dt, 'YYYYMM'), a.cust_code, c.cust_name;

-- 成本项分析
select to_char(a.rec_dt, 'YYYYMM') month_code,
       sum(a.amt) income_amt,
       sum(b.dive_amt) dive_amt,
       sum(b.car_amt) car_amt,
       sum(b.mgr_amt) mgr_amt,
       sum(b.pep_amt) pep_amt
  from abc_bsl_waybill a
  left join (select a.waybill_no,
                    sum(case
                          when a.fm_reso_code = 'ZY0201' then
                           a.to_amt
                          else
                           0
                        end) dive_amt,
                    sum(case
                          when a.fm_reso_code = 'ZY0301' then
                           a.to_amt
                          else
                           0
                        end) car_amt,
                    sum(case
                          when a.fm_reso_code in ('ZY0401', 'ZY0402') then
                           a.to_amt
                          else
                           0
                        end) metr_amt,
                    sum(case
                          when a.fm_reso_code = 'ZY0101' and
                               a.fm_func_code = '1040' then
                           a.to_amt
                          else
                           0
                        end) mgr_amt,
                    sum(case
                          when a.fm_reso_code = 'ZY0101' and
                               a.fm_func_code <> '1040' then
                           a.to_amt
                          else
                           0
                        end) pep_amt
               from abc_fct_ao_dist a
              where a.month_code = '201905'
              group by a.waybill_no) b
    on a.waybill_no = b.waybill_no
 where a.rec_dt >= date '2019-05-01'
   and a.rec_dt < date '2019-06-01'
 group by to_char(a.rec_dt, 'YYYYMM');


-- 作业成本项分析
select a.month_code,
       b.fm_acti_type_code,
       b.fm_acti_type_name,
       a.income_amt,
       b.amt
  from (select to_char(a.rec_dt, 'YYYYMM') month_code, sum(a.amt) income_amt
          from abc_bsl_waybill a
         where a.rec_dt >= date '2019-05-01'
           and a.rec_dt < date '2019-06-01'
         group by to_char(a.rec_dt, 'YYYYMM')) a
  left join (select a.fm_acti_type_code,
                    a.fm_acti_type_name,
                    sum(a.to_amt) amt
               from abc_fct_ao_dist a
              where a.month_code = '201905'
              group by a.fm_acti_type_code, a.fm_acti_type_name) b
    on 1 = 1;
