-- Program Specialism Instance
CREATE TABLE IF NOT EXISTS public.enrolment__specialism_instance
(
    id                 UUID PRIMARY KEY,
    specialism_id      UUID NOT NULL REFERENCES course__program_specialism(id),
    code               VARCHAR NOT NULL
    UNIQUE (specialism_id, code)
);

CREATE TABLE IF NOT EXISTS public.enrolment__specialism_instance_progress
(
    id                      UUID PRIMARY KEY,
    specialism_instance_id  UUID NOT NULL REFERENCES enrolment__specialism_instance(id),
    level                   SMALLINT NOT NULL,
    UNIQUE (specialism_instance_id, level)
);

CREATE TABLE IF NOT EXISTS public.enrolment__specialism_instance_progress_school_year
(
    id                  UUID PRIMARY KEY REFERENCES enrolment__specialism_instance_progress(id),
    school_year         SMALLINT NOT NULL
);

-- Course Instance
CREATE TABLE IF NOT EXISTS public.enrolment__course_instance
(
    id                      UUID PRIMARY KEY,
    course_id               UUID NOT NULL REFERENCES course__course(id),
    specialism_instance_id  UUID PRIMARY KEY REFERENCES enrolment__specialism_instance(id),
    UNIQUE (course_id, specialism_instance_id)
);

CREATE TABLE IF NOT EXISTS public.enrolment__course_instance_school_year
(
    id                 UUID PRIMARY KEY REFERENCES enrolment__course_instance(id),
    school_year        SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS public.enrolment__course_instance_semester
(
    id                 UUID PRIMARY KEY REFERENCES enrolment__course_instance(id),
    semester           SMALLINT NOT NULL
);

-- Student Enrolment
CREATE TABLE IF NOT EXISTS public.enrolment__student_specialism
(
    id                      UUID PRIMARY KEY,
    student_id              UUID NOT NULL REFERENCES student__student(id),
    specialism_instance_id  UUID NOT NULL REFERENCES enrolment__specialism_instance(id),
    UNIQUE (student_id, specialism_instance_id)
);

CREATE TABLE IF NOT EXISTS public.enrolment__student_course
(
    id                      UUID PRIMARY KEY,
    student_id              UUID NOT NULL REFERENCES student__student(id),
    course_instance_id      UUID NOT NULL REFERENCES enrolment__course_instance(id),
    UNIQUE (student_id, course_instance_id)
);

-- Student: Nguyễn Hữu Chiến - Program: STL - Specialism: Tín Lý - Level 0 - SchoolYear: 2016
INSERT INTO public.student__student (id)
VALUES ('b02582cd-7440-47c8-838a-93b7ad19da4e');

INSERT INTO public.enrolment__specialism_instance (id, specialism_id, code)
VALUES ('118f832d-2f4a-4ab4-af3e-49bcbf14028f', '4eb07b8e-33dc-4e15-85b5-b6024613df20', 'STL-TL-K1');

INSERT INTO public.enrolment__specialism_instance_progress (id, specialism_instance_id, level)
VALUES ('c93d5c74-04d7-4607-b6bf-4f121065ae9e', '118f832d-2f4a-4ab4-af3e-49bcbf14028f', 0);

INSERT INTO public.enrolment__specialism_instance_progress_school_year (id, school_year)
VALUES ('c93d5c74-04d7-4607-b6bf-4f121065ae9e', 2016);

INSERT INTO public.enrolment__student_specialism (id, student_id, specialism_instance_id)
VALUES ('c93d5c74-04d7-4607-b6bf-4f121065ae9e', 2016);

