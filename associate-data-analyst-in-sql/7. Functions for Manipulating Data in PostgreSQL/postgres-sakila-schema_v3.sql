-- Tables

DROP TABLE IF EXISTS "actor";
CREATE TABLE actor (
    actor_id smallint,
    first_name character varying(45),
    last_name character varying(45),
    last_update timestamp);


DROP TABLE IF EXISTS "film";
CREATE TABLE film (
    film_id smallint,
    title character varying(255),
    description text,
    release_year SMALLINT,
    language_id smallint,
    original_language_id smallint,
    rental_duration smallint DEFAULT 3,
    rental_rate numeric(4,2) DEFAULT 4.99,
    length smallint,
    replacement_cost numeric(5,2) DEFAULT 19.99,
    rating character varying(6),
    last_update timestamp,
    special_features text);


DROP TABLE IF EXISTS "category";
CREATE TABLE category (
    category_id smallint,
    name character varying(25),
    last_update timestamp);


DROP TABLE IF EXISTS "film_actor";
CREATE TABLE film_actor (
    actor_id smallint,
    film_id smallint,
    last_update timestamp);


DROP TABLE IF EXISTS "film_category";
CREATE TABLE film_category (
    film_id smallint,
    category_id smallint,
    last_update timestamp);


DROP TABLE IF EXISTS "address";
CREATE TABLE address (
    address_id smallint,
    address character varying(50),
    address2 character varying(50),
    district character varying(20),
    city_id smallint,
    postal_code character varying(10),
    phone character varying(20),
    last_update timestamp);


DROP TABLE IF EXISTS "city";
CREATE TABLE city (
    city_id smallint,
    city character varying(50),
    country_id smallint,
    last_update timestamp);


DROP TABLE IF EXISTS "country";
CREATE TABLE country (
    country_id smallint,
    country character varying(50),
    last_update timestamp);


DROP TABLE IF EXISTS "customer";
CREATE TABLE customer (
    customer_id smallint,
    store_id smallint,
    first_name character varying(45),
    last_name character varying(45),
    email character varying(50),
    address_id smallint,
    activebool boolean DEFAULT true,
    create_date date DEFAULT ('now'::text)::date,
    last_update timestamp,
    active integer);


DROP TABLE IF EXISTS "inventory";
CREATE TABLE inventory (
    inventory_id smallint,
    film_id smallint,
    store_id smallint,
    last_update timestamp);


DROP TABLE IF EXISTS "language";
CREATE TABLE language (
    language_id smallint,
    name character(20),
    last_update timestamp);


DROP TABLE IF EXISTS "payment";
CREATE TABLE payment (
    payment_id smallint,
    customer_id smallint,
    staff_id smallint,
    rental_id integer,
    amount numeric(5,2),
    payment_date timestamp);


DROP TABLE IF EXISTS "rental";
CREATE TABLE rental (
    rental_id smallint,
    rental_date timestamp,
    inventory_id integer,
    customer_id smallint,
    return_date timestamp,
    staff_id smallint,
    last_update timestamp);


DROP TABLE IF EXISTS "staff";
CREATE TABLE staff (
    staff_id smallint,
    first_name character varying(45),
    last_name character varying(45),
    address_id smallint,
    email character varying(50),
    store_id smallint,
    active boolean DEFAULT true,
    username character varying(16),
    password character varying(40),
    last_update timestamp,
    picture bytea);


DROP TABLE IF EXISTS "store";
CREATE TABLE store (
    store_id smallint,
    manager_staff_id smallint,
    address_id smallint,
    last_update timestamp);
