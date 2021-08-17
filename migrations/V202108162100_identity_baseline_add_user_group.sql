CREATE TABLE IF NOT EXISTS public.identity__group
(
    id UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS public.identity__group_name
(
    id UUID PRIMARY KEY REFERENCES identity__group(id),
    group_name VARCHAR NOT NULL UNIQUE
    );

CREATE TABLE IF NOT EXISTS public.identity__user_group
(
    user_id UUID REFERENCES identity__user(id),
    group_id UUID REFERENCES identity__group(id)
    );

INSERT INTO public.identity__group (id)
VALUES ('d2d7b1e2-31d0-4e9d-b434-ce2f1035509d');
INSERT INTO public.identity__group_name(id, group_name)
VALUES ('d2d7b1e2-31d0-4e9d-b434-ce2f1035509d', 'AdminGroup');

INSERT INTO public.identity__group (id)
VALUES ('bc1a36eb-da8f-441b-92dc-823dfbb393c4');
INSERT INTO public.identity__group_name(id, group_name)
VALUES ('bc1a36eb-da8f-441b-92dc-823dfbb393c4', 'OperatorGroup');

INSERT INTO public.identity__group (id)
VALUES ('0266be52-2710-4622-bd45-7ccf7e8fa503');
INSERT INTO public.identity__group_name(id, group_name)
VALUES ('0266be52-2710-4622-bd45-7ccf7e8fa503', 'ProfessorGroup');

INSERT INTO public.identity__group (id)
VALUES ('828b522b-e749-461f-a667-16e98d103066');
INSERT INTO public.identity__group_name(id, group_name)
VALUES ('828b522b-e749-461f-a667-16e98d103066', 'StudentGroup');

INSERT INTO public.identity__user_group(user_id, group_id)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608','828b522b-e749-461f-a667-16e98d103066');

INSERT INTO public.identity__user_group(user_id, group_id)
VALUES ('40e6215d-b5c6-4896-987c-f30f3678f608','0266be52-2710-4622-bd45-7ccf7e8fa503');

DROP VIEW IF EXISTS identity__group_view;
CREATE VIEW identity__group_view AS
SELECT identity__group.id, group_name
FROM identity__group
         LEFT JOIN identity__group_name
                   ON identity__group.id = identity__group_name.id;