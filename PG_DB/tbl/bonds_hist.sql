--drop table invest_stat.bonds_hist;

create table invest_stat.bonds_hist (
 instrument_uid varchar(36)
,nominal decimal(20, 2)
,type integer
,sector varchar(50)
,maturity_date date
,callput_date date
,mod_no integer not null
,mod_time timestamp not null
);

ALTER TABLE invest_stat.bonds_hist ADD PRIMARY KEY (instrument_uid, mod_no);