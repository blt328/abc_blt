---------------------------------------机构建表脚本-----------------------------------------------------------------------
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
  is 'ODS机构表';
-- Add comments to the columns 
comment on column ODS_DEPT.dept_code
  is '部门代码';
comment on column ODS_DEPT.dept_name
  is '部门名称';
comment on column ODS_DEPT.dept_type
  is '部门类型';
comment on column ODS_DEPT.dept_type_name
  is '部门类型名称';
comment on column ODS_DEPT.parent_code
  is '父结点';
comment on column ODS_DEPT.city_code
  is '城市';
comment on column ODS_DEPT.load_tm
  is '加载时间';







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
  is '机构维度表';
-- Add comments to the columns 
comment on column ABC_DIM_DEPT.dept_id
  is '机构ID代理键';
comment on column ABC_DIM_DEPT.dept_code
  is '部门代码';
comment on column ABC_DIM_DEPT.dept_name
  is '部门名称';
comment on column ABC_DIM_DEPT.dept_type
  is '网点类型';
comment on column ABC_DIM_DEPT.dept_type_name
  is '网点类型名';
comment on column ABC_DIM_DEPT.fm_tm
  is '开始日期';
comment on column ABC_DIM_DEPT.to_tm
  is '结束日期';
comment on column ABC_DIM_DEPT.level1_code
  is '层级1代码';
comment on column ABC_DIM_DEPT.level1_name
  is '层级1名称';
comment on column ABC_DIM_DEPT.level2_code
  is '层级2代码';
comment on column ABC_DIM_DEPT.level2_name
  is '层级2名称';
comment on column ABC_DIM_DEPT.level3_code
  is '层级3代码';
comment on column ABC_DIM_DEPT.level3_name
  is '层级3名称';
comment on column ABC_DIM_DEPT.level4_code
  is '层级4代码';
comment on column ABC_DIM_DEPT.level4_name
  is '层级4名称';
comment on column ABC_DIM_DEPT.level5_code
  is '层级5代码';
comment on column ABC_DIM_DEPT.level5_name
  is '层级5名称';
comment on column ABC_DIM_DEPT.parent_code
  is '父结点';
comment on column ABC_DIM_DEPT.city_code
  is '城市';
comment on column ABC_DIM_DEPT.type_level
  is '层级';
comment on column ABC_DIM_DEPT.load_tm
  is '加载时间';



---------------------------------------运单--------------------------------------------------------------
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
  is '运单基础信息表';
-- Add comments to the columns 
comment on column ABC_BSL_WAYBILL.waybill_no
  is '运单号';
comment on column ABC_BSL_WAYBILL.rec_dt
  is '收件日期';
comment on column ABC_BSL_WAYBILL.send_dt
  is '派件日期';
comment on column ABC_BSL_WAYBILL.cust_code
  is '客户卡号';
comment on column ABC_BSL_WAYBILL.rec_dept
  is '收件网点';
comment on column ABC_BSL_WAYBILL.send_dept
  is '派件网点';
comment on column ABC_BSL_WAYBILL.rec_city
  is '收件城市';
comment on column ABC_BSL_WAYBILL.send_city
  is '派件城市';
comment on column ABC_BSL_WAYBILL.prod_code
  is '产品代码';
comment on column ABC_BSL_WAYBILL.prod_name
  is '产品名';
comment on column ABC_BSL_WAYBILL.wt
  is '计费重量';
comment on column ABC_BSL_WAYBILL.amt
  is '金额';
comment on column ABC_BSL_WAYBILL.load_tm
  is '加载时间';





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
  is '客户维表';
-- Add comments to the columns 
comment on column ABC_REL_CUST.cust_code
  is '客户代码';
comment on column ABC_REL_CUST.cust_name
  is '客户名';
comment on column ABC_REL_CUST.indu_l1
  is '1级行业';
comment on column ABC_REL_CUST.indu_l2
  is '2级行业';
comment on column ABC_REL_CUST.load_tm
  is '加载时间';



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
  is '产品维表';
-- Add comments to the columns 
comment on column ABC_REL_PROD.prod_code
  is '产品代码';
comment on column ABC_REL_PROD.prod_name
  is '产品名';
comment on column ABC_REL_PROD.first_pric
  is '首价';
comment on column ABC_REL_PROD.add_pric
  is '续价';
comment on column ABC_REL_PROD.load_tm
  is '加载时间';


----------------------------------------成本-------------------------------------------------------------------

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
comment on column ODS_SUBJ_ACCO.amt
  is '金额';
comment on column ODS_SUBJ_ACCO.load_tm
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
  is 'ABC资源结果表';
-- Add comments to the columns 
comment on column ABC_FCT_RESO_LIST.month_code
  is '月份';
comment on column ABC_FCT_RESO_LIST.dept_code
  is '机构代码';
comment on column ABC_FCT_RESO_LIST.dept_type
  is '机构类型';
comment on column ABC_FCT_RESO_LIST.dept_type_name
  is '机构类型名';
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
comment on column ABC_FCT_RESO_LIST.amt
  is '金额';
comment on column ABC_FCT_RESO_LIST.load_tm
  is '加载时间';



----------------------------------------业务量--------------------------------------------------------------------------

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
  is '运单操作基础表';
-- Add comments to the columns 
comment on column ABC_BSL_OP_WAYBILL.op_dt
  is '操作日期';
comment on column ABC_BSL_OP_WAYBILL.op_dept_code
  is '操作网点';
comment on column ABC_BSL_OP_WAYBILL.op_code
  is '操作码';
comment on column ABC_BSL_OP_WAYBILL.op_name
  is '操作码名称';
comment on column ABC_BSL_OP_WAYBILL.waybill_no
  is '运单号';
comment on column ABC_BSL_OP_WAYBILL.car_no
  is '车牌';
comment on column ABC_BSL_OP_WAYBILL.line_code
  is '线路';
comment on column ABC_BSL_OP_WAYBILL.is_pkg
  is '是否包';
comment on column ABC_BSL_OP_WAYBILL.waybill_wt
  is '重量';
comment on column ABC_BSL_OP_WAYBILL.load_tm
  is '加载时间';









