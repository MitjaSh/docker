select * from invest_stat.stg_upload;

delete from invest_stat.stg_upload where upload_type = 'Positions';
delete from invest_stat.ownership;
delete from invest_stat.ownership_hist;
delete from invest_stat.instruments;
delete from invest_stat.instruments_hist;

select * from invest_stat.stg_positions;

call invest_stat.pr_process_positions();

select * from invest_stat.instruments;

select * from invest_stat.ownership where instrument_uid = 'e6cd495f-454b-49f8-b33f-22f15c640f08';

select * from invest_stat.instruments where instrument_uid in (
'a92e2e25-a698-45cc-a781-167cf465257c','e6cd495f-454b-49f8-b33f-22f15c640f08'
);

select * from invest_stat.operations o order by o.operation_time desc;

select * 
  from invest_stat.operations o
 where o.instrument_uid = '2fd94496-e7e7-4d92-a2b0-6fd466c95bfd'
     ;




select * from invest_stat.ownership_hist;
-- 5-17


select 25*26/30

select 24642*100/(24642+36908), (24642+36908)


select * from invest_stat.instruments_hist;
-- 0

select * from invest_stat.ownership where mod_no > 1;

select upload_id, count(*) from invest_stat.stg_positions where account_id is null group by upload_id;

select * from invest_stat.stg_upload order by upload_id desc;

insert into invest_stat.stg_upload values ('20260901184146', 'Positions', 'U', 280);

delete from invest_stat.stg_upload where upload_id in ('20260902114642');

select * from invest_stat.stg_positions where instrument_uid = 'af7946a1-8c0a-4cb1-b7db-dfc5e32071a0'

select * from invest_stat.stg_positions order by insert_time desc;

select upload_id, count(*) from invest_stat.stg_positions group by upload_id order by upload_id desc;

20260902102437	113



INSERT INTO invest_stat.instruments (instrument_uid, instrument_type, name, brand, current_price, ccy, figi, ticker, isin, asset_uid, blocked, trading_status)
select i.instrument_uid, i.instrument_type, i.name,  
        replace(i.brand, ' (ISIN)', ''), 
        i.current_price, i.ccy, i.figi, i.ticker, i.isin, i.asset_uid, i.blocked, i.trading_status from invest_stat.stg_positions i where upload_id = '20260901184146' and instrument_type is not null;

INSERT INTO invest_stat.bonds (instrument_uid, nominal, type, sector, maturity_date, callput_date)
select i.instrument_uid, i.bond_nominal, i.bond_type, i.bond_sector, i.bond_maturity_date, case when i.bond_callput_date = '1970-01-01'::date then null else i.bond_callput_date end
 from invest_stat.stg_positions i where upload_id = '20260901184146' and instrument_type = 'bond';

delete from invest_stat.stg_positions where upload_id = '20260901184146' and instrument_type is null;


alter table invest_stat.stg_positions alter column name type varchar(255);
alter table invest_stat.stg_positions alter column brand type varchar(255);
alter table invest_stat.instruments alter column name type varchar(255);
alter table invest_stat.instruments alter column brand type varchar(255);
alter table invest_stat.instruments_hist alter column name type varchar(255);
alter table invest_stat.instruments_hist alter column brand type varchar(255);

call invest_stat.pr_process_positions();

select * from invest_stat.stg_upload order by upload_id desc;

select * from invest_stat.stg_positions order by insert_time desc;

insert into invest_stat.stg_upload values ('20260901184146', 'Positions', 'P', 189);
insert into invest_stat.stg_upload values ('20260902102437', 'Positions', 'U', 113);

select count(distinct o.instrument_uid)
  from invest_stat.operations o
  left join invest_stat.instruments i on o.instrument_uid = i.instrument_uid
 where o.instrument_uid is not null
   and o.instrument_uid <> ''
   and i.instrument_uid is null;
-- 451 -> 262 -> 149

select 451-149
--302

select *
  from invest_stat.instruments i
  left join invest_stat.ownership o on i.instrument_uid = o.instrument_uid 
 where o.instrument_uid is null
     ;

update invest_stat.instruments
   set current_price = null
 where instrument_uid in (select i.instrument_uid
					    	from invest_stat.instruments i
						    left join invest_stat.ownership o on i.instrument_uid = o.instrument_uid 
						   where o.instrument_uid is null)
						   
						   
