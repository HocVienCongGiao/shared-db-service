CREATE TABLE IF NOT EXISTS public.teacher__teacher
(
    id        UUID PRIMARY KEY,
    person_id UUID REFERENCES person__person (id) ON DELETE CASCADE
);

INSERT INTO public.teacher__teacher (id, person_id)
VALUES ('1f21cfab-7850-452a-b871-3d1a875e6766', '938c9343-2f5e-4517-8d2e-8f251403d350');


-- View
CREATE VIEW teacher__teacher_view AS
    SELECT teacher.*,
    person__person_title.title,
    person__person_christian_name_view.saint_ids,
    person__person_christian_name_view.christian_name,

    person__person_first_name.first_name,
    person__person_middle_name.middle_name,
    person__person_last_name.last_name,
    person__person_polity.polity_id,
    polity.name polity_name,
    polity.location_address polity_location_address,
    polity.location_name polity_location_name,
    polity.location_email polity_location_email
    FROM teacher__teacher teacher
    LEFT JOIN person__person_title ON teacher.id = person__person_title.id
    LEFT JOIN person__person_first_name ON teacher.id = person__person_first_name.id
    LEFT JOIN person__person_middle_name ON teacher.id = person__person_middle_name.id
    LEFT JOIN person__person_last_name ON teacher.id = person__person_last_name.id
    LEFT JOIN person__person_christian_name_view ON teacher.id = person__person_christian_name_view.person_id

    LEFT JOIN person__person_polity ON teacher.id = person__person_polity.id
    LEFT JOIN polity__polity_view polity ON person__person_polity.polity_id = polity.id
