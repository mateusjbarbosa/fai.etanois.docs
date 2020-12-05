-- Table: public.FuelStations

-- DROP TABLE public."FuelStations";

CREATE TABLE public."FuelStations"
(
    id integer NOT NULL DEFAULT nextval('"FuelStations_id_seq"'::regclass),
    cnpj character varying(18) COLLATE pg_catalog."default" NOT NULL,
    phone_number character varying(11) COLLATE pg_catalog."default",
    user_id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    street_number character varying(10) COLLATE pg_catalog."default" NOT NULL,
    street character varying(100) COLLATE pg_catalog."default" NOT NULL,
    neighborhood character varying(100) COLLATE pg_catalog."default" NOT NULL,
    city character varying(100) COLLATE pg_catalog."default" NOT NULL,
    state character varying(100) COLLATE pg_catalog."default" NOT NULL,
    cep character varying(8) COLLATE pg_catalog."default" NOT NULL,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    flag_of_fuel_station character varying(255) COLLATE pg_catalog."default" NOT NULL DEFAULT 'branca'::character varying,
    restaurant boolean NOT NULL DEFAULT false,
    car_wash boolean NOT NULL DEFAULT false,
    mechanical boolean NOT NULL DEFAULT false,
    time_to_open time without time zone NOT NULL,
    time_to_close time without time zone NOT NULL,
    activate boolean NOT NULL DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    CONSTRAINT "FuelStations_pkey" PRIMARY KEY (id),
    CONSTRAINT "FuelStations_cnpj_key" UNIQUE (cnpj),
    CONSTRAINT "FuelStations_phone_number_key" UNIQUE (phone_number),
    CONSTRAINT "FuelStations_user_id_fkey" FOREIGN KEY (user_id)
        REFERENCES public."Users" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."FuelStations"
    OWNER to postgres;