create or replace procedure p_abc_data_waybill(p_fm_dt date default sysdate,
                                               p_to_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-15
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-15  生成运单信息
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  v_rowcount  number(12);
  --自定义变量
  v_fm_date date;
  v_to_date date;
  v_cnt     number;
  v_wt      number;
  v_rd      number;
begin
  v_sqlstate  := '变量赋值';
  v_proc_name := 'p_abc_data_waybill';
  v_fm_date   := trunc(p_fm_dt, 'DD');
  v_to_date   := trunc(p_to_dt, 'DD');
  v_cnt       := 0; --记录数
  v_wt        := 0; --重量
  v_rd        := 0; --随机数用于产品和客户

  while v_fm_date <= v_to_date loop
    v_sqlstate := '删除当天的收件运单信息';
    delete abc_bsl_waybill a where a.rec_dt = v_fm_date;
    select 50 + round(dbms_random.value(0, 100), 0) into v_cnt from dual;
    v_sqlstate := '生成运单数';
    while v_cnt >= 0 loop
      select round(dbms_random.value(0, 100), 0),
             round(dbms_random.value(0, 1000), 0)
        into v_wt, v_rd
        from dual;
      for v_dept1 in (select *
                        from (select a.*,
                                     row_number() over(order by dbms_random.value(0, 10)) rn
                                from abc_dim_dept a
                               where a.dept_type = 'YYD') t
                       where t.rn = 1) loop
        for v_dept2 in (select *
                          from (select a.*,
                                       row_number() over(order by dbms_random.value(0, 10)) rn
                                  from abc_dim_dept a
                                 where a.dept_type = 'YYD') t
                         where t.rn = 1) loop
          for v_prod in (select *
                           from (select a.*,
                                        row_number() over(order by dbms_random.value(0, 10)) rn
                                   from abc_rel_prod a) t
                          where t.rn = 1) loop
            insert into abc_bsl_waybill
            values
              (to_char(v_fm_date, 'YYYYMMDD') || lpad(v_cnt, 3, '0'),
               v_fm_date,
               v_fm_date + mod(v_rd, 5),
               'C10' || mod(v_rd, 9),
               v_dept1.dept_code,
               v_dept2.dept_code,
               v_dept1.city_code,
               v_dept2.city_code,
               v_prod.prod_code,
               v_prod.prod_name,
               v_wt,
               v_prod.first_pric + v_prod.add_pric * (v_wt - 1),
               sysdate);
          end loop;
        end loop;
      end loop;
      v_cnt := v_cnt - 1;
    end loop;
    v_fm_date := v_fm_date + 1;
  end loop;

  commit;
  v_sqlstate := '结束';

exception
  when others then
    rollback;
    commit;
  
end p_abc_data_waybill;
/
