-- Program Instance
CREATE TABLE IF NOT EXISTS public.enrolment__program
(
    id                 UUID PRIMARY KEY,
    code               VARCHAR NOT NULL
);

-- Program Specialism Instance
CREATE TABLE IF NOT EXISTS public.enrolment__specialism
(
    id                 UUID PRIMARY KEY,
    program_id         UUID NOT NULL REFERENCES enrolment__program(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__specialism_program_id ON enrolment__specialism (program_id);

-- Program enrolable
CREATE TABLE IF NOT EXISTS public.enrolment__program_enrolable
(
    id                           UUID PRIMARY KEY REFERENCES enrolment__program(id) ON DELETE CASCADE,
    enrolable_program_id         UUID NOT NULL REFERENCES enrolable__program (id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__program_enrolable_enrolable_program_id ON enrolment__program_enrolable(enrolable_program_id);

-- Specialism enrolable
CREATE TABLE IF NOT EXISTS public.enrolment__specialism_enrolable
(
    id                           UUID PRIMARY KEY REFERENCES enrolment__specialism(id) ON DELETE CASCADE,
    enrolable_specialism_id      UUID NOT NULL REFERENCES enrolable__program_specialism(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__specialism_enrolable_enrolable_specialism_id ON enrolment__specialism_enrolable(enrolable_specialism_id);

-- Program Degree
CREATE TABLE IF NOT EXISTS public.enrolment__degree
(
    id                 UUID PRIMARY KEY,
    program_id         UUID NOT NULL REFERENCES enrolment__program(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__degree_program_id ON enrolment__degree (program_id);

CREATE TABLE IF NOT EXISTS public.enrolment__degree_specialism
(
    id                 UUID PRIMARY KEY REFERENCES enrolment__degree (id) ON DELETE CASCADE,
    specialism_id      UUID NOT NULL REFERENCES enrolment__specialism(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__degree_specialism_specialism_id ON enrolment__degree_specialism (specialism_id);

CREATE TABLE IF NOT EXISTS public.enrolment__degree_code
(
    id                 UUID PRIMARY KEY REFERENCES enrolment__degree (id) ON DELETE CASCADE,
    code               VARCHAR NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__degree_specialism_code ON enrolment__degree_code(code);

-- Degree Progress
CREATE TABLE IF NOT EXISTS public.enrolment__degree_progress
(
    id                      UUID PRIMARY KEY,
    degree_id               UUID NOT NULL REFERENCES enrolment__degree(id) ON DELETE CASCADE,
    level                   SMALLINT NOT NULL,
    UNIQUE (degree_id, level)
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__degree_progress_degree_id ON enrolment__degree_progress(degree_id);

CREATE TABLE IF NOT EXISTS public.enrolment__degree_progress_school_year
(
    id                  UUID PRIMARY KEY REFERENCES enrolment__degree_progress(id) ON DELETE CASCADE,
    school_year         SMALLINT NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__degree_progress_school_year ON enrolment__degree_progress_school_year(school_year);

CREATE TABLE IF NOT EXISTS public.enrolment__degree_progress_semester
(
    id                  UUID PRIMARY KEY REFERENCES enrolment__degree_progress_school_year(id) ON DELETE CASCADE,
    semester            SMALLINT NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__degree_progress_semester ON enrolment__degree_progress_semester(semester);

-- Course Instance
CREATE TABLE IF NOT EXISTS public.enrolment__course
(
    id                          UUID PRIMARY KEY,
    degree_progress_id          UUID NOT NULL REFERENCES  enrolment__degree_progress(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__course_degree_progress_id ON enrolment__course(degree_progress_id);

-- Course enrolable
CREATE TABLE IF NOT EXISTS public.enrolment__course_enrolable
(
    id                              UUID PRIMARY KEY REFERENCES enrolment__course(id) ON DELETE CASCADE,
    enrolable_course_id             UUID NOT NULL REFERENCES enrolable__course(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__course_enrolable_course_id ON enrolment__course_enrolable(enrolable_course_id);

-- Student Enrolment
CREATE TABLE IF NOT EXISTS public.enrolment__students_progresses
(
    id                      UUID PRIMARY KEY,
    student_id              UUID NOT NULL REFERENCES student__student(id) ON DELETE CASCADE,
    degree_progress_id      UUID NOT NULL REFERENCES enrolment__degree_progress(id) ON DELETE CASCADE,
    UNIQUE (student_id, degree_progress_id)
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__students_progresses_student_id ON enrolment__students_progresses(student_id);
CREATE INDEX IF NOT EXISTS IDX_enrolment__students_progresses_specialism_progress_id ON enrolment__students_progresses(degree_progress_id);

CREATE TABLE IF NOT EXISTS public.enrolment__students_courses
(
    id                      UUID PRIMARY KEY,
    student_id              UUID NOT NULL REFERENCES student__student(id) ON DELETE CASCADE,
    course_id               UUID NOT NULL REFERENCES enrolment__course(id) ON DELETE CASCADE,
    UNIQUE (student_id, course_id)
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__students_courses ON enrolment__students_courses(student_id);
CREATE INDEX IF NOT EXISTS IDX_enrolment__students_courses ON enrolment__students_courses(course_id);


-- Program: STL
INSERT INTO public.enrolment__program (id, code)
VALUES ('ec645abf-bc55-413c-a4c7-c55ff701d080', 'STL-K1');

INSERT INTO public.enrolment__program_enrolable (id, enrolable_program_id)
VALUES ('ec645abf-bc55-413c-a4c7-c55ff701d080', 'be738e71-0023-40f6-a3e4-7e2a5bde0a75');

-- Program: STL - Specialism: Tín Lý
INSERT INTO public.enrolment__specialism (id, program_id)
VALUES ('d4643c5e-d0fb-4826-b6e9-c9217a682b11', 'ec645abf-bc55-413c-a4c7-c55ff701d080');

INSERT INTO public.enrolment__specialism_enrolable (id, enrolable_specialism_id)
VALUES ('d4643c5e-d0fb-4826-b6e9-c9217a682b11','4eb07b8e-33dc-4e15-85b5-b6024613df20');

-- Degree: STL
INSERT INTO public.enrolment__degree (id, program_id)
VALUES ('c2776d7b-213a-471a-8174-ccf04d550ac1', 'ec645abf-bc55-413c-a4c7-c55ff701d080');

-- Degree: STL - Specialism: Tín Lý
INSERT INTO public.enrolment__degree_specialism (id, specialism_id) VALUES ('c2776d7b-213a-471a-8174-ccf04d550ac1', 'd4643c5e-d0fb-4826-b6e9-c9217a682b11');


-- Degree: STL - Specialism: Tín Lý - Level: 1
INSERT INTO public.enrolment__degree_progress (id, degree_id, level)
VALUES ('58dc9f23-81f5-46d5-8026-bbc640f52a64', 'c2776d7b-213a-471a-8174-ccf04d550ac1', 1);

-- Degree: STL - Specialism: Tín Lý - Level: 1 - SchoolYear: 2016
INSERT INTO public.enrolment__degree_progress_school_year (id, school_year)
VALUES ('58dc9f23-81f5-46d5-8026-bbc640f52a64', 2016);

-- Degree: STL - Specialism: Tín Lý - Level: 1 - SchoolYear: 2016 - Semester: 1
INSERT INTO public.enrolment__degree_progress_semester (id, semester)
VALUES ('58dc9f23-81f5-46d5-8026-bbc640f52a64', 1);

-- Course: ... - Degree: STL - Specialism: Tín Lý - Level: 1 - SchoolYear: 2016 - Semester: 1
INSERT INTO public.enrolment__course (id, degree_progress_id)
VALUES ('31930404-7dee-456c-8bde-d4549d27b4d3', '58dc9f23-81f5-46d5-8026-bbc640f52a64');

-- Course: Thần Học Căn Bản - Catalog: Môn học bắt buộc - Degree: STL
INSERT INTO public.enrolment__course_enrolable(id, enrolable_course_id)
VALUES ('31930404-7dee-456c-8bde-d4549d27b4d3', '0ea5cfa4-4dbc-4f48-b857-58881f88591f');

-- TODO: khởi tạo enrolment mới
-- Course: Phương Pháp Nghiên Cứu Kinh Thánh
-- INSERT INTO public.enrolment__course_enrolable(id, enrolable_course_id)
-- VALUES ('', '0ea5cfa4-4dbc-4f48-b857-58881f88591f');

-- Degree: STL - Specialism: Tín Lý - Level: 1 - SchoolYear: 2016 - Student: Nguyễn Hữu Chiến
INSERT INTO public.enrolment__students_progresses (id, student_id, degree_progress_id)
VALUES ('2f9bd80a-2b68-4c30-9250-e847b13f2b32', '53f549b9-99bf-4e12-88e3-c2f868953283', '58dc9f23-81f5-46d5-8026-bbc640f52a64');

-- View
 CREATE VIEW enrolment__degree_view AS
     SELECT degree.id, degree.program_id AS program_id, es.id AS specialism_id, CONCAT(enrolable_name.name,' - ', psn.name) AS name,
            enrolable_program_id, enrolable_specialism_id
        FROM enrolment__degree degree
         LEFT JOIN enrolment__program_enrolable epe ON degree.program_id = epe.id
         LEFT JOIN enrolable__enrolable_name enrolable_name ON epe.enrolable_program_id = enrolable_name.id
         LEFT JOIN enrolment__degree_specialism eds ON degree.id = eds.id
         LEFT JOIN enrolment__specialism es ON eds.specialism_id = es.id
         LEFT JOIN enrolment__specialism_enrolable ese ON es.id = ese.id
         LEFT JOIN enrolable__program_specialism_name psn ON ese.enrolable_specialism_id = psn.id;

CREATE VIEW enrolment__student_degree_enrolment_view AS
     SELECT ss.id student_specialism_id, ss.student_id, ss.degree_progress_id progress_id, progress.level,
     degree.name degree_name, epsn.name specialism_name,
     student.title as student_title,
     student.christian_name, student.first_name, student.middle_name, student.last_name,
     student.date_of_birth, student.place_of_birth, student.undergraduate_school_name, student.email, student.phone,
     student.polity_name, student.polity_location_name, student.polity_location_address, student.polity_location_email
     FROM enrolment__students_progresses ss
     LEFT JOIN student__student_view student ON ss.student_id = student.id
     LEFT JOIN enrolment__degree_progress progress ON ss.degree_progress_id = progress.id
     LEFT JOIN enrolment__degree_view degree ON progress.degree_id = degree.id
     LEFT JOIN enrolment__specialism_enrolable specialism_enrolable ON degree.specialism_id = specialism_enrolable.id
     LEFT JOIN enrolable__program_specialism_name epsn ON specialism_enrolable.enrolable_specialism_id = epsn.id;
     