CREATE OR REPLACE VIEW polity__polity_view AS
    SELECT polity__polity.id, name, person_in_charge, type
    FROM polity__polity
    LEFT JOIN polity__polity_name ON polity__polity.id = polity__polity_name.id
    LEFT JOIN polity__polity_person_in_charge ON polity__polity.id = polity__polity_person_in_charge.id;
