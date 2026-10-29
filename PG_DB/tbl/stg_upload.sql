drop table invest_stat.stg_upload;

create table invest_stat.stg_upload (
 upload_id varchar(50)
,upload_type varchar(30)
,status varchar(1)
,row_qty integer
);