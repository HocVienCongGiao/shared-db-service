DROP VIEW polity__parish_view;

DROP VIEW polity__deanery_view;

DROP VIEW polity__diocese_view;

DROP VIEW polity__polity_view;

ALTER TABLE public.polity__polity
    ALTER COLUMN type TYPE VARCHAR(9);

CREATE VIEW polity__polity_view AS
    SELECT polity__polity.id, name, person_in_charge
    FROM polity__polity
    LEFT JOIN polity__polity_name ON polity__polity.id = polity__polity_name.id
    LEFT JOIN polity__polity_person_in_charge ON polity__polity.id = polity__polity_person_in_charge.id;

CREATE VIEW polity__province_view AS
    SELECT polity.*, province.code
    FROM polity__province province
    LEFT JOIN polity__polity_view polity ON province.id = polity.id;

CREATE VIEW polity__diocese_view AS
    SELECT polity.*, diocese.province_id
    FROM polity__diocese diocese
    LEFT JOIN polity__polity_view polity ON diocese.id = polity.id;

CREATE VIEW polity__deanery_view AS
    SELECT polity.*, deanery.diocese_id
    FROM polity__deanery deanery
    LEFT JOIN polity__polity_view polity ON deanery.id = polity.id;

CREATE VIEW polity__parish_view AS
    SELECT polity.*, parish.deanery_id, deanery.diocese_id
    FROM polity__parish parish
    LEFT JOIN polity__polity_view polity ON parish.id = polity.id
    LEFT JOIN polity__deanery_view deanery ON parish.deanery_id = deanery.id;
