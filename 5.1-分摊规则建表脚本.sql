-- Create table
create table ABC_REL_RR_DIST
(
  mode_code         VARCHAR2(10),
  fm_dt             DATE,
  to_dt             DATE,
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
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
comment on table ABC_REL_RR_DIST
  is 'ABC模型RR分摊规则';
-- Add comments to the columns 
comment on column ABC_REL_RR_DIST.mode_code
  is '模型代码';
comment on column ABC_REL_RR_DIST.fm_dt
  is '开始日期';
comment on column ABC_REL_RR_DIST.to_dt
  is '结束日期';
comment on column ABC_REL_RR_DIST.dist_type
  is '分摊类型';
comment on column ABC_REL_RR_DIST.driv_code
  is '动因代码';
comment on column ABC_REL_RR_DIST.driv_name
  is '动因名';
comment on column ABC_REL_RR_DIST.fm_dept_type_code
  is '发送方网点类型代码';
comment on column ABC_REL_RR_DIST.fm_dept_type_name
  is '发送方网点类型名称';
comment on column ABC_REL_RR_DIST.fm_func_code
  is '发送方功能中心代码';
comment on column ABC_REL_RR_DIST.fm_func_name
  is '发送方功能中心名称';
comment on column ABC_REL_RR_DIST.fm_reso_code
  is '发送方资源代码';
comment on column ABC_REL_RR_DIST.fm_reso_name
  is '发送方资源名称';
comment on column ABC_REL_RR_DIST.to_dept_type_code
  is '接收方网点类型代码';
comment on column ABC_REL_RR_DIST.to_dept_type_name
  is '接收方网点类型名称';
comment on column ABC_REL_RR_DIST.to_func_code
  is '接收方功能中心代码';
comment on column ABC_REL_RR_DIST.to_func_name
  is '接收方功能中心名称';
comment on column ABC_REL_RR_DIST.to_reso_code
  is '接收方资源代码';
comment on column ABC_REL_RR_DIST.to_reso_name
  is '接收方资源名称';
comment on column ABC_REL_RR_DIST.load_tm
  is '加载时间';











-- Create table
create table ABC_REL_RA_DIST
(
  mode_code         VARCHAR2(10),
  fm_dt             DATE,
  to_dt             DATE,
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  to_acti_code      VARCHAR2(10),
  to_acti_name      VARCHAR2(100),
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
comment on table ABC_REL_RA_DIST
  is 'ABC模型RA分摊规则';
-- Add comments to the columns 
comment on column ABC_REL_RA_DIST.mode_code
  is '模型代码';
comment on column ABC_REL_RA_DIST.fm_dt
  is '开始日期';
comment on column ABC_REL_RA_DIST.to_dt
  is '结束日期';
comment on column ABC_REL_RA_DIST.dist_type
  is '分摊类型';
comment on column ABC_REL_RA_DIST.driv_code
  is '动因代码';
comment on column ABC_REL_RA_DIST.driv_name
  is '动因名';
comment on column ABC_REL_RA_DIST.fm_dept_type_code
  is '发送方网点类型代码';
comment on column ABC_REL_RA_DIST.fm_dept_type_name
  is '发送方网点类型名称';
comment on column ABC_REL_RA_DIST.fm_func_code
  is '发送方功能中心代码';
comment on column ABC_REL_RA_DIST.fm_func_name
  is '发送方功能中心名称';
comment on column ABC_REL_RA_DIST.fm_reso_code
  is '发送方资源代码';
comment on column ABC_REL_RA_DIST.fm_reso_name
  is '发送方资源名称';
comment on column ABC_REL_RA_DIST.to_dept_type_code
  is '接收方网点类型代码';
comment on column ABC_REL_RA_DIST.to_dept_type_name
  is '接收方网点类型名称';
comment on column ABC_REL_RA_DIST.to_func_code
  is '接收方功能中心代码';
comment on column ABC_REL_RA_DIST.to_func_name
  is '接收方功能中心名称';
comment on column ABC_REL_RA_DIST.to_reso_code
  is '接收方资源代码';
comment on column ABC_REL_RA_DIST.to_reso_name
  is '接收方资源名称';
comment on column ABC_REL_RA_DIST.to_acti_code
  is '接收方作业代码';
comment on column ABC_REL_RA_DIST.to_acti_name
  is '接收方作业名称';
comment on column ABC_REL_RA_DIST.load_tm
  is '加载时间';











-- Create table
create table ABC_REL_AA_DIST
(
  mode_code         VARCHAR2(10),
  fm_dt             DATE,
  to_dt             DATE,
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  fm_acti_code      VARCHAR2(10),
  fm_acti_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  to_acti_code      VARCHAR2(10),
  to_acti_name      VARCHAR2(100),
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
comment on table ABC_REL_AA_DIST
  is 'ABC模型AA分摊规则';
-- Add comments to the columns 
comment on column ABC_REL_AA_DIST.mode_code
  is '模型代码';
comment on column ABC_REL_AA_DIST.fm_dt
  is '开始日期';
comment on column ABC_REL_AA_DIST.to_dt
  is '结束日期';
comment on column ABC_REL_AA_DIST.dist_type
  is '分摊类型';
comment on column ABC_REL_AA_DIST.driv_code
  is '动因代码';
comment on column ABC_REL_AA_DIST.driv_name
  is '动因名';
comment on column ABC_REL_AA_DIST.fm_dept_type_code
  is '发送方网点类型代码';
comment on column ABC_REL_AA_DIST.fm_dept_type_name
  is '发送方网点类型名称';
comment on column ABC_REL_AA_DIST.fm_func_code
  is '发送方功能中心代码';
comment on column ABC_REL_AA_DIST.fm_func_name
  is '发送方功能中心名称';
comment on column ABC_REL_AA_DIST.fm_reso_code
  is '发送方资源代码';
comment on column ABC_REL_AA_DIST.fm_reso_name
  is '发送方资源名称';
comment on column ABC_REL_AA_DIST.fm_acti_code
  is '发送方作业代码';
comment on column ABC_REL_AA_DIST.fm_acti_name
  is '发送方作业名称';
comment on column ABC_REL_AA_DIST.to_dept_type_code
  is '接收方网点类型代码';
comment on column ABC_REL_AA_DIST.to_dept_type_name
  is '接收方网点类型名称';
comment on column ABC_REL_AA_DIST.to_func_code
  is '接收方功能中心代码';
comment on column ABC_REL_AA_DIST.to_func_name
  is '接收方功能中心名称';
comment on column ABC_REL_AA_DIST.to_reso_code
  is '接收方资源代码';
comment on column ABC_REL_AA_DIST.to_reso_name
  is '接收方资源名称';
comment on column ABC_REL_AA_DIST.to_acti_code
  is '接收方作业代码';
comment on column ABC_REL_AA_DIST.to_acti_name
  is '接收方作业名称';
comment on column ABC_REL_AA_DIST.load_tm
  is '加载时间';







-- Create table
create table ABC_REL_AO_DIST
(
  mode_code         VARCHAR2(10),
  fm_dt             DATE,
  to_dt             DATE,
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  fm_acti_code      VARCHAR2(10),
  fm_acti_name      VARCHAR2(100),
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
comment on table ABC_REL_AO_DIST
  is 'ABC模型AO分摊规则';
-- Add comments to the columns 
comment on column ABC_REL_AO_DIST.mode_code
  is '模型代码';
comment on column ABC_REL_AO_DIST.fm_dt
  is '开始日期';
comment on column ABC_REL_AO_DIST.to_dt
  is '结束日期';
comment on column ABC_REL_AO_DIST.dist_type
  is '分摊类型';
comment on column ABC_REL_AO_DIST.driv_code
  is '动因代码';
comment on column ABC_REL_AO_DIST.driv_name
  is '动因名';
comment on column ABC_REL_AO_DIST.fm_dept_type_code
  is '发送方网点类型代码';
comment on column ABC_REL_AO_DIST.fm_dept_type_name
  is '发送方网点类型名称';
comment on column ABC_REL_AO_DIST.fm_func_code
  is '发送方功能中心代码';
comment on column ABC_REL_AO_DIST.fm_func_name
  is '发送方功能中心名称';
comment on column ABC_REL_AO_DIST.fm_reso_code
  is '发送方资源代码';
comment on column ABC_REL_AO_DIST.fm_reso_name
  is '发送方资源名称';
comment on column ABC_REL_AO_DIST.fm_acti_code
  is '发送方作业代码';
comment on column ABC_REL_AO_DIST.fm_acti_name
  is '发送方作业名称';
comment on column ABC_REL_AO_DIST.load_tm
  is '加载时间';




