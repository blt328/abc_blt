

delete abc_dim_reso;


insert into abc_dim_reso (FM_DT, TO_DT, RESO_CODE, RESO_NAME, L1_RESO_CODE, L1_RESO_NAME, L2_RESO_CODE, L2_RESO_NAME, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'ZY0101', '薪酬福利', 'ZY00', '总资源', 'ZY01', '人工成本', null);

insert into abc_dim_reso (FM_DT, TO_DT, RESO_CODE, RESO_NAME, L1_RESO_CODE, L1_RESO_NAME, L2_RESO_CODE, L2_RESO_NAME, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'ZY0201', '设备折旧', 'ZY00', '总资源', 'ZY02', '设备成本', null);

insert into abc_dim_reso (FM_DT, TO_DT, RESO_CODE, RESO_NAME, L1_RESO_CODE, L1_RESO_NAME, L2_RESO_CODE, L2_RESO_NAME, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'ZY0301', '运输费', 'ZY00', '总资源', 'ZY03', '运输成本', null);

insert into abc_dim_reso (FM_DT, TO_DT, RESO_CODE, RESO_NAME, L1_RESO_CODE, L1_RESO_NAME, L2_RESO_CODE, L2_RESO_NAME, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'ZY0401', '物料费', 'ZY00', '总资源', 'ZY04', '物料成本', null);

insert into abc_dim_reso (FM_DT, TO_DT, RESO_CODE, RESO_NAME, L1_RESO_CODE, L1_RESO_NAME, L2_RESO_CODE, L2_RESO_NAME, LOAD_TM)
values (to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'ZY0402', '生鲜物料费', 'ZY00', '总资源', 'ZY04', '物料成本', null);








delete abc_rel_cust;

insert into abc_rel_cust (CUST_CODE, CUST_NAME, INDU_L1, INDU_L2, LOAD_TM)
values ('C100', '华为', '制造业', '手机', null);

insert into abc_rel_cust (CUST_CODE, CUST_NAME, INDU_L1, INDU_L2, LOAD_TM)
values ('C101', '中兴', '制造业', '手机', null);

insert into abc_rel_cust (CUST_CODE, CUST_NAME, INDU_L1, INDU_L2, LOAD_TM)
values ('C102', '小米', '制造业', '手机', null);

insert into abc_rel_cust (CUST_CODE, CUST_NAME, INDU_L1, INDU_L2, LOAD_TM)
values ('C103', '中行', '金融', '银行', null);

insert into abc_rel_cust (CUST_CODE, CUST_NAME, INDU_L1, INDU_L2, LOAD_TM)
values ('C104', '建行', '金融', '银行', null);

insert into abc_rel_cust (CUST_CODE, CUST_NAME, INDU_L1, INDU_L2, LOAD_TM)
values ('C105', '农行', '金融', '银行', null);

insert into abc_rel_cust (CUST_CODE, CUST_NAME, INDU_L1, INDU_L2, LOAD_TM)
values ('C106', '齐心', '制造业', '文具', null);

insert into abc_rel_cust (CUST_CODE, CUST_NAME, INDU_L1, INDU_L2, LOAD_TM)
values ('C107', '德力', '制造业', '文具', null);

insert into abc_rel_cust (CUST_CODE, CUST_NAME, INDU_L1, INDU_L2, LOAD_TM)
values ('C108', '京东', '互联网', '电商', null);

insert into abc_rel_cust (CUST_CODE, CUST_NAME, INDU_L1, INDU_L2, LOAD_TM)
values ('C109', '淘宝', '互联网', '电商', null);





delete abc_rel_prod;

insert into abc_rel_prod (PROD_CODE, PROD_NAME, FIRST_PRIC, ADD_PRIC, LOAD_TM)
values ('P001', '标快', 20, 5, null);

insert into abc_rel_prod (PROD_CODE, PROD_NAME, FIRST_PRIC, ADD_PRIC, LOAD_TM)
values ('P002', '电商', 12, 4, null);

insert into abc_rel_prod (PROD_CODE, PROD_NAME, FIRST_PRIC, ADD_PRIC, LOAD_TM)
values ('P003', '即日', 25, 8, null);

insert into abc_rel_prod (PROD_CODE, PROD_NAME, FIRST_PRIC, ADD_PRIC, LOAD_TM)
values ('P004', '次日', 22, 6, null);






delete abc_rel_subj_reso;

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





delete ods_dept;

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('100', '总部', 'ZB', '总部', null, '755', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('755AB', '深圳南山营业点', 'YYD', '营业点', '755Y', '755', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('755AC', '深圳福田营业点', 'YYD', '营业点', '755Y', '755', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('755W', '深圳中转场', 'ZZC', '中转场', '111Y', '755', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('755Y', '深圳区部', 'YYC', '业务区', '100', '755', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('111Y', '华南分拨区', 'FBC', '分拨区', '100', '755', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('021AB', '上海浦东', 'YYD', '营业点', '021Y', '021', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('021AC', '上海嘉定', 'YYD', '营业点', '021Y', '021', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('021W', '上海中转场', 'ZZC', '中转场', '222Y', '021', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('021Y', '上海区部', 'YYC', '业务区', '100', '755', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('222Y', '华中分拨区', 'FBC', '分拨区', '100', '755', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('010AB', '北京西城', 'YYD', '营业点', '010Y', '010', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('010AC', '北京朝阳', 'YYD', '营业点', '010Y', '010', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('010W', '北京中转场', 'ZZC', '中转场', '333Y', '010', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('010Y', '北京区部', 'YYC', '业务区', '100', '755', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('333Y', '华北分拨区', 'FBC', '分拨区', '100', '755', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('020AB', '广州天河营业点', 'YYD', '营业点', '020Y', '020', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('020AC', '广州越秀营业点', 'YYD', '营业点', '020Y', '020', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('020W', '广州中转场', 'ZZC', '中转场', '111Y', '020', null);

insert into ods_dept (DEPT_CODE, DEPT_NAME, DEPT_TYPE, DEPT_TYPE_NAME, PARENT_CODE, CITY_CODE, LOAD_TM)
values ('020Y', '广州区部', 'YYC', '业务区', '100', '755', null);

