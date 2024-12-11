-- Table: public.movies_analytics_final

-- DROP TABLE IF EXISTS public.movies_analytics_final;

CREATE TABLE IF NOT EXISTS public.movies_analytics_final
(
    id bigint,
    title text COLLATE pg_catalog."default",
    status text COLLATE pg_catalog."default",
    release_date timestamp without time zone,
    revenue numeric,
    runtime bigint,
    adult boolean,
    budget numeric,
    tconst text COLLATE pg_catalog."default",
    original_language text COLLATE pg_catalog."default",
    original_title text COLLATE pg_catalog."default",
    poster_path text COLLATE pg_catalog."default",
    tagline text COLLATE pg_catalog."default",
    genres text COLLATE pg_catalog."default",
    production_companies text COLLATE pg_catalog."default",
    production_countries text COLLATE pg_catalog."default",
    spoken_languages text COLLATE pg_catalog."default",
    keywords text COLLATE pg_catalog."default",
    directors text COLLATE pg_catalog."default",
    writers text COLLATE pg_catalog."default",
    average_rating double precision,
    num_votes bigint,
    main_genre text COLLATE pg_catalog."default",
    main_production_company text COLLATE pg_catalog."default",
    main_production_country text COLLATE pg_catalog."default",
    main_spoken_language text COLLATE pg_catalog."default",
    main_director text COLLATE pg_catalog."default",
    main_writer text COLLATE pg_catalog."default",
    revenue_millions numeric,
    budget_millions numeric,
    net_revenue_millions numeric,
    budget_to_revenue_ratio numeric
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.movies_analytics_final
    OWNER to postgres;