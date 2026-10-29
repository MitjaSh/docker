create table invest_stat.ownership (
 account_id varchar(36)
,instrument_uid varchar(36)
,quantity integer
,blocked_quantity integer
,average_price decimal(20, 2)
,mod_no integer not null
,mod_time timestamp  not null
);

ALTER TABLE invest_stat.ownership ADD PRIMARY KEY (instrument_uid, account_id);