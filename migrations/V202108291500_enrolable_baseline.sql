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
CREATE INDEX IF NOT EXISTS IDX_enrolable__enrolable_phase_enrolable_id ON enrolable__enrolable_phase (enrolable_id);

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

-- program_specialism
CREATE TABLE IF NOT EXISTS public.enrolable__program_specialism
(
    id                 UUID PRIMARY KEY,
    program_id         UUID NOT NULL REFERENCES enrolable__program(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolable__program_specialism_program_id ON enrolable__program_specialism(program_id);

CREATE TABLE IF NOT EXISTS public.enrolable__program_specialism_code
(
    id         UUID PRIMARY KEY REFERENCES enrolable__program_specialism(id) ON DELETE CASCADE,
    code       VARCHAR NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_enrolable__program_specialism_code ON enrolable__program_specialism_code(code);

CREATE TABLE IF NOT EXISTS public.enrolable__program_specialism_name
(
    id         UUID PRIMARY KEY REFERENCES enrolable__program_specialism(id) ON DELETE CASCADE,
    name       VARCHAR NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_enrolable__program_specialism_name ON enrolable__program_specialism_name(name);

-- N-N cardinality between course and program
CREATE TABLE IF NOT EXISTS public.enrolable__courses_programs
(
    id                  UUID PRIMARY KEY,
    course_id           UUID NOT NULL REFERENCES enrolable__course(id) ON DELETE CASCADE,
    program_id       UUID NOT NULL REFERENCES enrolable__program(id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__courses_programs_course_id ON enrolable__courses_programs (course_id);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__courses_programs_program_id ON enrolable__courses_programs (program_id);

-- N-N cardinality between course and specialism
CREATE TABLE IF NOT EXISTS public.enrolable__courses_specialisms
(
    id                  UUID PRIMARY KEY,
    course_id           UUID NOT NULL REFERENCES enrolable__course(id) ON DELETE CASCADE,
    specialism_id       UUID NOT NULL REFERENCES enrolable__program_specialism(id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__courses_specialisms_course_id ON enrolable__courses_specialisms (course_id);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__courses_specialisms_specialism_id ON enrolable__courses_specialisms (specialism_id);

-- Program: Cử Nhân Thần Học
INSERT INTO public.enrolable__enrolable (id, type)
VALUES ('d7513466-b2a9-4ae7-8f58-4599f414f14c', 'program');

INSERT INTO public.enrolable__enrolable_name (id, name)
VALUES ('d7513466-b2a9-4ae7-8f58-4599f414f14c', 'Cử Nhân Thần Học');

INSERT INTO public.enrolable__enrolable_code (id, code)
VALUES ('d7513466-b2a9-4ae7-8f58-4599f414f14c', 'STB');

INSERT INTO public.enrolable__program (id)
VALUES ('d7513466-b2a9-4ae7-8f58-4599f414f14c');

--- Program: Cử Nhân Thần Học - general - Phase: Triết học 
INSERT INTO public.enrolable__enrolable_phase (id, enrolable_id, phase_name)
VALUES ('b4e16a36-a1f1-464f-95a4-ff95cccf7151', 'd7513466-b2a9-4ae7-8f58-4599f414f14c', 'Triết học');

INSERT INTO public.enrolable__enrolable_phase_level (id, level)
VALUES ('b4e16a36-a1f1-464f-95a4-ff95cccf7151', 1);

--- Program: Cử Nhân Thần Học - general - Phase: Thần học 
INSERT INTO public.enrolable__enrolable_phase (id, enrolable_id, phase_name)
VALUES ('8de9679a-f8f2-41ea-abce-e6e47640e063', 'd7513466-b2a9-4ae7-8f58-4599f414f14c', 'Thần học');

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
INSERT INTO public.enrolable__program_specialism (id, program_id)
VALUES ('90205738-a4d5-4c9f-8cab-9b7a6b2da4ed', 'be738e71-0023-40f6-a3e4-7e2a5bde0a75');

INSERT INTO public.enrolable__program_specialism_code (id, code)
VALUES ('90205738-a4d5-4c9f-8cab-9b7a6b2da4ed', 'TK');

INSERT INTO public.enrolable__program_specialism_name (id, name)
VALUES ('90205738-a4d5-4c9f-8cab-9b7a6b2da4ed', 'Thánh Kinh');

-- Specialism: Thạc Sĩ Thần Học - Tín Lý
INSERT INTO public.enrolable__program_specialism (id, program_id)
VALUES ('4eb07b8e-33dc-4e15-85b5-b6024613df20', 'be738e71-0023-40f6-a3e4-7e2a5bde0a75');

INSERT INTO public.enrolable__program_specialism_code (id, code)
VALUES ('4eb07b8e-33dc-4e15-85b5-b6024613df20', 'TL');

INSERT INTO public.enrolable__program_specialism_name (id, name)
VALUES ('4eb07b8e-33dc-4e15-85b5-b6024613df20', 'Tín Lý');

-- View
CREATE VIEW enrolable__enrolable_view AS
    SELECT enrolable__enrolable.id, code, name, ects, type
    FROM enrolable__enrolable
    LEFT JOIN enrolable__enrolable_code ON enrolable__enrolable.id = enrolable__enrolable_code.id
    LEFT JOIN enrolable__enrolable_name ON enrolable__enrolable.id = enrolable__enrolable_name.id
    LEFT JOIN enrolable__enrolable_ects ON enrolable__enrolable.id = enrolable__enrolable_ects.id;
