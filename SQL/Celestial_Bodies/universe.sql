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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(60),
    constellation character varying(60),
    info text
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
    name character varying(30) NOT NULL,
    planet_id integer,
    radius_in_km numeric(7,2),
    discovery_year integer,
    announced_year integer
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
    name character varying(30) NOT NULL,
    star_id integer,
    habitable boolean,
    diameter_km numeric(15,2),
    type_of_planet_id integer,
    rings boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    chromacity character varying(60),
    class character varying(60)
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
-- Name: type_of_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type_of_planet (
    type_of_planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.type_of_planet OWNER TO freecodecamp;

--
-- Name: type_of_planet_type_of_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.type_of_planet_type_of_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_of_planet_type_of_planet_id_seq OWNER TO freecodecamp;

--
-- Name: type_of_planet_type_of_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.type_of_planet_type_of_planet_id_seq OWNED BY public.type_of_planet.type_of_planet_id;


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
-- Name: type_of_planet type_of_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_planet ALTER COLUMN type_of_planet_id SET DEFAULT nextval('public.type_of_planet_type_of_planet_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Spyral', 'Andromeda', NULL);
INSERT INTO public.galaxy VALUES (2, 'Eye of God', 'Spyral', 'Eridanus', NULL);
INSERT INTO public.galaxy VALUES (3, 'Pinwheel Galaxy', 'Spyral', 'Ursa Major', NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 82', 'Starburst', 'Ursa Major', NULL);
INSERT INTO public.galaxy VALUES (5, 'Lindsay-Shapley-Ring', 'Lenticular', 'Volans', NULL);
INSERT INTO public.galaxy VALUES (6, 'Wolf-Lundmark-Melotte', 'Irregular', 'Cetus', NULL);
INSERT INTO public.galaxy VALUES (7, 'N/A', 'N/A', 'N/A', NULL);
INSERT INTO public.galaxy VALUES (8, 'Milky Way', 'Spyral', 'Sagittarius', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1738.00, 0, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11.26, 1877, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6.20, 1877, 1877);
INSERT INTO public.moon VALUES (4, 'IO', 5, 1821.00, 1610, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.00, 1610, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.00, 1610, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.00, 1610, 1610);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 83.50, 1892, 1892);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 69.80, 1904, 1905);
INSERT INTO public.moon VALUES (10, 'Elara', 5, 43.00, 1905, 1905);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 198.20, 1789, 1789);
INSERT INTO public.moon VALUES (12, 'Enceladus', 6, 252.10, 1789, 1789);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 533.10, 1684, 1686);
INSERT INTO public.moon VALUES (14, 'Dione', 6, 561.40, 1684, 1686);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 763.80, 1672, 1673);
INSERT INTO public.moon VALUES (16, 'Titan', 6, 2574.73, 1655, 1656);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 578.90, 1851, 1851);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 788.90, 1787, 1787);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 1353.40, 1846, 1846);
INSERT INTO public.moon VALUES (20, 'Charon', 9, 606.00, 1978, 1978);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 7, true, 12742.00, 1, false);
INSERT INTO public.planet VALUES (2, 'Mars', 7, false, 6779.00, 1, false);
INSERT INTO public.planet VALUES (3, 'Mercury', 7, false, 4880.00, 1, false);
INSERT INTO public.planet VALUES (4, 'Venus', 7, false, 12104.00, 1, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 7, false, 139820.00, 2, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 7, false, 116460.00, 2, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 7, false, 50724.00, 3, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 7, false, 49244.00, 3, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 7, false, 2377.00, 1, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186B', 8, false, 14016.00, 1, false);
INSERT INTO public.planet VALUES (11, 'Kepler-186C', 8, false, 15290.00, 1, false);
INSERT INTO public.planet VALUES (12, 'Kepler-186E', 8, false, 20388.00, 1, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 1, 'Blue-White', 'B9');
INSERT INTO public.star VALUES (2, 'Mirach', 1, 'RED', 'M0 III');
INSERT INTO public.star VALUES (3, 'Tau Ceti', 4, 'Yellow', 'G8 V');
INSERT INTO public.star VALUES (4, 'Van Maanen 2', 7, 'White', 'DZ 8');
INSERT INTO public.star VALUES (6, 'Betelgeuse', 7, 'Red', 'M2lab');
INSERT INTO public.star VALUES (5, 'Pollux', 7, 'Orange', NULL);
INSERT INTO public.star VALUES (7, 'The Sun', 8, 'Yellow', 'G2 V');
INSERT INTO public.star VALUES (8, 'Kepler-186', 8, 'Red', 'M1');


--
-- Data for Name: type_of_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type_of_planet VALUES (2, 'Gas', NULL);
INSERT INTO public.type_of_planet VALUES (3, 'Ice', NULL);
INSERT INTO public.type_of_planet VALUES (4, 'Dwarf', NULL);
INSERT INTO public.type_of_planet VALUES (1, 'Terrestrial', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: type_of_planet_type_of_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.type_of_planet_type_of_planet_id_seq', 4, true);


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
-- Name: type_of_planet type_of_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_planet
    ADD CONSTRAINT type_of_planet_name_key UNIQUE (name);


--
-- Name: type_of_planet type_of_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_planet
    ADD CONSTRAINT type_of_planet_pkey PRIMARY KEY (type_of_planet_id);


--
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_type_fkey FOREIGN KEY (type_of_planet_id) REFERENCES public.type_of_planet(type_of_planet_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

