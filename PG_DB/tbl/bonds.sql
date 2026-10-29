--drop table invest_stat.bonds;

create table invest_stat.bonds (
 instrument_uid varchar(36) primary key
,nominal decimal(20, 2)
,type integer
,sector varchar(50)
,maturity_date date
,callput_date date
,mod_no integer not null
,mod_time timestamp  not null
);