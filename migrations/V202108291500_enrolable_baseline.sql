CREATE TABLE IF NOT EXISTS public.enrolable__enrolable
(
    id                 UUID PRIMARY KEY,
    type               VARCHAR NOT NULL
);

-- type: program
CREATE TABLE IF NOT EXISTS public.enrolable__program
(
    id                 UUID PRIMARY KEY REFERENCES enrolable__enrolable(id) ON DELETE CASCADE
);

-- type: specialism
CREATE TABLE IF NOT EXISTS public.enrolable__specialism
(
    id                 UUID PRIMARY KEY REFERENCES enrolable__enrolable(id) ON DELETE CASCADE,
    program_id         UUID NOT NULL REFERENCES enrolable__program(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolable__specialism_program_id ON enrolable__specialism(program_id);

-- type: course
CREATE TABLE IF NOT EXISTS public.enrolable__course
(
    id                  UUID PRIMARY KEY REFERENCES enrolable__enrolable(id) ON DELETE CASCADE
);

-- enrolable__enrolable_phase
CREATE TABLE IF NOT EXISTS public.enrolable__enrolable_phase
(
    id                 UUID PRIMARY KEY,
    enrolable_id       UUID NOT NULL REFERENCES enrolable__enrolable(id) ON DELETE CASCADE,
    phase_name         VARCHAR NOT NULL,
    UNIQUE (enrolable_id, phase_name)
);
CREATE INDEX IF NOT EXISTS IDX_enrolable__enrolable_phase_enrolable_id ON enrolable__enrolable_phase
 (enrolable_id);

CREATE TABLE IF NOT EXISTS public.enrolable__enrolable_phase_level
(
    id                 UUID PRIMARY KEY REFERENCES enrolable__enrolable_phase(id) ON DELETE CASCADE,
    level              SMALLINT NOT NULL,
    UNIQUE (id, level)
);

CREATE TABLE IF NOT EXISTS public.enrolable__enrolable_phase_assignment
(
    id                 UUID PRIMARY KEY,
    enrolable_id       UUID NOT NULL REFERENCES enrolable__enrolable(id) ON DELETE CASCADE,
    phase_id           UUID NOT NULL REFERENCES enrolable__enrolable_phase(id) ON DELETE CASCADE,
    UNIQUE (enrolable_id, phase_id)
);
CREATE INDEX IF NOT EXISTS IDX_enrolable__enrolable_phase_assignment_enrolable_id ON enrolable__enrolable_phase_assignment(enrolable_id);
CREATE INDEX IF NOT EXISTS IDX_enrolable__enrolable_phase_assignment_phase_id ON enrolable__enrolable_phase_assignment(phase_id);

-- enrolable__enrolable_ properties
CREATE TABLE IF NOT EXISTS public.enrolable__enrolable_code
(
    id                 UUID PRIMARY KEY REFERENCES enrolable__enrolable(id) ON DELETE CASCADE,
    code               VARCHAR NOT NULL
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__enrolable__enrolable_code ON enrolable__enrolable_code (code);

CREATE TABLE IF NOT EXISTS public.enrolable__enrolable_name
(
    id                 UUID PRIMARY KEY REFERENCES enrolable__enrolable(id) ON DELETE CASCADE,
    name               VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.enrolable__enrolable_ects
(
    id                 UUID PRIMARY KEY REFERENCES enrolable__enrolable(id) ON DELETE CASCADE,
    ects               SMALLINT NOT NULL
);

-- N-N cardinality between course and program
CREATE TABLE IF NOT EXISTS public.enrolable__course_program
(
    id                  UUID PRIMARY KEY,
    course_id           UUID NOT NULL REFERENCES enrolable__course(id) ON DELETE CASCADE,
    specialism_id       UUID NOT NULL REFERENCES enrolable__program(id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__course_program_course_id ON enrolable__course_program (course_id);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__course_program_specialism_id ON enrolable__course_program (specialism_id);

-- N-N cardinality between course and program_specialism
CREATE TABLE IF NOT EXISTS public.enrolable__course_specialism
(
    id                  UUID PRIMARY KEY,
    course_id           UUID NOT NULL REFERENCES enrolable__course(id) ON DELETE CASCADE,
    specialism_id       UUID NOT NULL REFERENCES enrolable__specialism(id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__course_specialism_course_id ON enrolable__course_specialism (course_id);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__course_specialism_specialism_id ON enrolable__course_specialism (specialism_id);

-- Program: Cử Nhân Thần Học
INSERT INTO public.enrolable__enrolable (id, type)
VALUES ('d7513466-b2a9-4ae7-8f58-4599f414f14c', 'program');

INSERT INTO public.enrolable__enrolable_name (id, name)
VALUES ('d7513466-b2a9-4ae7-8f58-4599f414f14c', 'Cử Nhân Thần Học');

INSERT INTO public.enrolable__enrolable_code (id, code)
VALUES ('d7513466-b2a9-4ae7-8f58-4599f414f14c', 'STB');

INSERT INTO public.enrolable__program (id)
VALUES ('d7513466-b2a9-4ae7-8f58-4599f414f14c');

--- Program: Cử Nhân Thần Học - general
INSERT INTO public.enrolable__enrolable (id, type)
VALUES ('ed723833-e3ae-4899-a64b-e7bc7df59610', 'specialism');

INSERT INTO public.enrolable__enrolable_name (id, name)
VALUES ('ed723833-e3ae-4899-a64b-e7bc7df59610', 'Cử Nhân Thần Học');

INSERT INTO public.enrolable__enrolable_code (id, code)
VALUES ('ed723833-e3ae-4899-a64b-e7bc7df59610', 'STB-TH');

INSERT INTO public.enrolable__specialism (id, program_id)
VALUES ('ed723833-e3ae-4899-a64b-e7bc7df59610', 'd7513466-b2a9-4ae7-8f58-4599f414f14c');

--- Program: Cử Nhân Thần Học - general - Phase: Triết học 
INSERT INTO public.enrolable__enrolable_phase (id, enrolable_id, phase_name)
VALUES ('b4e16a36-a1f1-464f-95a4-ff95cccf7151', 'ed723833-e3ae-4899-a64b-e7bc7df59610', 'Triết học');

INSERT INTO public.enrolable__enrolable_phase_level (id, level)
VALUES ('b4e16a36-a1f1-464f-95a4-ff95cccf7151', 1);
--- Program: Cử Nhân Thần Học - general - Phase: Thần học 
INSERT INTO public.enrolable__enrolable_phase (id, enrolable_id, phase_name)
VALUES ('8de9679a-f8f2-41ea-abce-e6e47640e063', 'ed723833-e3ae-4899-a64b-e7bc7df59610', 'Thần học');

INSERT INTO public.enrolable__enrolable_phase_level (id, level)
VALUES ('8de9679a-f8f2-41ea-abce-e6e47640e063', 2);

-- Program: Thạc Sĩ Thần Học
INSERT INTO public.enrolable__enrolable (id, type)
VALUES ('be738e71-0023-40f6-a3e4-7e2a5bde0a75', 'program');

INSERT INTO public.enrolable__enrolable_name (id, name)
VALUES ('be738e71-0023-40f6-a3e4-7e2a5bde0a75', 'Thạc Sĩ Thần Học');

INSERT INTO public.enrolable__enrolable_code (id, code)
VALUES ('be738e71-0023-40f6-a3e4-7e2a5bde0a75', 'STL');

INSERT INTO public.enrolable__program (id)
VALUES ('be738e71-0023-40f6-a3e4-7e2a5bde0a75');

-- Specialism: Thạc Sĩ Thần Học - Thánh Kinh
INSERT INTO public.enrolable__enrolable (id, type)
VALUES ('90205738-a4d5-4c9f-8cab-9b7a6b2da4ed', 'specialism');

INSERT INTO public.enrolable__enrolable_name (id, name)
VALUES ('90205738-a4d5-4c9f-8cab-9b7a6b2da4ed', 'Thạc Sĩ Thần Học Thánh Kinh');

INSERT INTO public.enrolable__enrolable_code (id, code)
VALUES ('90205738-a4d5-4c9f-8cab-9b7a6b2da4ed', 'STL-TK');

INSERT INTO public.enrolable__specialism (id, program_id)
VALUES ('90205738-a4d5-4c9f-8cab-9b7a6b2da4ed', 'be738e71-0023-40f6-a3e4-7e2a5bde0a75');

-- Specialism: Thạc Sĩ Thần Học - Tín Lý
INSERT INTO public.enrolable__enrolable (id, type)
VALUES ('4eb07b8e-33dc-4e15-85b5-b6024613df20', 'specialism');

INSERT INTO public.enrolable__enrolable_name (id, name)
VALUES ('4eb07b8e-33dc-4e15-85b5-b6024613df20', 'Thạc Sĩ Thần Học Tín Lý');

INSERT INTO public.enrolable__enrolable_code (id, code)
VALUES ('4eb07b8e-33dc-4e15-85b5-b6024613df20', 'STL-TL');

INSERT INTO public.enrolable__specialism (id, program_id)
VALUES ('4eb07b8e-33dc-4e15-85b5-b6024613df20', 'be738e71-0023-40f6-a3e4-7e2a5bde0a75');

-- View
CREATE VIEW enrolable__enrolable_view AS
    SELECT enrolable__enrolable.id, code, name, ects, type
    FROM enrolable__enrolable
    LEFT JOIN enrolable__enrolable_code ON enrolable__enrolable.id = enrolable__enrolable_code.id
    LEFT JOIN enrolable__enrolable_name ON enrolable__enrolable.id = enrolable__enrolable_name.id
    LEFT JOIN enrolable__enrolable_ects ON enrolable__enrolable.id = enrolable__enrolable_ects.id;