select d.value, i2.name, o.*
  from invest_stat.operations o
  left join invest_stat.instruments i on o.instrument_uid = i.instrument_uid
  left join invest_stat.dict d on d.dict = 'operation_type' and d.id = o.operation_type
  left join invest_stat.instruments i2 on o.ticker = i2.ticker
 where o.instrument_uid is not null
   and o.instrument_uid <> ''
   and i.instrument_uid is null
 order by o.operation_time desc
     ;


select * from invest_stat.dict where dict = 'operation_type';

select * from invest_stat.instruments where name like '%Норн%14'
e6cd495f-454b-49f8-b33f-22f15c640f08


create table invest_stat.operations_old as select * from invest_stat.operations o

select count(*) from invest_stat.operations_old;

select * from invest_stat.operations_old order by operation_time desc;

select count(*) from invest_stat.operations;

select * from invest_stat.operations order by operation_time desc;

create unique index ix_instruments_ticker on invest_stat.instruments (ticker);

select * from invest_stat.instruments where ticker = 'SOFL';


select * from invest_stat.ownership o  where instrument_uid = 'cc188158-3c40-467e-b96d-43c1aa9e64d5';
select * from invest_stat.ownership o  where instrument_uid = 'ab1f751e-15b2-4c74-802c-1b3e8638c394';

delete from invest_stat.instruments where instrument_uid = 'cc188158-3c40-467e-b96d-43c1aa9e64d5';


select * from invest_stat.instruments where ticker = 'XS2116222451';


create unique index ix_instruments_figi on invest_stat.instruments (figi) where instrument_type <> 'debt_dfa';

select * from invest_stat.instruments where figi = '';

select figi, count(*) from invest_stat.instruments group by figi having count(*) > 1;

select ticker, count(*) from invest_stat.instruments group by ticker having count(*) > 1;

select * from invest_stat.instruments where ticker = 'RU000A0ZYQY7';


select --count(*)
       d.value, i2.name, i.name, o.*
  from invest_stat.operations o
  left join invest_stat.instruments i on o.figi = i.figi
  left join invest_stat.dict d on d.dict = 'operation_type' and d.id = o.operation_type
  left join invest_stat.instruments i2 on o.ticker = i2.ticker
 where o.instrument_uid is not null
   and o.instrument_uid <> ''
   and i.instrument_uid is null
 order by o.operation_time desc
     ;

-- 464->61

Каршеринг Руссия 001P-05
RU000A10AV31	TCS80A10AV31
9cd913cf-479f-4a20-a4dd-a5f14beee280

insert into invest_stat.instruments

select * from invest_stat.instruments where ticker = 'RU000A10AV31';

select * from invest_stat.bonds where instrument_uid = 'fcc08118-a50a-4a87-8b89-6426d31eca90';


select * from invest_stat.instruments_hist

select count(*) from invest_stat.instruments where mod_no is not null;

select * from invest_stat.bonds_hist

select count(*) from invest_stat.bonds where mod_no is not null;

select * from invest_stat.ownership_hist

select count(*) from invest_stat.ownership where mod_no is null;

ALTER TABLE invest_stat.ownership ALTER COLUMN mod_no SET NOT NULL;
ALTER TABLE invest_stat.ownership ALTER COLUMN mod_time SET NOT NULL;

ALTER TABLE invest_stat.ownership_hist ALTER COLUMN mod_no SET NOT NULL;
ALTER TABLE invest_stat.ownership_hist ALTER COLUMN mod_time SET NOT NULL;

drop table invest_stat.ownership2;

update invest_stat.instruments
   set mod_no = 1
     , mod_time = current_timestamp
 where mod_no is null and mod_time is null;

ALTER TABLE invest_stat.instruments ALTER COLUMN mod_no SET NOT NULL;
ALTER TABLE invest_stat.instruments ALTER COLUMN mod_time SET NOT NULL;

ALTER TABLE invest_stat.instruments_hist ALTER COLUMN mod_no SET NOT NULL;
ALTER TABLE invest_stat.instruments_hist ALTER COLUMN mod_time SET NOT NULL;

update invest_stat.bonds
   set mod_no = 1
     , mod_time = current_timestamp
 where mod_no is null and mod_time is null;

ALTER TABLE invest_stat.bonds ALTER COLUMN mod_no SET NOT NULL;
ALTER TABLE invest_stat.bonds ALTER COLUMN mod_time SET NOT NULL;

