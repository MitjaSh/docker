create or replace TRIGGER trg_ownership_hist
    BEFORE update or insert ON invest_stat.ownership
    FOR EACH ROW
    EXECUTE FUNCTION invest_stat.fnctrg_ownership_hist();