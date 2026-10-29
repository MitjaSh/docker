drop table invest_stat.operations;

create table invest_stat.operations (
 id varchar(64) primary  key
,account_id varchar(36)
,instrument_uid varchar(36)
,ticker varchar(50)
,figi varchar(12)
--,instrument_type varchar(30)
,operation_type integer
--,operation_type_name varchar(50)
,operation_time timestamp
,amount decimal(20, 2)
,price decimal(20, 2)
,ccy varchar(3)
,quantity integer
,commission decimal(20, 2)
,accrued_int decimal(20, 2)
,status integer
--,status_name varchar(50)
,upload_id varchar(50)
,insert_time timestamp
);