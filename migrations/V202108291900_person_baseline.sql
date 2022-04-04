CREATE TABLE IF NOT EXISTS public.person__person
(
    id                  UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS public.person__person_polity
(
    id                 UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE,
    polity_id          UUID NOT NULL REFERENCES polity__polity(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.person__person_title
(
    id UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE,
    title VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_christian_names
(
    person_id UUID NOT NULL REFERENCES person__person(id) ON DELETE CASCADE,
    saint_id           UUID NOT NULL REFERENCES saint__saint(id) ON DELETE CASCADE,
    ordering           SMALLINT NOT NULL,
    PRIMARY KEY(person_id, saint_id)
);

CREATE TABLE IF NOT EXISTS public.person__person_first_name
(
    id                 UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE,
    first_name         VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_middle_name
(
    id                 UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE,
    middle_name        VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_last_name
(
    id                 UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE,
    last_name          VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_nationality
(
    id                  UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE,
    nationality         VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_race
(
    id                  UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE,
    race                VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_id_number
(
    id                  UUID PRIMARY KEY,
    person_id           UUID NOT NULL REFERENCES person__person(id) ON DELETE CASCADE,
    person_id_number    VARCHAR NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS public.person__person_id_number_provider
(
    id                  UUID PRIMARY KEY REFERENCES person__person_id_number(id) ON DELETE CASCADE,
    code                VARCHAR NOT NULL
);


CREATE TABLE IF NOT EXISTS public.person__person_id_number_date_of_issue
(
    id                       UUID PRIMARY KEY REFERENCES person__person_id_number(id) ON DELETE CASCADE,
    date_of_issue            DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS public.person__person_id_number_place_of_issue
(
    id                        UUID PRIMARY KEY REFERENCES person__person_id_number(id) ON DELETE CASCADE,
    place_of_issue            VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_languages
(
    person_id                   UUID NOT NULL REFERENCES person__person(id) ON DELETE CASCADE,
    language                    VARCHAR NOT NULL,
    level                       VARCHAR NOT NULL,
    PRIMARY KEY (person_id, language)
);

CREATE TABLE IF NOT EXISTS public.person__person_date_of_birth
(
    id                 UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE,
    date_of_birth      DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_place_of_birth
(
    id                 UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE,
    place_of_birth     VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_email
(
    id                 UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE,
    email              VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_phone
(
    id                 UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE,
    phone              VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_address
(
    id                 UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE,
    address              VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__educational_stage
(
    id                UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS public.person__educational_stage_educational_level
(
    id                UUID PRIMARY KEY REFERENCES person__educational_stage(id) ON DELETE CASCADE,
    level             VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__educational_stage_school_name
(
    id          UUID PRIMARY KEY REFERENCES person__educational_stage (id) ON DELETE CASCADE,
    school_name VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__educational_stage_major
(
    id          UUID PRIMARY KEY REFERENCES person__educational_stage (id) ON DELETE CASCADE,
    major       VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_educational_stages
(
    person_id               UUID REFERENCES person__person (id) ON DELETE CASCADE,
    educational_stage_id    UUID REFERENCES person__educational_stage (id) ON DELETE CASCADE,
    graduate_year           INT NOT NULL,
    PRIMARY KEY (person_id, educational_stage_id, graduate_year)
);

CREATE TABLE IF NOT EXISTS public.person__person_vow_progress
(
    id       UUID PRIMARY KEY REFERENCES person__person (id) ON DELETE CASCADE,
    progress VARCHAR NOT NULL
);


-- Student: Nguyễn Hữu Chiến
INSERT INTO public.person__person (id)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283');

INSERT INTO public.person__person_date_of_birth (id, date_of_birth)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', '1983-05-16');

INSERT INTO public.person__person_place_of_birth (id, place_of_birth)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'Trà Vinh');

INSERT INTO public.person__person_email (id, email)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'binh@sunrise.vn');

INSERT INTO public.person__person_phone (id, phone)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', '+84 1228019700');

INSERT INTO public.person__person_address (id, address)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', '1000 CMT8 phường 3 quận Tân Bình, TP HCM');

INSERT INTO public.person__person_polity (id, polity_id)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', '4d084b56-54e1-4bd2-878e-c52675497c2b');

INSERT INTO public.person__person_christian_names (person_id, saint_id, ordering)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', '40e6215d-b5c6-4896-987c-f30f3678f608', 1);

INSERT INTO public.person__person_title (id, title)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'PRIEST');

INSERT INTO public.person__person_first_name (id, first_name)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'Chiến');

INSERT INTO public.person__person_middle_name (id, middle_name)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'Hữu');

INSERT INTO public.person__person_last_name (id, last_name)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'Nguyễn');

INSERT INTO public.person__person_nationality (id, nationality)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'VIETNAMESE');

INSERT INTO public.person__person_race (id, race)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'Kinh');

INSERT INTO public.person__person_id_number (id, person_id, person_id_number)
VALUES ('2f6c0dd3-f6c7-4504-aba3-de017ad33821', '53f549b9-99bf-4e12-88e3-c2f868953283', '837837655558');

INSERT INTO public.person__person_id_number_provider (id, code)
VALUES ('2f6c0dd3-f6c7-4504-aba3-de017ad33821', 'NATIONAL_ID');

INSERT INTO public.person__person_id_number_date_of_issue (id, date_of_issue)
VALUES ('2f6c0dd3-f6c7-4504-aba3-de017ad33821', '2011-05-05');

INSERT INTO public.person__person_id_number_place_of_issue (id, place_of_issue)
VALUES ('2f6c0dd3-f6c7-4504-aba3-de017ad33821', 'TP.HCM');

INSERT INTO public.person__educational_stage (id)
VALUES ('56439ecf-99e9-469a-9dcf-f5f654878e1b');

INSERT INTO public.person__educational_stage_educational_level (id, level)
VALUES ('56439ecf-99e9-469a-9dcf-f5f654878e1b', 'HIGH_SCHOOL');

INSERT INTO public.person__educational_stage_school_name (id, school_name)
VALUES ('56439ecf-99e9-469a-9dcf-f5f654878e1b', 'THPT Nguyễn Du');

INSERT INTO public.person__person_educational_stages (person_id, educational_stage_id, graduate_year)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', '56439ecf-99e9-469a-9dcf-f5f654878e1b', 2000);

-- Teacher: Đỗ Văn Ngân
INSERT INTO public.person__person (id)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350');

INSERT INTO public.person__person_polity (id, polity_id)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', '4d084b56-54e1-4bd2-878e-c52675497c2b');

INSERT INTO public.person__person_christian_names (person_id, saint_id, ordering)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', '40e6215d-b5c6-4896-987c-f30f3678f608', 1);

INSERT INTO public.person__person_title (id, title)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'PRIEST');

INSERT INTO public.person__person_first_name (id, first_name)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'Ngân');

INSERT INTO public.person__person_middle_name (id, middle_name)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'Văn');

INSERT INTO public.person__person_last_name (id, last_name)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'Đỗ');

INSERT INTO public.person__person_date_of_birth (id, date_of_birth)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', '1983-05-16');

INSERT INTO public.person__person_place_of_birth (id, place_of_birth)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'Đồng Nai');

INSERT INTO public.person__person_nationality (id, nationality)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'VIETNAMESE');

INSERT INTO public.person__person_race (id, race)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'Kinh');

INSERT INTO public.person__person_languages (person_id, language, level)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'English', 'ADVANCED');

INSERT INTO public.person__person_languages (person_id, language, level)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'Latin', 'ADVANCED');

INSERT INTO public.person__person_email (id, email)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'ngando@gmail.vn');

INSERT INTO public.person__person_phone (id, phone)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', '+84 1208019700');

INSERT INTO public.person__person_id_number (id, person_id, person_id_number)
VALUES ('f0dacf1c-b728-4072-8ded-495bcb9e9c57', '938c9343-2f5e-4517-8d2e-8f251403d350', '673487263555');

INSERT INTO public.person__person_id_number_provider (id, code)
VALUES ('f0dacf1c-b728-4072-8ded-495bcb9e9c57', 'NATIONAL_ID');

INSERT INTO public.person__person_id_number_date_of_issue (id, date_of_issue)
VALUES ('f0dacf1c-b728-4072-8ded-495bcb9e9c57', '2001-05-05');

INSERT INTO public.person__person_id_number_place_of_issue (id, place_of_issue)
VALUES ('f0dacf1c-b728-4072-8ded-495bcb9e9c57', 'TP.HCM');

-- View
CREATE VIEW person__person_christian_name_view AS
    SELECT person.id as person_id,
    array_agg(saint__saint_display_name.id ORDER BY person__person_christian_names.ordering) as saint_ids,
    string_agg(saint__saint_display_name.display_name, ' ' ORDER BY person__person_christian_names.ordering) as christian_name
    FROM person__person person
    LEFT JOIN person__person_christian_names ON person.id = person__person_christian_names.person_id
    LEFT JOIN saint__saint_display_name ON person__person_christian_names.saint_id = saint__saint_display_name.id
    GROUP BY person.id;

CREATE VIEW person__educational_stage_view AS
SELECT person__educational_stage.id,
       educational_level.level as educational_level,
       school_name.school_name,
       major.major
FROM person__educational_stage
         LEFT JOIN person__educational_stage_school_name school_name ON person__educational_stage.id = school_name.id
         LEFT JOIN person__educational_stage_educational_level educational_level
                   ON person__educational_stage.id = educational_level.id
         LEFT JOIN person__educational_stage_major major ON person__educational_stage.id = major.id;

CREATE VIEW person__person_education_stage_view AS
SELECT educational_stage_id, educational_level, school_name, major, graduate_year, person_id
FROM person__person_educational_stages
         LEFT JOIN person__educational_stage_view stage
                   ON person__person_educational_stages.educational_stage_id = stage.id;

CREATE VIEW person__personal_id_number_view AS
SELECT ppin.id,
       person_id,
       ppin.person_id_number,
       person__person_id_number_provider.code,
       person__person_id_number_date_of_issue.date_of_issue,
       person__person_id_number_place_of_issue.place_of_issue
FROM person__person as person
         LEFT JOIN person__person_id_number ppin on person.id = ppin.person_id
         LEFT JOIN person__person_id_number_provider on ppin.id = person__person_id_number_provider.id
         LEFT JOIN person__person_id_number_date_of_issue on ppin.id = person__person_id_number_date_of_issue.id
         LEFT JOIN person__person_id_number_place_of_issue on ppin.id = person__person_id_number_place_of_issue.id;



CREATE VIEW person__person_view AS
SELECT person.*,
       person__person_title.title,
       person__person_christian_name_view.saint_ids,
       person__person_christian_name_view.christian_name,

       person__person_first_name.first_name,
       person__person_middle_name.middle_name,
       person__person_last_name.last_name,
       person__person_date_of_birth.date_of_birth,
       person__person_place_of_birth.place_of_birth,
       person__person_email.email,
       person__person_phone.phone,
       person__person_nationality.nationality,
       person__person_race.race,
       person__person_polity.polity_id,
       polity.name             polity_name,
       polity.location_address polity_location_address,
       polity.location_name    polity_location_name,
       polity.location_email   polity_location_email
FROM person__person person

         LEFT JOIN person__person_date_of_birth ON person.id = person__person_date_of_birth.id
         LEFT JOIN person__person_place_of_birth ON person.id = person__person_place_of_birth.id
         LEFT JOIN person__person_email ON person.id = person__person_email.id
         LEFT JOIN person__person_phone ON person.id = person__person_phone.id

         LEFT JOIN person__person_title ON person.id = person__person_title.id
         LEFT JOIN person__person_first_name ON person.id = person__person_first_name.id
         LEFT JOIN person__person_middle_name ON person.id = person__person_middle_name.id
         LEFT JOIN person__person_last_name ON person.id = person__person_last_name.id
         LEFT JOIN person__person_christian_name_view ON person.id = person__person_christian_name_view.person_id
         LEFT JOIN person__person_nationality ON person.id = person__person_nationality.id
         LEFT JOIN person__person_race ON person.id = person__person_race.id

         LEFT JOIN person__person_polity ON person.id = person__person_polity.id
         LEFT JOIN polity__polity_view polity ON person__person_polity.polity_id = polity.id;
