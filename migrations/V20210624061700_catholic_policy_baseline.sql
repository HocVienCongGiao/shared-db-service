CREATE TABLE IF NOT EXISTS public.polity__polity
(
    id                 UUID PRIMARY KEY
);
CREATE TABLE IF NOT EXISTS public.polity__polity_name
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
    name               VARCHAR NOT NULL
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_polity_poility_name ON polity__polity_name (name);
CREATE TABLE IF NOT EXISTS public.polity__polity_person_in_charge
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
    person_in_charge   VARCHAR NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_polity_poility_person_in_charge ON polity__polity_person_in_charge (person_in_charge);


INSERT INTO public.polity__polity (id)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', 'Thành phố Hồ Chí Minh');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', 'Giuse Nguyễn Năng');

INSERT INTO public.polity__polity (id)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'Phu Tho');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'Giuse Pham Ba Lam');

INSERT INTO public.polity__polity (id)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043', 'Hoa Hung');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043', 'Giuse Pham Ba Lam');


CREATE VIEW polity__polity_view AS
    SELECT polity__polity.id, name, person_in_charge
    FROM polity__polity
    LEFT JOIN polity__polity_name ON polity__polity.id = polity__polity_name.id
    LEFT JOIN polity__polity_person_in_charge ON polity__polity.id = polity__polity_person_in_charge.id;


CREATE TABLE IF NOT EXISTS public.polity__diocese
(
    polity_id                            UUID PRIMARY KEY REFERENCES polity__polity(id)
);
CREATE TABLE IF NOT EXISTS public.polity__diocese_ecclesiastical_province
(
    polity_id                            UUID PRIMARY KEY REFERENCES polity__polity(id),
    ecclesiastical_province               VARCHAR NOT NULL
);
CREATE INDEX IDX_polity_diocese_ecclesiastical_province ON polity__diocese_ecclesiastical_province (ecclesiastical_province);


INSERT INTO public.polity__diocese (polity_id)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608');

INSERT INTO public.polity__diocese_ecclesiastical_province (polity_id, ecclesiastical_province)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', 'SAI GON');


-- CREATE VIEW polity__diocese_view AS
--     SELECT polity__diocese.polity_id, ecclesiastical_province, name, person_in_charge
--     FROM polity__diocese
--     LEFT JOIN polity__diocese_ecclesiastical_province ON polity__diocese.polity_id = polity__diocese_ecclesiastical_province.polity_id
--     LEFT JOIN polity__polity ON polity__diocese.polity_id = polity__polity.id


CREATE VIEW polity__diocese_view AS
    SELECT polity__diocese.polity_id, ecclesiastical_province
    FROM polity__diocese
    LEFT JOIN polity__diocese_ecclesiastical_province ON polity__diocese.polity_id = polity__diocese_ecclesiastical_province.polity_id;

-------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.polity__deanery
(
    polity_id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
);
CREATE TABLE IF NOT EXISTS public.polity__deanery_diocese_id
(
    polity_id                 UUID PRIMARY KEY REFERENCES polity__polity(polity_id),
    diocese_id                UUID FOREIGN KEY REFERENCES polity__diocese(polity_id)
);
CREATE UNIQUE INDEX IDX_polity_deanery_diocese_id ON polity__deanery_diocese_id (diocese_id);


INSERT INTO public.polity__deanery (polity_id)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f');

INSERT INTO public.polity__deanery_diocese_id (polity_id, diocese_id)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', 'a8c5fcc2-e665-4220-9e09-f2f5314d282f');


CREATE VIEW polity__deanery_view AS
    SELECT polity__deanery.id, polity_id, diocese_id
    FROM polity__deanery
    LEFT JOIN polity__polity ON polity__deanery.polity_id = polity__polity.id
    LEFT JOIN polity__diocese ON polity__deanery.polity_id = polity__diocese.polity_id


---------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.polity__parish
(
    polity_id           UUID PRIMARY KEY REFERENCES polity__polity(id),
);
CREATE TABLE IF NOT EXISTS public.polity__parish_deanery_id
(
    polity_id           UUID PRIMARY KEY REFERENCES polity__polity(id),
    deanery_id          UUID FOREIGN KEY REFERENCES polity__deanery(id),
);
CREATE UNIQUE INDEX IDX_polity_parish_deanery_id ON polity__parish_deanery_id (deanery_id);


INSERT INTO public.polity__parish (id)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043');

INSERT INTO public.polity__parish_deanery_id (polity_id, deanery_id)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043', 'a8c5fcc2-e665-4220-9e09-f2f5314d282f');


CREATE VIEW polity__parish_view AS
    SELECT polity__parish.id, polity_id, deanery_id
    FROM polity__parish
    LEFT JOIN polity__polity ON polity__parish.polity_id = polity__polity.id
    LEFT JOIN polity__deanery ON polity__parish.polity_id = polity__deanery.polity_id