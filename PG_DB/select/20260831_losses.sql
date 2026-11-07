--Custom
with x as (
	select i.name, i.isin, brand
	     , b.nominal
	     , b.callput_date
	     , b.maturity_date     
	     , i.current_price
	     , sum(o.quantity) quantity
	     , sum(o.quantity * i.current_price) current_amount
	     , sum(average_price * o.quantity) buy_amount
	     , sum(average_price * o.quantity)/sum(o.quantity) average_price
	  from invest_stat.instruments i
	  left join invest_stat.bonds b on i.instrument_uid = b.instrument_uid
	  join invest_stat.ownership o on i.instrument_uid = o.instrument_uid
	  left join invest_stat.accounts a on o.account_id = a.id 
	 where lower(i.name) like '%donald%'
	 group by i.name, i.isin, brand
	     , b.nominal
	     , i.current_price
	     , b.callput_date
	     , b.maturity_date)
select x.*
     , sum(current_amount) over (partition by 1) total_amount
  from x	     
	 ;

--Детализация до счета 
select a.owner||'/'||a.name account
     ,i.name, i.isin, brand
     , b.nominal
     , b.callput_date
     , b.maturity_date     
     , i.current_price
     , o.quantity
     , o.quantity * i.current_price current_amount
     , average_price * o.quantity buy_amount
     , average_price
  from invest_stat.instruments i
  left join invest_stat.bonds b on i.instrument_uid = b.instrument_uid
  join invest_stat.ownership o on i.instrument_uid = o.instrument_uid
  left join invest_stat.accounts a on o.account_id = a.id 
 where lower(i.name) like '%вис ф%';


select * from invest_stat.instruments i where isin ='US5801351017';