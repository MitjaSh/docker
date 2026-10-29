CREATE OR REPLACE PROCEDURE invest_stat.pr_process_positions()
LANGUAGE plpgsql
AS $$
DECLARE
	v_upload_id varchar(50);
	i record;
	v_old_instruments_flag boolean := false;

	v_instr_iu integer := 0;
	v_bond_iu  integer := 0;
	v_ownr_iu  integer := 0;
	v_instr_d  integer := 0;
	v_bond_d   integer := 0;
	v_ownr_d   integer := 0;
	v_rows     integer;
BEGIN
    select min(upload_id)
      into v_upload_id
      from invest_stat.stg_upload
     where upload_type = 'Positions'
       and status = 'U';
    

	if v_upload_id is not null then
    	RAISE NOTICE 'upload_id: %', v_upload_id;
		for i in (select * from invest_stat.stg_positions where upload_id = v_upload_id)
		loop
			if i.account_id is null or i.account_id = '' then
				v_old_instruments_flag := true;
			end if;	

			-- Instrument NEW, EXISTED
			INSERT INTO invest_stat.instruments (instrument_uid, instrument_type, name, brand, current_price, ccy, figi, ticker, isin, asset_uid, blocked, trading_status)
			VALUES (i.instrument_uid, i.instrument_type, i.name,  
                    replace(i.brand, ' (ISIN)', ''), 
                    case when v_old_instruments_flag then null else i.current_price end,
                    i.ccy, i.figi, i.ticker, i.isin, i.asset_uid, i.blocked, i.trading_status)
			ON CONFLICT (instrument_uid) 
			DO UPDATE SET 
			    current_price  = EXCLUDED.current_price,
			    blocked        = EXCLUDED.blocked,
			    trading_status = EXCLUDED.trading_status
			WHERE instruments.current_price   IS DISTINCT FROM EXCLUDED.current_price
			   OR instruments.blocked         IS DISTINCT FROM EXCLUDED.blocked
			   OR instruments.trading_status  IS DISTINCT FROM EXCLUDED.trading_status;

			GET DIAGNOSTICS v_rows = ROW_COUNT;
			v_instr_iu = v_instr_iu + v_rows;
			
			if (i.instrument_type = 'bond') then
				-- Bond NEW, EXISTED
				INSERT INTO invest_stat.bonds (instrument_uid, nominal, type, sector, maturity_date, callput_date)
				VALUES (i.instrument_uid, i.bond_nominal, i.bond_type, i.bond_sector, i.bond_maturity_date, case when i.bond_callput_date = '1970-01-01'::date then null else i.bond_callput_date end)
				ON CONFLICT (instrument_uid) 
				DO UPDATE SET 
				    callput_date   = EXCLUDED.callput_date,
					maturity_date  = EXCLUDED.maturity_date,
				    nominal        = EXCLUDED.nominal,
				    type           = EXCLUDED.type,
				    sector         = EXCLUDED.sector
				WHERE bonds.callput_date    IS DISTINCT FROM EXCLUDED.callput_date
				   OR bonds.maturity_date   IS DISTINCT FROM EXCLUDED.maturity_date
				   OR bonds.nominal         IS DISTINCT FROM EXCLUDED.nominal
				   OR bonds.type            IS DISTINCT FROM EXCLUDED.type
				   OR bonds.sector          IS DISTINCT FROM EXCLUDED.sector;

				GET DIAGNOSTICS v_rows = ROW_COUNT;
				v_bond_iu = v_bond_iu + v_rows;
			end if;

			if not v_old_instruments_flag then				
				-- Ownership NEW, EXISTED
				INSERT INTO invest_stat.ownership (account_id, instrument_uid, quantity, blocked_quantity, average_price)
				VALUES (i.account_id, i.instrument_uid, i.quantity, i.blocked_quantity, i.average_price)
				ON CONFLICT (instrument_uid, account_id) 
				DO UPDATE SET 
				    quantity           = EXCLUDED.quantity,
				    blocked_quantity   = EXCLUDED.blocked_quantity,
				    average_price      = EXCLUDED.average_price
				WHERE ownership.quantity          IS DISTINCT FROM EXCLUDED.quantity
				   OR ownership.blocked_quantity  IS DISTINCT FROM EXCLUDED.blocked_quantity
				   OR ownership.average_price     IS DISTINCT FROM EXCLUDED.average_price;

				GET DIAGNOSTICS v_rows = ROW_COUNT;
				v_ownr_iu = v_ownr_iu + v_rows;
			end if;

			--RAISE NOTICE 'row: %', i.instrument_uid;
		end loop;

		if not v_old_instruments_flag then
			-- Ownership DISAPPEARED
			update invest_stat.ownership o
	           set quantity           = 0
			     , blocked_quantity   = 0
			     , average_price      = null
			 where not exists (select 1 
	                             from invest_stat.stg_positions p
	                            where upload_id = v_upload_id
	                              and o.instrument_uid = p.instrument_uid
	                              and o.account_id = p.account_id)
	           and (quantity IS DISTINCT FROM 0 or blocked_quantity IS DISTINCT FROM 0 or average_price IS DISTINCT FROM null)
	             ;

			GET DIAGNOSTICS v_rows = ROW_COUNT;
			v_ownr_d = v_ownr_d + v_rows;
			
			-- instruments DISAPPEARED
			update invest_stat.instruments ins
	           set current_price      = null
			     , blocked            = null
			     , trading_status     = null
			 where not exists (select 1 
	                             from invest_stat.stg_positions p
	                            where upload_id = v_upload_id
	                              and ins.instrument_uid = p.instrument_uid)
	           and (current_price IS DISTINCT FROM null or blocked IS DISTINCT FROM null or trading_status IS DISTINCT FROM null)
	             ;

			GET DIAGNOSTICS v_rows = ROW_COUNT;
			v_instr_d = v_instr_d + v_rows;
	
			-- bonds DISAPPEARED
			update invest_stat.bonds b
	           set nominal           = null
			     , callput_date      = null
			 where not exists (select 1 
	                             from invest_stat.stg_positions p
	                            where upload_id = v_upload_id
	                              and b.instrument_uid = p.instrument_uid)
	           and (nominal IS DISTINCT FROM null or callput_date IS DISTINCT FROM null)
	             ;

			GET DIAGNOSTICS v_rows = ROW_COUNT;
			v_bond_d = v_bond_d + v_rows;
		end if;

		-- Mark as prosecced
		update invest_stat.stg_upload
		   set status = 'P'
	     where upload_type = 'Positions'
           and upload_id = v_upload_id
	         ;
		RAISE NOTICE '(ui/d) instr: %/%, bond: %/%, ownr: %/%', v_instr_iu, v_instr_d, v_bond_iu, v_bond_d, v_ownr_iu, v_ownr_d;
	end if;
END;
$$;