create or replace procedure p_abc_bsl_op_waybill(p_fm_dt date default sysdate,
                                                 p_to_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-15
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-15  �����˵�����������
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  v_rowcount  number(12);
  --�Զ������
  v_fm_date date;
  v_to_date date;
  v_pkg     int;
begin
  v_sqlstate  := '������ֵ';
  v_proc_name := 'p_abc_bsl_op_waybill';
  v_fm_date   := trunc(p_fm_dt, 'DD');
  v_to_date   := trunc(p_to_dt, 'DD');
  v_pkg       := 0;

  v_sqlstate := 'ɾ������';
  delete abc_bsl_op_waybill a
   where a.op_dt >= v_fm_date
     and a.op_dt <= v_to_date;

  while v_fm_date <= v_to_date loop
    --�˵���Ϣ
    for v_waybill in (select *
                        from abc_bsl_waybill a
                       where a.rec_dt = v_fm_date) loop
      select mod(dbms_random.value(0, 10), 2) into v_pkg from dual;
      if v_waybill.rec_city <> v_waybill.send_city then
        --�ն˳�����Ϣ
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
             'װ��',
             v_waybill.waybill_no,
             v_car.car_no,
             v_waybill.rec_dept || v_waybill.rec_city || 'W',
             v_pkg,
             v_waybill.wt,
             sysdate);
        end loop;
        commit;
        --�ɶ˳�����Ϣ
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
             'ж��',
             v_waybill.waybill_no,
             v_car.car_no,
             v_waybill.rec_city || 'W' || v_waybill.send_dept,
             v_pkg,
             v_waybill.wt,
             sysdate);
        end loop;
        commit;
      end if;
      --��ת������Ϣ
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
           'װ��',
           v_waybill.waybill_no,
           v_car.car_no,
           v_waybill.rec_city || 'W' || v_waybill.rec_city || 'W',
           v_pkg,
           v_waybill.wt,
           sysdate);
      end loop;
      commit;
    end loop;
    v_fm_date := v_fm_date + 1;
  end loop;
  commit;
  v_sqlstate := '����';

exception
  when others then
    rollback;
    commit;
  
end p_abc_bsl_op_waybill;
/
