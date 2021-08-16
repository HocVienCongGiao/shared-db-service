CREATE TABLE IF NOT EXISTS public.identity__user_group
(
    id UUID PRIMARY KEY REFERENCES identity__user(id),
    "group" VARCHAR NOT NULL
    );
INSERT INTO public.identity__user_group (id, "group")
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', 'AdminGroup');

DROP VIEW identity__user_view;
CREATE VIEW identity__user_view AS
SELECT identity__user.id, username, email, phone, enabled
FROM identity__user
         LEFT JOIN identity__user_username
                   ON identity__user.id = identity__user_username.id
         LEFT JOIN identity__user_email
                   ON identity__user.id = identity__user_email.id
         LEFT JOIN identity__user_phone
                   ON identity__user.id = identity__user_phone.id
         LEFT JOIN identity__user_enabled
                   ON identity__user.id = identity__user_enabled.id
         LEFT JOIN identity__user_group
                   ON identity__user.id = identity__user_group.id