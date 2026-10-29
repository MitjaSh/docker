create table my_firest(c varchar(50));

alter table my_firest add column d numeric;

insert into my_firest values ('Один');

select * from my_firest;

select * from invest_stat.accounts;

select * from invest_stat.stg_positions where upload_id = '20260827150827' and brand like 'Новатэк%';

select * from invest_stat.stg_upload order by upload_id desc;

select count(*) from invest_stat.stg_positions;

select count(*)
  from invest_stat.stg_positions p
  join invest_stat.accounts a on p.account_id = a.id 
     ;

delete from invest_stat.operations;

select count(*) from invest_stat.operations;

select * from invest_stat.operations where status <> 1 order by operation_time desc;

select * from invest_stat.operations where instrument_uid = '' order by operation_time desc;

select distinct status, status_name from invest_stat.operations;

select distinct 'insert into invest_stat.dict (dict, id, value) values (''operation_type'', '||operation_type||', '''||operation_type_name||''');', operation_type from invest_stat.operations order by operation_type;

select * from invest_stat.dict;

select * from invest_stat.stg_upload order by upload_id desc;

delete from invest_stat.stg_upload where upload_type = 'Operations';

select * from invest_stat.operations order by operation_time desc;


select DATE_TRUNC('month', operation_time)
     , owner
     , a.name
     , count(*)
  from invest_stat.operations o
  left join invest_stat.accounts a on o.account_id = a.id 
  group by DATE_TRUNC('month', operation_time)
     , owner
     , a."name" 
     order by 1,2,3
     ;


select DATE_TRUNC('month', operation_time)
     , count(*)
  from invest_stat.operations o
  join invest_stat.accounts a on o.account_id = a.id 
  group by DATE_TRUNC('month', operation_time) 
     order by 1
     ;

select count(*), min(operation_time), max(operation_time) from invest_stat.operations where upload_id = '20260827181552';

select count(*), min(operation_time), max(operation_time) from invest_stat.operations where upload_id = '20260827181320';

select * from invest_stat.operations where id = '13673851793';

select count(*) from invest_stat.operations;

select * from invest_stat.stg_positions where brand like '%алтий%';

select sum(quantity) from invest_stat.stg_positions where brand like '%алтий%';

select * from invest_stat.stg_positions where blocked_quantity<>0;

select * from invest_stat.stg_positions where blocked = true;

select * from invest_stat.stg_positions where name like 'Tes%' 

select * from invest_stat.stg_positions where exchange_blocked = true;

select * from invest_stat.accounts;

select trading_status, count(*) from invest_stat.stg_positions group by trading_status;

select sum(current_price * quantity), ccy  from invest_stat.stg_positions  where trading_status in (1,14,4) group by ccy;

select max(operation_time) mot from invest_stat.operations;

delete from invest_stat.operations;

select upload_id, count(*) from invest_stat.stg_positions group by upload_id;

select * from invest_stat.stg_upload where upload_id = '20260828121549';

delete from invest_stat.stg_upload where upload_id = '20260828173120';

select max(operation_time) mot, count(*) from invest_stat.operations;
-- 2026-08-28 16:34:17.000	15444
-- 2026-08-28 16:29:10.000	15443



delete from invest_stat.operations where id = '226541078608';

select * from invest_stat.operations order by operation_time desc;


select * from invest_stat.accounts;

select * from invest_stat.dict;

select * from invest_stat.stg_positions where brand like '%Сег%';


select count(*)
  from invest_stat.operations o
  left join invest_stat.dict d on d.id = o.operation_type and d.dict = 'operation_type'
     ;

select date_trunc('Month', operation_time) mon
     , d.value operation_type
     , o.ccy 
     ,sum(o.amount)
  from invest_stat.operations o
  left join invest_stat.dict d on d.id = o.operation_type and d.dict = 'operation_type'
 where status = 1
   --and d.value in ('OPERATION_TYPE_COUPON', 'OPERATION_TYPE_DIVIDEND')
 group by date_trunc('Month', operation_time) 
     , d.value
     , o.ccy
 order by date_trunc('Month', operation_time) 
     , d.value
     , o.ccy
     ;

select date_trunc('Month', operation_time) mon
     , o.ccy 
     ,sum(o.amount)
  from invest_stat.operations o
  left join invest_stat.dict d on d.id = o.operation_type and d.dict = 'operation_type'
 where status = 1
   and d.value in ('OPERATION_TYPE_COUPON', 'OPERATION_TYPE_DIVIDEND', 'OPERATION_TYPE_TAX', 'OPERATION_TYPE_DIVIDEND_TAX', 'OPERATION_TYPE_BROKER_FEE', 'OPERATION_TYPE_TAX_CORRECTION', 'OPERATION_TYPE_TAX')
 group by date_trunc('Month', operation_time) 
     , o.ccy
 order by date_trunc('Month', operation_time) desc
     , o.ccy
     ;


SELECT version();

insert into invest_stat.instruments (instrument_uid, current_price, ccy, bond_nominal, blocked, trading_status) values (1, 1,'rur', 1000, false, 1);

select * from invest_stat.instruments ;

update invest_stat.instruments set current_price = 2, bond_nominal = bond_nominal-199;

select * from invest_stat.instruments_hist; 

insert into invest_stat.ownership (account_id, instrument_uid, quantity ,blocked_quantity,average_price) values (1,2,3,4,5);

update invest_stat.ownership set average_price = average_price * 1.03;

select * from invest_stat.ownership;


select * from invest_stat.ownership_hist;

delete from invest_stat.ownership;
delete from invest_stat.ownership_hist;
delete from invest_stat.instruments;
delete from invest_stat.instruments_hist;
update invest_stat.stg_upload set status = 'U' where upload_id = '20260828121549';

select min(upload_id) from invest_stat.stg_upload;

select * from invest_stat.stg_upload order by upload_id desc;

call invest_stat.pr_process_positions();

select * from invest_stat.instruments;

select * from invest_stat.instruments where mod_no > 1;

select * from invest_stat.instruments_hist;

select * from invest_stat.ownership;

select * from invest_stat.ownership_hist;

update invest_stat.instruments set current_price = 88, bond_nominal = 100 where instrument_uid = '0054309c-8c00-430e-879f-0c128e6b9802';

select * from invest_stat.instruments where instrument_uid = '0054309c-8c00-430e-879f-0c128e6b9802';

select count(*) from invest_stat.ownership;

select i.brand
     , o.ccy 
     , sum(o.amount)
  from invest_stat.operations o
  left join invest_stat.dict d on d.id = o.operation_type and d.dict = 'operation_type'
  left join invest_stat.instruments i on i.instrument_uid = o.instrument_uid
 where status = 1
   and d.value in ('OPERATION_TYPE_COUPON', 'OPERATION_TYPE_DIVIDEND')
   and operation_time >= '2026-01-01'
 group by i.brand, o.ccy
 order by sum(o.amount) desc
     ;

select replace(brand, ' (ISIN)', ''), p.* from invest_stat.stg_positions p where 1=1;


select distinct o.instrument_uid
  from invest_stat.operations o
  left join invest_stat.dict d on d.id = o.operation_type and d.dict = 'operation_type'
  left join invest_stat.instruments i on i.instrument_uid = o.instrument_uid
 where status = 1
   and d.value in ('OPERATION_TYPE_COUPON', 'OPERATION_TYPE_DIVIDEND')
   and operation_time >= '2026-01-01'
   and i.brand is null
     ;