CREATE OR REPLACE FUNCTION invest_stat.fnctrg_ownership_hist()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        NEW.mod_no := 1; 
        NEW.mod_time := current_timestamp;
    ELSIF (TG_OP = 'UPDATE') THEN
		if coalesce(old.quantity, 0) <> coalesce(new.quantity, 0)
            or coalesce(old.blocked_quantity, 0) <> coalesce(new.blocked_quantity, 0)
            or coalesce(old.average_price, 0) <> coalesce(new.average_price, 0)
		then
	        NEW.mod_no := OLD.mod_no + 1; 
	        NEW.mod_time := current_timestamp;
			insert into invest_stat.ownership_hist values (old.*);
		end if;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;