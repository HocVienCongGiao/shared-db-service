DROP VIEW polity__parish_view;

DROP VIEW polity__deanery_view;

DROP VIEW polity__diocese_view;

CREATE OR REPLACE VIEW polity__diocese_view AS
    SELECT polity.*, province.id province_id, province.name province_name, province.person_in_charge province_person_in_charge, province.code province_code
    FROM polity__diocese diocese
    LEFT JOIN polity__polity_view polity ON diocese.id = polity.id
    LEFT JOIN polity__province_view province ON diocese.province_id = province.id;

CREATE OR REPLACE VIEW polity__deanery_view AS
    SELECT polity.*, diocese.id diocese_id, diocese.name diocese_name, diocese.person_in_charge diocese_person_in_charge, diocese.province_id, diocese.province_name, diocese.province_person_in_charge, diocese.province_code
    FROM polity__deanery deanery
    LEFT JOIN polity__polity_view polity ON deanery.id = polity.id
    LEFT JOIN polity__diocese_view diocese ON deanery.diocese_id = diocese.id;

CREATE OR REPLACE VIEW polity__parish_view AS
    SELECT polity.*, deanery.id deanery_id, deanery.name deanery_name, deanery.person_in_charge deanery_person_in_charge, deanery.diocese_id, deanery.diocese_name, deanery.diocese_person_in_charge, deanery.province_id, deanery.province_name, deanery.province_person_in_charge, deanery.province_code
    FROM polity__parish parish
    LEFT JOIN polity__polity_view polity ON parish.id = polity.id
    LEFT JOIN polity__deanery_view deanery ON parish.deanery_id = deanery.id;

