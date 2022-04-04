 CREATE TABLE IF NOT EXISTS public.student__student
(
    id                 UUID PRIMARY KEY,
    person_id          UUID NOT NULL REFERENCES person__person(id) ON DELETE CASCADE
);

-- Student: Nguyễn Hữu Chiến
INSERT INTO public.student__student (id, person_id)
VALUES ('ccb45678-69bb-4b54-9f09-3c8ab3c30999', '53f549b9-99bf-4e12-88e3-c2f868953283');

-- View
CREATE VIEW student__student_view AS
    SELECT student.id as student_id,
    person.title,
    christian_name.saint_ids,
    christian_name.christian_name,
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
    FROM student__student student
    LEFT JOIN person__person_view person ON student.person_id = person.id
    LEFT JOIN person__person_christian_name_view as christian_name ON student.person_id = christian_name.person_id
    LEFT JOIN person__person_polity ON student.person_id = person__person_polity.id
    LEFT JOIN polity__polity_view polity ON person__person_polity.polity_id = polity.id
