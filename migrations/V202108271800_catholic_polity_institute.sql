CREATE TABLE IF NOT EXISTS public.polity__institute
(
    id                            UUID PRIMARY KEY REFERENCES polity__polity(id)
);

-- Dong Thanh Gia
INSERT INTO public.polity__polity (id, type)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', 'institute');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', 'Dòng Thánh Gia');

INSERT INTO public.polity__polity_location_address (id, location_address)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', '603/47 Khóm Bình Đức 3, P. Bình Đức, Long Xuyên, An Giang');

INSERT INTO public.polity__polity_location_name (id, location_name)
VALUES ('1db3b426-83bf-4519-980c-964303c344e4', 'Dòng Thánh Gia Việt Nam');

INSERT INTO public.polity__polity_location_email (id, location_email)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'binh@sunrise.vn');

-- Dong Thanh The
INSERT INTO public.polity__polity (id, type)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'institute');

INSERT INTO public.polity__polity_name (id, name)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'Dòng Thánh Thể');

INSERT INTO public.polity__polity_location_address (id, location_address)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', '15b, đường 4, khu phố 4, phường Bình Chiểu, quận Thủ Đức, TPHCM');

INSERT INTO public.polity__polity_location_name (id, location_name)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'Dòng Thánh Thể Việt Nam');

INSERT INTO public.polity__polity_location_email (id, location_email)
VALUES ('36a7d729-9dd1-4e79-a73b-0329224ad6d4', 'peterbean410@gmail.com');
