drop table invest_stat.stg_positions;

create table invest_stat.stg_positions (
 upload_id varchar(50)
,account_id varchar(36)
,instrument_uid varchar(36)
,instrument_type varchar(30)
,name varchar(255)
,brand varchar(255)
,quantity integer
,blocked_quantity integer
,current_price decimal(20, 2)
,average_price decimal(20, 2)
,ccy varchar(3)
,figi varchar(12)
,ticker varchar(50)
,isin varchar(12)
,asset_uid varchar(36)
,blocked boolean
,trading_status integer
,bond_nominal decimal(20, 2)
,bond_type integer
,bond_sector varchar(50)
,bond_maturity_date date
,bond_callput_date date
,insert_time timestamp
);