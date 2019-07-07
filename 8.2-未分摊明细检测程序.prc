create or replace procedure p_abc_fct_no_dist_list(p_to_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-30
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-30  未分摊明细检测程序
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  --自定义变量
  v_fm_date date;
  v_to_date date;
  v_month   varchar2(10);
begin
  v_sqlstate  := '变量赋值';
  v_proc_name := 'p_abc_fct_check_dist';
  v_fm_date   := trunc(add_months(p_to_dt, -1), 'MM');
  v_to_date   := trunc(p_to_dt, 'MM');
  v_month     := to_char(v_fm_date, 'YYYYMM');

  v_sqlstate := '删除数据';
  delete abc_fct_no_dist_list a where a.month_code = v_month;

  v_sqlstate := 'RR分摊检测-未分摊';
  insert into abc_fct_no_dist_list
    select a.month_code,
           a.dist_type,
           a.fm_dept_code,
           a.fm_dept_name,
           a.fm_dept_type_code,
           a.fm_dept_type_name,
           a.fm_func_code,
           a.fm_func_name,
           a.fm_reso_code,
           a.fm_reso_name,
           null fm_acti_type_code,
           null fm_acti_type_name,
           null fm_acti_code,
           a.fm_car,
           a.driv_code,
           a.driv_name,
           max(a.fm_amt) amt,
           sysdate load_tm
      from abc_fct_rr_dist a
     where a.month_code = v_month
       and nvl(a.all_qty, 0) = 0
       and nvl(a.fm_amt, 0) <> 0
       and a.driv_code not in ('RR001', 'RA001', 'AA001', 'AO001')
     group by a.month_code,
              a.dist_type,
              a.fm_dept_code,
              a.fm_dept_name,
              a.fm_dept_type_code,
              a.fm_dept_type_name,
              a.fm_func_code,
              a.fm_func_name,
              a.fm_reso_code,
              a.fm_reso_name,
              a.fm_car,
              a.driv_code,
              a.driv_name;

  v_sqlstate := 'RA分摊检测-未分摊';
  insert into abc_fct_no_dist_list
    select a.month_code,
           a.dist_type,
           a.fm_dept_code,
           a.fm_dept_name,
           a.fm_dept_type_code,
           a.fm_dept_type_name,
           a.fm_func_code,
           a.fm_func_name,
           a.fm_reso_code,
           a.fm_reso_name,
           null fm_acti_type_code,
           null fm_acti_type_name,
           null fm_acti_code,
           a.fm_car,
           a.driv_code,
           a.driv_name,
           max(a.fm_amt) amt,
           sysdate load_tm
      from abc_fct_ra_dist a
     where a.month_code = v_month
       and nvl(a.all_qty, 0) = 0
       and nvl(a.fm_amt, 0) <> 0
       and a.driv_code not in ('RR001', 'RA001', 'AA001', 'AO001')
     group by a.month_code,
              a.dist_type,
              a.fm_dept_code,
              a.fm_dept_name,
              a.fm_dept_type_code,
              a.fm_dept_type_name,
              a.fm_func_code,
              a.fm_func_name,
              a.fm_reso_code,
              a.fm_reso_name,
              a.fm_car,
              a.driv_code,
              a.driv_name;

  v_sqlstate := 'AA分摊检测-未分摊';
  insert into abc_fct_no_dist_list
    select a.month_code,
           a.dist_type,
           a.fm_dept_code,
           a.fm_dept_name,
           a.fm_dept_type_code,
           a.fm_dept_type_name,
           a.fm_func_code,
           a.fm_func_name,
           a.fm_reso_code,
           a.fm_reso_name,
           a.fm_acti_type_code,
           a.fm_acti_type_name,
           a.fm_acti_code,
           a.fm_car,
           a.driv_code,
           a.driv_name,
           max(a.fm_amt) amt,
           sysdate load_tm
      from abc_fct_aa_dist a
     where a.month_code = v_month
       and nvl(a.all_qty, 0) = 0
       and nvl(a.fm_amt, 0) <> 0
       and a.driv_code not in ('RR001', 'RA001', 'AA001', 'AO001')
     group by a.month_code,
              a.dist_type,
              a.fm_dept_code,
              a.fm_dept_name,
              a.fm_dept_type_code,
              a.fm_dept_type_name,
              a.fm_func_code,
              a.fm_func_name,
              a.fm_reso_code,
              a.fm_reso_name,
              a.fm_acti_type_code,
              a.fm_acti_type_name,
              a.fm_acti_code,
              a.fm_car,
              a.driv_code,
              a.driv_name;

  v_sqlstate := 'AO分摊检测-未分摊';
  insert into abc_fct_no_dist_list
    select a.month_code,
           a.dist_type,
           a.fm_dept_code,
           a.fm_dept_name,
           a.fm_dept_type_code,
           a.fm_dept_type_name,
           a.fm_func_code,
           a.fm_func_name,
           a.fm_reso_code,
           a.fm_reso_name,
           a.fm_acti_type_code,
           a.fm_acti_type_name,
           a.fm_acti_code,
           a.fm_car,
           a.driv_code,
           a.driv_name,
           max(a.fm_amt) amt,
           sysdate load_tm
      from abc_fct_ao_dist a
     where a.month_code = v_month
       and nvl(a.all_qty, 0) = 0
       and nvl(a.fm_amt, 0) <> 0
       and a.driv_code not in ('RR001', 'RA001', 'AA001', 'AO001')
     group by a.month_code,
              a.dist_type,
              a.fm_dept_code,
              a.fm_dept_name,
              a.fm_dept_type_code,
              a.fm_dept_type_name,
              a.fm_func_code,
              a.fm_func_name,
              a.fm_reso_code,
              a.fm_reso_name,
              a.fm_acti_type_code,
              a.fm_acti_type_name,
              a.fm_acti_code,
              a.fm_car,
              a.driv_code,
              a.driv_name;
  commit;
  v_sqlstate := '结束';

exception
  when others then
    rollback;
    commit;
  
end p_abc_fct_no_dist_list;
/
