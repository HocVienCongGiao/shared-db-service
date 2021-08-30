CREATE TABLE IF NOT EXISTS public.polity__polity
(
    id                 UUID PRIMARY KEY,
    type               CHAR(9) NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_polity__polity_type ON polity__polity (type);

CREATE TABLE IF NOT EXISTS public.polity__institute
(
    id                            UUID PRIMARY KEY REFERENCES polity__polity(id)
);

CREATE TABLE IF NOT EXISTS public.polity__province
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
    code               VARCHAR NOT NULL
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_polity__province_code ON polity__province (code);

CREATE TABLE IF NOT EXISTS public.polity__diocese
(
    id                            UUID PRIMARY KEY REFERENCES polity__polity(id),
    province_id                   UUID NOT NULL REFERENCES polity__province(id)
);

CREATE TABLE IF NOT EXISTS public.polity__deanery
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
    diocese_id         UUID NOT NULL REFERENCES polity__diocese(id)
);

CREATE TABLE IF NOT EXISTS public.polity__parish
(
    id                  UUID PRIMARY KEY REFERENCES polity__polity(id),
    deanery_id          UUID NOT NULL REFERENCES polity__deanery(id)
);

CREATE TABLE IF NOT EXISTS public.polity__polity_name
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
    name               VARCHAR NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_polity__polity_name ON polity__polity_name (name);

CREATE TABLE IF NOT EXISTS public.polity__polity_location_email
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
   location_email      VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.polity__polity_location_address
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
    location_address   VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.polity__polity_location_name
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
    location_name      VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.polity__polity_person_in_charge
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id),
    person_in_charge   VARCHAR NOT NULL
);

-- Giáo Tỉnh Sài Gòn
INSERT INTO public.polity__polity (id, type)
VALUES ('3262ca15-b55f-4dcb-8c19-0f37972dfc2a', 'province');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('3262ca15-b55f-4dcb-8c19-0f37972dfc2a', 'Sài Gòn');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('3262ca15-b55f-4dcb-8c19-0f37972dfc2a', 'Giuse Nguyễn Năng');

-- Giáo Phận Sài Gòn
INSERT INTO public.polity__polity (id, type)
VALUES ('fb19b6e1-bf48-4db0-8260-3c03572136e7', 'diocese');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('fb19b6e1-bf48-4db0-8260-3c03572136e7', 'Sài Gòn');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('fb19b6e1-bf48-4db0-8260-3c03572136e7', 'Giuse Nguyễn Năng');

-- Giáo Phận Cần Thơ
INSERT INTO public.polity__polity (id, type)
VALUES ('4d084b56-54e1-4bd2-878e-c52675497c2b', 'diocese');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('4d084b56-54e1-4bd2-878e-c52675497c2b', 'Cần Thơ');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('4d084b56-54e1-4bd2-878e-c52675497c2b', 'Stêphanô Tri Bửu Thiên');

-- Giáo Hạt Phú Thọ
INSERT INTO public.polity__polity (id, type)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'deanery');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'Phú Thọ');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'Giuse Pham Ba Lam');

-- Giáo Xứ Hòa Hưng
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

INSERT INTO public.polity__parish (id, deanery_id)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043', 'a8c5fcc2-e665-4220-9e09-f2f5314d282f');

-- Institute: Dong Thanh Gia
INSERT INTO public.polity__polity (id, type)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', 'institute');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', 'Dòng Thánh Gia');

INSERT INTO public.polity__polity_location_address (id, location_address)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', '603/47 Khóm Bình Đức 3, P. Bình Đức, Long Xuyên, An Giang');

INSERT INTO public.polity__polity_location_name (id, location_name)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', 'Dòng Thánh Gia Việt Nam');

INSERT INTO public.polity__polity_location_email (id, location_email)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', 'binh@sunrise.vn');

-- Institute: Dong Thanh The
INSERT INTO public.polity__polity (id, type)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'institute');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'Dòng Thánh Thể');

INSERT INTO public.polity__polity_location_address (id, location_address)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', '15b, đường 4, khu phố 4, phường Bình Chiểu, quận Thủ Đức, TPHCM');

INSERT INTO public.polity__polity_location_name (id, location_name)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'Dòng Thánh Thể Việt Nam');

INSERT INTO public.polity__polity_location_email (id, location_email)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'peterbean410@gmail.com');

-- VIEW
CREATE VIEW polity__polity_view AS
    SELECT polity__polity.id, name, person_in_charge
    FROM polity__polity
    LEFT JOIN polity__polity_name ON polity__polity.id = polity__polity_name.id
    LEFT JOIN polity__polity_person_in_charge ON polity__polity.id = polity__polity_person_in_charge.id;


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
