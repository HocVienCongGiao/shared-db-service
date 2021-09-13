-- Program Specialism Instance
CREATE TABLE IF NOT EXISTS public.enrolment__specialism
(
    id                 UUID PRIMARY KEY,
    code               VARCHAR NOT NULL,
);

CREATE TABLE IF NOT EXISTS public.enrolment__specialism_enrolable
(
    id                           UUID PRIMARY KEY REFERENCES enrolment__specialism(id) ON DELETE CASCADE,
    enrolable_specialism_id      UUID NOT NULL REFERENCES course__program_specialism(id) ON DELETE CASCADE,
);

CREATE TABLE IF NOT EXISTS public.enrolment__specialism_progress
(
    id                      UUID PRIMARY KEY,
    specialism_id  UUID NOT NULL REFERENCES enrolment__specialism(id) ON DELETE CASCADE,
    level                   SMALLINT NOT NULL,
    UNIQUE (specialism_id, level)
);

CREATE TABLE IF NOT EXISTS public.enrolment__specialism_progress_school_year
(
    id                  UUID PRIMARY KEY REFERENCES enrolment__specialism_progress(id) ON DELETE CASCADE,
    school_year         SMALLINT NOT NULL
);

-- Course Instance
CREATE TABLE IF NOT EXISTS public.enrolment__course
(
    id                              UUID PRIMARY KEY,
    course_id                       UUID NOT NULL REFERENCES course__course(id) ON DELETE CASCADE,
    specialism_progress_id UUID NOT NULL REFERENCES enrolment__specialism_progress(id) ON DELETE CASCADE,
    UNIQUE (course_id, specialism_progress_id)
);

CREATE TABLE IF NOT EXISTS public.enrolment__course_school_year
(
    id                 UUID PRIMARY KEY REFERENCES enrolment__course(id) ON DELETE CASCADE,
    school_year        SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS public.enrolment__course_semester
(
    id                 UUID PRIMARY KEY REFERENCES enrolment__course(id) ON DELETE CASCADE,
    semester           SMALLINT NOT NULL
);

-- Student Enrolment
CREATE TABLE IF NOT EXISTS public.enrolment__students_specialisms
(
    id                      UUID PRIMARY KEY,
    student_id              UUID NOT NULL REFERENCES student__student(id) ON DELETE CASCADE,
    specialism_progress_id  UUID NOT NULL REFERENCES enrolment__specialism_progress(id) ON DELETE CASCADE,
    UNIQUE (student_id, specialism_progress_id)
);

CREATE TABLE IF NOT EXISTS public.enrolment__students_courses
(
    id                      UUID PRIMARY KEY,
    student_id              UUID NOT NULL REFERENCES student__student(id),
    course_id      UUID NOT NULL REFERENCES enrolment__course(id),
    UNIQUE (student_id, course_id)
);

-- Program: STL - Specialism: Tín Lý 
INSERT INTO public.enrolment__specialism (id, specialism_id, code)
VALUES ('118f832d-2f4a-4ab4-af3e-49bcbf14028f', '4eb07b8e-33dc-4e15-85b5-b6024613df20', 'STL-TL-K1');

-- Program: STL - Specialism: Tín Lý - Level: 1
INSERT INTO public.enrolment__specialism_progress (id, specialism_id, level)
VALUES ('c93d5c74-04d7-4607-b6bf-4f121065ae9e', '118f832d-2f4a-4ab4-af3e-49bcbf14028f', 1);

-- Program: STL - Specialism: Tín Lý - Level: 1 - SchoolYear: 2016
INSERT INTO public.enrolment__specialism_progress_school_year (id, school_year)
VALUES ('c93d5c74-04d7-4607-b6bf-4f121065ae9e', 2016);

-- Program: STL - Specialism: Tín Lý - Level: 1 - SchoolYear: 2016 - Student: Nguyễn Hữu Chiến
INSERT INTO public.enrolment__students_specialisms (id, student_id, specialism_progress_id)
VALUES ('7fdcd5d6-e952-4725-a64f-77d2803db352', '53f549b9-99bf-4e12-88e3-c2f868953283', 'c93d5c74-04d7-4607-b6bf-4f121065ae9e');

-- View
CREATE VIEW enrolment__student_specialism_enrolment_view AS
    SELECT ss.id student_specialism_id, ss.student_id, ss.specialism_progress_id progress_id, progress.level,
    course__enrolable_name.name  specialism_name,
    student.title as student_title,
    student.christian_name, student.first_name, student.middle_name, student.last_name,
    student.date_of_birth, student.place_of_birth, student.undergraduate_school_name, student.email, student.phone,
    student.polity_name, student.polity_location_name, student.polity_location_address, student.polity_location_email
    FROM enrolment__students_specialisms ss
    LEFT JOIN student__student_view student ON ss.student_id = student.id

    LEFT JOIN enrolment__specialism_progress progress ON ss.specialism_progress_id = progress.id
    LEFT JOIN enrolment__specialism specialism ON progress.specialism_id = specialism.id
    LEFT JOIN course__enrolable specialism ON  specialism.specialism_id = specialism.id
    LEFT JOIN course__enrolable_name ON specialism.id = course__enrolable_name.id;
