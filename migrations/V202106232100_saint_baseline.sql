CREATE TABLE IF NOT EXISTS public.saint__saint
(
    id                 UUID PRIMARY KEY
);
CREATE TABLE IF NOT EXISTS public.saint__saint_english_name
(
    id                 UUID PRIMARY KEY REFERENCES saint__saint(id),
    english_name       VARCHAR
);
CREATE INDEX IDX_saint_english_name ON saint__saint_english_name (english_name);
CREATE TABLE IF NOT EXISTS public.saint__saint_french_name
(
    id                 UUID PRIMARY KEY REFERENCES saint__saint(id),
    french_name        VARCHAR
);
CREATE INDEX IDX_saint_french_name ON saint__saint_french_name (french_name);
CREATE TABLE IF NOT EXISTS public.saint__saint_latin_name
(
    id                 UUID PRIMARY KEY REFERENCES saint__saint(id),
    latin_name         VARCHAR
);
CREATE INDEX IDX_saint_latin_name ON saint__saint_latin_name (latin_name);
CREATE TABLE IF NOT EXISTS public.saint__saint_vietnamese_name
(
    id                 UUID PRIMARY KEY REFERENCES saint__saint(id),
    vietnamese_name    VARCHAR NOT NULL
);
CREATE INDEX IDX_saint_vietnamese_name ON saint__saint_vietnamese_name (vietnamese_name);
CREATE TABLE IF NOT EXISTS public.saint__saint_gender
(
    id                 UUID PRIMARY KEY REFERENCES saint__saint(id),
    gender             VARCHAR NOT NULL
);
CREATE INDEX IDX_saint_gender ON saint__saint_gender (gender);
CREATE TABLE IF NOT EXISTS public.saint__saint_feast_day
(
    id                 UUID PRIMARY KEY REFERENCES saint__saint(id),
    feast_day          VARCHAR NOT NULL
);
CREATE INDEX IDX_saint_feast_day ON saint__saint_feast_day (feast_day);

INSERT INTO public.saint__saint (id)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608');

INSERT INTO public.saint__saint_english_name (id, english_name)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', NULL);

INSERT INTO public.saint__saint_french_name (id, french_name)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', NULL);

INSERT INTO public.saint__saint_latin_name (id,latin_name)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', NULL);

INSERT INTO public.saint__saint_vietnamese_name (id,vietnamese_name)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608','Lê Dang Thi');

INSERT INTO public.saint__saint_gender (id, gender)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608','Female');

INSERT INTO public.saint__saint_feast_day (id, feast_day)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', '2410');

CREATE VIEW saint__saint_view AS
    SELECT saint__saint.id, english_name, french_name, latin_name, vietnamese_name, gender, feast_day
    FROM
    saint__saint
    JOIN saint__saint_english_name ON saint__saint.id = saint__saint_english_name.id
    JOIN saint__saint_french_name ON saint__saint.id = saint__saint_french_name.id
    JOIN saint__saint_latin_name ON saint__saint.id = saint__saint_latin_name.id
    JOIN saint__saint_vietnamese_name ON saint__saint.id = saint__saint_vietnamese_name.id
    JOIN saint__saint_gender ON saint__saint.id = saint__saint_gender.id
    JOIN saint__saint_feast_day ON saint__saint.id = saint__saint_feast_day.id
