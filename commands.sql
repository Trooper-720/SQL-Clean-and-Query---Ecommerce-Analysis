--Local Database used is PostgreSQL
--All commands are executed in pgAdmin 4 

--Create DB for CSV data

CREATE DATABASE olist_brazilian_ecom_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


----------------Create TABLES for DATA and Import data into TABLES----------------
-- Table: public.customer_data
-- DROP TABLE IF EXISTS public.customer_data;
CREATE TABLE IF NOT EXISTS public.customer_data
(
    customer_unique_id uuid NOT NULL,
    customer_id uuid NOT NULL,
    customer_zip_code_prefix integer NOT NULL,
    customer_city character varying(32) COLLATE pg_catalog."default",
    customer_state character varying(2) COLLATE pg_catalog."default",
    CONSTRAINT customers_data_pkey PRIMARY KEY (customer_unique_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customer_data
    OWNER to postgres;


-- Table: public.geolocation_data
-- DROP TABLE IF EXISTS public.geolocation_data;
CREATE TABLE IF NOT EXISTS public.geolocation_data
(
    geolocation_zip_code_prefix integer NOT NULL,
    geolocation_lat real NOT NULL,
    geolocation_lng real NOT NULL,
    geolocation_city character varying(128) COLLATE pg_catalog."default" NOT NULL,
    geolocation_state character varying(2) COLLATE pg_catalog."default" NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.geolocation_data
    OWNER to postgres;


-- Table: public.order_item_data
-- DROP TABLE IF EXISTS public.order_item_data;
CREATE TABLE IF NOT EXISTS public.order_item_data
(
    order_item_id integer NOT NULL,
    product_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    seller_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    shipping_limit_date timestamp without time zone NOT NULL,
    price real NOT NULL,
    freight_value real NOT NULL,
    order_id character varying(32) COLLATE pg_catalog."default" NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.order_item_data
    OWNER to postgres;