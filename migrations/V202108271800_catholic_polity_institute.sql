CREATE TABLE IF NOT EXISTS public.polity__institute
(
    id                            UUID PRIMARY KEY REFERENCES polity__polity(id)
);