CREATE TABLE IF NOT EXISTS public.user__user
(
    id UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS public.user__user_username
(
    id UUID PRIMARY KEY REFERENCES user__user(id),
    username VARCHAR NOT NULL UNIQUE
);

CREATE
UNIQUE INDEX IDX_user__user_username 
ON user__user_username(username);

CREATE TABLE IF NOT EXISTS public.user__user_email
(
    id UUID PRIMARY KEY REFERENCES user__user(id),
    email VARCHAR NOT NULL
);

CREATE
UNIQUE INDEX IDX_user__user_email 
ON user__user_email(email);

CREATE TABLE IF NOT EXISTS public.user__user_phone
(
    id UUID PRIMARY KEY REFERENCES user__user(id),
    phone VARCHAR
);

CREATE
UNIQUE INDEX IDX_user__user_phone 
ON user__user_phone(phone);

CREATE TABLE IF NOT EXISTS public.user__user_password
(
    id UUID PRIMARY KEY REFERENCES user__user(id),
    password VARCHAR
);

CREATE TABLE IF NOT EXISTS public.user__user_enabled
(
    id UUID PRIMARY KEY REFERENCES user__user(id),
    enabled bool default false
);

INSERT INTO public.user__user (id)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608');

INSERT INTO public.user__user_username (id, username)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', 'hvcg_dev');

INSERT INTO public.user__user_email (id, email)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', 'hvcg_dev@gmail.com');

INSERT INTO public.user__user_phone (id, phone)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', '0909683979');

INSERT INTO public.user__user_password (id, password)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', 'dummy_password');

INSERT INTO public.user__user_enabled (id, enabled)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608', true);

CREATE VIEW user__user_view AS
SELECT user__user.id, username, email, phone, password, enabled
FROM user__user
         LEFT JOIN user__user_username
                   ON user__user.id = user__user_username.id
         LEFT JOIN user__user_email
                   ON user__user.id = user__user_email.id
         LEFT JOIN user__user_phone
                   ON user__user.id = user__user_phone.id
         LEFT JOIN user__user_password
                   ON user__user.id = user__user_password.id
         LEFT JOIN user__user_enabled
                   ON user__user.id = user__user_enabled.id