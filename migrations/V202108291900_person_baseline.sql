CREATE TABLE IF NOT EXISTS public.person__person
(
    id                  UUID PRIMARY KEY,
    type                VARCHAR NOT NULL
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
    person_id           UUID REFERENCES person__person(id) ON DELETE CASCADE,
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

CREATE TABLE IF NOT EXISTS public.person__person_foreign_language
(
    id                          UUID PRIMARY KEY,
    person_id                   UUID REFERENCES person__person(id) ON DELETE CASCADE,
    language                    VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.person__person_foreign_language_level
(
    id                          UUID PRIMARY KEY REFERENCES person__person_foreign_language(id),
    code                        VARCHAR NOT NULL
);


-- Student: Nguyễn Hữu Chiến
INSERT INTO public.person__person (id, type)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'student');

INSERT INTO public.person__person_polity (id, polity_id)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', '4d084b56-54e1-4bd2-878e-c52675497c2b');

INSERT INTO public.person__person_christian_names (person_id, saint_id, ordering)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', '40e6215d-b5c6-4896-987c-f30f3678f608', 1);

INSERT INTO public.person__person_title (id, title)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'PRIEST');

INSERT INTO public.person__person_first_name (id, first_name)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'Nguyễn');

INSERT INTO public.person__person_middle_name (id, middle_name)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'Hữu');

INSERT INTO public.person__person_last_name (id, last_name)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'Chiến');

INSERT INTO public.person__person_nationality (id, nationality)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'Vietnamese');

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


-- Teacher: Đỗ Văn Ngân
INSERT INTO public.person__person (id, type)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'teacher');

INSERT INTO public.person__person_polity (id, polity_id)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', '4d084b56-54e1-4bd2-878e-c52675497c2b');

INSERT INTO public.person__person_christian_names (person_id, saint_id, ordering)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', '40e6215d-b5c6-4896-987c-f30f3678f608', 1);

INSERT INTO public.person__person_title (id, title)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'PRIEST');

INSERT INTO public.person__person_first_name (id, first_name)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'Đỗ');

INSERT INTO public.person__person_middle_name (id, middle_name)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'Văn');

INSERT INTO public.person__person_last_name (id, last_name)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'Ngân');

INSERT INTO public.person__person_nationality (id, nationality)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'Vietnamese');

INSERT INTO public.person__person_race (id, race)
VALUES ('938c9343-2f5e-4517-8d2e-8f251403d350', 'Kinh');

INSERT INTO public.person__person_id_number (id, person_id, person_id_number)
VALUES ('f0dacf1c-b728-4072-8ded-495bcb9e9c57', '938c9343-2f5e-4517-8d2e-8f251403d350', '673487263555');

INSERT INTO public.person__person_id_number_provider (id, code)
VALUES ('f0dacf1c-b728-4072-8ded-495bcb9e9c57', 'NATIONAL_ID');

INSERT INTO public.person__person_id_number_date_of_issue (id, date_of_issue)
VALUES ('f0dacf1c-b728-4072-8ded-495bcb9e9c57', '2001-05-05');

INSERT INTO public.person__person_id_number_place_of_issue (id, place_of_issue)
VALUES ('f0dacf1c-b728-4072-8ded-495bcb9e9c57', 'TP.HCM');

INSERT INTO public.person__person_foreign_language (id, person_id, language)
VALUES ('ff45da19-8bae-4367-9d85-ac9b8dbe0b97', '938c9343-2f5e-4517-8d2e-8f251403d350', 'English');

INSERT INTO public.person__person_foreign_language_level (id, code)
VALUES ('ff45da19-8bae-4367-9d85-ac9b8dbe0b97', 'ADVANCED');

INSERT INTO public.person__person_foreign_language (id, person_id, language)
VALUES ('bdbca191-867f-4933-aa1a-eec10050e5bf', '938c9343-2f5e-4517-8d2e-8f251403d350', 'Latin');

INSERT INTO public.person__person_foreign_language_level (id, code)
VALUES ('bdbca191-867f-4933-aa1a-eec10050e5bf', 'ADVANCED');

-- View
CREATE VIEW person__person_christian_name_view AS
    SELECT person.id as person_id,
    array_agg(saint__saint_display_name.id ORDER BY person__person_christian_names.ordering) as saint_ids,
    string_agg(saint__saint_display_name.display_name, ' ' ORDER BY person__person_christian_names.ordering) as christian_name
    FROM person__person person
    LEFT JOIN person__person_christian_names ON person.id = person__person_christian_names.person_id
    LEFT JOIN saint__saint_display_name ON person__person_christian_names.saint_id = saint__saint_display_name.id
    GROUP BY person.id;

CREATE VIEW person__person_foreign_language_view AS
SELECT language.id,
       language.language,
       person__person_foreign_language_level.code as level,
       language.person_id                         as person_id
FROM person__person_foreign_language as language
         LEFT JOIN person__person_foreign_language_level on language.id = person__person_foreign_language_level.id

CREATE VIEW person__person_view AS
SELECT person.*,
       person__person_title.title,
       person__person_christian_name_view.saint_ids,
    person__person_christian_name_view.christian_name,

    person__person_first_name.first_name,
    person__person_middle_name.middle_name,
    person__person_last_name.last_name,
    person__person_nationality.nationality,
    person__person_race.race,
    person__person_polity.polity_id,
    polity.name polity_name,
    polity.location_address polity_location_address,
    polity.location_name polity_location_name,
    polity.location_email polity_location_email
    FROM person__person person
    LEFT JOIN person__person_title ON person.id = person__person_title.id
    LEFT JOIN person__person_first_name ON person.id = person__person_first_name.id
    LEFT JOIN person__person_middle_name ON person.id = person__person_middle_name.id
    LEFT JOIN person__person_last_name ON person.id = person__person_last_name.id
    LEFT JOIN person__person_christian_name_view ON person.id = person__person_christian_name_view.person_id
    LEFT JOIN person__person_nationality ON person.id = person__person_nationality.id
    LEFT JOIN person__person_race ON person.id = person__person_race.id

    LEFT JOIN person__person_id_number ppin on person.id = ppin.person_id
    LEFT JOIN person__person_id_number_provider on ppin.id = person__person_id_number_provider.id
    LEFT JOIN person__person_id_number_date_of_issue on ppin.id = person__person_id_number_date_of_issue.id
    LEFT JOIN person__person_id_number_place_of_issue on ppin.id = person__person_id_number_place_of_issue.id

    LEFT JOIN person__person_polity ON person.id = person__person_polity.id
    LEFT JOIN polity__polity_view polity ON person__person_polity.polity_id = polity.id
