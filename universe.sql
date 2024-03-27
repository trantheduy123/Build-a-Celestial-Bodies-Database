--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km numeric NOT NULL,
    distance_from_sun_km numeric NOT NULL,
    description text,
    has_tail boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    distance_from_earth numeric,
    galaxy_type text,
    number_of_stars integer NOT NULL,
    has_black_hole boolean
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
    name character varying(100) NOT NULL,
    diameter_km numeric NOT NULL,
    distance_from_planet_km numeric NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    planet_id integer
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
    name character varying(100) NOT NULL,
    diameter_km numeric NOT NULL,
    distance_from_star_km numeric NOT NULL,
    is_spherical boolean NOT NULL,
    planet_type text,
    age_in_millions_of_years integer,
    star_id integer,
    has_water boolean NOT NULL
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
    name character varying(100) NOT NULL,
    luminosity numeric NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean,
    galaxy_id integer,
    distance_from_galaxy numeric NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 11, 35.1, 'Periodic comet visible from Earth every 75-76 years', true);
INSERT INTO public.comet VALUES (2, 'Comet Hyakutake', 30, 165.3, 'Bright comet observed in 1996', true);
INSERT INTO public.comet VALUES (3, 'Comet Hale-Bopp', 60, 217.2, 'One of the brightest comets of the 20th century', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy containing our solar system', 100000, 'Spiral', 200, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy to the Milky Way', 250000, 'Spiral', 300, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy in the local group', 300000, 'Spiral', 50, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Giant elliptical galaxy in the Virgo cluster', 550000, 'Elliptical', 1000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Sombrero-shaped galaxy', 600000, 'Spiral', 150, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Interacting spiral galaxy with a visible companion', 200000, 'Spiral', 80, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, 384400, 'Earth''s natural satellite', false, true, 4500, 1);
INSERT INTO public.moon VALUES (59, 'Moon1', 500, 10000, NULL, false, true, 4500, 1);
INSERT INTO public.moon VALUES (60, 'Moon2', 600, 12000, NULL, true, true, 4600, 2);
INSERT INTO public.moon VALUES (61, 'Moon3', 700, 14000, NULL, false, false, 4700, 3);
INSERT INTO public.moon VALUES (62, 'Moon4', 800, 16000, NULL, true, true, 4800, 4);
INSERT INTO public.moon VALUES (63, 'Moon5', 900, 18000, NULL, false, false, 4900, 5);
INSERT INTO public.moon VALUES (86, 'Moon6', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (87, 'Moon7', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (88, 'Moon8', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (89, 'Moon9', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (90, 'Moon10', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (91, 'Moon11', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (92, 'Moon12', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (93, 'Moon13', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (94, 'Moon14', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (95, 'Moon15', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (96, 'Moon16', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (97, 'Moon17', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (98, 'Moon18', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (99, 'Moon20', 1000, 20000, NULL, true, true, 5000, 1);
INSERT INTO public.moon VALUES (100, 'Moon21', 1000, 20000, NULL, true, true, 5000, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742, 149.6, true, 'Terrestrial', 4500, 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', 6792, 227.9, true, 'Terrestrial', 4000, 1, false);
INSERT INTO public.planet VALUES (3, 'Venus', 12104, 108.2, true, 'Terrestrial', 5000, 1, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 139822, 778.6, false, 'Gas Giant', 4500, 1, false);
INSERT INTO public.planet VALUES (5, 'Saturn', 116464, 1433.5, false, 'Gas Giant', 4500, 1, false);
INSERT INTO public.planet VALUES (9, 'Venu', 12104, 108.2, true, 'Terrestrial', 4500, 1, false);
INSERT INTO public.planet VALUES (10, 'Mar', 6792, 227.9, true, 'Terrestrial', 4500, 1, false);
INSERT INTO public.planet VALUES (13, 'Jupite', 139822, 778.6, false, 'Gas Giant', 4500, 1, false);
INSERT INTO public.planet VALUES (14, 'Satur', 116464, 1433.5, false, 'Gas Giant', 4500, 1, false);
INSERT INTO public.planet VALUES (15, 'Uranu', 50724, 2872.5, true, 'Ice Giant', 4500, 1, false);
INSERT INTO public.planet VALUES (16, 'Neptun', 49244, 4495.1, true, 'Ice Giant', 4500, 1, false);
INSERT INTO public.planet VALUES (17, 'Plut', 2376, 5906.4, true, 'Dwarf', 4500, 1, false);
INSERT INTO public.planet VALUES (18, 'Proxima b', 12104, 0.0485, true, 'Terrestrial', 100, 2, false);
INSERT INTO public.planet VALUES (19, 'HD 209458 b', 487940, 0.0475, false, 'Gas Giant', 100, 3, false);
INSERT INTO public.planet VALUES (20, 'Kepler-22b', 24000, 0.849, true, 'Super-Earth', 100, 4, false);
INSERT INTO public.planet VALUES (21, 'TRAPPIST-1d', 10000, 0.0283, true, 'Terrestrial', 100, 5, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.0, 5000, true, 1, 0);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1.5, 6000, false, 1, 4.3);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 0.5, 6000, false, 1, 4.3);
INSERT INTO public.star VALUES (4, 'Sirius', 25.4, 250, true, 1, 8.6);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 0.001, 10000, false, 1, 4.3);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 10000, 1000, false, 1, 640);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 100, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

