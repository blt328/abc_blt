---------------------------------------��������ű�-----------------------------------------------------------------------
-- Create table
create table ODS_DEPT
(
  dept_code      VARCHAR2(30),
  dept_name      VARCHAR2(100),
  dept_type      VARCHAR2(30),
  dept_type_name VARCHAR2(100),
  parent_code    VARCHAR2(30),
  city_code      VARCHAR2(30),
  load_tm        DATE
);
-- Add comments to the table 
comment on table ODS_DEPT
  is 'ODS������';
-- Add comments to the columns 
comment on column ODS_DEPT.dept_code
  is '���Ŵ���';
comment on column ODS_DEPT.dept_name
  is '��������';
comment on column ODS_DEPT.dept_type
  is '��������';
comment on column ODS_DEPT.dept_type_name
  is '������������';
comment on column ODS_DEPT.parent_code
  is '�����';
comment on column ODS_DEPT.city_code
  is '����';
comment on column ODS_DEPT.load_tm
  is '����ʱ��';







create table ABC_DIM_DEPT_TMP01
(
  dept_code      VARCHAR2(30),
  dept_name      VARCHAR2(100),
  dept_type      VARCHAR2(30),
  dept_type_name VARCHAR2(100),
  parent_code    VARCHAR2(30),
  city_code      VARCHAR2(30),
  type_level     NUMBER,
  code_path      VARCHAR2(4000),
  name_path      VARCHAR2(4000)
);



create table ABC_DIM_DEPT_TMP02
(
  code_path      VARCHAR2(4000),
  dept_code      VARCHAR2(4000),
  dept_name      VARCHAR2(4000),
  fm_tm          DATE,
  to_tm          DATE,
  level1_code    VARCHAR2(4000),
  level1_name    VARCHAR2(4000),
  level2_code    VARCHAR2(4000),
  level2_name    VARCHAR2(4000),
  level3_code    VARCHAR2(4000),
  level3_name    VARCHAR2(4000),
  level4_code    VARCHAR2(4000),
  level4_name    VARCHAR2(4000),
  level5_code    VARCHAR2(4000),
  level5_name    VARCHAR2(4000),
  dept_type      VARCHAR2(30),
  dept_type_name VARCHAR2(100),
  parent_code    VARCHAR2(30),
  city_code      VARCHAR2(30),
  type_level     NUMBER
);





create table ABC_DIM_DEPT_TMP03
(
  dept_id        NUMBER,
  dept_code      VARCHAR2(4000),
  dept_name      VARCHAR2(4000),
  dept_type      VARCHAR2(30),
  dept_type_name VARCHAR2(100),
  fm_tm          DATE,
  to_tm          DATE,
  level1_code    VARCHAR2(4000),
  level1_name    VARCHAR2(4000),
  level2_code    VARCHAR2(4000),
  level2_name    VARCHAR2(4000),
  level3_code    VARCHAR2(4000),
  level3_name    VARCHAR2(4000),
  level4_code    VARCHAR2(4000),
  level4_name    VARCHAR2(4000),
  level5_code    VARCHAR2(4000),
  level5_name    VARCHAR2(4000),
  parent_code    VARCHAR2(30),
  city_code      VARCHAR2(30),
  type_level     NUMBER
);





-- Create table
create table ABC_DIM_DEPT
(
  dept_id        NUMBER,
  dept_code      VARCHAR2(30),
  dept_name      VARCHAR2(100),
  dept_type      VARCHAR2(30),
  dept_type_name VARCHAR2(100),
  fm_tm          DATE,
  to_tm          DATE,
  level1_code    VARCHAR2(30),
  level1_name    VARCHAR2(100),
  level2_code    VARCHAR2(30),
  level2_name    VARCHAR2(100),
  level3_code    VARCHAR2(30),
  level3_name    VARCHAR2(100),
  level4_code    VARCHAR2(30),
  level4_name    VARCHAR2(100),
  level5_code    VARCHAR2(30),
  level5_name    VARCHAR2(100),
  parent_code    VARCHAR2(30),
  city_code      VARCHAR2(30),
  type_level     INTEGER,
  load_tm        DATE
);
-- Add comments to the table 
comment on table ABC_DIM_DEPT
  is '����ά�ȱ�';
