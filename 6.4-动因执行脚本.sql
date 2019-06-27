
begin
  -- Call the procedure
  p_abc_bsl_op_waybill(date '2019-05-01', DATE '2019-06-01');
  p_abc_fct_rr_driv(DATE '2019-06-01');
  p_abc_fct_ra_driv(DATE '2019-06-01');
  p_abc_fct_aa_driv(DATE '2019-06-01');
  p_abc_fct_ao_driv(DATE '2019-06-01');
end;


select * from ABC_REL_DRIV_LOGIC a where a.op_dt<date'2019-06-01';
select * from abc_fct_rr_driv;
select * from abc_fct_ra_driv;
select * from abc_fct_aa_driv;
select * from abc_fct_ao_driv a where a.driv_code='AO005';

