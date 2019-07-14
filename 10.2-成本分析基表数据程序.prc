create or replace procedure p_abc_bsl_cost_base(p_to_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-30
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-30  ABC成本分析基表
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  --自定义变量
  v_fm_date date;
  v_to_date date;
  v_month   varchar2(10);
begin
  v_sqlstate  := '变量赋值';
  v_proc_name := 'p_abc_fct_ra_dist';
  v_fm_date   := trunc(add_months(p_to_dt, -1), 'MM');
  v_to_date   := trunc(p_to_dt, 'MM');
  v_month     := to_char(v_fm_date, 'YYYYMM');

  v_sqlstate := '删除数据';
  delete abc_bsl_cost_base_tmp01;
  delete abc_bsl_cost_base a where a.month_code = v_month;

  v_sqlstate := '生成作业资源成本';
  insert into abc_bsl_cost_base_tmp01
    select a.waybill_no,
           a.fm_acti_type_code,
           a.fm_acti_type_name,
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
                 when a.fm_reso_code = 'ZY0101' and a.fm_func_code = '1040' then
                  a.to_amt
                 else
                  0
               end) mgr_amt,
           sum(case
                 when a.fm_reso_code = 'ZY0101' and a.fm_func_code <> '1040' then
                  a.to_amt
                 else
                  0
               end) pep_amt,
           sum(a.to_amt) all_amt
      from abc_fct_ao_dist a
     where a.month_code = v_month
     group by a.waybill_no, a.fm_acti_type_code, a.fm_acti_type_name;

  v_sqlstate := '生成结果表数据';
  insert into abc_bsl_cost_base
    select to_char(a.rec_dt, 'YYYYMM') month_code,
           a.rec_dept,
           d.level2_code rec_area_code,
           d.level2_name rec_area_name,
           a.send_dept,
           e.level2_code send_area_code,
           e.level2_name send_area_name,
           a.waybill_no,
           a.rec_city,
           a.send_city,
           a.cust_code,
           c.cust_name,
           a.prod_code,
           a.prod_name,
           a.amt income_amt,
           b.fm_acti_type_code,
           b.fm_acti_type_name,
           b.dive_amt,
           b.car_amt,
           b.metr_amt,
           b.mgr_amt,
           b.pep_amt,
           b.all_amt,
           row_number() over(partition by a.waybill_no order by a.amt desc) as rn,
           sysdate load_tm
      from abc_bsl_waybill a
      left join abc_bsl_cost_base_tmp01 b
        on a.waybill_no = b.waybill_no
      left join abc_rel_cust c
        on a.cust_code = c.cust_code
      left join abc_dim_dept d
        on a.rec_dept = d.dept_code
       and d.fm_tm <= v_fm_date
       and d.to_tm >= v_to_date
      left join abc_dim_dept e
        on a.send_dept = e.dept_code
       and e.fm_tm <= v_fm_date
       and e.to_tm >= v_to_date
     where a.rec_dt >= v_fm_date
       and a.rec_dt < v_to_date;
  commit;
  v_sqlstate := '结束';

exception
  when others then
    rollback;
    commit;
  
end p_abc_bsl_cost_base;
/
