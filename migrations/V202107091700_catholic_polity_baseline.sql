CREATE TABLE IF NOT EXISTS public.polity__polity
(
    id                 UUID PRIMARY KEY,
    type               VARCHAR(9) NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_polity__polity_type ON polity__polity (type);

CREATE TABLE IF NOT EXISTS public.polity__institute
(
    id                            UUID PRIMARY KEY REFERENCES polity__polity(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.polity__province
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id) ON DELETE CASCADE,
    code               VARCHAR NOT NULL
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_polity__province_code ON polity__province (code);

CREATE TABLE IF NOT EXISTS public.polity__diocese
(
    id                            UUID PRIMARY KEY REFERENCES polity__polity(id) ON DELETE CASCADE,
    province_id                   UUID NOT NULL REFERENCES polity__province(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.polity__deanery
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id) ON DELETE CASCADE,
    diocese_id         UUID NOT NULL REFERENCES polity__diocese(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.polity__parish
(
    id                  UUID PRIMARY KEY REFERENCES polity__polity(id) ON DELETE CASCADE,
    deanery_id          UUID NOT NULL REFERENCES polity__deanery(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.polity__polity_name
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id) ON DELETE CASCADE,
    name               VARCHAR NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_polity__polity_name ON polity__polity_name (name);

CREATE TABLE IF NOT EXISTS public.polity__polity_location_email
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id) ON DELETE CASCADE,
   location_email      VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.polity__polity_location_address
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id) ON DELETE CASCADE,
    location_address   VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.polity__polity_location_name
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id) ON DELETE CASCADE,
    location_name      VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.polity__polity_person_in_charge
(
    id                 UUID PRIMARY KEY REFERENCES polity__polity(id) ON DELETE CASCADE,
    person_in_charge   VARCHAR NOT NULL
);

-- Gi??o T???nh S??i G??n
INSERT INTO public.polity__polity (id, type)
VALUES ('3262ca15-b55f-4dcb-8c19-0f37972dfc2a', 'province');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('3262ca15-b55f-4dcb-8c19-0f37972dfc2a', 'S??i G??n');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('3262ca15-b55f-4dcb-8c19-0f37972dfc2a', 'Giuse Nguy???n N??ng');

INSERT INTO public.polity__province (id, code)
VALUES ('3262ca15-b55f-4dcb-8c19-0f37972dfc2a', 'SAI_GON');


-- Gi??o T???nh H?? N???i
INSERT INTO public.polity__polity (id, type)
VALUES ('ea8ab7a2-4065-4dd6-88c7-f037427e84cc', 'province');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('ea8ab7a2-4065-4dd6-88c7-f037427e84cc', 'H?? N???i');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('ea8ab7a2-4065-4dd6-88c7-f037427e84cc', 'Giuse V?? V??n Thi??n');

INSERT INTO public.polity__province (id, code)
VALUES ('ea8ab7a2-4065-4dd6-88c7-f037427e84cc', 'HA_NOI');

-- Gi??o T???nh Hu???
INSERT INTO public.polity__polity (id, type)
VALUES ('496603d8-df71-4444-8794-98dad88c4c30', 'province');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('496603d8-df71-4444-8794-98dad88c4c30', 'Hu???');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('496603d8-df71-4444-8794-98dad88c4c30', 'Giuse Nguy???n Ch?? Linh');

INSERT INTO public.polity__province (id, code)
VALUES ('496603d8-df71-4444-8794-98dad88c4c30', 'HUE');

-- Gi??o Ph???n S??i G??n
INSERT INTO public.polity__polity (id, type)
VALUES ('fb19b6e1-bf48-4db0-8260-3c03572136e7', 'diocese');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('fb19b6e1-bf48-4db0-8260-3c03572136e7', 'S??i G??n');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('fb19b6e1-bf48-4db0-8260-3c03572136e7', 'Giuse Nguy???n N??ng');

INSERT INTO public.polity__diocese (id, province_id)
VALUES ('fb19b6e1-bf48-4db0-8260-3c03572136e7', '3262ca15-b55f-4dcb-8c19-0f37972dfc2a');

-- Gi??o Ph???n C???n Th??
INSERT INTO public.polity__polity (id, type)
VALUES ('4d084b56-54e1-4bd2-878e-c52675497c2b', 'diocese');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('4d084b56-54e1-4bd2-878e-c52675497c2b', 'C???n Th??');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('4d084b56-54e1-4bd2-878e-c52675497c2b', 'St??phan?? Tri B???u Thi??n');

INSERT INTO public.polity__polity_location_address (id, location_address)
VALUES ('4d084b56-54e1-4bd2-878e-c52675497c2b', '12 Nguy???n Tr??i, Ninh Ki???u, C???n Th??');

INSERT INTO public.polity__polity_location_name (id, location_name)
VALUES ('4d084b56-54e1-4bd2-878e-c52675497c2b', 'T??a Gi??m M???c C???n Th??');

INSERT INTO public.polity__polity_location_email (id, location_email)
VALUES ('4d084b56-54e1-4bd2-878e-c52675497c2b', 'binh@sunrise.vn');

INSERT INTO public.polity__diocese (id, province_id)
VALUES ('4d084b56-54e1-4bd2-878e-c52675497c2b', '3262ca15-b55f-4dcb-8c19-0f37972dfc2a');

-- Gi??o H???t Ph?? Th???
INSERT INTO public.polity__polity (id, type)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'deanery');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'Ph?? Th???');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'Giuse Pham Ba Lam');

