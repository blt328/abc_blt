
insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'RR002', '收派票数', '1010', '收件', null, null, null, null, null, null, 'YYD', null, '按收件网点统计的票数', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'RR002', '收派票数', '1020', '派件', null, null, null, null, null, null, 'YYD', null, '按派件网点统计的票数', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'RA002', '车辆运行的线路类型里程', '1030', '运输', '201000', '支线', null, '20', null, null, 'ZZC', null, '车辆行使的支线里程', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'RA002', '车辆运行的线路类型里程', '1030', '运输', '202000', '干线', null, '10', null, null, 'ZZC', null, '车辆行使的干线里程', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'RA002', '车辆运行的线路类型里程', '1030', '运输', '201000', '支线', null, '20', null, null, 'YYD', null, '车辆行使的支线里程', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'RA002', '车辆运行的线路类型里程', '1030', '运输', '202000', '干线', null, '10', null, null, 'YYD', null, '车辆行使的干线里程', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'RA003', '装卸中转票数', '1050', '操作', '301000', '装卸', '30', null, null, 1, 'ZZC', null, '装卸和中转相乘系数的票数', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'RA003', '装卸中转票数', '1050', '操作', '301000', '装卸', '31', null, null, 1, 'ZZC', null, '装卸和中转相乘系数的票数', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'RA003', '装卸中转票数', '1050', '操作', '302000', '中转', '30', null, null, 1.5, 'ZZC', null, '装卸和中转相乘系数的票数', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AA002', '车辆装载重量的正常闲置', '1030', '运输', '201010', '支线正常', null, '20', null, null, 'ZZC', null, '车辆的正常和闲置重量', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AA002', '车辆装载重量的正常闲置', '1030', '运输', '201020', '支线闲置', null, '20', null, null, 'ZZC', null, '车辆的正常和闲置重量', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AA002', '车辆装载重量的正常闲置', '1030', '运输', '202010', '干线正常', null, '10', null, null, 'ZZC', null, '车辆的正常和闲置重量', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AA002', '车辆装载重量的正常闲置', '1030', '运输', '202020', '干线闲置', null, '10', null, null, 'ZZC', null, '车辆的正常和闲置重量', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AA002', '车辆装载重量的正常闲置', '1030', '运输', '201010', '支线正常', null, '20', null, null, 'YYD', null, '车辆的正常和闲置重量', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AA002', '车辆装载重量的正常闲置', '1030', '运输', '201020', '支线闲置', null, '20', null, null, 'YYD', null, '车辆的正常和闲置重量', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AA002', '车辆装载重量的正常闲置', '1030', '运输', '202010', '干线正常', null, '10', null, null, 'YYD', null, '车辆的正常和闲置重量', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AA002', '车辆装载重量的正常闲置', '1030', '运输', '202020', '干线闲置', null, '10', null, null, 'YYD', null, '车辆的正常和闲置重量', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AA003', '整包单件装卸票数', '1050', '操作', '301010', '整包装卸', null, null, '1', null, 'ZZC', null, '整包单件装卸票数', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AA003', '整包单件装卸票数', '1050', '操作', '301020', '单件装卸', null, null, '0', null, 'ZZC', null, '整包单件装卸票数', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AA004', '整包单件中转票数', '1050', '操作', '302010', '整包中转', '30', null, '1', null, 'ZZC', null, '整包单件中转票数', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AA004', '整包单件中转票数', '1050', '操作', '302020', '单件中转', '30', null, '0', null, 'ZZC', null, '整包单件中转票数', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO002', '收件运单', '1010', '收件', '101010', '收件作业', null, null, null, null, 'YYD', null, '收件运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO003', '派件运单', '1020', '派件', '101020', '派件作业', null, null, null, null, 'YYD', null, '派件运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO004', '收派运单', '1040', '管理', '101040', '管理支持', null, null, null, null, 'YYD', null, '收派运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO005', '车辆运输的运单', '1030', '运输', '201010', '支线正常', null, '20', null, null, 'ZZC', null, '车辆运输的运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO005', '车辆运输的运单', '1030', '运输', '201020', '支线闲置', null, '20', null, null, 'ZZC', null, '车辆运输的运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO005', '车辆运输的运单', '1030', '运输', '202010', '干线正常', null, '10', null, null, 'ZZC', null, '车辆运输的运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO005', '车辆运输的运单', '1030', '运输', '202020', '干线闲置', null, '10', null, null, 'ZZC', null, '车辆运输的运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO005', '车辆运输的运单', '1030', '运输', '201010', '支线正常', null, '20', null, null, 'YYD', null, '车辆运输的运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO005', '车辆运输的运单', '1030', '运输', '201020', '支线闲置', null, '20', null, null, 'YYD', null, '车辆运输的运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO005', '车辆运输的运单', '1030', '运输', '202010', '干线正常', null, '10', null, null, 'YYD', null, '车辆运输的运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO005', '车辆运输的运单', '1030', '运输', '202020', '干线闲置', null, '10', null, null, 'YYD', null, '车辆运输的运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO006', '整包装卸的运单', '1050', '操作', '301010', '整包装卸', null, null, '1', null, 'ZZC', null, '整包装卸的运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO007', '单件装卸的运单', '1050', '操作', '301020', '单件装卸', null, null, '0', null, 'ZZC', null, '单件装卸的运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO008', '整包中转的运单', '1050', '操作', '302010', '整包中转', '30', null, '1', null, 'ZZC', null, '整包中转的运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO009', '单件中转的运单', '1050', '操作', '302020', '单件中转', '30', null, '0', null, 'ZZC', null, '单件中转的运单', null);

insert into ABC_REL_DRIV_LOGIC (FM_TM, TO_TM, DRIV_CODE, DRIV_NAME, FUNC_CODE, FUNC_NAME, ACTI_CODE, ACTI_NAME, OP_CODE, LINE_LEVE, PKG_STATE, RT, DEPT_TYPE, PROD_CODE, REMARK, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'AO010', '收件电商产品运单', '1050', '操作', '101010', '收件作业', null, null, null, null, 'YYD', 'P002', '收件电商产品运单', null);

