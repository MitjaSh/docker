-- Типы активов
select instrument_type, d_bt.value as bond_type, round(sum(invest_stat.fn_get_rub_amt(current_price, ccy)*quantity), 2) amt
  from invest_stat.instruments i
  join invest_stat.ownership o on i.instrument_uid = o.instrument_uid 
  left join invest_stat.bonds b on i.instrument_uid = b.instrument_uid
  left join invest_stat.dict d_bt on d_bt.id = b.type and  d_bt.dict = 'bond_type'
 group by i.instrument_type, d_bt.value
 order by i.instrument_type, d_bt.value
     ;

/*
2026-09-03
bond	NORMAL_BOND	9087971.01
bond	REPLACEMENT_BOND	5481009.28
currency		262597.26
debt_dfa		95355.00
etf		2625402.79
share		6415588.48
*/
  
select invest_stat.fn_get_rub_amt(current_price, ccy)*quantity amt, *
  from invest_stat.instruments i
  join invest_stat.ownership o on i.instrument_uid = o.instrument_uid 
  left join invest_stat.bonds b on i.instrument_uid = b.instrument_uid
  left join invest_stat.dict d_bt on d_bt.id = b.type and  d_bt.dict = 'bond_type'
 where instrument_type = 'currency'
     ;

select *
  from invest_stat.instruments i
 where instrument_type = 'currency'
     ;
-- Доллар США	Dollar	86.75



-- Бренды
select instrument_type, brand, round(sum(invest_stat.fn_get_rub_amt(current_price, ccy)*quantity), 2) amt
  from invest_stat.instruments i
  join invest_stat.ownership o on i.instrument_uid = o.instrument_uid 
  left join invest_stat.bonds b on i.instrument_uid = b.instrument_uid
  left join invest_stat.dict d_bt on d_bt.id = b.type and  d_bt.dict = 'bond_type'
 where quantity > 0
 group by i.instrument_type, brand
 order by 3 desc
     ;