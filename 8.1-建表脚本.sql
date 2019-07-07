-- Create table
create table ABC_FCT_CHK_DIST
(
  month_code CHAR(6),
  dist_type  CHAR(2),
  dist_step  NUMBER,
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
comment on table ABC_FCT_CHK_DIST
  is '分摊检测结果表';
-- Add comments to the columns 
comment on column ABC_FCT_CHK_DIST.month_code
  is '月份';
comment on column ABC_FCT_CHK_DIST.dist_type
  is '分摊类型';
comment on column ABC_FCT_CHK_DIST.dist_step
  is '分摊步骤';
comment on column ABC_FCT_CHK_DIST.amt
  is '金额';
comment on column ABC_FCT_CHK_DIST.load_tm
  is '加载时间';




-- Create table
create table ABC_FCT_NO_DIST_LIST
(
  month_code        CHAR(6),
  dist_type         VARCHAR2(10),
  fm_dept_code      VARCHAR2(30),
  fm_dept_name      VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  fm_acti_type_code VARCHAR2(10),
  fm_acti_type_name VARCHAR2(100),
  fm_acti_code      VARCHAR2(50),
  fm_car            VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  amt               NUMBER,
  load_tm           DATE
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
comment on table ABC_FCT_NO_DIST_LIST
  is '未分摊明细';
-- Add comments to the columns 
comment on column ABC_FCT_NO_DIST_LIST.month_code
  is '月份';
comment on column ABC_FCT_NO_DIST_LIST.dist_type
  is '分摊类型';
comment on column ABC_FCT_NO_DIST_LIST.fm_dept_code
  is '网点代码';
comment on column ABC_FCT_NO_DIST_LIST.fm_dept_name
  is '网点名称';
comment on column ABC_FCT_NO_DIST_LIST.fm_dept_type_code
  is '网点类型代码';
comment on column ABC_FCT_NO_DIST_LIST.fm_dept_type_name
  is '网点类型名称';
comment on column ABC_FCT_NO_DIST_LIST.fm_func_code
  is '功能中心代码';
comment on column ABC_FCT_NO_DIST_LIST.fm_func_name
  is '功能中心名称';
comment on column ABC_FCT_NO_DIST_LIST.fm_reso_code
  is '资源代码';
comment on column ABC_FCT_NO_DIST_LIST.fm_reso_name
  is '资源名称';
comment on column ABC_FCT_NO_DIST_LIST.fm_acti_type_code
  is '作业类型代码';
comment on column ABC_FCT_NO_DIST_LIST.fm_acti_type_name
  is '作业类型名称';
comment on column ABC_FCT_NO_DIST_LIST.fm_acti_code
  is '作业';
comment on column ABC_FCT_NO_DIST_LIST.fm_car
  is '车牌';
comment on column ABC_FCT_NO_DIST_LIST.driv_code
  is '动因代码';
comment on column ABC_FCT_NO_DIST_LIST.driv_name
  is '动因名';
comment on column ABC_FCT_NO_DIST_LIST.amt
  is '金额';
comment on column ABC_FCT_NO_DIST_LIST.load_tm
  is '加载时间';


