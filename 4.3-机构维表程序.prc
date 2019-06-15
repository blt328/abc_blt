create or replace procedure p_abc_dim_dept(p_dt       date default sysdate, --to����
                                           v_init_flg number default 0 --1����ʼ�� 0���ǳ�ʼ��
                                           ) is
  /*************************************************************
   author  : blt
   created : 2019-05-04
   purpose :
   version  modify  time        desc
   -------  -----   ----------  -------------------------------
   v1.0     blt     2019-05-04  ���ɻ���ά��
  **************************************************************/

  v_sqlstate  varchar2(1000);
  v_proc_name varchar2(300);
  v_rowcount  number(12);
  --�Զ������
  v_fm_date   date;
  v_max_sgkey number;
begin
  v_sqlstate  := '������ֵ';
  v_proc_name := 'P_ABC_DIM_DEPT';
  v_fm_date   := trunc(p_dt, 'MM');

  v_sqlstate := '�����ʱ��';
  execute immediate 'TRUNCATE TABLE ABC_DIM_DEPT_TMP01';
  execute immediate 'TRUNCATE TABLE ABC_DIM_DEPT_TMP02';
  execute immediate 'TRUNCATE TABLE ABC_DIM_DEPT_TMP03';

  v_sqlstate := '��ʼ��ɾ������';
  if v_init_flg = 1 then
    delete abc_dim_dept;
  end if;

  v_sqlstate := '�õ�ASU����·��';
  insert into abc_dim_dept_tmp01
    select dept_code,
           dept_name,
           dept_type,
           dept_type_name,
           parent_code,
           city_code,
           level type_level,
           sys_connect_by_path(dept_code, '@') || '@' code_path,
           sys_connect_by_path(dept_name, '@') || '@' name_path
      from (select dept_code,
                   dept_name,
                   dept_type,
                   dept_type_name,
                   parent_code,
                   city_code
              from ods_dept a) t
     start with parent_code is null --�Ӽ���������
    connect by parent_code = prior dept_code;

  v_sqlstate := '�õ�������ƽ��';
  insert into abc_dim_dept_tmp02
    select a.code_path,
           nvl(regexp_substr(code_path, '[^@]+', 1, type_level), '') dept_code,
           nvl(regexp_substr(name_path, '[^@]+', 1, type_level), '') dept_name,
           case
             when v_init_flg = 1 then
              date '1993-03-01' --��ʼ��ʱ��ʼ������ʼʱ��Ĵ������ڵ��µ�һ��
             else
              v_fm_date
           end fm_tm, --��ʼʱ��
           to_date('9999-12-31', 'YYYY-MM-DD') to_tm,
           nvl(regexp_substr(code_path, '[^@]+', 1, 1),
               nvl(regexp_substr(code_path, '[^@]+', 1, type_level), '')) level1_code,
           nvl(regexp_substr(name_path, '[^@]+', 1, 1),
               nvl(regexp_substr(name_path, '[^@]+', 1, type_level), '')) level1_name,
           nvl(regexp_substr(code_path, '[^@]+', 1, 2),
               nvl(regexp_substr(code_path, '[^@]+', 1, type_level), '')) level2_code,
           nvl(regexp_substr(name_path, '[^@]+', 1, 2),
               nvl(regexp_substr(name_path, '[^@]+', 1, type_level), '')) level2_name,
           nvl(regexp_substr(code_path, '[^@]+', 1, 3),
               nvl(regexp_substr(code_path, '[^@]+', 1, type_level), '')) level3_code,
           nvl(regexp_substr(name_path, '[^@]+', 1, 3),
               nvl(regexp_substr(name_path, '[^@]+', 1, type_level), '')) level3_name,
           nvl(regexp_substr(code_path, '[^@]+', 1, 4),
               nvl(regexp_substr(code_path, '[^@]+', 1, type_level), '')) level4_code,
           nvl(regexp_substr(name_path, '[^@]+', 1, 4),
               nvl(regexp_substr(name_path, '[^@]+', 1, type_level), '')) level4_name,
           nvl(regexp_substr(code_path, '[^@]+', 1, 5),
               nvl(regexp_substr(code_path, '[^@]+', 1, type_level), '')) level5_code,
           nvl(regexp_substr(name_path, '[^@]+', 1, 5),
               nvl(regexp_substr(name_path, '[^@]+', 1, type_level), '')) level5_name,
           dept_type,
           dept_type_name,
           parent_code,
           city_code,
           type_level
      from abc_dim_dept_tmp01 a;

  v_sqlstate := 'ȡ��������ABC�������������';
  select nvl(max(dept_id), 0) into v_max_sgkey from abc_dim_dept;

  insert into abc_dim_dept_tmp03
    select nvl(b.dept_id,
               v_max_sgkey + row_number()
               over(partition by b.dept_id order by b.dept_id)) dept_id, --����״̬��¼�����´����
           a.dept_code,
           a.dept_name,
           a.dept_type,
           a.dept_type_name,
           a.fm_tm,
           a.to_tm,
           a.level1_code,
           a.level1_name,
           a.level2_code,
           a.level2_name,
           a.level3_code,
           a.level3_name,
           a.level4_code,
           a.level4_name,
           a.level5_code,
           a.level5_name,
           a.parent_code,
           a.city_code,
           a.type_level
      from abc_dim_dept_tmp02 a
      left join abc_dim_dept b
        on a.dept_code || a.dept_name || a.dept_type || a.level1_code ||
           a.level1_name || a.level2_code || a.level2_name || a.level3_code ||
           a.level3_name || a.level4_code || a.level4_name || a.level5_code ||
           a.level5_name || a.parent_code =
           b.dept_code || b.dept_name || b.dept_type || b.level1_code ||
           b.level1_name || b.level2_code || b.level2_name || b.level3_code ||
           b.level3_name || b.level4_code || b.level4_name || b.level5_code ||
           b.level5_name || b.parent_code
       and b.to_tm = date '9999-12-31';

  v_sqlstate := '�����б���İ�������ABC�������ڵ�ǰһ��';
  update abc_dim_dept a
     set a.to_tm = v_fm_date - 1, load_tm = sysdate
   where a.to_tm = date
   '9999-12-31'
     and a.dept_code in (select b.dept_code
                           from abc_dim_dept_tmp03 b
                          where b.dept_id > v_max_sgkey);
  commit;

  v_sqlstate := '�����°�������ABC��������';
  insert into abc_dim_dept
    (dept_id,
     dept_code,
     dept_name,
     dept_type,
     dept_type_name,
     fm_tm,
     to_tm,
     level1_code,
     level1_name,
     level2_code,
     level2_name,
     level3_code,
     level3_name,
     level4_code,
     level4_name,
     level5_code,
     level5_name,
     parent_code,
     city_code,
     type_level,
     load_tm)
    select dept_id,
           dept_code,
           dept_name,
           dept_type,
           dept_type_name,
           fm_tm,
           to_tm,
           level1_code,
           level1_name,
           level2_code,
           level2_name,
           level3_code,
           level3_name,
           level4_code,
           level4_name,
           level5_code,
           level5_name,
           parent_code,
           city_code,
           type_level,
           sysdate load_tm
      from abc_dim_dept_tmp03 a
     where a.dept_id > v_max_sgkey;
  commit;

  v_sqlstate := 'ɾ��ASU_DEPT��Ч��������';
  delete abc_dim_dept a where a.fm_tm > a.to_tm;
  commit;
  v_sqlstate := '����';

exception
  when others then
    rollback;
    commit;
  
end p_abc_dim_dept;
/
