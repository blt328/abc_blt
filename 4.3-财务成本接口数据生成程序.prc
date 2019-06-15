create or replace procedure p_abc_data_subj_acco(p_fm_dt date default sysdate) is
  /*************************************************************
   author  : blt
   created : 2019-06-15
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-06-15  ���ɲ���ɱ��ӿڱ���Ϣ
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  v_rowcount  number(12);
  --�Զ������
  v_yyyymm varchar2(1000);
  v_cnt    number;
  v_pep    number; --�˹��ɱ�����
  v_div    number; --�豸�ɱ�����
  v_mate   number; --���ϳɱ�����
  v_car    number; --�����ɱ�����
  v_fot    number; --���ʳɱ�����
begin
  v_sqlstate  := '������ֵ';
  v_proc_name := 'p_abc_data_subj_acco';
  v_yyyymm    := to_char(p_fm_dt, 'YYYYMM');
  v_cnt       := 0; --��¼��

  delete ods_subj_acco a where a.month_code = v_yyyymm;

  v_sqlstate := '���ɽӿ�����';
  for v_waybill in (select * from abc_bsl_waybill) loop
    v_sqlstate := '���ɱ���';
    select dbms_random.value(0, 10) / 3,
           dbms_random.value(0, 5) / 2,
           dbms_random.value(0, 3),
           dbms_random.value(0, 5) / 2,
           dbms_random.value(0, 3)
      into v_pep, v_div, v_mate, v_car, v_fot
      from dual;
    for v_sub in (select * from abc_rel_subj_reso) loop
      if v_sub.reso_name = 'н�긣��' then
        --�ռ�����
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.rec_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           '����',
           null,
           v_waybill.amt * v_pep / 100,
           sysdate);
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.rec_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           '����',
           null,
           v_waybill.amt * v_pep / 100,
           sysdate);
        --�ɼ�����
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.send_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           '����',
           null,
           v_waybill.amt * v_pep / 100,
           sysdate);
        insert into ods_subj_acco
        values
          (v_yyyymm,
           v_waybill.send_dept,
           v_sub.subj_code,
           v_sub.subj_name,
           '����',
           null,
           v_waybill.amt * v_pep / 100,
           sysdate);
        --�����ܲ��ɱ�
        insert into ods_subj_acco
        values
          (v_yyyymm,
           '100',
           v_sub.subj_code,
           v_sub.subj_name,
           '����',
           null,
           v_waybill.amt * v_pep / 100,
           sysdate);
        --����ҵ�����ͷֲ����ɱ�
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
             '����',
             null,
             v_waybill.amt * v_pep / 100,
             sysdate);
        end loop;
      end if;
      if v_sub.reso_name = '�����' then
        --�ռ�����
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
        --�ɼ�����
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
        --������ת�������ɱ�
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
      if v_sub.reso_name = '�豸�۾�' then
        --�ռ�����
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
        --�ɼ�����
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
      if v_sub.reso_name = '���Ϸ�' then
        --�ռ�����
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
      if v_sub.reso_name = '�������Ϸ�' and v_waybill.prod_name = '����' then
        --�ռ�����
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
  v_sqlstate := '����';

exception
  when others then
    rollback;
    commit;
  
end p_abc_data_subj_acco;
/
