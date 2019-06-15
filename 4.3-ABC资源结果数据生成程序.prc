create or replace procedure p_abc_fct_reso_list(p_fm_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-15
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-15  生成ABC资源结果表
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  v_rowcount  number(12);
  --自定义变量
  v_yyyymm varchar2(1000);
begin
  v_sqlstate  := '变量赋值';
  v_proc_name := 'p_abc_fct_reso_list';
  v_yyyymm    := to_char(p_fm_dt, 'YYYYMM');

  v_sqlstate := '删除数据';
  delete abc_fct_reso_list a where a.month_code = v_yyyymm;

  v_sqlstate := '生成资源结果表';
  insert into abc_fct_reso_list
    select a.month_code,
           a.dept_code,
           c.dept_type,
           c.dept_type_name,
           case
             when b.reso_code = 'ZY0301' then
              '1030'
             else
              '5010'
           end func_code,
           case
             when b.reso_code = 'ZY0301' then
              '运输'
             else
              '公共'
           end func_code,
           a.car_no,
           b.reso_code,
           b.reso_name,
           sum(a.amt) amt,
           sysdate load_tm
      from ods_subj_acco a
      left join abc_rel_subj_reso b
        on a.subj_code = b.subj_code
       and to_char(b.fm_dt, 'YYYYMM') <= v_yyyymm
       and to_char(b.to_dt, 'YYYYMM') >= v_yyyymm
      left join abc_dim_dept c
        on a.dept_code = c.dept_code
       and to_char(c.fm_tm, 'YYYYMM') <= v_yyyymm
       and to_char(c.to_tm, 'YYYYMM') >= v_yyyymm
     where a.month_code = v_yyyymm
     group by a.month_code,
              a.dept_code,
              c.dept_type,
              c.dept_type_name,
              case
                when b.reso_code = 'ZY0301' then
                 '1030'
                else
                 '5010'
              end,
              case
                when b.reso_code = 'ZY0301' then
                 '运输'
                else
                 '公共'
              end,
              a.car_no,
              b.reso_code,
              b.reso_name;

  commit;
  v_sqlstate := '结束';

exception
  when others then
    rollback;
    commit;
  
end p_abc_fct_reso_list;
/
