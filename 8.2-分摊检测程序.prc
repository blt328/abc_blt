create or replace procedure p_abc_fct_check_dist(p_to_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-30
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-30  分摊检测程序
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
  delete abc_fct_chk_dist a where a.month_code = v_month;

  v_sqlstate := 'RR分摊检测-理论';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'RR' dist_type,
           1 dist_step,
           sum(amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_car,
                   max(a.fm_amt) amt
              from abc_fct_rr_dist_tmp03 a
             inner join abc_rel_rr_dist b
                on a.fm_dept_type_code = b.fm_dept_type_code
               and a.fm_func_code = b.fm_func_code
               and a.fm_reso_code = b.fm_reso_code
               and b.fm_dt <= v_fm_date
               and b.to_dt >= v_fm_date
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_car) t;

  v_sqlstate := 'RR分摊检测-实际';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'RR' dist_type,
           2 dist_step,
           sum(amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_car,
                   max(a.fm_amt) amt
              from abc_fct_rr_dist_tmp03 a
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_car) t;

  v_sqlstate := 'RR分摊检测-已分摊';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'RR' dist_type,
           3 dist_step,
           sum(a.to_amt) amt,
           sysdate load_tm
      from abc_fct_rr_dist a
     where a.month_code = v_month;

  v_sqlstate := 'RR分摊检测-未分摊';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'RR' dist_type,
           4 dist_step,
           sum(amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_car,
                   max(a.fm_amt) amt
              from abc_fct_rr_dist a
             where a.month_code = v_month
               and nvl(a.all_qty, 0) = 0
               and a.driv_code not in ('RR001', 'RA001', 'AA001', 'AO001')
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_car) t;

  v_sqlstate := 'RR分摊检测-重复分摊';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'RR' dist_type,
           5 dist_step,
           sum(fm_amt - to_amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_car,
                   max(a.fm_amt) fm_amt,
                   sum(a.to_amt) to_amt
              from abc_fct_rr_dist a
             where a.month_code = v_month
               and (nvl(a.all_qty, 0) <> 0 or
                   a.driv_code in ('RR001', 'RA001', 'AA001', 'AO001'))
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_car) t;

  v_sqlstate := 'RA分摊检测-理论';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'RA' dist_type,
           1 dist_step,
           sum(amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_car,
                   max(a.fm_amt) amt
              from abc_fct_ra_dist_tmp04 a
             inner join abc_rel_ra_dist b
                on a.fm_dept_type_code = b.fm_dept_type_code
               and a.fm_func_code = b.fm_func_code
               and a.fm_reso_code = b.fm_reso_code
               and b.fm_dt <= v_fm_date
               and b.to_dt >= v_fm_date
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_car) t;

  v_sqlstate := 'RA分摊检测-实际';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'RA' dist_type,
           2 dist_step,
           sum(amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_car,
                   max(a.fm_amt) amt
              from abc_fct_ra_dist_tmp04 a
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_car) t;

  v_sqlstate := 'RA分摊检测-已分摊';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'RA' dist_type,
           3 dist_step,
           sum(a.to_amt) amt,
           sysdate load_tm
      from abc_fct_ra_dist a
     where a.month_code = v_month;

  v_sqlstate := 'RA分摊检测-未分摊';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'RA' dist_type,
           4 dist_step,
           sum(amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_car,
                   max(a.fm_amt) amt
              from abc_fct_ra_dist a
             where a.month_code = v_month
               and nvl(a.all_qty, 0) = 0
               and a.driv_code not in ('RR001', 'RA001', 'AA001', 'AO001')
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_car) t;

  v_sqlstate := 'RA分摊检测-重复分摊';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'RA' dist_type,
           5 dist_step,
           sum(fm_amt - to_amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_car,
                   max(a.fm_amt) fm_amt,
                   sum(a.to_amt) to_amt
              from abc_fct_ra_dist a
             where a.month_code = v_month
               and (nvl(a.all_qty, 0) <> 0 or
                   a.driv_code in ('RR001', 'RA001', 'AA001', 'AO001'))
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_car) t;

  v_sqlstate := 'AA分摊检测-理论';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'AA' dist_type,
           1 dist_step,
           sum(amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_acti_type_code,
                   a.fm_acti_code,
                   a.fm_car,
                   max(a.fm_amt) amt
              from abc_fct_aa_dist_tmp04 a
             inner join abc_rel_aa_dist b
                on a.fm_dept_type_code = b.fm_dept_type_code
               and a.fm_func_code = b.fm_func_code
               and a.fm_reso_code = b.fm_reso_code
               and a.fm_acti_type_code = b.fm_acti_code
               and b.fm_dt <= v_fm_date
               and b.to_dt >= v_fm_date
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_acti_type_code,
                      a.fm_acti_code,
                      a.fm_car) t;

  v_sqlstate := 'AA分摊检测-实际';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'AA' dist_type,
           2 dist_step,
           sum(amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_acti_type_code,
                   a.fm_acti_code,
                   a.fm_car,
                   max(a.fm_amt) amt
              from abc_fct_aa_dist_tmp04 a
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_acti_type_code,
                      a.fm_acti_code,
                      a.fm_car) t;

  v_sqlstate := 'AA分摊检测-已分摊';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'AA' dist_type,
           3 dist_step,
           sum(a.to_amt) amt,
           sysdate load_tm
      from abc_fct_aa_dist a
     where a.month_code = v_month;

  v_sqlstate := 'AA分摊检测-未分摊';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'AA' dist_type,
           4 dist_step,
           sum(amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_acti_type_code,
                   a.fm_acti_code,
                   a.fm_car,
                   max(a.fm_amt) amt
              from abc_fct_aa_dist a
             where a.month_code = v_month
               and nvl(a.all_qty, 0) = 0
               and a.driv_code not in ('RR001', 'RA001', 'AA001', 'AO001')
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_acti_type_code,
                      a.fm_acti_code,
                      a.fm_car) t;

  v_sqlstate := 'AA分摊检测-重复分摊';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'AA' dist_type,
           5 dist_step,
           sum(fm_amt - to_amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_acti_type_code,
                   a.fm_acti_code,
                   a.fm_car,
                   max(a.fm_amt) fm_amt,
                   sum(a.to_amt) to_amt
              from abc_fct_aa_dist a
             where a.month_code = v_month
               and (nvl(a.all_qty, 0) <> 0 or
                   a.driv_code in ('RR001', 'RA001', 'AA001', 'AO001'))
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_acti_type_code,
                      a.fm_acti_code,
                      a.fm_car) t;

  v_sqlstate := 'AO分摊检测-理论';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'AO' dist_type,
           1 dist_step,
           sum(amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_acti_type_code,
                   a.fm_acti_code,
                   a.fm_car,
                   max(a.fm_amt) amt
              from abc_fct_ao_dist_tmp04 a
             inner join abc_rel_ao_dist b
                on a.fm_dept_type_code = b.fm_dept_type_code
               and a.fm_func_code = b.fm_func_code
               and a.fm_reso_code = b.fm_reso_code
               and a.fm_acti_type_code = b.fm_acti_code
               and b.fm_dt <= v_fm_date
               and b.to_dt >= v_fm_date
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_acti_type_code,
                      a.fm_acti_code,
                      a.fm_car) t;

  v_sqlstate := 'AO分摊检测-实际';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'AO' dist_type,
           2 dist_step,
           sum(amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_acti_type_code,
                   a.fm_acti_code,
                   a.fm_car,
                   max(a.fm_amt) amt
              from abc_fct_ao_dist_tmp04 a
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_acti_type_code,
                      a.fm_acti_code,
                      a.fm_car) t;

  v_sqlstate := 'AO分摊检测-已分摊';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'AO' dist_type,
           3 dist_step,
           sum(a.to_amt) amt,
           sysdate load_tm
      from abc_fct_ao_dist a
     where a.month_code = v_month;

  v_sqlstate := 'AO分摊检测-未分摊';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'AO' dist_type,
           4 dist_step,
           sum(amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_acti_type_code,
                   a.fm_acti_code,
                   a.fm_car,
                   max(a.fm_amt) amt
              from abc_fct_ao_dist a
             where a.month_code = v_month
               and nvl(a.all_qty, 0) = 0
               and a.driv_code not in ('RR001', 'RA001', 'AA001', 'AO001')
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_acti_type_code,
                      a.fm_acti_code,
                      a.fm_car) t;

  v_sqlstate := 'AO分摊检测-重复分摊';
  insert into abc_fct_chk_dist
    select v_month month_code,
           'AO' dist_type,
           5 dist_step,
           sum(fm_amt - to_amt) amt,
           sysdate load_tm
      from (select a.fm_dept_code,
                   a.fm_func_code,
                   a.fm_reso_code,
                   a.fm_acti_type_code,
                   a.fm_acti_code,
                   a.fm_car,
                   max(a.fm_amt) fm_amt,
                   sum(a.to_amt) to_amt
              from abc_fct_ao_dist a
             where a.month_code = v_month
               and (nvl(a.all_qty, 0) <> 0 or
                   a.driv_code in ('RR001', 'RA001', 'AA001', 'AO001'))
             group by a.fm_dept_code,
                      a.fm_func_code,
                      a.fm_reso_code,
                      a.fm_acti_type_code,
                      a.fm_acti_code,
                      a.fm_car) t;
  commit;
  v_sqlstate := '结束';

exception
  when others then
    rollback;
    commit;
  
end p_abc_fct_check_dist;
/
