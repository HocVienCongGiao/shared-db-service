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

-- View
CREATE VIEW person__person_christian_name_view AS
    SELECT person.id as person_id,
    array_agg(saint__saint_display_name.id ORDER BY person__person_christian_names.ordering) as saint_ids,
    string_agg(saint__saint_display_name.display_name, ' ' ORDER BY person__person_christian_names.ordering) as christian_name
    FROM person__person person
    LEFT JOIN person__person_christian_names ON person.id = person__person_christian_names.person_id
    LEFT JOIN saint__saint_display_name ON person__person_christian_names.saint_id = saint__saint_display_name.id
    GROUP BY person.id;
