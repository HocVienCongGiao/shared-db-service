CREATE TABLE IF NOT EXISTS public.polity__polity
(
    id                 UUID PRIMARY KEY,
    type               CHAR(9) NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_polity_polity_type ON polity__polity (type);

CREATE TABLE IF NOT EXISTS public.polity__polity_name
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
    name               VARCHAR NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_polity_polity_name ON polity__polity_name (name);

CREATE TABLE IF NOT EXISTS public.polity__polity_person_in_charge
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
    person_in_charge   VARCHAR NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_polity_polity_person_in_charge ON polity__polity_person_in_charge (person_in_charge);

CREATE TABLE IF NOT EXISTS public.polity__province
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
    code               VARCHAR NOT NULL
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_polity_province_code ON polity__province (code);

CREATE TABLE IF NOT EXISTS public.polity__diocese
(
    id                            UUID PRIMARY KEY REFERENCES polity__polity(id),
    province_id                   UUID NOT NULL REFERENCES polity__province(id)
);
CREATE INDEX IF NOT EXISTS IDX_polity_diocese_province ON polity__diocese (province_id);

CREATE TABLE IF NOT EXISTS public.polity__deanery
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
    diocese_id         UUID NOT NULL REFERENCES polity__diocese(id)
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_polity_deanery_diocese_id ON polity__deanery (diocese_id);


CREATE TABLE IF NOT EXISTS public.polity__parish
(
    id                  UUID PRIMARY KEY REFERENCES polity__polity(id)
);
CREATE TABLE IF NOT EXISTS public.polity__parish_deanery
(
    id                  UUID PRIMARY KEY REFERENCES polity__parish(id),
    deanery_id          UUID NOT NULL REFERENCES polity__deanery(id)
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_polity_parish_deanery_id ON polity__parish_deanery (deanery_id);


INSERT INTO public.polity__polity (id, type)
VALUES ('3262ca15-b55f-4dcb-8c19-0f37972dfc2a', 'province');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('3262ca15-b55f-4dcb-8c19-0f37972dfc2a', 'Sài Gòn');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('3262ca15-b55f-4dcb-8c19-0f37972dfc2a', 'Giuse Nguyễn Năng');

INSERT INTO public.polity__polity (id, type)
VALUES ('fb19b6e1-bf48-4db0-8260-3c03572136e7', 'diocese');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('fb19b6e1-bf48-4db0-8260-3c03572136e7', 'Thành phố Hồ Chí Minh');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('fb19b6e1-bf48-4db0-8260-3c03572136e7', 'Giuse Nguyễn Năng');

INSERT INTO public.polity__polity (id, type)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'deneary');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'Phu Tho');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'Giuse Pham Ba Lam');

INSERT INTO public.polity__polity (id, type)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043', 'parish');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043', 'Hòa Hưng');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043', 'Giuse Pham Ba Lam');

INSERT INTO public.polity__province (id, code)
VALUES ('3262ca15-b55f-4dcb-8c19-0f37972dfc2a', 'SAI_GON');

INSERT INTO public.polity__diocese (id, province_id)
VALUES ('fb19b6e1-bf48-4db0-8260-3c03572136e7', '3262ca15-b55f-4dcb-8c19-0f37972dfc2a');

INSERT INTO public.polity__deanery (id, diocese_id)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'fb19b6e1-bf48-4db0-8260-3c03572136e7');

INSERT INTO public.polity__parish (id)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043');

INSERT INTO public.polity__parish_deanery (id, deanery_id)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043', 'a8c5fcc2-e665-4220-9e09-f2f5314d282f');


CREATE VIEW polity__polity_view AS
    SELECT polity__polity.id, name, person_in_charge
    FROM polity__polity
    LEFT JOIN polity__polity_name ON polity__polity.id = polity__polity_name.id
    LEFT JOIN polity__polity_person_in_charge ON polity__polity.id = polity__polity_person_in_charge.id;


CREATE VIEW polity__diocese_view AS
    SELECT *
    FROM polity__diocese;


CREATE VIEW polity__deanery_view AS
    SELECT *
    FROM polity__deanery;


CREATE VIEW polity__parish_view AS
    SELECT polity__parish.id, deanery_id
    FROM polity__parish
    LEFT JOIN polity__parish_deanery ON polity__parish.id = polity__parish_deanery.id;
