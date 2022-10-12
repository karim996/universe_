--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: additional_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.additional_table (
    additional_table_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_good boolean,
    is_bad boolean NOT NULL,
    add_frr character varying(30)
);


ALTER TABLE public.additional_table OWNER TO freecodecamp;

--
-- Name: additional_table_add_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.additional_table_add_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.additional_table_add_id_seq OWNER TO freecodecamp;

--
-- Name: additional_table_add_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.additional_table_add_id_seq OWNED BY public.additional_table.additional_table_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    planet_types integer,
    galaxy_types integer NOT NULL,
    distance_from_earth numeric(4,1) NOT NULL,
    name character varying(50)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    moon_types integer,
    galaxy_types integer NOT NULL,
    distance_from_earth numeric(4,1) NOT NULL,
    planet_id integer,
    name character varying(50)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    planet_types integer,
    galaxy_types integer,
    distance_from_earth numeric(4,1) NOT NULL,
    star_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    planet_types integer,
    galaxy_types integer,
    distance_from_earth numeric(4,1) NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: additional_table additional_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table ALTER COLUMN additional_table_id SET DEFAULT nextval('public.additional_table_add_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: additional_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.additional_table VALUES (1, 'srr', true, false, '0');
INSERT INTO public.additional_table VALUES (2, 'krr', false, true, '1');
INSERT INTO public.additional_table VALUES (3, 'prr', true, false, '2');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'this galaxy is awesome', true, false, 0, 0, 65.3, 'galaxy_1');
INSERT INTO public.galaxy VALUES (6, 'this galaxy is good', true, false, 1, 0, 120.3, 'galaxy_2');
INSERT INTO public.galaxy VALUES (7, 'this galaxy is bad', false, false, 4, 1, 150.0, 'galaxy_3');
INSERT INTO public.galaxy VALUES (8, 'this galaxy is not bad', true, true, 2, 1, 300.0, 'galaxy_4');
INSERT INTO public.galaxy VALUES (9, 'this is rick galaxy', true, false, 3, 0, 500.0, 'galaxy_5');
INSERT INTO public.galaxy VALUES (10, 'this is morty galaxy', false, true, 5, 1, 50.0, 'galaxy_6');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'this is moon 1', false, false, 0, 0, 300.0, 1, 'moon_1');
INSERT INTO public.moon VALUES (3, 'this is moon 2', false, false, 1, 0, 300.0, 1, 'moon_2');
INSERT INTO public.moon VALUES (4, 'this is moon 3', false, false, 2, 0, 300.0, 1, 'moon_3');
INSERT INTO public.moon VALUES (5, 'this is moon 4', false, false, 3, 0, 30.0, 1, 'moon_4');
INSERT INTO public.moon VALUES (6, 'this is moon 5', false, false, 4, 0, 30.0, 1, 'moon_5');
INSERT INTO public.moon VALUES (7, 'this is moon 6', false, false, 5, 0, 30.0, 1, 'moon_6');
INSERT INTO public.moon VALUES (8, 'this is moon 7', false, false, 6, 0, 20.0, 1, 'moon_7');
INSERT INTO public.moon VALUES (9, 'this is moon 8', false, false, 7, 0, 200.0, 1, 'moon_8');
INSERT INTO public.moon VALUES (10, 'this is moon 9', false, false, 8, 0, 200.0, 1, 'moon_9');
INSERT INTO public.moon VALUES (11, 'this is moon 10', false, false, 9, 0, 200.0, 1, 'moon_10');
INSERT INTO public.moon VALUES (12, 'this is moon 11', false, false, 10, 0, 20.1, 2, 'moon_11');
INSERT INTO public.moon VALUES (13, 'this is moon 12', false, false, 11, 0, 65.1, 5, 'moon_12');
INSERT INTO public.moon VALUES (14, 'this is moon 13', false, false, 12, 0, 12.1, 8, 'moon_13');
INSERT INTO public.moon VALUES (15, 'this is moon 14', false, false, 13, 0, 120.1, 6, 'moon_14');
INSERT INTO public.moon VALUES (16, 'this is moon 15', false, false, 14, 0, 116.1, 4, 'moon_15');
INSERT INTO public.moon VALUES (17, 'this is moon 16', false, false, 15, 0, 103.2, 4, 'moon_16');
INSERT INTO public.moon VALUES (18, 'this is moon 17', false, false, 16, 0, 103.2, 4, 'moon_17');
INSERT INTO public.moon VALUES (19, 'this is moon 18', false, false, 17, 0, 311.6, 10, 'moon_18');
INSERT INTO public.moon VALUES (20, 'this is moon 19', false, false, 18, 0, 320.6, 10, 'moon_19');
INSERT INTO public.moon VALUES (21, 'this is moon 20', false, false, 19, 0, 512.6, 11, 'moon_20');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'this is planet earth', true, true, 0, 1, 0.0, 1, 'earth');
INSERT INTO public.planet VALUES (2, 'this is planet mars', true, false, 1, 0, 10.0, 1, 'mars');
INSERT INTO public.planet VALUES (3, 'this is planet venus', true, false, 2, 0, 12.0, 1, 'venus');
INSERT INTO public.planet VALUES (4, 'this is planet uranus', true, false, 3, 0, 14.5, 1, 'uranus');
INSERT INTO public.planet VALUES (5, 'this is planet mercury', true, false, 4, 0, 15.2, 1, 'mercury');
INSERT INTO public.planet VALUES (6, 'this is planet orgon', true, true, 5, 1, 112.1, 3, 'orgon');
INSERT INTO public.planet VALUES (7, 'this is planet zodox', true, true, 6, 1, 218.1, 4, 'zodox');
INSERT INTO public.planet VALUES (8, 'this is planet weed', false, false, 7, 0, 69.1, 3, 'weed');
INSERT INTO public.planet VALUES (9, 'this is planet horny', true, true, 8, 1, 540.0, 4, 'horny');
INSERT INTO public.planet VALUES (10, 'this is planet zomoroda', true, false, 9, 0, 25.0, 6, 'zomoroda');
INSERT INTO public.planet VALUES (11, 'this planet riada', false, true, 10, 1, 32.1, 5, 'riada');
INSERT INTO public.planet VALUES (12, 'this is planet comidia', false, false, 11, 0, 25.1, 5, 'comidia');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'this is star 1', true, false, 0, 1, 20.3, 1, 'star_1');
INSERT INTO public.star VALUES (2, 'this is star 2', true, true, 1, 0, 30.5, 6, 'star_2');
INSERT INTO public.star VALUES (3, 'this is star 3', false, false, 2, 1, 100.1, 7, 'star_3');
INSERT INTO public.star VALUES (4, 'this is star 4', true, false, 3, 1, 201.3, 7, 'star_4');
INSERT INTO public.star VALUES (5, 'this is star 5', true, false, 4, 0, 30.5, 7, 'star_5');
INSERT INTO public.star VALUES (6, 'this is star 6', false, false, 5, 1, 69.1, 9, 'star_6');


--
-- Name: additional_table_add_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.additional_table_add_id_seq', 33, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: additional_table additional_table_add_frr_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table
    ADD CONSTRAINT additional_table_add_frr_key UNIQUE (add_frr);


--
-- Name: additional_table additional_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table
    ADD CONSTRAINT additional_table_pkey PRIMARY KEY (additional_table_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_planet_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_planet_types_key UNIQUE (planet_types);


--
-- Name: moon moon_moon_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_types_key UNIQUE (moon_types);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_key UNIQUE (planet_types);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_planet_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_types_key UNIQUE (planet_types);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