ALTER TABLE invest_stat.bonds_hist ALTER COLUMN mod_no SET NOT NULL;
ALTER TABLE invest_stat.bonds_hist ALTER COLUMN mod_time SET NOT NULL;

-------------------

select --count(*)
       d.value, i2.name, i.name, o.*
  from invest_stat.operations o
  left join invest_stat.instruments i on o.figi = i.figi
  left join invest_stat.dict d on d.dict = 'operation_type' and d.id = o.operation_type
  left join invest_stat.instruments i2 on o.ticker = i2.ticker
 where o.instrument_uid is not null
   and o.instrument_uid <> ''
   and i.instrument_uid is null
 order by o.operation_time desc
     ;

insert into invest_stat.instruments (instrument_uid, instrument_type, name, brand, ccy, figi, ticker, isin, asset_uid)

with x as ( select o.instrument_uid, o.ticker, o.figi, count(*), max(o.operation_time )
			  from invest_stat.operations o
			  left join invest_stat.instruments i on o.instrument_uid = i.instrument_uid
			  left join invest_stat.dict d on d.dict = 'operation_type' and d.id = o.operation_type
			 where o.instrument_uid is not null
			   and o.instrument_uid <> ''
			   and i.instrument_uid is null
			 group by o.instrument_uid, o.ticker, o.figi)
select x.instrument_uid, instrument_type, name, brand, ccy, x.figi, x.ticker, isin, asset_uid
  from x
  join invest_stat.instruments i on x.figi = i.figi and x.figi <> ''
 --where x.instrument_uid = 'af7946a1-8c0a-4cb1-b7db-dfc5e32071a0'
     ;




select * from invest_stat.instruments where ticker = 'US25058X1054';

select * from invest_stat.operations o  where figi = 'TCS00A10EES4';

alter table invest_stat.instruments drop unique index ix_instruments_figi;

drop index invest_stat.ix_instruments_figi;

with x as ( select o.instrument_uid, o.ticker, o.figi, count(*), max(o.operation_time )
			  from invest_stat.operations o
			  left join invest_stat.instruments i on o.instrument_uid = i.instrument_uid
			  left join invest_stat.dict d on d.dict = 'operation_type' and d.id = o.operation_type
			 where o.instrument_uid is not null
			   and o.instrument_uid <> ''
			   and i.instrument_uid is null
			 group by o.instrument_uid, o.ticker, o.figi)
select * from x  where instrument_uid = 'af7946a1-8c0a-4cb1-b7db-dfc5e32071a0';


insert into invest_stat.bonds (instrument_uid, nominal, type, sector, maturity_date)
select i.instrument_uid, b2.nominal, b2.type, b2.sector, b2.maturity_date
  from invest_stat.instruments i
  left join invest_stat.bonds b on b.instrument_uid = i.instrument_uid
  join invest_stat.instruments i2 on i.figi = i2.figi and i.instrument_uid <> i2.instrument_uid
  join invest_stat.bonds b2 on b2.instrument_uid = i2.instrument_uid
 where i.instrument_type = 'bond'
   and b.instrument_uid is null;


select o.*
  from invest_stat.operations o
  left join invest_stat.instruments i on o.instrument_uid = i.instrument_uid
  left join invest_stat.dict d on d.dict = 'operation_type' and d.id = o.operation_type
 where o.instrument_uid is not null
   and o.instrument_uid <> ''
   and i.instrument_uid is null
   
select * from invest_stat.instruments;
   
   
insert into invest_stat.instruments (instrument_uid, instrument_type, name, brand, ccy, figi, ticker, isin, asset_uid)
values ('af7946a1-8c0a-4cb1-b7db-dfc5e32071a0', 'share', 'Desktop Metal, Inc.', 'Desktop Metal, Inc.', 'usd', null, 'US25058X1054', null, null);


select o.*
  from invest_stat.operations o
  left join invest_stat.instruments i on o.figi = i.figi
  left join invest_stat.dict d on d.dict = 'operation_type' and d.id = o.operation_type
 where o.figi is not null
   and o.figi <> ''
   and i.figi is null
   
select o.*
  from invest_stat.operations o
  left join invest_stat.instruments i on o.ticker = i.ticker
  left join invest_stat.dict d on d.dict = 'operation_type' and d.id = o.operation_type
 where o.ticker is not null
   and o.ticker <> ''
   and i.ticker is null
   
   
