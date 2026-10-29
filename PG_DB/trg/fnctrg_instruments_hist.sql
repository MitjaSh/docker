CREATE OR REPLACE FUNCTION invest_stat.fnctrg_instruments_hist()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        NEW.mod_no := 1; 
        NEW.mod_time := current_timestamp;
    ELSIF (TG_OP = 'UPDATE') THEN
		if old.blocked <> new.blocked
            or coalesce(old.trading_status, 0) <> coalesce(new.trading_status, 0)
		then
	        NEW.mod_no := OLD.mod_no + 1; 
	        NEW.mod_time := current_timestamp;
			insert into invest_stat.instruments_hist values (old.*);
		end if;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;