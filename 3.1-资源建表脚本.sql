-- Create table
create table ABC_FCT_RESO_LIST
(
  month_code VARCHAR2(10),
  dept_code  VARCHAR2(30),
  dept_type  VARCHAR2(100),
  func_code  VARCHAR2(30),
  func_name  VARCHAR2(100),
  car_no     VARCHAR2(10),
  reso_code  VARCHAR2(10),
  reso_name  VARCHAR2(100),
  load_tm    DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
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
comment on column ABC_FCT_RESO_LIST.load_tm
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
create table ODS_SUBJ_ACCO
(
  month_code VARCHAR2(10),
  dept_code  VARCHAR2(30),
  subj_code  VARCHAR2(30),
  subj_name  VARCHAR2(100),
  post_name  VARCHAR2(100),
  car_no     VARCHAR2(10),
  load_tm    DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
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
comment on column ODS_SUBJ_ACCO.load_tm
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
  maxtrans 255;
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

