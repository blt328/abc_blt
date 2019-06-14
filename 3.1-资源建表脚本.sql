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
  is 'ABC资源结果表';
-- Add comments to the columns 
comment on column ABC_FCT_RESO_LIST.month_code
  is '月份';
comment on column ABC_FCT_RESO_LIST.dept_code
  is '机构代码';
comment on column ABC_FCT_RESO_LIST.dept_type
  is '机构类型';
comment on column ABC_FCT_RESO_LIST.func_code
  is '功能中心代码';
comment on column ABC_FCT_RESO_LIST.func_name
  is '功能中心名称';
comment on column ABC_FCT_RESO_LIST.car_no
  is '车牌号';
comment on column ABC_FCT_RESO_LIST.reso_code
  is '资源代码';
comment on column ABC_FCT_RESO_LIST.reso_name
  is '资源名称';
comment on column ABC_FCT_RESO_LIST.load_tm
  is '加载时间';




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
  is '科目资源配置表';
-- Add comments to the columns 
comment on column ABC_REL_SUBJ_RESO.fm_dt
  is '开始日期';
comment on column ABC_REL_SUBJ_RESO.to_dt
  is '结束日期';
comment on column ABC_REL_SUBJ_RESO.subj_code
  is '科目代码';
comment on column ABC_REL_SUBJ_RESO.subj_name
  is '科目名称';
comment on column ABC_REL_SUBJ_RESO.reso_code
  is '资源代码';
comment on column ABC_REL_SUBJ_RESO.reso_name
  is '资源名称';
comment on column ABC_REL_SUBJ_RESO.reso_type
  is '类型';
comment on column ABC_REL_SUBJ_RESO.load_tm
  is '加载时间';




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
  is 'ODS财务成本接口表';
-- Add comments to the columns 
comment on column ODS_SUBJ_ACCO.month_code
  is '月份';
comment on column ODS_SUBJ_ACCO.dept_code
  is '机构代码';
comment on column ODS_SUBJ_ACCO.subj_code
  is '科目代码';
comment on column ODS_SUBJ_ACCO.subj_name
  is '科目名称';
comment on column ODS_SUBJ_ACCO.post_name
  is '岗位名';
comment on column ODS_SUBJ_ACCO.car_no
  is '车牌号';
comment on column ODS_SUBJ_ACCO.load_tm
  is '加载时间';






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
  is '资源维度表';
-- Add comments to the columns 
comment on column ABC_DIM_RESO.fm_dt
  is '开始日期';
comment on column ABC_DIM_RESO.to_dt
  is '结束日期';
comment on column ABC_DIM_RESO.reso_code
  is '资源代码';
comment on column ABC_DIM_RESO.reso_name
  is '资源名称';
comment on column ABC_DIM_RESO.l1_reso_code
  is '层级1资源代码';
comment on column ABC_DIM_RESO.l1_reso_name
  is '层级1资源名称';
comment on column ABC_DIM_RESO.l2_reso_code
  is '层级2资源代码';
comment on column ABC_DIM_RESO.l2_reso_name
  is '层级2资源名称';
comment on column ABC_DIM_RESO.load_tm
  is '加载时间';

