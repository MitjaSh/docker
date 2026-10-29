create or replace TRIGGER trg_bonds_hist
    BEFORE update or insert ON invest_stat.bonds
    FOR EACH ROW
    EXECUTE FUNCTION invest_stat.fnctrg_bonds_hist();