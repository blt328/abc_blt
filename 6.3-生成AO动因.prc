create or replace procedure p_abc_fct_ao_driv(p_to_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-15
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-27  生成AO动因
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  --自定义变量
  v_fm_date date;
  v_to_date date;
  v_month   varchar2(10);
begin
  v_sqlstate  := '变量赋值';
  v_proc_name := 'p_abc_fct_ao_driv';
  v_fm_date   := trunc(add_months(p_to_dt, -1), 'MM');
  v_to_date   := trunc(p_to_dt, 'MM');
  v_month     := to_char(v_fm_date, 'YYYYMM');

  v_sqlstate := '删除数据';
  delete abc_fct_ao_driv a
   where a.month_code = v_month
     and a.driv_code in ('AO002',
                         'AO003',
                         'AO004',
                         'AO005',
                         'AO006',
                         'AO007',
                         'AO008',
                         'AO009',
                         'AO010');

  v_sqlstate := '生成动因';
  insert into abc_fct_ao_driv
    select to_char(a.rec_dt, 'YYYYMM') month_code,
           a.rec_dept,
           b.dept_type,
           b.dept_type_name,
           c.func_code,
           c.func_name,
           c.acti_code,
           c.acti_name,
           null car_no,
           c.driv_code,
           c.driv_name,
           1 qty,
           a.waybill_no,
           sysdate load_tm
      from abc_bsl_waybill a
      left join abc_dim_dept b
        on a.rec_dept = b.dept_code
       and b.fm_tm <= v_fm_date
       and b.to_tm >= v_fm_date
     inner join abc_rel_driv_logic c
        on b.dept_type = c.dept_type
       and c.driv_code = 'AO002'
     where a.rec_dt >= v_fm_date
       and a.rec_dt < v_to_date;

  insert into abc_fct_ao_driv
    select to_char(a.rec_dt, 'YYYYMM') month_code,
           a.send_dept,
           b.dept_type,
           b.dept_type_name,
           c.func_code,
           c.func_name,
           c.acti_code,
           c.acti_name,
           null car_no,
           c.driv_code,
           c.driv_name,
           1 qty,
           a.waybill_no,
           sysdate load_tm
      from abc_bsl_waybill a
      left join abc_dim_dept b
        on a.send_dept = b.dept_code
       and b.fm_tm <= v_fm_date
       and b.to_tm >= v_fm_date
     inner join abc_rel_driv_logic c
        on b.dept_type = c.dept_type
       and c.driv_code = 'AO003'
     where a.rec_dt >= v_fm_date
       and a.rec_dt < v_to_date;

  insert into abc_fct_ao_driv
    select to_char(a.rec_dt, 'YYYYMM') month_code,
           a.rec_dept,
           b.dept_type,
           b.dept_type_name,
           c.func_code,
           c.func_name,
           c.acti_code,
           c.acti_name,
           null car_no,
           c.driv_code,
           c.driv_name,
           1 qty,
           a.waybill_no,
           sysdate load_tm
      from abc_bsl_waybill a
      left join abc_dim_dept b
        on a.rec_dept = b.dept_code
       and b.fm_tm <= v_fm_date
       and b.to_tm >= v_fm_date
     inner join abc_rel_driv_logic c
        on b.dept_type = c.dept_type
       and c.driv_code = 'AO004'
     where a.rec_dt >= v_fm_date
       and a.rec_dt < v_to_date;

  insert into abc_fct_ao_driv
    select to_char(a.rec_dt, 'YYYYMM') month_code,
           a.send_dept,
           b.dept_type,
           b.dept_type_name,
           c.func_code,
           c.func_name,
           c.acti_code,
           c.acti_name,
           null car_no,
           c.driv_code,
           c.driv_name,
           1 qty,
           a.waybill_no,
           sysdate load_tm
      from abc_bsl_waybill a
      left join abc_dim_dept b
        on a.send_dept = b.dept_code
       and b.fm_tm <= v_fm_date
       and b.to_tm >= v_fm_date
     inner join abc_rel_driv_logic c
        on b.dept_type = c.dept_type
       and c.driv_code = 'AO004'
     where a.rec_dt >= v_fm_date
       and a.rec_dt < v_to_date;

  insert into abc_fct_ao_driv
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
           a.waybill_wt qty,
           a.waybill_no,
           sysdate load_tm
      from abc_bsl_op_waybill a
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
       and d.driv_code = 'AO005'
       and d.fm_tm <= v_fm_date
       and d.to_tm >= v_fm_date
     where to_char(a.op_dt, 'YYYYMM') = v_month
       and d.driv_code is not null;

  insert into abc_fct_ao_driv
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
           1 qty,
           a.waybill_no,
           sysdate load_tm
      from abc_bsl_op_waybill a
      left join abc_dim_dept c
        on a.op_dept_code = c.dept_code
       and c.fm_tm <= v_fm_date
       and c.to_tm >= v_fm_date
      left join abc_rel_driv_logic d
        on a.is_pkg = d.pkg_state
       and c.dept_type = d.dept_type
       and d.driv_code in ('AO006', 'AO007')
       and d.fm_tm <= v_fm_date
       and d.to_tm >= v_fm_date
     where to_char(a.op_dt, 'YYYYMM') = v_month
       and d.driv_code is not null;

  insert into abc_fct_ao_driv
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
           1 qty,
           a.waybill_no,
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
       and d.driv_code in ('AO008', 'AO009')
       and d.fm_tm <= v_fm_date
       and d.to_tm >= v_fm_date
     where to_char(a.op_dt, 'YYYYMM') = v_month
       and d.driv_code is not null;

  insert into abc_fct_ao_driv
    select to_char(a.rec_dt, 'YYYYMM') month_code,
           a.rec_dept,
           b.dept_type,
           b.dept_type_name,
           c.func_code,
           c.func_name,
           c.acti_code,
           c.acti_name,
           null car_no,
           c.driv_code,
           c.driv_name,
           1 qty,
           a.waybill_no,
           sysdate load_tm
      from abc_bsl_waybill a
      left join abc_dim_dept b
        on a.rec_dept = b.dept_code
       and b.fm_tm <= v_fm_date
       and b.to_tm >= v_fm_date
     inner join abc_rel_driv_logic c
        on a.prod_code = c.prod_code
       and b.dept_type = c.dept_type
       and c.driv_code = 'AO010'
     where a.rec_dt >= v_fm_date
       and a.rec_dt < v_to_date;

  commit;
  v_sqlstate := '结束';

exception
  when others then
    rollback;
    commit;
  
end p_abc_fct_ao_driv;
/
