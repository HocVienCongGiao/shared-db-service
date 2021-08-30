DROP VIEW polity__parish_view CASCADE;

DROP VIEW polity__deanery_view CASCADE;

DROP VIEW polity__diocese_view CASCADE;

CREATE OR REPLACE VIEW polity__diocese_view AS
    SELECT polity.*, province.id province_id, province.name province_name, province.person_in_charge province_person_in_charge, province.location_name province_location_name, province.location_email province_location_email, province.location_address province_location_address, province.code province_code
    FROM polity__diocese diocese
    LEFT JOIN polity__polity_view polity ON diocese.id = polity.id
    LEFT JOIN polity__province_view province ON diocese.province_id = province.id;

CREATE OR REPLACE VIEW polity__deanery_view AS
    SELECT polity.*, diocese.id diocese_id, diocese.name diocese_name, diocese.person_in_charge diocese_person_in_charge, diocese.location_name diocese_location_name, diocese.location_email diocese_location_email, diocese.location_address diocese_location_address, diocese.province_id, diocese.province_name, diocese.province_person_in_charge, diocese.province_location_name, diocese.province_location_email, diocese.province_location_address, diocese.province_code
    FROM polity__deanery deanery
    LEFT JOIN polity__polity_view polity ON deanery.id = polity.id
    LEFT JOIN polity__diocese_view diocese ON deanery.diocese_id = diocese.id;

CREATE OR REPLACE VIEW polity__parish_view AS
    SELECT polity.*, deanery.id deanery_id, deanery.name deanery_name, deanery.person_in_charge deanery_person_in_charge, deanery.location_name deanery_location_name, deanery.location_email deanery_location_email, deanery.location_address deanery_location_address,  deanery.diocese_id, deanery.diocese_name, deanery.diocese_person_in_charge, deanery.diocese_location_name, deanery.diocese_location_email, deanery.diocese_location_address, deanery.province_id, deanery.province_name, deanery.province_person_in_charge, deanery.province_location_name, deanery.province_location_email, deanery.province_location_address, deanery.province_code
    FROM polity__parish parish
    LEFT JOIN polity__polity_view polity ON parish.id = polity.id
    LEFT JOIN polity__deanery_view deanery ON parish.deanery_id = deanery.id;

INSERT INTO public.polity__institute (id)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4');

INSERT INTO public.polity__institute (id)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4');

CREATE OR REPLACE VIEW polity__institute_view AS
    SELECT polity.*
    FROM polity__institute institute
    LEFT JOIN polity__polity_view polity ON institute.id = polity.id;
