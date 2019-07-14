-- Create table
create table ABC_BSL_COST_BASE_TMP01
(
  waybill_no        VARCHAR2(100),
  fm_acti_type_code VARCHAR2(10),
  fm_acti_type_name VARCHAR2(100),
  dive_amt          NUMBER,
  car_amt           NUMBER,
  metr_amt          NUMBER,
  mgr_amt           NUMBER,
  pep_amt           NUMBER,
  all_amt           NUMBER
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
create table ABC_BSL_COST_BASE
(
  month_code        VARCHAR2(6),
  rec_dept          VARCHAR2(30),
  rec_area_code     VARCHAR2(30),
  rec_area_name     VARCHAR2(30),
  send_dept         VARCHAR2(30),
  send_area_code    VARCHAR2(30),
  send_area_name    VARCHAR2(30),
  waybill_no        VARCHAR2(30),
  rec_city          VARCHAR2(30),
  send_city         VARCHAR2(30),
  cust_code         VARCHAR2(30),
  cust_name         VARCHAR2(100),
  prod_code         VARCHAR2(30),
  prod_name         VARCHAR2(100),
  income_amt        NUMBER,
  fm_acti_type_code VARCHAR2(10),
  fm_acti_type_name VARCHAR2(100),
  dive_amt          NUMBER,
  car_amt           NUMBER,
  metr_amt          NUMBER,
  mgr_amt           NUMBER,
  pep_amt           NUMBER,
  cost_all_amt      NUMBER,
  rn                NUMBER,
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
comment on table ABC_BSL_COST_BASE
  is 'ABC成本分析基础表';
-- Add comments to the columns 
comment on column ABC_BSL_COST_BASE.month_code
  is '月份';
comment on column ABC_BSL_COST_BASE.rec_dept
  is '收件网点';
comment on column ABC_BSL_COST_BASE.rec_area_code
  is '收件区部代码';
comment on column ABC_BSL_COST_BASE.rec_area_name
  is '收件区部名称';
comment on column ABC_BSL_COST_BASE.send_dept
  is '派件网点';
comment on column ABC_BSL_COST_BASE.send_area_code
  is '派件区部代码';
comment on column ABC_BSL_COST_BASE.send_area_name
  is '派件区部名称';
comment on column ABC_BSL_COST_BASE.waybill_no
  is '运单号';
comment on column ABC_BSL_COST_BASE.rec_city
  is '始发城市';
comment on column ABC_BSL_COST_BASE.send_city
  is '目的城市';
comment on column ABC_BSL_COST_BASE.cust_code
  is '客户代码';
comment on column ABC_BSL_COST_BASE.cust_name
  is '客户名称';
comment on column ABC_BSL_COST_BASE.prod_code
  is '产品代码';
comment on column ABC_BSL_COST_BASE.prod_name
  is '产品名称';
comment on column ABC_BSL_COST_BASE.income_amt
  is '收入';
comment on column ABC_BSL_COST_BASE.fm_acti_type_code
  is '作业代码';
comment on column ABC_BSL_COST_BASE.fm_acti_type_name
  is '作业名称';
comment on column ABC_BSL_COST_BASE.dive_amt
  is '设备成本';
comment on column ABC_BSL_COST_BASE.car_amt
  is '运输成本';
comment on column ABC_BSL_COST_BASE.metr_amt
  is '物料成本';
comment on column ABC_BSL_COST_BASE.mgr_amt
  is '管理成本';
comment on column ABC_BSL_COST_BASE.pep_amt
  is '人工成本';
comment on column ABC_BSL_COST_BASE.cost_all_amt
  is '所有成本';
comment on column ABC_BSL_COST_BASE.rn
  is '收入状态(1时才能用)';
comment on column ABC_BSL_COST_BASE.load_tm
  is '加载时间';