-- Add comments to the columns 
comment on column ABC_DIM_DEPT.dept_id
  is '����ID�����';
comment on column ABC_DIM_DEPT.dept_code
  is '���Ŵ���';
comment on column ABC_DIM_DEPT.dept_name
  is '��������';
comment on column ABC_DIM_DEPT.dept_type
  is '��������';
comment on column ABC_DIM_DEPT.dept_type_name
  is '����������';
comment on column ABC_DIM_DEPT.fm_tm
  is '��ʼ����';
comment on column ABC_DIM_DEPT.to_tm
  is '��������';
comment on column ABC_DIM_DEPT.level1_code
  is '�㼶1����';
comment on column ABC_DIM_DEPT.level1_name
  is '�㼶1����';
comment on column ABC_DIM_DEPT.level2_code
  is '�㼶2����';
comment on column ABC_DIM_DEPT.level2_name
  is '�㼶2����';
comment on column ABC_DIM_DEPT.level3_code
  is '�㼶3����';
comment on column ABC_DIM_DEPT.level3_name
  is '�㼶3����';
comment on column ABC_DIM_DEPT.level4_code
  is '�㼶4����';
comment on column ABC_DIM_DEPT.level4_name
  is '�㼶4����';
comment on column ABC_DIM_DEPT.level5_code
  is '�㼶5����';
comment on column ABC_DIM_DEPT.level5_name
  is '�㼶5����';
comment on column ABC_DIM_DEPT.parent_code
  is '�����';
comment on column ABC_DIM_DEPT.city_code
  is '����';
comment on column ABC_DIM_DEPT.type_level
  is '�㼶';
comment on column ABC_DIM_DEPT.load_tm
  is '����ʱ��';



