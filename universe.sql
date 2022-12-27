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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    type character varying(200) NOT NULL,
    distance_from_milky_way numeric(8,2),
    name character varying(200) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth_in_km numeric(4,2),
    planet_id integer,
    name character varying(200) NOT NULL
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
-- Name: noneed; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.noneed (
    noneed_id integer NOT NULL,
    name character varying(200) NOT NULL,
    empty integer NOT NULL
);


ALTER TABLE public.noneed OWNER TO freecodecamp;

--
-- Name: noneed_empty_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.noneed_empty_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.noneed_empty_seq OWNER TO freecodecamp;

--
-- Name: noneed_empty_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.noneed_empty_seq OWNED BY public.noneed.empty;


--
-- Name: noneed_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.noneed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.noneed_id_seq OWNER TO freecodecamp;

--
-- Name: noneed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.noneed_id_seq OWNED BY public.noneed.noneed_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    planet_type character varying(200) NOT NULL,
    distance_from_earth numeric(4,2) NOT NULL,
    star_id integer,
    name character varying(200) NOT NULL
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
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(4,2) NOT NULL,
    galaxy_id integer,
    name character varying(200) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: noneed noneed_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.noneed ALTER COLUMN noneed_id SET DEFAULT nextval('public.noneed_id_seq'::regclass);


--
-- Name: noneed empty; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.noneed ALTER COLUMN empty SET DEFAULT nextval('public.noneed_empty_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'desi', 32, 'none', 42.92, 'Milky way');
INSERT INTO public.galaxy VALUES (2, 'desi', 43, 'none', 42.92, 'sholay');
INSERT INTO public.galaxy VALUES (3, 'desi', 54, 'none', 42.92, 'dijango');
INSERT INTO public.galaxy VALUES (4, 'desi', 65, 'none', 42.92, 'pk');
INSERT INTO public.galaxy VALUES (5, 'desi', 76, 'none', 42.34, '3 idiots');
INSERT INTO public.galaxy VALUES (6, 'desi', 23, 'none', 43.54, 'hatim');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, true, 78, 18.41, 8, 'desi');
INSERT INTO public.moon VALUES (3, NULL, false, 21, 74.68, 5, 'dfds');
INSERT INTO public.moon VALUES (4, NULL, true, 92, 76.84, 12, 'dreqw');
INSERT INTO public.moon VALUES (6, NULL, true, 62, 76.18, 10, 'detri');
INSERT INTO public.moon VALUES (7, NULL, true, 8, 19.37, 6, 'destrew');
INSERT INTO public.moon VALUES (8, NULL, false, 44, 47.17, 12, 'desirewq');
INSERT INTO public.moon VALUES (10, NULL, true, 80, 87.28, 10, 'desire');
INSERT INTO public.moon VALUES (11, NULL, true, 74, 30.18, 4, 'desrewi');
INSERT INTO public.moon VALUES (12, NULL, true, 30, 56.15, 4, 'desinbv');
INSERT INTO public.moon VALUES (14, NULL, true, 1, 69.69, 3, 'desibv');
INSERT INTO public.moon VALUES (15, NULL, true, 93, 73.23, 10, 'desibbv');
INSERT INTO public.moon VALUES (16, NULL, true, 6, 47.68, 1, 'desmni');
INSERT INTO public.moon VALUES (18, NULL, true, 70, 47.88, 10, 'desiz');
INSERT INTO public.moon VALUES (19, NULL, false, 53, 58.13, 3, 'desai');
INSERT INTO public.moon VALUES (20, NULL, true, 66, 40.12, 12, 'desqi');
INSERT INTO public.moon VALUES (23, NULL, true, 48, 3.89, 13, 'jatt');
INSERT INTO public.moon VALUES (26, NULL, true, 43, 33.99, 12, 're');
INSERT INTO public.moon VALUES (127, NULL, false, 7, 33.26, 6, 'fsdafsdfsuyi');
INSERT INTO public.moon VALUES (42, NULL, false, 13, 97.25, 8, 'desuyi');
INSERT INTO public.moon VALUES (51, NULL, false, 23, 50.36, 10, 'desigsdf');


--
-- Data for Name: noneed; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.noneed VALUES (1, 'deis', 1);
INSERT INTO public.noneed VALUES (2, 'jatt', 2);
INSERT INTO public.noneed VALUES (3, 'fuck', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, NULL, true, 80, 'none', 0.00, 1, 'earth');
INSERT INTO public.planet VALUES (2, NULL, true, 91, 'none', 69.41, 2, 'venus');
INSERT INTO public.planet VALUES (3, NULL, true, 71, 'none', 5.81, 3, 'mongol');
INSERT INTO public.planet VALUES (4, NULL, false, 48, 'hot', 74.53, 4, 'moon');
INSERT INTO public.planet VALUES (5, NULL, true, 77, 'cold', 24.96, 5, 'sun');
INSERT INTO public.planet VALUES (6, NULL, false, 92, 'none', 53.53, 6, 'ploutoo');
INSERT INTO public.planet VALUES (8, NULL, true, 23, 'none', 73.53, 6, 'dewsi');
INSERT INTO public.planet VALUES (9, NULL, true, 81, 'none', 53.53, 6, 'desi');
INSERT INTO public.planet VALUES (10, NULL, false, 37, 'none', 23.53, 6, 'ao');
INSERT INTO public.planet VALUES (11, NULL, true, 48, 'none', 43.53, 6, 'o');
INSERT INTO public.planet VALUES (12, NULL, true, 50, 'none', 54.53, 6, 'poo');
INSERT INTO public.planet VALUES (13, NULL, true, 60, 'none', 43.21, 2, 'peo');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'none', true, 227, 39.02, 1, 'unknown');
INSERT INTO public.star VALUES (2, 'none', true, 464, 31.66, 2, 'unknown');
INSERT INTO public.star VALUES (3, 'none', true, 165, 97.56, 3, 'unknown');
INSERT INTO public.star VALUES (4, 'none', true, 351, 96.04, 4, 'unknown');
INSERT INTO public.star VALUES (5, 'none', true, 445, 24.49, 5, 'unknown');
INSERT INTO public.star VALUES (6, 'none', true, 151, 31.03, 6, 'unknown');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 127, true);


--
-- Name: noneed_empty_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.noneed_empty_seq', 3, true);


--
-- Name: noneed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.noneed_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: noneed noneed_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.noneed
    ADD CONSTRAINT noneed_name_key UNIQUE (name);


--
-- Name: noneed noneed_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.noneed
    ADD CONSTRAINT noneed_pkey PRIMARY KEY (noneed_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_uniqe; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_uniqe UNIQUE (distance_from_earth);


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

