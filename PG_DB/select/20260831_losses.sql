select i.name, i.isin
     , b.nominal
     , b.callput_date
     , b.maturity_date
     , i.current_price
     , sum(o.quantity) quantity
     , sum(o.quantity * i.current_price) current_amount
     , sum(average_price * o.quantity) buy_amount
     , sum(average_price * o.quantity)/sum(o.quantity) average_price
     , sum(average_price * o.quantity)/sum(o.quantity) - i.current_price loss_per_item
     , nominal - i.current_price loss_per_item2
     , 1000 - 960 gain 
  from invest_stat.instruments i 
  left join invest_stat.bonds b on i.instrument_uid = b.instrument_uid
  left join invest_stat.ownership o on i.instrument_uid = o.instrument_uid
  left join invest_stat.accounts a on o.account_id = a.id 
 where brand = 'Балтийский лизинг'
 group by i.name, i.isin
     , b.nominal
     , i.current_price
     , b.callput_date
     , b.maturity_date
     ;
     
-- RU000A10A3W1 961.5 Дата оферты 19.11.2026


select i.name, i.isin
     , b.nominal
     , b.callput_date
     , b.maturity_date     
     , i.current_price
     , sum(o.quantity) quantity
     , sum(o.quantity * i.current_price) current_amount
     , sum(average_price * o.quantity) buy_amount
     , sum(average_price * o.quantity)/sum(o.quantity) average_price
     , sum(average_price * o.quantity)/sum(o.quantity) - i.current_price loss_per_item
     , nominal - i.current_price loss_per_item2
     , 1000 - 994.00 gain 
  from invest_stat.instruments i
  left join invest_stat.bonds b on i.instrument_uid = b.instrument_uid
  left join invest_stat.ownership o on i.instrument_uid = o.instrument_uid
  left join invest_stat.accounts a on o.account_id = a.id 
 where brand like 'Карш%'
 group by i.name, i.isin
     , b.nominal
     , i.current_price
     , b.callput_date
     , b.maturity_date     
     ;
     
-- iКарРус1P4 RU000A109TG2



-- Сегежа
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
  left join invest_stat.ownership o on i.instrument_uid = o.instrument_uid
  left join invest_stat.accounts a on o.account_id = a.id 
 where brand like 'Segezh%'
 group by i.name, i.isin, brand
     , b.nominal
     , i.current_price
     , b.callput_date
     , b.maturity_date     
     ;



--АФК
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
  left join invest_stat.ownership o on i.instrument_uid = o.instrument_uid
  left join invest_stat.accounts a on o.account_id = a.id 
 where brand like 'АФК%'
 group by i.name, i.isin, brand
     , b.nominal
     , i.current_price
     , b.callput_date
     , b.maturity_date     
     ;

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
	 where lower(i.name) like '%пик%'
	 group by i.name, i.isin, brand
	     , b.nominal
	     , i.current_price
	     , b.callput_date
	     , b.maturity_date)
select x.*
     , sum(current_amount) over (partition by 1) total_amount
  from x	     
	 ;


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
 where lower(i.name) like '%пик%';