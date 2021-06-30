CREATE TABLE IF NOT EXISTS public.user
(
    id       uuid        NOT NULL PRIMARY KEY,
    username varchar(50) NOT NULL,
    email    varchar(50),
    phone    varchar(50),
    password varchar (50)
    enabled  bool default false
    );

CREATE UNIQUE index user_id_uindex
    ON public.user (id);