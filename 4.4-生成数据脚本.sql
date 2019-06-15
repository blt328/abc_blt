
--生成数据
begin
  --机构
  p_abc_dim_dept(date '2019-05-01', 1);
  --运单
  p_abc_data_waybill(date '2019-05-01', date '2019-06-01');
  --成本
  p_abc_data_subj_acco(date '2019-05-01');
  --资源
  p_abc_fct_reso_list(date '2019-05-01');
  --业务量
  p_abc_bsl_op_waybill(date '2019-05-01', date '2019-06-01');
end;

--科目成本接口
select * from ods_subj_acco a where a.month_code='201905';
--运单信息
select * from abc_bsl_waybill a where a.send_dt<date'2019-06-01';
--资源结果表
select * from abc_fct_reso_list a where a.month_code='201905';
--运单操作信息
select * from abc_bsl_op_waybill;
