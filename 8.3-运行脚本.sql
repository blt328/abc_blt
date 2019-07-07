begin
  -- Call the procedure
  p_abc_fct_ao_driv(date '2019-06-01');
  p_abc_fct_rr_dist(date '2019-06-01');
  p_abc_fct_ra_dist(date '2019-06-01');
  p_abc_fct_aa_dist(date '2019-06-01');
  p_abc_fct_ao_dist(date '2019-06-01');
  p_abc_fct_check_dist(date '2019-06-01');
  p_abc_fct_no_dist_list(date '2019-06-01');
end;

select * from abc_fct_chk_dist a where a.month_code='201905';
select * from abc_fct_no_dist_list a where a.month_code='201905';


