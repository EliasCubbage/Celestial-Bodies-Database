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
    name character varying(255) NOT NULL,
    galaxy_type text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    galaxy_types_id integer
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_planet numeric NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer,
    has_life boolean,
    planet_type text,
    distance_from_star integer NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    star_type text,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, 13600, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', false, 10000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', false, 10000, NULL);
INSERT INTO public.galaxy VALUES (12, 'Messier 82', 'Starburst', false, 12000, NULL);
INSERT INTO public.galaxy VALUES (13, 'Large Magellanic Cloud', 'Irregular', false, 13000, NULL);
INSERT INTO public.galaxy VALUES (14, 'Small Magellanic Cloud', 'Irregular', false, 7000, NULL);
INSERT INTO public.galaxy VALUES (15, 'NGC 1300', 'Barred Spiral', false, 15000, NULL);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'A galaxy with spiral arms winding outwards from the center.');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'A galaxy with an elongated shape and a smooth, featureless light profile.');
INSERT INTO public.galaxy_types VALUES (3, 'Lenticular', 'A galaxy with a central bulge and a disk but lacking spiral arms.');
INSERT INTO public.galaxy_types VALUES (4, 'Irregular', 'A galaxy with an undefined shape and often chaotic structure.');
INSERT INTO public.galaxy_types VALUES (5, 'Dwarf', 'A small galaxy with a lower luminosity and fewer stars.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (24, 'Titan', 5, true, 0.008);
INSERT INTO public.moon VALUES (25, 'Rhea', 5, true, 0.007);
INSERT INTO public.moon VALUES (26, 'Iapetus', 5, true, 0.014);
INSERT INTO public.moon VALUES (27, 'Oberon', 6, true, 0.01);
INSERT INTO public.moon VALUES (28, 'Titania', 6, true, 0.012);
INSERT INTO public.moon VALUES (29, 'Umbriel', 6, true, 0.014);
INSERT INTO public.moon VALUES (30, 'Miranda', 6, true, 0.013);
INSERT INTO public.moon VALUES (31, 'Phobos', 10, true, 0.00006);
INSERT INTO public.moon VALUES (32, 'Deimos', 10, true, 0.00023);
INSERT INTO public.moon VALUES (33, 'Charon', 15, true, 0.01);
INSERT INTO public.moon VALUES (34, 'Hydra', 15, true, 0.003);
INSERT INTO public.moon VALUES (35, 'Nix', 15, true, 0.005);
INSERT INTO public.moon VALUES (36, 'Kerberos', 15, true, 0.002);
INSERT INTO public.moon VALUES (37, 'Styx', 15, true, 0.002);
INSERT INTO public.moon VALUES (38, 'Eris', 17, true, 0.003);
INSERT INTO public.moon VALUES (39, 'Haumea', 18, true, 0.004);
INSERT INTO public.moon VALUES (40, 'Makemake', 19, true, 0.006);
INSERT INTO public.moon VALUES (41, 'Sedna', 21, true, 0.007);
INSERT INTO public.moon VALUES (42, 'Ceres', 16, true, 0.008);
INSERT INTO public.moon VALUES (43, 'Pluto', 15, true, 0.009);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Mars', 1, false, 'Terrestrial', 2);
INSERT INTO public.planet VALUES (6, 'Proxima b', 2, NULL, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (10, 'Venus', 1, false, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (11, 'Jupiter', 1, false, 'Gas Giant', 5);
INSERT INTO public.planet VALUES (12, 'Saturn', 1, false, 'Gas Giant', 10);
INSERT INTO public.planet VALUES (13, 'Uranus', 1, false, 'Ice Giant', 19);
INSERT INTO public.planet VALUES (14, 'Neptune', 1, false, 'Ice Giant', 30);
INSERT INTO public.planet VALUES (15, 'Pluto', 1, false, 'Dwarf', 39);
INSERT INTO public.planet VALUES (16, 'Ceres', 1, false, 'Dwarf', 3);
INSERT INTO public.planet VALUES (17, 'Eris', 1, false, 'Dwarf', 96);
INSERT INTO public.planet VALUES (18, 'Haumea', 1, false, 'Dwarf', 43);
INSERT INTO public.planet VALUES (19, 'Makemake', 1, false, 'Dwarf', 46);
INSERT INTO public.planet VALUES (20, 'Charon', 1, false, 'Dwarf', 0);
INSERT INTO public.planet VALUES (21, 'Sedna', 1, false, 'Dwarf', 86);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-Type', true, 0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 'M-Type', true, 4.24);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 2, 'G-Type', true, 4.37);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'A-Type', true, 8.6);
INSERT INTO public.star VALUES (5, 'Canopus', 1, 'F-Type', true, 310);
INSERT INTO public.star VALUES (6, 'Arcturus', 1, 'K-Type', true, 37.7);
INSERT INTO public.star VALUES (7, 'Alpha Centauri B', 2, 'K-Type', true, 4.37);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 1, 'M-Type', true, 642);
INSERT INTO public.star VALUES (9, 'Rigel', 1, 'B-Type', true, 863);
INSERT INTO public.star VALUES (25, 'Altair', 2, 'A-Type', true, 16.7);
INSERT INTO public.star VALUES (26, 'Deneb', 2, 'A-Type', true, 1425);
INSERT INTO public.star VALUES (27, 'Spica', 2, 'B-Type', true, 250);
INSERT INTO public.star VALUES (28, 'Polaris', 2, 'F-Type', true, 433);
INSERT INTO public.star VALUES (29, 'Vega', 2, 'A-Type', true, 25);
INSERT INTO public.star VALUES (30, 'Castor', 2, 'A-Type', true, 51.8);
INSERT INTO public.star VALUES (31, 'Sirius B', 2, 'White Dwarf', true, 8.6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 15, true);


--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 48, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 31, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: galaxy galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


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

