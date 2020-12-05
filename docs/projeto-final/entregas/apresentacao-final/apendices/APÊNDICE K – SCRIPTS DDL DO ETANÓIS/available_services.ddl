-- Table: public.AvailableServices

-- DROP TABLE public."AvailableServices";

CREATE TABLE public."AvailableServices"
(
    id integer NOT NULL DEFAULT nextval('"AvailableServices_id_seq"'::regclass),
    service_type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    fuel_station_id integer NOT NULL,
    time_to_open time without time zone,
    time_to_close time without time zone,
    service_24_hours boolean NOT NULL DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    CONSTRAINT "AvailableServices_pkey" PRIMARY KEY (id),
    CONSTRAINT "AvailableServices_service_type_fuel_station_id_key" UNIQUE (service_type, fuel_station_id),
    CONSTRAINT "AvailableServices_fuel_station_id_fkey" FOREIGN KEY (fuel_station_id)
        REFERENCES public."FuelStations" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."AvailableServices"
    OWNER to postgres;