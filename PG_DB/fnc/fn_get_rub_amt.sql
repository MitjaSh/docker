CREATE OR REPLACE function invest_stat.fn_get_rub_amt(in p_fcy_amt decimal(20,2), in p_ccy varchar) returns decimal(20,2)
LANGUAGE plpgsql
AS $$
DECLARE
	v_rate decimal(20,2);
BEGIN
    if p_ccy = 'rub' then
		return p_fcy_amt;
    elsif p_ccy = 'hkd' then
		return 10.37; -- No trading
	else
		select current_price
          into v_rate
  		  from invest_stat.instruments i
         where instrument_type='currency'
           and figi = case p_ccy
                          when 'usd' then 'USD800UTSTOM'
                          when 'eur' then 'BBG0013HJJ31'
                          when 'cny' then 'BBG0013HRTL0'
                      end;
	end if;

	if v_rate is null then
		RAISE EXCEPTION 'Can''t find rate for: %.', p_ccy;
	end if;

	return p_fcy_amt * v_rate;

END;
$$;


