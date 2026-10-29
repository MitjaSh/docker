create or replace TRIGGER trg_instruments_hist
    BEFORE update or insert ON invest_stat.instruments
    FOR EACH ROW
    EXECUTE FUNCTION invest_stat.fnctrg_instruments_hist();