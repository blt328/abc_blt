-- Create table
create table ABC_FCT_RR_DIST_TMP01
(
  mode_code         VARCHAR2(10),
  fm_dept_code      VARCHAR2(30),
  fm_dept_name      VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  to_dept_code      VARCHAR2(30),
  to_dept_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100)
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

-- Create table
create table ABC_FCT_RR_DIST_TMP02
(
  mode_code         VARCHAR2(10),
  fm_dept_code      VARCHAR2(30),
  fm_dept_name      VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  fm_car            VARCHAR2(10),
  fm_amt            NUMBER,
  to_dept_code      VARCHAR2(30),
  to_dept_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100)
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




-- Create table
create table ABC_FCT_RR_DIST_TMP03
(
  mode_code         VARCHAR2(10),
  fm_dept_code      VARCHAR2(30),
  fm_dept_name      VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  fm_car            VARCHAR2(10),
  fm_amt            NUMBER,
  to_dept_code      VARCHAR2(30),
  to_dept_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  qty               NUMBER,
  all_qty           NUMBER
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



-- Create table
create table ABC_FCT_RR_DIST
(
  mode_code         VARCHAR2(10),
  month_code        CHAR(6),
  fm_dept_code      VARCHAR2(30),
  fm_dept_name      VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  fm_car            VARCHAR2(10),
  fm_amt            NUMBER,
  to_dept_code      VARCHAR2(30),
  to_dept_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  qty               NUMBER,
  all_qty           NUMBER,
  to_amt            NUMBER,
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
comment on table ABC_FCT_RR_DIST
  is 'RR分摊结果表';
-- Add comments to the columns 
comment on column ABC_FCT_RR_DIST.mode_code
  is '模型代码';
comment on column ABC_FCT_RR_DIST.month_code
  is '月份';
comment on column ABC_FCT_RR_DIST.fm_dept_code
  is '发送方网点代码';
comment on column ABC_FCT_RR_DIST.fm_dept_name
  is '发送方网点名';
comment on column ABC_FCT_RR_DIST.fm_dept_type_code
  is '发送方网点类型代码';
comment on column ABC_FCT_RR_DIST.fm_dept_type_name
  is '发送方网点类型名称';
comment on column ABC_FCT_RR_DIST.fm_func_code
  is '发送方功能中心代码';
comment on column ABC_FCT_RR_DIST.fm_func_name
  is '发送方功能中心名称';
comment on column ABC_FCT_RR_DIST.fm_reso_code
  is '发送方资源代码';
comment on column ABC_FCT_RR_DIST.fm_reso_name
  is '发送方资源名称';
comment on column ABC_FCT_RR_DIST.fm_car
  is '发送方车牌';
comment on column ABC_FCT_RR_DIST.fm_amt
  is '发送方金额';
comment on column ABC_FCT_RR_DIST.to_dept_code
  is '接收方网点代码';
comment on column ABC_FCT_RR_DIST.to_dept_name
  is '接收方网点名称';
comment on column ABC_FCT_RR_DIST.to_dept_type_code
  is '接收方网点类型代码';
comment on column ABC_FCT_RR_DIST.to_dept_type_name
  is '接收方网点类型名称';
comment on column ABC_FCT_RR_DIST.to_func_code
  is '接收方功能中心代码';
comment on column ABC_FCT_RR_DIST.to_func_name
  is '接收方功能中心名称';
comment on column ABC_FCT_RR_DIST.to_reso_code
  is '接收方资源代码';
comment on column ABC_FCT_RR_DIST.to_reso_name
  is '接收方资源名称';
comment on column ABC_FCT_RR_DIST.dist_type
  is '分摊类型';
comment on column ABC_FCT_RR_DIST.driv_code
  is '动因代码';
comment on column ABC_FCT_RR_DIST.driv_name
  is '动因名';
comment on column ABC_FCT_RR_DIST.qty
  is '动因量';
comment on column ABC_FCT_RR_DIST.all_qty
  is '总动因量';
comment on column ABC_FCT_RR_DIST.to_amt
  is '分摊金额';
comment on column ABC_FCT_RR_DIST.load_tm
  is '加载时间';



-- Create table
create table ABC_FCT_RA_DIST_TMP01
(
  mode_code         VARCHAR2(10),
  fm_dept_code      VARCHAR2(30),
  fm_dept_name      VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  to_dept_code      VARCHAR2(30),
  to_dept_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  to_acti_code      VARCHAR2(10),
  to_acti_name      VARCHAR2(100),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100)
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




-- Create table
create table ABC_FCT_RA_DIST_TMP02
(
  fm_dept_code VARCHAR2(30),
  fm_func_code VARCHAR2(30),
  fm_reso_code VARCHAR2(10),
  fm_car       VARCHAR2(10),
  fm_amt       NUMBER
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



-- Create table
create table ABC_FCT_RA_DIST_TMP03
(
  mode_code         VARCHAR2(10),
  fm_dept_code      VARCHAR2(30),
  fm_dept_name      VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  fm_car            VARCHAR2(10),
  fm_amt            NUMBER,
  to_dept_code      VARCHAR2(30),
  to_dept_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  to_car            VARCHAR2(10),
  to_acti_code      VARCHAR2(10),
  to_acti_name      VARCHAR2(100),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100)
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




-- Create table
create table ABC_FCT_RA_DIST_TMP04
(
  mode_code         VARCHAR2(10),
  fm_dept_code      VARCHAR2(30),
  fm_dept_name      VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  fm_car            VARCHAR2(10),
  fm_amt            NUMBER,
  to_dept_code      VARCHAR2(30),
  to_dept_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  to_car            VARCHAR2(10),
  to_acti_type_code VARCHAR2(10),
  to_acti_type_name VARCHAR2(100),
  to_acti_code      VARCHAR2(50),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  qty               NUMBER,
  all_qty           NUMBER
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




-- Create table
create table ABC_FCT_RA_DIST
(
  mode_code         VARCHAR2(10),
  month_code        CHAR(6),
  fm_dept_code      VARCHAR2(30),
  fm_dept_name      VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  fm_car            VARCHAR2(10),
  fm_amt            NUMBER,
  to_dept_code      VARCHAR2(30),
  to_dept_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  to_car            VARCHAR2(10),
  to_acti_type_code VARCHAR2(10),
  to_acti_type_name VARCHAR2(100),
  to_acti_code      VARCHAR2(50),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  qty               NUMBER,
  all_qty           NUMBER,
  to_amt            NUMBER,
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
comment on table ABC_FCT_RA_DIST
  is 'RA分摊结果表';
-- Add comments to the columns 
comment on column ABC_FCT_RA_DIST.mode_code
  is '模型代码';
comment on column ABC_FCT_RA_DIST.month_code
  is '月份';
comment on column ABC_FCT_RA_DIST.fm_dept_code
  is '发送方网点代码';
comment on column ABC_FCT_RA_DIST.fm_dept_name
  is '发送方网点名称';
comment on column ABC_FCT_RA_DIST.fm_dept_type_code
  is '发送方网点类型代码';
comment on column ABC_FCT_RA_DIST.fm_dept_type_name
  is '发送方网点类型名称';
comment on column ABC_FCT_RA_DIST.fm_func_code
  is '发送方功能中心代码';
comment on column ABC_FCT_RA_DIST.fm_func_name
  is '发送方功能中心名称';
comment on column ABC_FCT_RA_DIST.fm_reso_code
  is '发送方资源代码';
comment on column ABC_FCT_RA_DIST.fm_reso_name
  is '发送方资源名称';
comment on column ABC_FCT_RA_DIST.fm_car
  is '发送方车牌';
comment on column ABC_FCT_RA_DIST.fm_amt
  is '发送方金额';
comment on column ABC_FCT_RA_DIST.to_dept_code
  is '接收方网点代码';
comment on column ABC_FCT_RA_DIST.to_dept_name
  is '接收方网点名称';
comment on column ABC_FCT_RA_DIST.to_dept_type_code
  is '接收方网点类型代码';
comment on column ABC_FCT_RA_DIST.to_dept_type_name
  is '接收方网点类型名称';
comment on column ABC_FCT_RA_DIST.to_func_code
  is '接收方功能中心代码';
comment on column ABC_FCT_RA_DIST.to_func_name
  is '接收方功能中心名称';
comment on column ABC_FCT_RA_DIST.to_reso_code
  is '接收方资源代码';
comment on column ABC_FCT_RA_DIST.to_reso_name
  is '接收方资源名称';
comment on column ABC_FCT_RA_DIST.to_car
  is '接收方车牌';
comment on column ABC_FCT_RA_DIST.to_acti_type_code
  is '接收方作业类型代码';
comment on column ABC_FCT_RA_DIST.to_acti_type_name
  is '接收方作业类型名';
comment on column ABC_FCT_RA_DIST.to_acti_code
  is '接收方作业代码';
comment on column ABC_FCT_RA_DIST.dist_type
  is '分摊类型';
comment on column ABC_FCT_RA_DIST.driv_code
  is '动因代码';
comment on column ABC_FCT_RA_DIST.driv_name
  is '动因名';
comment on column ABC_FCT_RA_DIST.qty
  is '动因量';
comment on column ABC_FCT_RA_DIST.all_qty
  is '总动因量';
comment on column ABC_FCT_RA_DIST.to_amt
  is '分摊金额';
comment on column ABC_FCT_RA_DIST.load_tm
  is '加载时间';





-- Create table
create table ABC_FCT_AA_DIST_TMP01
(
  mode_code         VARCHAR2(10),
  fm_dept_code      VARCHAR2(30),
  fm_dept_name      VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  fm_acti_code      VARCHAR2(10),
  fm_acti_name      VARCHAR2(100),
  to_dept_code      VARCHAR2(30),
  to_dept_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  to_acti_code      VARCHAR2(10),
  to_acti_name      VARCHAR2(100),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100)
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



-- Create table
create table ABC_FCT_AA_DIST_TMP02
(
  fm_dept_code      VARCHAR2(30),
  fm_func_code      VARCHAR2(10),
  fm_reso_code      VARCHAR2(10),
  fm_acti_type_code VARCHAR2(10),
  fm_acti_code      VARCHAR2(50),
  fm_car            VARCHAR2(10),
  fm_amt            NUMBER
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



-- Create table
create table ABC_FCT_AA_DIST_TMP03
(
  mode_code         VARCHAR2(10),
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
  fm_amt            NUMBER,
  to_dept_code      VARCHAR2(30),
  to_dept_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  to_acti_code      VARCHAR2(10),
  to_acti_name      VARCHAR2(100),
  to_car            VARCHAR2(10),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100)
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



-- Create table
create table ABC_FCT_AA_DIST_TMP04
(
  mode_code         VARCHAR2(10),
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
  fm_amt            NUMBER,
  to_dept_code      VARCHAR2(30),
  to_dept_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  to_acti_type_code VARCHAR2(10),
  to_acti_type_name VARCHAR2(100),
  to_acti_code      VARCHAR2(50),
  to_car            VARCHAR2(10),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  qty               NUMBER,
  all_qty           NUMBER
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



-- Create table
create table ABC_FCT_AA_DIST
(
  mode_code         VARCHAR2(10),
  month_code        CHAR(6),
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
  fm_amt            NUMBER,
  to_dept_code      VARCHAR2(30),
  to_dept_name      VARCHAR2(100),
  to_dept_type_code VARCHAR2(10),
  to_dept_type_name VARCHAR2(100),
  to_func_code      VARCHAR2(10),
  to_func_name      VARCHAR2(100),
  to_reso_code      VARCHAR2(10),
  to_reso_name      VARCHAR2(100),
  to_acti_type_code VARCHAR2(10),
  to_acti_type_name VARCHAR2(100),
  to_acti_code      VARCHAR2(50),
  to_car            VARCHAR2(10),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  qty               NUMBER,
  all_qty           NUMBER,
  to_amt            NUMBER,
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
comment on table ABC_FCT_AA_DIST
  is 'AA分摊结果表';
-- Add comments to the columns 
comment on column ABC_FCT_AA_DIST.mode_code
  is '模型代码';
comment on column ABC_FCT_AA_DIST.month_code
  is '月份';
comment on column ABC_FCT_AA_DIST.fm_dept_code
  is '发送方网点代码';
comment on column ABC_FCT_AA_DIST.fm_dept_name
  is '发送方网点名称';
comment on column ABC_FCT_AA_DIST.fm_dept_type_code
  is '发送方网点类型代码';
comment on column ABC_FCT_AA_DIST.fm_dept_type_name
  is '发送方网点类型名称';
comment on column ABC_FCT_AA_DIST.fm_func_code
  is '发送方功能中心代码';
comment on column ABC_FCT_AA_DIST.fm_func_name
  is '发送方功能中心名称';
comment on column ABC_FCT_AA_DIST.fm_reso_code
  is '发送方资源代码';
comment on column ABC_FCT_AA_DIST.fm_reso_name
  is '发送方资源名称';
comment on column ABC_FCT_AA_DIST.fm_acti_type_code
  is '发送方作业类型代码';
comment on column ABC_FCT_AA_DIST.fm_acti_type_name
  is '发送方作业类型名称';
comment on column ABC_FCT_AA_DIST.fm_acti_code
  is '发送方作业代码';
comment on column ABC_FCT_AA_DIST.fm_car
  is '发送方车牌';
comment on column ABC_FCT_AA_DIST.fm_amt
  is '发送方金额';
comment on column ABC_FCT_AA_DIST.to_dept_code
  is '接收方网点代码';
comment on column ABC_FCT_AA_DIST.to_dept_name
  is '接收方网点名称';
comment on column ABC_FCT_AA_DIST.to_dept_type_code
  is '接收方网点类型代码';
comment on column ABC_FCT_AA_DIST.to_dept_type_name
  is '接收方网点类型名称';
comment on column ABC_FCT_AA_DIST.to_func_code
  is '接收方功能中心代码';
comment on column ABC_FCT_AA_DIST.to_func_name
  is '接收方功能中心名称';
comment on column ABC_FCT_AA_DIST.to_reso_code
  is '接收方资源代码';
comment on column ABC_FCT_AA_DIST.to_reso_name
  is '接收方资源名称';
comment on column ABC_FCT_AA_DIST.to_acti_type_code
  is '接收方作业类型代码';
comment on column ABC_FCT_AA_DIST.to_acti_type_name
  is '接收方作业类型名';
comment on column ABC_FCT_AA_DIST.to_acti_code
  is '接收方作业代码';
comment on column ABC_FCT_AA_DIST.to_car
  is '接收方车牌';
comment on column ABC_FCT_AA_DIST.dist_type
  is '分摊类型';
comment on column ABC_FCT_AA_DIST.driv_code
  is '动因代码';
comment on column ABC_FCT_AA_DIST.driv_name
  is '动因名';
comment on column ABC_FCT_AA_DIST.qty
  is '动因量';
comment on column ABC_FCT_AA_DIST.all_qty
  is '总动因量';
comment on column ABC_FCT_AA_DIST.to_amt
  is '分摊金额';
comment on column ABC_FCT_AA_DIST.load_tm
  is '加载时间';




-- Create table
create table ABC_FCT_AO_DIST_TMP01
(
  mode_code         VARCHAR2(10),
  fm_dept_code      VARCHAR2(30),
  fm_dept_name      VARCHAR2(100),
  fm_dept_type_code VARCHAR2(10),
  fm_dept_type_name VARCHAR2(100),
  fm_func_code      VARCHAR2(10),
  fm_func_name      VARCHAR2(100),
  fm_reso_code      VARCHAR2(10),
  fm_reso_name      VARCHAR2(100),
  fm_acti_code      VARCHAR2(10),
  fm_acti_name      VARCHAR2(100),
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100)
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



-- Create table
create table ABC_FCT_AO_DIST_TMP02
(
  fm_dept_code      VARCHAR2(30),
  fm_func_code      VARCHAR2(10),
  fm_reso_code      VARCHAR2(10),
  fm_acti_type_code VARCHAR2(10),
  fm_acti_code      VARCHAR2(50),
  fm_car            VARCHAR2(10),
  fm_amt            NUMBER
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




-- Create table
create table ABC_FCT_AO_DIST_TMP03
(
  mode_code         VARCHAR2(10),
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
  fm_amt            NUMBER,
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100)
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




-- Create table
create table ABC_FCT_AO_DIST_TMP04
(
  mode_code         VARCHAR2(10),
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
  fm_amt            NUMBER,
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  waybill_no        VARCHAR2(100),
  qty               NUMBER,
  all_qty           NUMBER
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




-- Create table
create table ABC_FCT_AO_DIST
(
  mode_code         VARCHAR2(10),
  month_code        CHAR(6),
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
  fm_amt            NUMBER,
  dist_type         VARCHAR2(10),
  driv_code         VARCHAR2(10),
  driv_name         VARCHAR2(100),
  waybill_no        VARCHAR2(100),
  qty               NUMBER,
  all_qty           NUMBER,
  to_amt            NUMBER,
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
comment on table ABC_FCT_AO_DIST
  is 'AO分摊结果表';
-- Add comments to the columns 
comment on column ABC_FCT_AO_DIST.mode_code
  is '模型代码';
comment on column ABC_FCT_AO_DIST.month_code
  is '月份';
comment on column ABC_FCT_AO_DIST.fm_dept_code
  is '网点代码';
comment on column ABC_FCT_AO_DIST.fm_dept_name
  is '网点名称';
comment on column ABC_FCT_AO_DIST.fm_dept_type_code
  is '网点类型代码';
comment on column ABC_FCT_AO_DIST.fm_dept_type_name
  is '网点类型名称';
comment on column ABC_FCT_AO_DIST.fm_func_code
  is '功能中心代码';
comment on column ABC_FCT_AO_DIST.fm_func_name
  is '功能中心名称';
comment on column ABC_FCT_AO_DIST.fm_reso_code
  is '资源代码';
comment on column ABC_FCT_AO_DIST.fm_reso_name
  is '资源名称';
comment on column ABC_FCT_AO_DIST.fm_acti_type_code
  is '作业类型代码';
comment on column ABC_FCT_AO_DIST.fm_acti_type_name
  is '作业类型名称';
comment on column ABC_FCT_AO_DIST.fm_acti_code
  is '作业';
comment on column ABC_FCT_AO_DIST.fm_car
  is '车牌';
comment on column ABC_FCT_AO_DIST.fm_amt
  is '发送方金额';
comment on column ABC_FCT_AO_DIST.dist_type
  is '分摊类型';
comment on column ABC_FCT_AO_DIST.driv_code
  is '动因代码';
comment on column ABC_FCT_AO_DIST.driv_name
  is '动因名';
comment on column ABC_FCT_AO_DIST.waybill_no
  is '运单号';
comment on column ABC_FCT_AO_DIST.qty
  is '动因量';
comment on column ABC_FCT_AO_DIST.all_qty
  is '总动因量';
comment on column ABC_FCT_AO_DIST.to_amt
  is '分摊金额';
comment on column ABC_FCT_AO_DIST.load_tm
  is '加载时间';
