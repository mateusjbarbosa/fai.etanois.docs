-- Table: public.AvailableFuels

-- DROP TABLE public."AvailableFuels";

CREATE TABLE public."AvailableFuels"
(
    id integer NOT NULL DEFAULT nextval('"AvailableFuels_id_seq"'::regclass),
    fuel character varying(255) COLLATE pg_catalog."default" NOT NULL,
    fuel_station_id integer NOT NULL,
    price double precision NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    CONSTRAINT "AvailableFuels_pkey" PRIMARY KEY (id),
    CONSTRAINT "AvailableFuels_fuel_fuel_station_id_key" UNIQUE (fuel, fuel_station_id),
    CONSTRAINT "AvailableFuels_fuel_station_id_fkey" FOREIGN KEY (fuel_station_id)
        REFERENCES public."FuelStations" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."AvailableFuels"
    OWNER to postgres;