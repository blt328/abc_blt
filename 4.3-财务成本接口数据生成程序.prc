create or replace procedure p_abc_data_subj_acco(p_fm_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-15
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-15  生成财务成本接口表信息
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  v_rowcount  number(12);
  --自定义变量
  v_yyyymm varchar2(1000);
  v_cnt    number;
  v_pep    number; --人工成本比率
  v_div    number; --设备成本比率
  v_mate   number; --物料成本比率
  v_car    number; --车辆成本比率
  v_fot    number; --生鲜成本比率
begin
  v_sqlstate  := '变量赋值';
  v_proc_name := 'p_abc_data_subj_acco';
  v_yyyymm    := to_char(p_fm_dt, 'YYYYMM');
  v_cnt       := 0; --记录数

  delete ods_subj_acco a where a.month_code = v_yyyymm;

  v_sqlstate := '生成接口数据';
  for v_waybill in (select * from abc_bsl_waybill) loop
    v_sqlstate := '生成比率';
    select dbms_random.value(0, 10) / 3,
           dbms_random.value(0, 5) / 2,
           dbms_random.value(0, 3),
           dbms_random.value(0, 5) / 2,
           dbms_random.value(0, 3)
      into v_pep, v_div, v_mate, v_car, v_fot
      from dual;
    for v_sub in (select * from abc_rel_subj_reso) loop
      if v_sub.reso_name = '薪酬福利' then
        --收件网点
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.rec_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           '收派',
           null,
           v_waybill.amt * v_pep / 100,
           sysdate);
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.rec_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           '管理',
           null,
           v_waybill.amt * v_pep / 100,
           sysdate);
        --派件网点
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.send_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           '收派',
           null,
           v_waybill.amt * v_pep / 100,
           sysdate);
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.send_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           '管理',
           null,
           v_waybill.amt * v_pep / 100,
           sysdate);
        --生成总部成本
        insert into ods_subj_acco
        values
          (v_yyyymm,
           '100',
           v_sub.subj_code,
           v_sub.subj_name,
           '管理',
           null,
           v_waybill.amt * v_pep / 100,
           sysdate);
        --生成业务区和分拨区成本
        for v_dept in (select *
                         from abc_dim_dept a
                        where to_char(a.fm_tm, 'YYYYMM') <= v_yyyymm
                          and to_char(a.to_tm, 'YYYYMM') >= v_yyyymm
                          and (a.dept_type = 'YYC' or a.dept_type = 'FBC')
                          and (a.city_code = v_waybill.rec_city or
                               a.city_code = v_waybill.send_city)) loop
          insert into ods_subj_acco
          values
            (v_yyyymm,
             v_dept.dept_code,
             v_sub.subj_code,
             v_sub.subj_name,
             '管理',
             null,
             v_waybill.amt * v_pep / 100,
             sysdate);
        end loop;
      end if;
      if v_sub.reso_name = '运输费' then
        --收件网点
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.rec_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           null,
           v_waybill.rec_city || '-' ||
           lpad(round(dbms_random.value(0, 15), 0), 5, '0'),
           v_waybill.amt * v_car / 100,
           sysdate);
        --派件网点
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.send_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           null,
           v_waybill.send_city || '-' ||
           lpad(round(dbms_random.value(0, 15), 0), 5, '0'),
           v_waybill.amt * v_car / 100,
           sysdate);
        --生成中转场车辆成本
        for v_dept in (select *
                         from abc_dim_dept a
                        where to_char(a.fm_tm, 'YYYYMM') <= v_yyyymm
                          and to_char(a.to_tm, 'YYYYMM') >= v_yyyymm
                          and a.dept_type = 'ZZC'
                          and (a.city_code = v_waybill.rec_city or
                               a.city_code = v_waybill.send_city)) loop
          insert into ods_subj_acco
          values
            (v_yyyymm,
             v_dept.dept_code,
             v_sub.subj_code,
             v_sub.subj_name,
             null,
             v_dept.city_code || '-' ||
             lpad(round(dbms_random.value(0, 15), 0), 5, '0'),
             v_waybill.amt * v_car / 100,
             sysdate);
        end loop;
      end if;
      if v_sub.reso_name = '设备折旧' then
        --收件网点
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.rec_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           null,
           null,
           v_waybill.amt * v_div / 100,
           sysdate);
        --派件网点
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.send_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           null,
           null,
           v_waybill.amt * v_div / 100,
           sysdate);
      end if;
      if v_sub.reso_name = '物料费' then
        --收件网点
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.rec_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           null,
           null,
           v_waybill.amt * v_mate / 100,
           sysdate);
      end if;
      if v_sub.reso_name = '生鲜物料费' and v_waybill.prod_name = '电商' then
        --收件网点
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.rec_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           null,
           null,
           v_waybill.amt * v_fot / 100,
           sysdate);
      end if;
    end loop;
  end loop;

  commit;
  v_sqlstate := '结束';

exception
  when others then
    rollback;
    commit;
  
end p_abc_data_subj_acco;
/
