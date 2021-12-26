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
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__courses_programs_courses_programs ON enrolable__courses_programs (course_id, program_id);

-- N-N cardinality between course and specialism
CREATE TABLE IF NOT EXISTS public.enrolable__courses_specialisms
(
    id                  UUID PRIMARY KEY,
    course_id           UUID NOT NULL REFERENCES enrolable__course(id) ON DELETE CASCADE,
    specialism_id       UUID NOT NULL REFERENCES enrolable__program_specialism(id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__courses_specialisms_courses_program_specialisms ON enrolable__courses_specialisms (course_id, specialism_id);

-- category
CREATE TABLE IF NOT EXISTS public.enrolable__category
(
    id              UUID PRIMARY KEY,
    name            VARCHAR NOT NULL

);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__category_name ON enrolable__category (name);

-- N-N cardinality between category and enrolable
CREATE TABLE IF NOT EXISTS public.enrolable__enrolables_categories
(
    id                  UUID PRIMARY KEY,
    enrolable_id        UUID NOT NULL REFERENCES enrolable__enrolable(id) ON DELETE CASCADE,
    category_id          UUID NOT NULL REFERENCES enrolable__category(id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_enrolable__enrolables_categories_enrolables_categories ON enrolable__enrolables_categories (enrolable_id, category_id);


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

--- Phase: Năm chuẩn bị - Program: Thạc Sĩ Thần Học
INSERT INTO public.enrolable__enrolable_phase (id, enrolable_id, phase_name)
VALUES ('c78693e8-2969-406d-952b-a977b7990a10', 'be738e71-0023-40f6-a3e4-7e2a5bde0a75', 'Năm chuẩn bị');

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

-- Course: Phương Pháp Nghiên Cứu Kinh Thánh
INSERT INTO public.enrolable__enrolable (id, type)
VALUES ('0ea5cfa4-4dbc-4f48-b857-58881f88591f', 'course');

INSERT INTO public.enrolable__enrolable_name (id, name)
VALUES ('0ea5cfa4-4dbc-4f48-b857-58881f88591f', 'Phương Pháp Nghiên Cứu Kinh Thánh');

INSERT INTO public.enrolable__enrolable_code (id, code)
VALUES ('0ea5cfa4-4dbc-4f48-b857-58881f88591f', 'RES500');

INSERT INTO public.enrolable__enrolable_ects (id, ects)
VALUES ('0ea5cfa4-4dbc-4f48-b857-58881f88591f', 3);

INSERT INTO public.enrolable__course (id)
VALUES ('0ea5cfa4-4dbc-4f48-b857-58881f88591f');

-- Course: Phương Pháp Nghiên Cứu Kinh Thánh - Thạc Sĩ Thần Học
INSERT INTO public.enrolable__courses_programs (id, course_id, program_id)
VALUES ('b0752284-816c-4d57-b9ca-7196e8358f6f', '0ea5cfa4-4dbc-4f48-b857-58881f88591f', 'be738e71-0023-40f6-a3e4-7e2a5bde0a75');

-- Course: Phương Pháp Nghiên Cứu Kinh Thánh - Specialism: Thánh Kinh
INSERT INTO public.enrolable__courses_specialisms (id, course_id, specialism_id)
VALUES ('b0752284-816c-4d57-b9ca-7196e8358f6f', '0ea5cfa4-4dbc-4f48-b857-58881f88591f', '90205738-a4d5-4c9f-8cab-9b7a6b2da4ed');

-- Course: Phương Pháp Nghiên Cứu Kinh Thánh - Specialism: Thánh Kinh - Phase: Năm chuẩn bị
INSERT INTO public.enrolable__enrolable_phase_assignment (id, enrolable_id, phase_id)
VALUES ('6480da6d-16cb-439a-8807-bf1819710ca8', '0ea5cfa4-4dbc-4f48-b857-58881f88591f', 'c78693e8-2969-406d-952b-a977b7990a10');

-- Course: Thần Học Căn Bản
INSERT INTO public.enrolable__enrolable (id, type)
VALUES ('df210b85-1e31-4511-87d9-42d7879ba7b8', 'course');

INSERT INTO public.enrolable__enrolable_name (id, name)
VALUES ('df210b85-1e31-4511-87d9-42d7879ba7b8', 'Thần Học Căn Bản');

INSERT INTO public.enrolable__enrolable_code (id, code)
VALUES ('df210b85-1e31-4511-87d9-42d7879ba7b8', 'THF501');

INSERT INTO public.enrolable__enrolable_ects (id, ects)
VALUES ('df210b85-1e31-4511-87d9-42d7879ba7b8', 3);

INSERT INTO public.enrolable__course (id)
VALUES ('df210b85-1e31-4511-87d9-42d7879ba7b8');

-- Course: Thần Học Căn Bản - Thạc Sĩ Thần Học
INSERT INTO public.enrolable__courses_programs (id, course_id, program_id)
VALUES ('b268ecdd-ba0c-48f6-ad84-96cb6d8b7aa6', 'df210b85-1e31-4511-87d9-42d7879ba7b8', 'be738e71-0023-40f6-a3e4-7e2a5bde0a75');

-- Course: Thần Học Căn Bản - Tín Lý
INSERT INTO public.enrolable__courses_specialisms (id, course_id, specialism_id)
VALUES ('b268ecdd-ba0c-48f6-ad84-96cb6d8b7aa6', 'df210b85-1e31-4511-87d9-42d7879ba7b8', '4eb07b8e-33dc-4e15-85b5-b6024613df20');

-- Course: Thần Học Căn Bản - Specialism: Tín lý - Phase: Năm chuẩn bị
INSERT INTO public.enrolable__enrolable_phase_assignment (id, enrolable_id, phase_id)
VALUES ('7ad0cb46-1def-4a88-92b4-2b98bc3ec06d', 'df210b85-1e31-4511-87d9-42d7879ba7b8', 'c78693e8-2969-406d-952b-a977b7990a10');

-- Category: Môn học bắt buộc
INSERT INTO public.enrolable__category (id, name)
VALUES ('48dafd1d-239d-4289-b98a-6aad623b5295', 'Môn học bắt buộc');

-- Category: Môn học bắt buộc - Thần Học Căn Bản
INSERT INTO public.enrolable__enrolables_categories (id, category_id, enrolable_id)
VALUES ('67f031df-4247-48db-81c7-251fb3fefdd5', '48dafd1d-239d-4289-b98a-6aad623b5295', 'df210b85-1e31-4511-87d9-42d7879ba7b8');

-- Category: Môn học bắt buộc - Phương Pháp Nghiên Cứu Kinh Thánh
INSERT INTO public.enrolable__enrolables_categories (id, category_id, enrolable_id)
VALUES ('30b5fd14-a08b-4f84-85e3-6e157210895b', '48dafd1d-239d-4289-b98a-6aad623b5295', '0ea5cfa4-4dbc-4f48-b857-58881f88591f');

-- View
CREATE VIEW enrolable__enrolable_view AS
    SELECT enrolable__enrolable.id, code, name, ects, type
    FROM enrolable__enrolable
    LEFT JOIN enrolable__enrolable_code ON enrolable__enrolable.id = enrolable__enrolable_code.id
    LEFT JOIN enrolable__enrolable_name ON enrolable__enrolable.id = enrolable__enrolable_name.id
    LEFT JOIN enrolable__enrolable_ects ON enrolable__enrolable.id = enrolable__enrolable_ects.id;

CREATE VIEW enrolable__program_view AS
SELECT ep.id, code, name
FROM enrolable__program ep
         LEFT JOIN enrolable__enrolable_view ON ep.id = enrolable__enrolable_view.id
WHERE enrolable__enrolable_view.type = 'program';

CREATE VIEW enrolable__specialism_view AS
SELECT eps.id, epsc.code, epsn.name, program.id as program_id, program.code as program_code, program.name as program_name
FROM enrolable__program_specialism eps
         LEFT JOIN enrolable__program_specialism_code epsc on eps.id = epsc.id
         LEFT JOIN enrolable__program_specialism_name epsn on eps.id = epsn.id
         LEFT JOIN enrolable__program_view program on eps.program_id = program.id;

CREATE VIEW enrolable__course_view AS
SELECT course.id,
       course.code,
       course.name,
       course.ects,
       program.id              as program_id,
       program.code            as program_code,
       program.name            as program_name,
       eep.id                  as phase_id,
       eep.phase_name          as phase_name,
       eepl.level              as phase_level,
       enrolable__category.id   as category_id,
       enrolable__category.name as category_name
FROM enrolable__enrolable_view course
         LEFT JOIN enrolable__courses_programs ON course.id = enrolable__courses_programs.course_id
         LEFT JOIN enrolable__program_view program ON enrolable__courses_programs.program_id = program.id
         LEFT JOIN enrolable__enrolables_categories eec on course.id = eec.enrolable_id
         LEFT JOIN enrolable__category on eec.category_id = enrolable__category.id
         LEFT JOIN enrolable__enrolable_phase_assignment eepa on course.id = eepa.enrolable_id
         LEFT JOIN enrolable__enrolable_phase eep on eepa.phase_id = eep.id
         LEFT JOIN enrolable__enrolable_phase_level eepl on eep.id = eepl.id
WHERE course.type = 'course'
