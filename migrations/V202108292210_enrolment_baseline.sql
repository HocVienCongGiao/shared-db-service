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
    id                 UUID PRIMARY KEY,
    specialism_id      UUID NOT NULL REFERENCES enrolment__specialism(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__degree_specialism_specialism_id ON enrolment__degree_specialism (specialism_id);

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
    id                              UUID PRIMARY KEY,
    enrolable_course_id             UUID NOT NULL REFERENCES enrolable__course(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__course_enrolable_course_id ON enrolment__course_enrolable(enrolable_course_id);

CREATE TABLE IF NOT EXISTS public.enrolment__course_school_year
(
    id                 UUID PRIMARY KEY REFERENCES enrolment__course(id) ON DELETE CASCADE,
    school_year        SMALLINT NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__course_school_year_school_year ON enrolment__course_school_year(school_year);

CREATE TABLE IF NOT EXISTS public.enrolment__course_semester
(
    id                 UUID PRIMARY KEY REFERENCES enrolment__course(id) ON DELETE CASCADE,
    semester           SMALLINT NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__course_semester_semester ON enrolment__course_semester(semester);

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
INSERT INTO public.enrolment__program (id, code) VALUES ('ec645abf-bc55-413c-a4c7-c55ff701d080', 'STL-K1');

INSERT INTO public.enrolment__program_enrolable (id, enrolable_program_id) VALUES ('ec645abf-bc55-413c-a4c7-c55ff701d080', 'be738e71-0023-40f6-a3e4-7e2a5bde0a75');

-- Program: STL - Specialism: Tín Lý
INSERT INTO public.enrolment__specialism (id, program_id) VALUES ('d4643c5e-d0fb-4826-b6e9-c9217a682b11', 'ec645abf-bc55-413c-a4c7-c55ff701d080');
 