-- Create table
create table ABC_DIM_LINE
(
  month_code VARCHAR2(14),
  line_code  VARCHAR2(30),
  line_km    NUMBER,
  line_type  VARCHAR2(30),
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
comment on table ABC_DIM_LINE
  is 'ABC线路主数据';
-- Add comments to the columns 
comment on column ABC_DIM_LINE.month_code
  is '月份';
comment on column ABC_DIM_LINE.line_code
  is '线路编码';
comment on column ABC_DIM_LINE.line_km
  is '线路里程';
comment on column ABC_DIM_LINE.line_type
  is '线路类型';
comment on column ABC_DIM_LINE.load_tm
  is '加载时间';



-- Create table
create table ABC_FCT_RR_DRIV
(
  month_code     VARCHAR2(10),
  dept_code      VARCHAR2(30),
  dept_type      VARCHAR2(100),
  dept_type_name VARCHAR2(100),
  func_code      VARCHAR2(30),
  func_name      VARCHAR2(100),
  driv_code      VARCHAR2(10),
  driv_name      VARCHAR2(100),
  qty            NUMBER,
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
comment on table ABC_FCT_RR_DRIV
  is 'RR动因结果表';
-- Add comments to the columns 
comment on column ABC_FCT_RR_DRIV.month_code
  is '月份';
comment on column ABC_FCT_RR_DRIV.dept_code
  is '机构代码';
comment on column ABC_FCT_RR_DRIV.dept_type
  is '机构类型';
comment on column ABC_FCT_RR_DRIV.dept_type_name
  is '机构类型名';
comment on column ABC_FCT_RR_DRIV.func_code
  is '功能中心代码';
comment on column ABC_FCT_RR_DRIV.func_name
  is '功能中心名称';
comment on column ABC_FCT_RR_DRIV.driv_code
  is '动因代码';
comment on column ABC_FCT_RR_DRIV.driv_name
  is '动因名称';
comment on column ABC_FCT_RR_DRIV.qty
  is '动因量';
comment on column ABC_FCT_RR_DRIV.load_tm
  is '加载时间';



-- Create table
create table ABC_REL_DRIV_LOGIC
(
  fm_tm     DATE,
  to_tm     DATE,
  driv_code VARCHAR2(50),
  driv_name VARCHAR2(100),
  func_code VARCHAR2(50),
  func_name VARCHAR2(100),
  acti_code VARCHAR2(50),
  acti_name VARCHAR2(100),
  op_code   VARCHAR2(50),
  line_leve VARCHAR2(50),
  pkg_state VARCHAR2(50),
  rt        NUMBER,
  dept_type VARCHAR2(50),
  prod_code VARCHAR2(50),
  remark    VARCHAR2(500),
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
comment on table ABC_REL_DRIV_LOGIC
  is '动因逻辑配置表';
-- Add comments to the columns 
comment on column ABC_REL_DRIV_LOGIC.fm_tm
  is '开始时间';
comment on column ABC_REL_DRIV_LOGIC.to_tm
  is '结束时间';
comment on column ABC_REL_DRIV_LOGIC.driv_code
  is '动因代码';
comment on column ABC_REL_DRIV_LOGIC.driv_name
  is '动因名';
comment on column ABC_REL_DRIV_LOGIC.func_code
  is '功能中心';
comment on column ABC_REL_DRIV_LOGIC.func_name
  is '功能中心名';
comment on column ABC_REL_DRIV_LOGIC.acti_code
  is '作业代码';
comment on column ABC_REL_DRIV_LOGIC.acti_name
  is '作业名';
comment on column ABC_REL_DRIV_LOGIC.op_code
  is '操作码';
comment on column ABC_REL_DRIV_LOGIC.line_leve
  is '线路等级';
comment on column ABC_REL_DRIV_LOGIC.pkg_state
  is '包状态';
comment on column ABC_REL_DRIV_LOGIC.rt
  is '系数';
comment on column ABC_REL_DRIV_LOGIC.dept_type
  is '网点类型';
comment on column ABC_REL_DRIV_LOGIC.prod_code
  is '产品';
comment on column ABC_REL_DRIV_LOGIC.remark
  is '说明';
comment on column ABC_REL_DRIV_LOGIC.load_tm
  is '加载时间';



-- Create table
create table ABC_FCT_RA_DRIV
(
  month_code     VARCHAR2(10),
  dept_code      VARCHAR2(30),
  dept_type      VARCHAR2(100),
  dept_type_name VARCHAR2(100),
  func_code      VARCHAR2(30),
  func_name      VARCHAR2(100),
  acti_code      VARCHAR2(50),
  acti_name      VARCHAR2(100),
  car_no         VARCHAR2(10),
  driv_code      VARCHAR2(10),
  driv_name      VARCHAR2(100),
  qty            NUMBER,
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
comment on table ABC_FCT_RA_DRIV
  is 'RA动因结果表';
-- Add comments to the columns 
comment on column ABC_FCT_RA_DRIV.month_code
  is '月份';
comment on column ABC_FCT_RA_DRIV.dept_code
  is '机构代码';
comment on column ABC_FCT_RA_DRIV.dept_type
  is '机构类型';
comment on column ABC_FCT_RA_DRIV.dept_type_name
  is '机构类型名';
comment on column ABC_FCT_RA_DRIV.func_code
  is '功能中心代码';
comment on column ABC_FCT_RA_DRIV.func_name
  is '功能中心名称';
comment on column ABC_FCT_RA_DRIV.acti_code
  is '作业代码';
comment on column ABC_FCT_RA_DRIV.acti_name
  is '作业名';
comment on column ABC_FCT_RA_DRIV.car_no
  is '车牌';
comment on column ABC_FCT_RA_DRIV.driv_code
  is '动因代码';
comment on column ABC_FCT_RA_DRIV.driv_name
  is '动因名称';
comment on column ABC_FCT_RA_DRIV.qty
  is '动因量';
comment on column ABC_FCT_RA_DRIV.load_tm
  is '加载时间';




-- Create table
create table ABC_FCT_AA_DRIV
(
  month_code     VARCHAR2(10),
  dept_code      VARCHAR2(30),
  dept_type      VARCHAR2(100),
  dept_type_name VARCHAR2(100),
  func_code      VARCHAR2(30),
  func_name      VARCHAR2(100),
  acti_code      VARCHAR2(50),
  acti_name      VARCHAR2(100),
  car_no         VARCHAR2(10),
  driv_code      VARCHAR2(10),
  driv_name      VARCHAR2(100),
  qty            NUMBER,
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
comment on table ABC_FCT_AA_DRIV
  is 'AA动因结果表';
-- Add comments to the columns 
comment on column ABC_FCT_AA_DRIV.month_code
  is '月份';
comment on column ABC_FCT_AA_DRIV.dept_code
  is '机构代码';
comment on column ABC_FCT_AA_DRIV.dept_type
  is '机构类型';
comment on column ABC_FCT_AA_DRIV.dept_type_name
  is '机构类型名';
comment on column ABC_FCT_AA_DRIV.func_code
  is '功能中心代码';
comment on column ABC_FCT_AA_DRIV.func_name
  is '功能中心名称';
comment on column ABC_FCT_AA_DRIV.acti_code
  is '作业代码';
comment on column ABC_FCT_AA_DRIV.acti_name
  is '作业名';
comment on column ABC_FCT_AA_DRIV.car_no
  is '车牌';
comment on column ABC_FCT_AA_DRIV.driv_code
  is '动因代码';
comment on column ABC_FCT_AA_DRIV.driv_name
  is '动因名称';
comment on column ABC_FCT_AA_DRIV.qty
  is '动因量';
comment on column ABC_FCT_AA_DRIV.load_tm
  is '加载时间';





-- Create table
create table ABC_FCT_AO_DRIV
(
  month_code     VARCHAR2(10),
  dept_code      VARCHAR2(30),
  dept_type      VARCHAR2(100),
  dept_type_name VARCHAR2(100),
  func_code      VARCHAR2(30),
  func_name      VARCHAR2(100),
  acti_code      VARCHAR2(50),
  acti_name      VARCHAR2(100),
  car_no         VARCHAR2(10),
  driv_code      VARCHAR2(10),
  driv_name      VARCHAR2(100),
  qty            NUMBER,
  waybill_no     VARCHAR2(100),
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
comment on table ABC_FCT_AO_DRIV
  is 'AO动因结果表';
-- Add comments to the columns 
comment on column ABC_FCT_AO_DRIV.month_code
  is '月份';
comment on column ABC_FCT_AO_DRIV.dept_code
  is '机构代码';
comment on column ABC_FCT_AO_DRIV.dept_type
  is '机构类型';
comment on column ABC_FCT_AO_DRIV.dept_type_name
  is '机构类型名';
comment on column ABC_FCT_AO_DRIV.func_code
  is '功能中心代码';
comment on column ABC_FCT_AO_DRIV.func_name
  is '功能中心名称';
comment on column ABC_FCT_AO_DRIV.acti_code
  is '作业代码';
comment on column ABC_FCT_AO_DRIV.acti_name
  is '作业名';
comment on column ABC_FCT_AO_DRIV.car_no
  is '车牌';
comment on column ABC_FCT_AO_DRIV.driv_code
  is '动因代码';
comment on column ABC_FCT_AO_DRIV.driv_name
  is '动因名称';
comment on column ABC_FCT_AO_DRIV.qty
  is '动因量';
comment on column ABC_FCT_AO_DRIV.waybill_no
  is '运单号';
comment on column ABC_FCT_AO_DRIV.load_tm
  is '加载时间';




