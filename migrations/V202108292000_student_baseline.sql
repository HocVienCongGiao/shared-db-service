 CREATE TABLE IF NOT EXISTS public.student__person
(
    id                 UUID PRIMARY KEY REFERENCES person__person(id) ON DELETE CASCADE
);

-- Student: Nguyễn Hữu Chiến
INSERT INTO public.student__person (id)
VALUES ('53f549b9-99bf-4e12-88e3-c2f868953283');

-- View
CREATE VIEW student__student_view AS
    SELECT student.id as student_id,
    person.title,
    person__person_christian_name_view.saint_ids,
    person__person_christian_name_view.christian_name,

    person.first_name,
    person.middle_name,
    person.last_name,
    person.date_of_birth,
    person.place_of_birth,
    person.email,
    person.phone,

    person__person_polity.polity_id,
    polity.name as polity_name,
    polity.location_address as polity_location_address,
    polity.location_name as polity_location_name,
    polity.location_email as polity_location_email
    FROM student__person student
    LEFT JOIN person__person_view person ON student.id = person.id


    LEFT JOIN person__person_christian_name_view ON student.id = person__person_christian_name_view.person_id

    LEFT JOIN person__person_polity ON student.id = person__person_polity.id
    LEFT JOIN polity__polity_view polity ON person__person_polity.polity_id = polity.id
