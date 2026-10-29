CREATE OR REPLACE FUNCTION invest_stat.fnctrg_bonds_hist()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        NEW.mod_no := 1; 
        NEW.mod_time := current_timestamp;
    ELSIF (TG_OP = 'UPDATE') THEN
		if old.type IS DISTINCT FROM new.type
            or old.nominal IS DISTINCT FROM new.nominal
            or old.sector IS DISTINCT FROM new.sector
            or old.maturity_date IS DISTINCT FROM new.maturity_date
            or old.callput_date IS DISTINCT FROM new.callput_date
		then
	        NEW.mod_no := OLD.mod_no + 1; 
	        NEW.mod_time := current_timestamp;
			insert into invest_stat.bonds_hist values (old.*);
		end if;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


