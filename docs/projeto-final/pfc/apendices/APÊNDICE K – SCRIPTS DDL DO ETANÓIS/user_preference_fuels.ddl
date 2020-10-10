-- Table: public.UserPreferenceFuels

-- DROP TABLE public."UserPreferenceFuels";

CREATE TABLE public."UserPreferenceFuels"
(
    id integer NOT NULL DEFAULT nextval('"UserPreferenceFuels_id_seq"'::regclass),
    fuel character varying(255) COLLATE pg_catalog."default" NOT NULL,
    user_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    CONSTRAINT "UserPreferenceFuels_pkey" PRIMARY KEY (id),
    CONSTRAINT "UserPreferenceFuels_fuel_user_id_key" UNIQUE (fuel, user_id),
    CONSTRAINT "UserPreferenceFuels_user_id_fkey" FOREIGN KEY (user_id)
        REFERENCES public."Users" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."UserPreferenceFuels"
    OWNER to postgres;