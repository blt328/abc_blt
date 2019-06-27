create or replace procedure p_abc_fct_aa_driv(p_to_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-15
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-27  生成AA动因
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  --自定义变量
  v_fm_date date;
  v_to_date date;
  v_month   varchar2(10);
begin
  v_sqlstate  := '变量赋值';
  v_proc_name := 'p_abc_fct_aa_driv';
  v_fm_date   := trunc(add_months(p_to_dt, -1), 'MM');
  v_to_date   := trunc(p_to_dt, 'MM');
  v_month     := to_char(v_fm_date, 'YYYYMM');

  v_sqlstate := '删除数据';
  delete abc_fct_aa_driv a
   where a.month_code = v_month
     and a.driv_code in ('AA002', 'AA003', 'AA004');

  v_sqlstate := '生成动因';
  insert into abc_fct_aa_driv
    select to_char(a.op_dt, 'YYYYMM') month_code,
           a.op_dept_code,
           c.dept_type,
           c.dept_type_name,
           d.func_code,
           d.func_name,
           d.acti_code || '_' || a.line_code,
           d.acti_name,
           a.car_no,
           d.driv_code,
           d.driv_name,
           sum(case
                 when substr(d.acti_code, 5, 2) = '10' and a.wt >= 3000 then
                  3000
                 when substr(d.acti_code, 5, 2) = '10' and a.wt < 3000 then
                  a.wt
                 when substr(d.acti_code, 5, 2) = '20' and a.wt >= 3000 then
                  0
                 when substr(d.acti_code, 5, 2) = '20' and a.wt < 3000 then
                  3000 - a.wt
               end) qty,
           sysdate load_tm
      from (select trunc(a.op_dt, 'DD') op_dt,
                   a.op_dept_code,
                   a.car_no,
                   a.line_code,
                   sum(a.waybill_wt) wt
              from abc_bsl_op_waybill a
             where to_char(a.op_dt, 'YYYYMM') = v_month
             group by trunc(a.op_dt, 'DD'),
                      a.op_dept_code,
                      a.car_no,
                      a.line_code) a
      left join abc_dim_line b
        on to_char(a.op_dt, 'YYYYMM') = b.month_code
       and a.line_code = b.line_code
      left join abc_dim_dept c
        on a.op_dept_code = c.dept_code
       and c.fm_tm <= v_fm_date
       and c.to_tm >= v_fm_date
      left join abc_rel_driv_logic d
        on b.line_type = d.line_leve
       and c.dept_type = d.dept_type
       and d.driv_code = 'AA002'
       and d.fm_tm <= v_fm_date
       and d.to_tm >= v_fm_date
     where d.driv_code is not null
     group by to_char(a.op_dt, 'YYYYMM'),
              a.op_dept_code,
              c.dept_type,
              c.dept_type_name,
              d.func_code,
              d.func_name,
              d.acti_code || '_' || a.line_code,
              d.acti_name,
              a.car_no,
              d.driv_code,
              d.driv_name;

  insert into abc_fct_aa_driv
    select to_char(a.op_dt, 'YYYYMM') month_code,
           a.op_dept_code,
           c.dept_type,
           c.dept_type_name,
           d.func_code,
           d.func_name,
           d.acti_code,
           d.acti_name,
           null car_no,
           d.driv_code,
           d.driv_name,
           count(1) qty,
           sysdate load_tm
      from abc_bsl_op_waybill a
      left join abc_dim_dept c
        on a.op_dept_code = c.dept_code
       and c.fm_tm <= v_fm_date
       and c.to_tm >= v_fm_date
      left join abc_rel_driv_logic d
        on a.is_pkg = d.pkg_state
       and c.dept_type = d.dept_type
       and d.driv_code = 'AA003'
       and d.fm_tm <= v_fm_date
       and d.to_tm >= v_fm_date
     where to_char(a.op_dt, 'YYYYMM') = v_month
       and d.driv_code is not null
     group by to_char(a.op_dt, 'YYYYMM'),
              a.op_dept_code,
              c.dept_type,
              c.dept_type_name,
              d.func_code,
              d.func_name,
              d.acti_code,
              d.acti_name,
              d.driv_code,
              d.driv_name;

  insert into abc_fct_aa_driv
    select to_char(a.op_dt, 'YYYYMM') month_code,
           a.op_dept_code,
           c.dept_type,
           c.dept_type_name,
           d.func_code,
           d.func_name,
           d.acti_code,
           d.acti_name,
           null car_no,
           d.driv_code,
           d.driv_name,
           count(1) qty,
           sysdate load_tm
      from abc_bsl_op_waybill a
      left join abc_dim_dept c
        on a.op_dept_code = c.dept_code
       and c.fm_tm <= v_fm_date
       and c.to_tm >= v_fm_date
      left join abc_rel_driv_logic d
        on a.is_pkg = d.pkg_state
       and a.op_code = d.op_code
       and c.dept_type = d.dept_type
       and d.driv_code = 'AA004'
       and d.fm_tm <= v_fm_date
       and d.to_tm >= v_fm_date
     where to_char(a.op_dt, 'YYYYMM') = v_month
       and d.driv_code is not null
     group by to_char(a.op_dt, 'YYYYMM'),
              a.op_dept_code,
              c.dept_type,
              c.dept_type_name,
              d.func_code,
              d.func_name,
              d.acti_code,
              d.acti_name,
              d.driv_code,
              d.driv_name;
  commit;
  v_sqlstate := '结束';

exception
  when others then
    rollback;
    commit;
  
end p_abc_fct_aa_driv;
/
