create or replace procedure p_abc_bsl_op_waybill(p_fm_dt date default sysdate,
                                                 p_to_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-15
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-15  Éú³ÉÔËµ¥²Ù×÷»ù´¡±í
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  v_rowcount  number(12);
  --×Ô¶¨Òå±äÁ¿
  v_fm_date date;
  v_to_date date;
  v_month   varchar2(10);
  v_pkg     int;
begin
  v_sqlstate  := '±äÁ¿¸³Öµ';
  v_proc_name := 'p_abc_bsl_op_waybill';
  v_fm_date   := trunc(p_fm_dt, 'MM');
  v_to_date   := trunc(p_to_dt, 'MM');
  v_month     := to_char(v_fm_date, 'YYYYMM');
  v_pkg       := 0;

  v_sqlstate := 'É¾³ýÊý¾Ý';
  delete abc_bsl_op_waybill a
   where a.op_dt >= v_fm_date
     and a.op_dt <= v_to_date;

  delete abc_dim_line a where a.month_code = v_month;

  while v_fm_date <= v_to_date loop
    --ÔËµ¥ÐÅÏ¢
    for v_waybill in (select *
                        from abc_bsl_waybill a
                       where a.rec_dt = v_fm_date) loop
      select mod(round(dbms_random.value(0, 10), 0), 2)
        into v_pkg
        from dual;
      if v_waybill.rec_city <> v_waybill.send_city then
        --ÊÕ¶Ë³µÅÆÐÅÏ¢
        for v_car in (select *
                        from (select b.*,
                                     row_number() over(order by dbms_random.value(0, 10)) rn
                                from ods_subj_acco b
                               where b.month_code =
                                     to_char(v_fm_date, 'YYYYMM')
                                 and b.dept_code = v_waybill.rec_dept
                                 and b.car_no is not null) t
                       where t.rn = 1) loop
          insert into abc_bsl_op_waybill
          values
            (v_fm_date,
             v_waybill.rec_dept,
             '30',
             '×°³µ',
             v_waybill.waybill_no,
             v_car.car_no,
             v_waybill.rec_dept || v_waybill.rec_city || 'W',
             v_pkg,
             v_waybill.wt,
             sysdate);
        end loop;
        commit;
        --ÅÉ¶Ë³µÅÆÐÅÏ¢
        for v_car in (select *
                        from (select b.*,
                                     row_number() over(order by dbms_random.value(0, 10)) rn
                                from ods_subj_acco b
                               where b.month_code =
                                     to_char(v_fm_date, 'YYYYMM')
                                 and b.dept_code = v_waybill.send_dept
                                 and b.car_no is not null) t
                       where t.rn = 1) loop
          insert into abc_bsl_op_waybill
          values
            (v_fm_date,
             v_waybill.send_dept,
             '31',
             'Ð¶³µ',
             v_waybill.waybill_no,
             v_car.car_no,
             v_waybill.send_city || 'W' || v_waybill.send_dept,
             v_pkg,
             v_waybill.wt,
             sysdate);
        end loop;
        commit;
      end if;
      --ÖÐ×ª³µÅÆÐÅÏ¢
      for v_car in (select *
                      from (select b.*,
                                   row_number() over(order by dbms_random.value(0, 10)) rn
                              from ods_subj_acco b
                             where b.month_code =
                                   to_char(v_fm_date, 'YYYYMM')
                               and substr(b.dept_code, 0, 3) =
                                   v_waybill.send_city
                               and b.dept_code like '%W'
                               and b.car_no is not null) t
                     where t.rn = 1) loop
        insert into abc_bsl_op_waybill
        values
          (v_fm_date,
           v_car.dept_code,
           '30',
           '×°³µ',
           v_waybill.waybill_no,
           v_car.car_no,
           v_waybill.rec_city || 'W' || v_waybill.send_city || 'W',
           v_pkg,
           v_waybill.wt,
           sysdate);
      end loop;
      commit;
    end loop;
    v_fm_date := v_fm_date + 1;
  end loop;

  v_sqlstate := 'Éú³ÉÏßÂ·Ö÷Êý¾Ý';
  insert into abc_dim_line
    select t.month_code,
           t.line_code,
           case
             when t.line_code like '%W%W' then
              round(t.main_km, 0)
             else
              round(t.bir_km, 0)
           end line_km,
           case
             when t.line_code like '%W%W' then
              '20'
             else
              '10'
           end line_type,
           sysdate load_tm
      from (select to_char(a.op_dt, 'YYYYMM') month_code,
                   a.line_code,
                   dbms_random.value(20, 50) bir_km,
                   dbms_random.value(100, 300) main_km
              from abc_bsl_op_waybill a
             where to_char(a.op_dt, 'YYYYMM') = v_month
             group by to_char(a.op_dt, 'YYYYMM'), a.line_code) t;
  commit;
  v_sqlstate := '½áÊø';

exception
  when others then
    rollback;
    commit;
  
end p_abc_bsl_op_waybill;
/