select d.value, o.*
  from invest_stat.operations o
  left join invest_stat.dict d on d.dict = 'operation_type' and d.id = o.operation_type
 where o.instrument_uid = '' and (ticker<>'' or figi<>'');

select * from invest_stat.dict

drop table invest_stat.operations_old;

select * from invest_stat.operations o where o.instrument_uid = 'eb3ae539-6c26-4dae-affe-0c36e101e311' order by operation_time desc;

select * from invest_stat.instruments where instrument_uid = 'eb3ae539-6c26-4dae-affe-0c36e101e311';

select * from invest_stat.ownership where instrument_uid = 'eb3ae539-6c26-4dae-affe-0c36e101e311';

select * from invest_stat.ownership_hist where instrument_uid = 'eb3ae539-6c26-4dae-affe-0c36e101e311';

select * from invest_stat.instruments_hist where instrument_uid = '46ae47ee-f409-4776-bf20-43a040b9e7fb'
union
select * from invest_stat.instruments where instrument_uid = '46ae47ee-f409-4776-bf20-43a040b9e7fb';

select * from invest_stat.instruments_hist where instrument_uid = '164211d5-786c-4847-88be-e6d48d8ee171'
union
select * from invest_stat.instruments where instrument_uid = '164211d5-786c-4847-88be-e6d48d8ee171';


select * from invest_stat.stg_positions where instrument_uid = '164211d5-786c-4847-88be-e6d48d8ee171';

select * from invest_stat.bonds_hist;

select * from invest_stat.bonds_hist where instrument_uid = '106e45f4-67d6-469a-a8d4-98d2cd8e9a94'
union
select * from invest_stat.bonds where instrument_uid = '106e45f4-67d6-469a-a8d4-98d2cd8e9a94';

select * from invest_stat.instruments_hist where instrument_uid = '106e45f4-67d6-469a-a8d4-98d2cd8e9a94'
union
select * from invest_stat.instruments where instrument_uid = '106e45f4-67d6-469a-a8d4-98d2cd8e9a94';

select * from invest_stat.ownership where instrument_uid = '106e45f4-67d6-469a-a8d4-98d2cd8e9a94';

select * from invest_stat.ownership_hist where instrument_uid = '106e45f4-67d6-469a-a8d4-98d2cd8e9a94';

select * from invest_stat.stg_positions where instrument_uid = '106e45f4-67d6-469a-a8d4-98d2cd8e9a94';

select * from invest_stat.instruments where instrument_uid = '106e45f4-67d6-469a-a8d4-98d2cd8e9a94' or ticker='RU000A105A95';

select * from invest_stat.ownership where instrument_uid = '8cfeee74-ff3f-4507-86e4-14b87801eba5';

select * from invest_stat.stg_positions where instrument_uid = '8cfeee74-ff3f-4507-86e4-14b87801eba5';

select * from invest_stat.operations o 
 where o.instrument_uid in ('8cfeee74-ff3f-4507-86e4-14b87801eba5', '106e45f4-67d6-469a-a8d4-98d2cd8e9a94') and account_id = '2210008427' 
   and status = 1
   and operation_type not in (19, 23)
 order by operation_time desc;

select * from invest_stat.stg_upload order by upload_id desc;


call invest_stat.pr_process_positions();
--upload_id: 20260903143755
--instr: iu609/d1, bond: iu2/d0, ownr: iu7/d2

select * from invest_stat.instruments where mod_time > '2026-09-03'::date;

select * from invest_stat.instruments where instrument_uid = '1f5eebf5-8164-4e12-bff7-aee37efb175c'
union select * from invest_stat.instruments_hist where instrument_uid = '1f5eebf5-8164-4e12-bff7-aee37efb175c';

select * from invest_stat.bonds where instrument_uid = '1f5eebf5-8164-4e12-bff7-aee37efb175c'
union select * from invest_stat.bonds_hist where instrument_uid = '1f5eebf5-8164-4e12-bff7-aee37efb175c';

select * from invest_stat.ownership where instrument_uid = '1f5eebf5-8164-4e12-bff7-aee37efb175c'
union select * from invest_stat.ownership_hist where instrument_uid = '1f5eebf5-8164-4e12-bff7-aee37efb175c';

select * from invest_stat.ownership where mod_time > '2026-09-03'::date;



select upload_id, count(*) from invest_stat.stg_positions group by upload_id order by upload_id;

     ;


