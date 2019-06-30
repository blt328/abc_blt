create or replace procedure p_abc_fct_aa_dist(p_to_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-30
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-30  生成AA分摊结果
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  --自定义变量
  v_fm_date date;
  v_to_date date;
  v_month   varchar2(10);
begin
  v_sqlstate  := '变量赋值';
  v_proc_name := 'p_abc_fct_aa_dist';
  v_fm_date   := trunc(add_months(p_to_dt, -1), 'MM');
  v_to_date   := trunc(p_to_dt, 'MM');
  v_month     := to_char(v_fm_date, 'YYYYMM');

  v_sqlstate := '删除数据';
  delete abc_fct_aa_dist_tmp01;
  delete abc_fct_aa_dist_tmp02;
  delete abc_fct_aa_dist_tmp03;
  delete abc_fct_aa_dist_tmp04;
  delete abc_fct_aa_dist a where a.month_code = v_month;

  v_sqlstate := '建立分摊标准';
  insert into abc_fct_aa_dist_tmp01
    select b.mode_code,
           a.dept_code         fm_dept_code,
           a.dept_name         fm_dept_name,
           b.fm_dept_type_code,
           b.fm_dept_type_name,
           b.fm_func_code,
           b.fm_func_name,
           b.fm_reso_code,
           b.fm_reso_name,
           b.fm_acti_code,
           b.fm_acti_name,
           a.dept_code         to_dept_code,
           a.dept_name         to_dept_name,
           b.to_dept_type_code,
           b.to_dept_type_name,
           b.to_func_code,
           b.to_func_name,
           b.to_reso_code,
           b.to_reso_name,
           b.to_acti_code,
           b.to_acti_name,
           b.dist_type,
           b.driv_code,
           b.driv_name
      from abc_dim_dept a
     inner join abc_rel_aa_dist b
        on a.dept_type = b.fm_dept_type_code
       and b.fm_dt <= v_fm_date
       and b.to_dt >= v_fm_date
     where a.fm_tm <= v_fm_date
       and a.to_tm >= v_fm_date;

  v_sqlstate := '合并资源';
  insert into abc_fct_aa_dist_tmp02
    select a.to_dept_code fm_dept_code,
           a.to_func_code fm_func_code,
           a.to_reso_code fm_reso_code,
           a.to_acti_type_code fm_acti_type_code,
           a.to_acti_code fm_acti_code,
           a.to_car fm_car,
           sum(a.to_amt) fm_amt
      from abc_fct_ra_dist a
     where a.month_code = v_month
       and a.to_amt <> 0
     group by a.to_dept_code,
              a.to_func_code,
              a.to_reso_code,
              a.to_acti_type_code,
              a.to_acti_code,
              a.to_car;

  v_sqlstate := '关联资源';
  insert into abc_fct_aa_dist_tmp03
    select a.mode_code,
           a.fm_dept_code,
           a.fm_dept_name,
           a.fm_dept_type_code,
           a.fm_dept_type_name,
           a.fm_func_code,
           a.fm_func_name,
           a.fm_reso_code,
           a.fm_reso_name,
           a.fm_acti_code      fm_acti_type_code,
           a.fm_acti_name      fm_acti_type_name,
           b.fm_acti_code,
           b.fm_car,
           b.fm_amt,
           a.to_dept_code,
           a.to_dept_name,
           a.to_dept_type_code,
           a.to_dept_type_name,
           a.to_func_code,
           a.to_func_name,
           a.to_reso_code,
           a.to_reso_name,
           a.to_acti_code,
           a.to_acti_name,
           b.fm_car            to_car,
           a.dist_type,
           a.driv_code,
           a.driv_name
      from abc_fct_aa_dist_tmp01 a
      left join abc_fct_aa_dist_tmp02 b
        on a.fm_dept_code = b.fm_dept_code
       and a.fm_func_code = b.fm_func_code
       and a.fm_reso_code = b.fm_reso_code
       and a.fm_acti_code = b.fm_acti_type_code;

  v_sqlstate := '生成动因';
  insert into abc_fct_aa_dist_tmp04
    select a.mode_code,
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
           a.fm_amt,
           a.to_dept_code,
           a.to_dept_name,
           a.to_dept_type_code,
           a.to_dept_type_name,
           a.to_func_code,
           a.to_func_name,
           a.to_reso_code,
           a.to_reso_name,
           a.to_acti_code to_acti_type_code,
           a.to_acti_name to_acti_type_name,
           b.acti_code to_acti_code,
           a.to_car,
           a.dist_type,
           a.driv_code,
           a.driv_name,
           b.qty,
           sum(b.qty) over(partition by a.fm_dept_code, a.fm_func_code, a.fm_reso_code, a.fm_acti_code, a.fm_car) all_qty
      from abc_fct_aa_dist_tmp03 a
      left join abc_fct_aa_driv b
        on a.to_dept_code = b.dept_code
       and a.to_func_code = b.func_code
       and nvl(a.to_car, 'abc') = nvl(b.car_no, 'abc')
       and a.to_acti_code = substr(b.acti_code, 0, 6)
       and nvl(substr(a.fm_acti_code, 8), 'abc') =
           nvl(substr(b.acti_code, 8), 'abc')
       and a.driv_code = b.driv_code
       and b.month_code = v_month;

  v_sqlstate := '生成分摊结果';
  insert into abc_fct_aa_dist
    select mode_code,
           v_month month_code,
           fm_dept_code,
           fm_dept_name,
           fm_dept_type_code,
           fm_dept_type_name,
           fm_func_code,
           fm_func_name,
           fm_reso_code,
           fm_reso_name,
           fm_acti_type_code,
           fm_acti_type_name,
           fm_acti_code,
           fm_car,
           fm_amt,
           to_dept_code,
           to_dept_name,
           to_dept_type_code,
           to_dept_type_name,
           to_func_code,
           to_func_name,
           to_reso_code,
           to_reso_name,
           to_acti_type_code,
           to_acti_type_name,
           to_acti_code,
           to_car,
           dist_type,
           driv_code,
           driv_name,
           qty,
           all_qty,
           case
             when a.driv_code in ('RR001', 'RA001', 'AA001', 'AO001') then
              a.fm_amt
             else
              a.fm_amt * a.qty / a.all_qty
           end to_amt,
           sysdate load_tm
      from abc_fct_aa_dist_tmp04 a;
  commit;
  v_sqlstate := '结束';

exception
  when others then
    rollback;
    commit;
  
end p_abc_fct_aa_dist;
/
