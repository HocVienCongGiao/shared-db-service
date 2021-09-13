-- Program Specialism Instance
CREATE TABLE IF NOT EXISTS public.enrolment__specialism
(
    id                 UUID PRIMARY KEY,
    code               VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.enrolment__specialism_enrolable
(
    id                           UUID PRIMARY KEY REFERENCES enrolment__specialism(id) ON DELETE CASCADE,
    enrolable_specialism_id      UUID NOT NULL REFERENCES enrolable__specialism(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__specialism_enrolable_enrolable_specialism_id ON enrolment__specialism_enrolable(enrolable_specialism_id);

CREATE TABLE IF NOT EXISTS public.enrolment__specialism_progress
(
    id                      UUID PRIMARY KEY,
    specialism_id           UUID NOT NULL REFERENCES enrolment__specialism(id) ON DELETE CASCADE,
    level                   SMALLINT NOT NULL,
    UNIQUE (specialism_id, level)
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__specialism_progress ON enrolment__specialism_progress(specialism_id);

CREATE TABLE IF NOT EXISTS public.enrolment__specialism_progress_school_year
(
    id                  UUID PRIMARY KEY REFERENCES enrolment__specialism_progress(id) ON DELETE CASCADE,
    school_year         SMALLINT NOT NULL
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__specialism_progress_school_year ON enrolment__specialism_progress_school_year(school_year);

-- Course Instance
CREATE TABLE IF NOT EXISTS public.enrolment__course
(
    id                              UUID PRIMARY KEY,
    specialism_progress_id          UUID NOT NULL REFERENCES  enrolment__specialism_progress(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__course_specialism_progress_id ON enrolment__course(specialism_progress_id);

CREATE TABLE IF NOT EXISTS public.enrolment__course_enrolable
(
    id                              UUID PRIMARY KEY,
    course_id                       UUID NOT NULL REFERENCES enrolable__course(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__course_enrolable_course_id ON enrolment__course_enrolable(course_id);

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
    specialism_progress_id  UUID NOT NULL REFERENCES enrolment__specialism_progress(id) ON DELETE CASCADE,
    UNIQUE (student_id, specialism_progress_id)
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__students_progresses_student_id ON enrolment__students_progresses(student_id);
CREATE INDEX IF NOT EXISTS IDX_enrolment__students_progresses_specialism_progress_id ON enrolment__students_progresses(specialism_progress_id);

CREATE TABLE IF NOT EXISTS public.enrolment__students_courses
(
    id                      UUID PRIMARY KEY,
    student_id              UUID NOT NULL REFERENCES student__student(id),
    course_id      UUID NOT NULL REFERENCES enrolment__course(id),
    UNIQUE (student_id, course_id)
);
CREATE INDEX IF NOT EXISTS IDX_enrolment__students_courses ON enrolment__students_courses(student_id);
CREATE INDEX IF NOT EXISTS IDX_enrolment__students_courses ON enrolment__students_courses(course_id);

-- Program: STL - Specialism: Tín Lý 
INSERT INTO public.enrolment__specialism (id, code)
VALUES ('118f832d-2f4a-4ab4-af3e-49bcbf14028f', 'STL-TL-K1');

INSERT INTO public.enrolment__specialism_enrolable(id, enrolable_specialism_id)
VALUES ('118f832d-2f4a-4ab4-af3e-49bcbf14028f', '4eb07b8e-33dc-4e15-85b5-b6024613df20');

-- Program: STL - Specialism: Tín Lý - Level: 1
INSERT INTO public.enrolment__specialism_progress (id, specialism_id, level)
VALUES ('c93d5c74-04d7-4607-b6bf-4f121065ae9e', '118f832d-2f4a-4ab4-af3e-49bcbf14028f', 1);

-- Program: STL - Specialism: Tín Lý - Level: 1 - SchoolYear: 2016
INSERT INTO public.enrolment__specialism_progress_school_year (id, school_year)
VALUES ('c93d5c74-04d7-4607-b6bf-4f121065ae9e', 2016);

-- Program: STL - Specialism: Tín Lý - Level: 1 - SchoolYear: 2016 - Student: Nguyễn Hữu Chiến
INSERT INTO public.enrolment__students_progresses (id, student_id, specialism_progress_id)
VALUES ('7fdcd5d6-e952-4725-a64f-77d2803db352', '53f549b9-99bf-4e12-88e3-c2f868953283', 'c93d5c74-04d7-4607-b6bf-4f121065ae9e');

-- View
CREATE VIEW enrolment__student_specialism_enrolment_view AS
    SELECT ss.id student_specialism_id, ss.student_id, ss.specialism_progress_id progress_id, progress.level,
    enrolable__enrolable_name.name  specialism_name,
    student.title as student_title,
    student.christian_name, student.first_name, student.middle_name, student.last_name,
    student.date_of_birth, student.place_of_birth, student.undergraduate_school_name, student.email, student.phone,
    student.polity_name, student.polity_location_name, student.polity_location_address, student.polity_location_email
    FROM enrolment__students_progresses ss
    LEFT JOIN student__student_view student ON ss.student_id = student.id

    LEFT JOIN enrolment__specialism_progress progress ON ss.specialism_progress_id = progress.id
    LEFT JOIN enrolment__specialism specialism ON progress.specialism_id = specialism.id
    LEFT JOIN enrolment__specialism_enrolable specialism_enrolable ON specialism.id = specialism_enrolable.id
    LEFT JOIN enrolable__enrolable enrolable ON  specialism_enrolable.enrolable_specialism_id = enrolable.id
    LEFT JOIN enrolable__enrolable_name ON enrolable.id = enrolable__enrolable_name.id;