---------------------------------------�˵�--------------------------------------------------------------
-- Create table
create table ABC_BSL_WAYBILL
(
  waybill_no VARCHAR2(30),
  rec_dt     DATE,
  send_dt    DATE,
  cust_code  VARCHAR2(30),
  rec_dept   VARCHAR2(30),
  send_dept  VARCHAR2(30),
  rec_city   VARCHAR2(30),
  send_city  VARCHAR2(30),
  prod_code  VARCHAR2(30),
  prod_name  VARCHAR2(100),
  wt         NUMBER,
  amt        NUMBER,
  load_tm    DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table ABC_BSL_WAYBILL
  is '�˵�������Ϣ��';
-- Add comments to the columns 
comment on column ABC_BSL_WAYBILL.waybill_no
  is '�˵���';
comment on column ABC_BSL_WAYBILL.rec_dt
  is '�ռ�����';
comment on column ABC_BSL_WAYBILL.send_dt
  is '�ɼ�����';
comment on column ABC_BSL_WAYBILL.cust_code
  is '�ͻ�����';
comment on column ABC_BSL_WAYBILL.rec_dept
  is '�ռ�����';
comment on column ABC_BSL_WAYBILL.send_dept
  is '�ɼ�����';
comment on column ABC_BSL_WAYBILL.rec_city
  is '�ռ�����';
comment on column ABC_BSL_WAYBILL.send_city
  is '�ɼ�����';
comment on column ABC_BSL_WAYBILL.prod_code
  is '��Ʒ����';
comment on column ABC_BSL_WAYBILL.prod_name
  is '��Ʒ��';
comment on column ABC_BSL_WAYBILL.wt
  is '�Ʒ�����';
comment on column ABC_BSL_WAYBILL.amt
  is '���';
comment on column ABC_BSL_WAYBILL.load_tm
  is '����ʱ��';





-- Create table
create table ABC_REL_CUST
(
  cust_code VARCHAR2(30),
  cust_name VARCHAR2(100),
  indu_l1   VARCHAR2(100),
  indu_l2   VARCHAR2(30),
  load_tm   DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table ABC_REL_CUST
  is '�ͻ�ά��';
-- Add comments to the columns 
comment on column ABC_REL_CUST.cust_code
  is '�ͻ�����';
comment on column ABC_REL_CUST.cust_name
  is '�ͻ���';
comment on column ABC_REL_CUST.indu_l1
  is '1����ҵ';
comment on column ABC_REL_CUST.indu_l2
  is '2����ҵ';
comment on column ABC_REL_CUST.load_tm
  is '����ʱ��';



-- Create table
create table ABC_REL_PROD
(
  prod_code  VARCHAR2(30),
  prod_name  VARCHAR2(100),
  first_pric NUMBER,
  add_pric   NUMBER,
  load_tm    DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table ABC_REL_PROD
  is '��Ʒά��';
-- Add comments to the columns 
comment on column ABC_REL_PROD.prod_code
  is '��Ʒ����';
comment on column ABC_REL_PROD.prod_name
  is '��Ʒ��';
comment on column ABC_REL_PROD.first_pric
  is '�׼�';
comment on column ABC_REL_PROD.add_pric
  is '����';
comment on column ABC_REL_PROD.load_tm
  is '����ʱ��';


----------------------------------------�ɱ�-------------------------------------------------------------------

-- Create table
create table ODS_SUBJ_ACCO
(
  month_code VARCHAR2(10),
  dept_code  VARCHAR2(30),
  subj_code  VARCHAR2(30),
  subj_name  VARCHAR2(100),
  post_name  VARCHAR2(100),
  car_no     VARCHAR2(10),
  amt        NUMBER,
  load_tm    DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table ODS_SUBJ_ACCO
  is 'ODS����ɱ��ӿڱ�';
-- Add comments to the columns 
comment on column ODS_SUBJ_ACCO.month_code
  is '�·�';
comment on column ODS_SUBJ_ACCO.dept_code
  is '��������';
comment on column ODS_SUBJ_ACCO.subj_code
  is '��Ŀ����';
comment on column ODS_SUBJ_ACCO.subj_name
  is '��Ŀ����';
comment on column ODS_SUBJ_ACCO.post_name
  is '��λ��';
comment on column ODS_SUBJ_ACCO.car_no
  is '���ƺ�';
comment on column ODS_SUBJ_ACCO.amt
  is '���';
comment on column ODS_SUBJ_ACCO.load_tm
  is '����ʱ��';




-- Create table
create table ABC_REL_SUBJ_RESO
(
  fm_dt     DATE,
  to_dt     DATE,
  subj_code VARCHAR2(30),
  subj_name VARCHAR2(100),
  reso_code VARCHAR2(30),
  reso_name VARCHAR2(100),
  reso_type VARCHAR2(100),
  load_tm   DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table ABC_REL_SUBJ_RESO
  is '��Ŀ��Դ���ñ�';
-- Add comments to the columns 
comment on column ABC_REL_SUBJ_RESO.fm_dt
  is '��ʼ����';
comment on column ABC_REL_SUBJ_RESO.to_dt
  is '��������';
comment on column ABC_REL_SUBJ_RESO.subj_code
  is '��Ŀ����';
comment on column ABC_REL_SUBJ_RESO.subj_name
  is '��Ŀ����';
comment on column ABC_REL_SUBJ_RESO.reso_code
  is '��Դ����';
comment on column ABC_REL_SUBJ_RESO.reso_name
  is '��Դ����';
comment on column ABC_REL_SUBJ_RESO.reso_type
  is '����';
comment on column ABC_REL_SUBJ_RESO.load_tm
  is '����ʱ��';



-- Create table
create table ABC_DIM_RESO
(
  fm_dt        DATE,
  to_dt        DATE,
  reso_code    VARCHAR2(30),
  reso_name    VARCHAR2(100),
  l1_reso_code VARCHAR2(30),
  l1_reso_name VARCHAR2(100),
  l2_reso_code VARCHAR2(30),
  l2_reso_name VARCHAR2(100),
  load_tm      DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table ABC_DIM_RESO
  is '��Դά�ȱ�';
-- Add comments to the columns 
comment on column ABC_DIM_RESO.fm_dt
  is '��ʼ����';
comment on column ABC_DIM_RESO.to_dt
  is '��������';
comment on column ABC_DIM_RESO.reso_code
  is '��Դ����';
comment on column ABC_DIM_RESO.reso_name
  is '��Դ����';
comment on column ABC_DIM_RESO.l1_reso_code
  is '�㼶1��Դ����';
comment on column ABC_DIM_RESO.l1_reso_name
  is '�㼶1��Դ����';
comment on column ABC_DIM_RESO.l2_reso_code
  is '�㼶2��Դ����';
comment on column ABC_DIM_RESO.l2_reso_name
  is '�㼶2��Դ����';
comment on column ABC_DIM_RESO.load_tm
  is '����ʱ��';




-- Create table
create table ABC_FCT_RESO_LIST
(
  month_code     VARCHAR2(10),
  dept_code      VARCHAR2(30),
  dept_type      VARCHAR2(100),
  dept_type_name VARCHAR2(100),
  func_code      VARCHAR2(30),
  func_name      VARCHAR2(100),
  car_no         VARCHAR2(10),
  reso_code      VARCHAR2(10),
  reso_name      VARCHAR2(100),
  amt            NUMBER,
  load_tm        DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table ABC_FCT_RESO_LIST
  is 'ABC��Դ�����';
-- Add comments to the columns 
comment on column ABC_FCT_RESO_LIST.month_code
  is '�·�';
comment on column ABC_FCT_RESO_LIST.dept_code
  is '��������';
comment on column ABC_FCT_RESO_LIST.dept_type
  is '��������';
comment on column ABC_FCT_RESO_LIST.dept_type_name
  is '����������';
comment on column ABC_FCT_RESO_LIST.func_code
  is '�������Ĵ���';
comment on column ABC_FCT_RESO_LIST.func_name
  is '������������';
comment on column ABC_FCT_RESO_LIST.car_no
  is '���ƺ�';
comment on column ABC_FCT_RESO_LIST.reso_code
  is '��Դ����';
comment on column ABC_FCT_RESO_LIST.reso_name
  is '��Դ����';
comment on column ABC_FCT_RESO_LIST.amt
  is '���';
comment on column ABC_FCT_RESO_LIST.load_tm
  is '����ʱ��';



----------------------------------------ҵ����--------------------------------------------------------------------------

-- Create table
create table ABC_BSL_OP_WAYBILL
(
  op_dt        DATE,
  op_dept_code VARCHAR2(30),
  op_code      VARCHAR2(30),
  op_name      VARCHAR2(100),
  waybill_no   VARCHAR2(30),
  car_no       VARCHAR2(30),
  line_code    VARCHAR2(30),
  is_pkg       INTEGER,
  waybill_wt   NUMBER,
  load_tm      DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table ABC_BSL_OP_WAYBILL
  is '�˵�����������';
-- Add comments to the columns 
comment on column ABC_BSL_OP_WAYBILL.op_dt
  is '��������';
comment on column ABC_BSL_OP_WAYBILL.op_dept_code
  is '��������';
comment on column ABC_BSL_OP_WAYBILL.op_code
  is '������';
comment on column ABC_BSL_OP_WAYBILL.op_name
  is '����������';
comment on column ABC_BSL_OP_WAYBILL.waybill_no
  is '�˵���';
comment on column ABC_BSL_OP_WAYBILL.car_no
  is '����';
comment on column ABC_BSL_OP_WAYBILL.line_code
  is '��·';
comment on column ABC_BSL_OP_WAYBILL.is_pkg
  is '�Ƿ��';
comment on column ABC_BSL_OP_WAYBILL.waybill_wt
  is '����';
comment on column ABC_BSL_OP_WAYBILL.load_tm
  is '����ʱ��';









