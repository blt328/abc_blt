create or replace procedure p_abc_fct_rr_driv(p_to_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-15
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-27  生成RR动因
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  --自定义变量
  v_fm_date date;
  v_to_date date;
  v_month   varchar2(10);
begin
  v_sqlstate  := '变量赋值';
  v_proc_name := 'p_abc_fct_rr_driv';
  v_fm_date   := trunc(add_months(p_to_dt, -1), 'MM');
  v_to_date   := trunc(p_to_dt, 'MM');
  v_month     := to_char(v_fm_date, 'YYYYMM');

  v_sqlstate := '删除数据';
  delete abc_fct_rr_driv a
   where a.month_code = v_month
     and a.driv_code = 'RR002';

  v_sqlstate := '生成动因';
  insert into abc_fct_rr_driv
    select to_char(a.rec_dt, 'YYYYMM') month_code,
           a.rec_dept,
           b.dept_type,
           b.dept_type_name,
           c.func_code,
           c.func_name,
           c.driv_code,
           c.driv_name,
           count(1) qty,
           sysdate load_tm
      from abc_bsl_waybill a
      left join abc_dim_dept b
        on a.rec_dept = b.dept_code
       and b.fm_tm <= v_fm_date
       and b.to_tm >= v_fm_date
     inner join abc_rel_driv_logic c
        on b.dept_type = c.dept_type
       and c.driv_code = 'RR002'
       and c.func_code = '1010'
     where a.rec_dt >= v_fm_date
       and a.rec_dt < v_to_date
     group by to_char(a.rec_dt, 'YYYYMM'),
              a.rec_dept,
              b.dept_type,
              b.dept_type_name,
              c.func_code,
              c.func_name,
              c.driv_code,
              c.driv_name;

  insert into abc_fct_rr_driv
    select to_char(a.rec_dt, 'YYYYMM') month_code,
           a.send_dept,
           b.dept_type,
           b.dept_type_name,
           c.func_code,
           c.func_name,
           c.driv_code,
           c.driv_name,
           count(1) qty,
           sysdate load_tm
      from abc_bsl_waybill a
      left join abc_dim_dept b
        on a.send_dept = b.dept_code
       and b.fm_tm <= v_fm_date
       and b.to_tm >= v_fm_date
     inner join abc_rel_driv_logic c
        on b.dept_type = c.dept_type
       and c.driv_code = 'RR002'
       and c.func_code = '1020'
     where a.rec_dt >= v_fm_date
       and a.rec_dt < v_to_date
     group by to_char(a.rec_dt, 'YYYYMM'),
              a.send_dept,
              b.dept_type,
              b.dept_type_name,
              c.func_code,
              c.func_name,
              c.driv_code,
              c.driv_name;
  commit;
  v_sqlstate := '结束';

exception
  when others then
    rollback;
    commit;
  
end p_abc_fct_rr_driv;
/
