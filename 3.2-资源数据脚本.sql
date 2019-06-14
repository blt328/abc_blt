
insert into ABC_DIM_RESO (FM_DT, TO_DT, RESO_CODE, RESO_NAME, L1_RESO_CODE, L1_RESO_NAME, L2_RESO_CODE, L2_RESO_NAME, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'ZY0101', '薪酬福利', 'ZY00', '总资源', 'ZY01', '人工成本', null);

insert into ABC_DIM_RESO (FM_DT, TO_DT, RESO_CODE, RESO_NAME, L1_RESO_CODE, L1_RESO_NAME, L2_RESO_CODE, L2_RESO_NAME, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'ZY0201', '设备折旧', 'ZY00', '总资源', 'ZY02', '设备成本', null);

insert into ABC_DIM_RESO (FM_DT, TO_DT, RESO_CODE, RESO_NAME, L1_RESO_CODE, L1_RESO_NAME, L2_RESO_CODE, L2_RESO_NAME, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'ZY0301', '运输费', 'ZY00', '总资源', 'ZY03', '运输成本', null);

insert into ABC_DIM_RESO (FM_DT, TO_DT, RESO_CODE, RESO_NAME, L1_RESO_CODE, L1_RESO_NAME, L2_RESO_CODE, L2_RESO_NAME, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'ZY0401', '物料费', 'ZY00', '总资源', 'ZY04', '物料成本', null);

insert into ABC_DIM_RESO (FM_DT, TO_DT, RESO_CODE, RESO_NAME, L1_RESO_CODE, L1_RESO_NAME, L2_RESO_CODE, L2_RESO_NAME, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'ZY0402', '生鲜物料费', 'ZY00', '总资源', 'ZY04', '物料成本', null);



insert into abc_rel_subj_reso (FM_DT, TO_DT, SUBJ_CODE, SUBJ_NAME, RESO_CODE, RESO_NAME, RESO_TYPE, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), '600101', '基本工资', 'ZY0101', '薪酬福利', '科目归类', null);

insert into abc_rel_subj_reso (FM_DT, TO_DT, SUBJ_CODE, SUBJ_NAME, RESO_CODE, RESO_NAME, RESO_TYPE, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), '600102', '社保', 'ZY0101', '薪酬福利', '科目归类', null);

insert into abc_rel_subj_reso (FM_DT, TO_DT, SUBJ_CODE, SUBJ_NAME, RESO_CODE, RESO_NAME, RESO_TYPE, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), '600103', '福利', 'ZY0101', '薪酬福利', '科目归类', null);

insert into abc_rel_subj_reso (FM_DT, TO_DT, SUBJ_CODE, SUBJ_NAME, RESO_CODE, RESO_NAME, RESO_TYPE, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), '600201', '皮带机折旧', 'ZY0201', '设备折旧', '科目归类', null);

insert into abc_rel_subj_reso (FM_DT, TO_DT, SUBJ_CODE, SUBJ_NAME, RESO_CODE, RESO_NAME, RESO_TYPE, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), '600202', '发动机折旧', 'ZY0201', '设备折旧', '科目归类', null);

insert into abc_rel_subj_reso (FM_DT, TO_DT, SUBJ_CODE, SUBJ_NAME, RESO_CODE, RESO_NAME, RESO_TYPE, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), '600301', '车辆油费', 'ZY0301', '运输费', '科目归类', null);

insert into abc_rel_subj_reso (FM_DT, TO_DT, SUBJ_CODE, SUBJ_NAME, RESO_CODE, RESO_NAME, RESO_TYPE, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), '600302', '车辆过桥费', 'ZY0301', '运输费', '科目归类', null);

insert into abc_rel_subj_reso (FM_DT, TO_DT, SUBJ_CODE, SUBJ_NAME, RESO_CODE, RESO_NAME, RESO_TYPE, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), '600401', '材料费', 'ZY0401', '物料费', '科目归类', null);

insert into abc_rel_subj_reso (FM_DT, TO_DT, SUBJ_CODE, SUBJ_NAME, RESO_CODE, RESO_NAME, RESO_TYPE, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), '600402', '保鲜材料费', 'ZY0402', '生鲜物料费', '资源性质', null);


