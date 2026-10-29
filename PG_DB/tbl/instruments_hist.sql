-- drop TABLE invest_stat.instruments_hist;

create table invest_stat.instruments_hist (
 instrument_uid varchar(36)
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
,mod_time timestamp  not null
);

ALTER TABLE invest_stat.instruments_hist ADD PRIMARY KEY (instrument_uid, mod_no);