INSERT INTO public.polity__deanery (id, diocese_id)
VALUES ('a8c5fcc2-e665-4220-9e09-f2f5314d282f', 'fb19b6e1-bf48-4db0-8260-3c03572136e7');

-- Gi??o X??? H??a H??ng
INSERT INTO public.polity__polity (id, type)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043', 'parish');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043', 'H??a H??ng');

INSERT INTO public.polity__polity_person_in_charge (id, person_in_charge)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043', 'Giuse Pham Ba Lam');

INSERT INTO public.polity__parish (id, deanery_id)
VALUES ('369769b1-96ee-4e11-95e9-a9ed1409c043', 'a8c5fcc2-e665-4220-9e09-f2f5314d282f');

-- Institute: Dong Thanh Gia
INSERT INTO public.polity__polity (id, type)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', 'institute');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', 'D??ng Th??nh Gia');

INSERT INTO public.polity__polity_location_address (id, location_address)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', '603/47 Kh??m B??nh ?????c 3, P. B??nh ?????c, Long Xuy??n, An Giang');

INSERT INTO public.polity__polity_location_name (id, location_name)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', 'D??ng Th??nh Gia Vi???t Nam');

INSERT INTO public.polity__polity_location_email (id, location_email)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', 'binh@sunrise.vn');

INSERT INTO public.polity__institute (id)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4');

-- Institute: Dong Thanh The
INSERT INTO public.polity__polity (id, type)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'institute');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'D??ng Th??nh Th???');

INSERT INTO public.polity__polity_location_address (id, location_address)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', '15b, ???????ng 4, khu ph??? 4, ph?????ng B??nh Chi???u, qu???n Th??? ?????c, TPHCM');

INSERT INTO public.polity__polity_location_name (id, location_name)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'D??ng Th??nh Th??? Vi???t Nam');

INSERT INTO public.polity__polity_location_email (id, location_email)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'peterbean410@gmail.com');

INSERT INTO public.polity__institute (id)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4');
-- View
CREATE VIEW polity__polity_view AS
    SELECT polity__polity.id, type, name, person_in_charge, location_name, location_email, location_address
    FROM polity__polity
    LEFT JOIN polity__polity_name ON polity__polity.id = polity__polity_name.id
    LEFT JOIN polity__polity_person_in_charge ON polity__polity.id = polity__polity_person_in_charge.id
    LEFT JOIN polity__polity_location_name ON polity__polity.id = polity__polity_location_name.id
    LEFT JOIN polity__polity_location_email ON polity__polity.id = polity__polity_location_email.id
    LEFT JOIN polity__polity_location_address ON polity__polity.id = polity__polity_location_address.id;

CREATE VIEW polity__province_view AS
     SELECT polity.*, province.code
     FROM polity__province province
     LEFT JOIN polity__polity_view polity ON province.id = polity.id;

CREATE OR REPLACE VIEW polity__diocese_view AS
    SELECT polity.*,
    province.id province_id, province.name province_name,
    province.person_in_charge province_person_in_charge,
    province.location_name province_location_name, province.location_email province_location_email, province.location_address province_location_address,
    province.code province_code
    FROM polity__diocese diocese
    LEFT JOIN polity__polity_view polity ON diocese.id = polity.id
    LEFT JOIN polity__province_view province ON diocese.province_id = province.id;

CREATE OR REPLACE VIEW polity__deanery_view AS
    SELECT polity.*,
    diocese.id diocese_id, diocese.name diocese_name, diocese.person_in_charge diocese_person_in_charge,
    diocese.location_name diocese_location_name, diocese.location_email diocese_location_email, diocese.location_address diocese_location_address,
    diocese.province_id, diocese.province_name, diocese.province_person_in_charge,
    diocese.province_location_name, diocese.province_location_email, diocese.province_location_address,
    diocese.province_code
    FROM polity__deanery deanery
    LEFT JOIN polity__polity_view polity ON deanery.id = polity.id
    LEFT JOIN polity__diocese_view diocese ON deanery.diocese_id = diocese.id;

CREATE OR REPLACE VIEW polity__parish_view AS
    SELECT polity.*,
    deanery.id deanery_id, deanery.name deanery_name, deanery.person_in_charge deanery_person_in_charge,
    deanery.location_name deanery_location_name, deanery.location_email deanery_location_email, deanery.location_address deanery_location_address,
    deanery.diocese_id, deanery.diocese_name, deanery.diocese_person_in_charge,
    deanery.diocese_location_name, deanery.diocese_location_email, deanery.diocese_location_address,
    deanery.province_id, deanery.province_name, deanery.province_person_in_charge,
    deanery.province_location_name, deanery.province_location_email, deanery.province_location_address,
    deanery.province_code
    FROM polity__parish parish
    LEFT JOIN polity__polity_view polity ON parish.id = polity.id
    LEFT JOIN polity__deanery_view deanery ON parish.deanery_id = deanery.id;

CREATE OR REPLACE VIEW polity__institute_view AS
     SELECT polity.*
     FROM polity__institute institute
     LEFT JOIN polity__polity_view polity ON institute.id = polity.id;

