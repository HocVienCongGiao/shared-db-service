CREATE TABLE IF NOT EXISTS public.student__person
(
    id                 UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.student__student_date_of_birth
(
    id                 UUID PRIMARY KEY REFERENCES student__person(id) ON DELETE CASCADE,
    date_of_birth      DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS public.student__student_place_of_birth
(
    id                 UUID PRIMARY KEY REFERENCES student__person(id) ON DELETE CASCADE,
    place_of_birth     VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.student__student_email
(
    id                 UUID PRIMARY KEY REFERENCES student__person(id) ON DELETE CASCADE,
    email              VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.student__student_phone
(
    id                 UUID PRIMARY KEY REFERENCES student__person(id) ON DELETE CASCADE,
    phone              VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS public.student__student_undergraduate_school_name
(
    id                 UUID PRIMARY KEY REFERENCES student__person(id) ON DELETE CASCADE,
    school_name        VARCHAR NOT NULL
);

-- Student: Nguyễn Hữu Chiến
INSERT INTO public.student__person (id)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283');

INSERT INTO public.student__student_date_of_birth (id, date_of_birth)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', '1983-05-16');

INSERT INTO public.student__student_place_of_birth (id, place_of_birth)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'Trà Vinh');

INSERT INTO public.student__student_email (id, email)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'binh@sunrise.vn');

INSERT INTO public.student__student_phone (id, phone)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', '+84 1228019700');

INSERT INTO public.student__student_undergraduate_school_name (id, school_name)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283', 'Đại Chủng Viện Thánh Quý - Cần Thơ');

-- View

CREATE VIEW student__student_view AS
    SELECT student.*,
    person__person_title.title,
    person__person_christian_name_view.saint_ids,
    person__person_christian_name_view.christian_name,

    person__person_first_name.first_name,
    person__person_middle_name.middle_name,
    person__person_last_name.last_name,
    student__student_date_of_birth.date_of_birth,
    student__student_place_of_birth.place_of_birth,
    student__student_email.email,
    student__student_phone.phone,
    student__student_undergraduate_school_name.school_name undergraduate_school_name,

    person__person_polity.polity_id,
    polity.name polity_name,
    polity.location_address polity_location_address,
    polity.location_name polity_location_name,
    polity.location_email polity_location_email
    FROM student__person student
    LEFT JOIN person__person_title ON student.id = person__person_title.id
    LEFT JOIN person__person_first_name ON student.id = person__person_first_name.id
    LEFT JOIN person__person_middle_name ON student.id = person__person_middle_name.id
    LEFT JOIN person__person_last_name ON student.id = person__person_last_name.id
    LEFT JOIN student__student_date_of_birth ON student.id = student__student_date_of_birth.id
    LEFT JOIN student__student_place_of_birth ON student.id = student__student_place_of_birth.id
    LEFT JOIN student__student_email ON student.id = student__student_email.id
    LEFT JOIN student__student_phone ON student.id = student__student_phone.id
    LEFT JOIN student__student_undergraduate_school_name ON student.id = student__student_undergraduate_school_name.id

    LEFT JOIN person__person_christian_name_view ON student.id = person__person_christian_name_view.person_id

    LEFT JOIN person__person_polity ON student.id = person__person_polity.id
    LEFT JOIN polity__polity_view polity ON person__person_polity.polity_id = polity.id
