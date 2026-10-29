--drop table invest_stat.instruments;

create table invest_stat.instruments (
 instrument_uid varchar(36) primary key
,instrument_type varchar(30)
,name varchar(255)
,brand varchar(255)
,current_price decimal(20, 2)
,ccy varchar(3)
,figi varchar(12)
,ticker varchar(50)
,isin varchar(12)
,asset_uid varchar(36)
,blocked boolean
,trading_status integer
,mod_no integer not null
,mod_time timestamp not null
);

create unique index ix_instruments_figi on invest_stat.instruments (figi) where instrument_type <> 'debt_dfa';