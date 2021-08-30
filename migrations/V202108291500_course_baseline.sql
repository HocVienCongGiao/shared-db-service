CREATE TABLE IF NOT EXISTS public.course__base
(
    id                 UUID PRIMARY KEY,
    type               VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.course__program
(
    id                 UUID PRIMARY KEY REFERENCES course__base(id)
);

CREATE TABLE IF NOT EXISTS public.course__program_specialism
(
    id                 UUID PRIMARY KEY REFERENCES course__base(id),
    program_id         UUID NOT NULL REFERENCES course__program(id)
);

CREATE TABLE IF NOT EXISTS public.course__course
(
    id                  UUID PRIMARY KEY REFERENCES course__base(id)
);

CREATE TABLE IF NOT EXISTS public.course__base_code
(
    id                 UUID PRIMARY KEY REFERENCES course__base(id),
    code               VARCHAR NOT NULL
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_course__course__base_code ON course__base_code (code);

CREATE TABLE IF NOT EXISTS public.course__base_name
(
    id                 UUID PRIMARY KEY REFERENCES course__base(id),
    name               VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.course__base_ects
(
    id                 UUID PRIMARY KEY REFERENCES course__base(id),
    ects               SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS public.course__course_program_specialism
(
    id                  UUID PRIMARY KEY REFERENCES course__base(id),
    specialism_id       UUID NOT NULL REFERENCES course__program_specialism(id)
);

-- Program: Cử Nhân Thần Học
INSERT INTO public.course__base (id, type)
VALUES ('d7513466-b2a9-4ae7-8f58-4599f414f14c', 'program');

INSERT INTO public.course__base_name (id, name)
VALUES ('d7513466-b2a9-4ae7-8f58-4599f414f14c', 'Cử Nhân Thần Học');

INSERT INTO public.course__base_code (id, code)
VALUES ('d7513466-b2a9-4ae7-8f58-4599f414f14c', 'STB');

INSERT INTO public.course__program (id)
VALUES ('d7513466-b2a9-4ae7-8f58-4599f414f14c');

--- Program: Cử Nhân Thần Học - general
INSERT INTO public.course__base (id, type)
VALUES ('ed723833-e3ae-4899-a64b-e7bc7df59610', 'specialism');

INSERT INTO public.course__base_name (id, name)
VALUES ('ed723833-e3ae-4899-a64b-e7bc7df59610', 'Cử Nhân Thần Học');

INSERT INTO public.course__base_code (id, code)
VALUES ('ed723833-e3ae-4899-a64b-e7bc7df59610', 'STB-TH');

INSERT INTO public.course__program_specialism (id, program_id)
VALUES ('ed723833-e3ae-4899-a64b-e7bc7df59610', 'd7513466-b2a9-4ae7-8f58-4599f414f14c');

-- Program: Thạc Sĩ Thần Học
INSERT INTO public.course__base (id, type)
VALUES ('be738e71-0023-40f6-a3e4-7e2a5bde0a75', 'program');

INSERT INTO public.course__base_name (id, name)
VALUES ('be738e71-0023-40f6-a3e4-7e2a5bde0a75', 'Thạc Sĩ Thần Học');

INSERT INTO public.course__base_code (id, code)
VALUES ('be738e71-0023-40f6-a3e4-7e2a5bde0a75', 'STL');

INSERT INTO public.course__program (id)
VALUES ('be738e71-0023-40f6-a3e4-7e2a5bde0a75');

-- Specialism: Thạc Sĩ Thần Học - Thánh Kinh
INSERT INTO public.course__base (id, type)
VALUES ('90205738-a4d5-4c9f-8cab-9b7a6b2da4ed', 'specialism');

INSERT INTO public.course__base_name (id, name)
VALUES ('90205738-a4d5-4c9f-8cab-9b7a6b2da4ed', 'Thạc Sĩ Thần Học Thánh Kinh');

INSERT INTO public.course__base_code (id, code)
VALUES ('90205738-a4d5-4c9f-8cab-9b7a6b2da4ed', 'STL-TK');

INSERT INTO public.course__program_specialism (id, program_id)
VALUES ('90205738-a4d5-4c9f-8cab-9b7a6b2da4ed', 'be738e71-0023-40f6-a3e4-7e2a5bde0a75');

-- Specialism: Thạc Sĩ Thần Học - Tín Lý
INSERT INTO public.course__base (id, type)
VALUES ('4eb07b8e-33dc-4e15-85b5-b6024613df20', 'specialism');

INSERT INTO public.course__base_name (id, name)
VALUES ('4eb07b8e-33dc-4e15-85b5-b6024613df20', 'Thạc Sĩ Thần Học Tín Lý');

INSERT INTO public.course__base_code (id, code)
VALUES ('4eb07b8e-33dc-4e15-85b5-b6024613df20', 'STL-TL');

INSERT INTO public.course__program_specialism (id, program_id)
VALUES ('4eb07b8e-33dc-4e15-85b5-b6024613df20', 'be738e71-0023-40f6-a3e4-7e2a5bde0a75');
