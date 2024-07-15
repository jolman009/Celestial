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
    name character varying NOT NULL,
    constellation text,
    type character varying,
    year_disc numeric,
    distance_earth_mly double precision,
    size_ly integer,
    tech_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying NOT NULL,
    radius_size_km double precision,
    year_disc numeric,
    tech_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: obs_technology; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.obs_technology (
    tech_id integer NOT NULL,
    name character varying NOT NULL,
    dev_year numeric,
    country text,
    developer character varying
);


ALTER TABLE public.obs_technology OWNER TO freecodecamp;

--
-- Name: obs_technology_tech_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.obs_technology_tech_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obs_technology_tech_id_seq OWNER TO freecodecamp;

--
-- Name: obs_technology_tech_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.obs_technology_tech_id_seq OWNED BY public.obs_technology.tech_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying NOT NULL,
    radius_size_km double precision,
    year_disc numeric,
    have_moons boolean,
    n_moons integer,
    tech_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying NOT NULL,
    spectral_type character varying,
    year_disc numeric,
    have_planets boolean,
    n_planets integer,
    tech_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: obs_technology tech_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.obs_technology ALTER COLUMN tech_id SET DEFAULT nextval('public.obs_technology_tech_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky_way', 'Sagittaurus', 'barred_spiral', 1610, 0.026, 52850, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 'barred_spiral', 964, 2537, 110000, 1);
INSERT INTO public.galaxy VALUES (3, 'Centaurus_A', 'Centaurus', 'elliptical', 1826, 13.5, 48500, 5);
INSERT INTO public.galaxy VALUES (4, 'Canis_Major_dwarf', 'Canis_Major', 'irregular', 2003, 0.025, 16800, 5);
INSERT INTO public.galaxy VALUES (5, 'Large_Magellanic_cloud', 'Dorado', 'barred_dwarf_spiral', 1913, 0.163, 7000, 4);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Virgo', 'elliptical', NULL, 0.49, 25000, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 3474, 428, 1);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 22.2, 1877, 2);
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 6.2, 1877, 4);
INSERT INTO public.moon VALUES (4, 5, 'Io', 1821.6, 1610, 2);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 1560.8, 1610, 2);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 2631, 1610, 1);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 2410.3, 1610, 1);
INSERT INTO public.moon VALUES (8, 5, 'Amalthea', 83.5, 1979, 2);
INSERT INTO public.moon VALUES (9, 5, 'Metis', 43, 1979, 2);
INSERT INTO public.moon VALUES (10, 5, 'Adrasthea', 16.4, 1979, 2);
INSERT INTO public.moon VALUES (11, 5, 'Thebe', 98.6, 1979, 1);
INSERT INTO public.moon VALUES (12, 5, 'Leda', 21.5, 1974, 2);
INSERT INTO public.moon VALUES (13, 6, 'Triton', 1353.4, 1846, 1);
INSERT INTO public.moon VALUES (14, 6, 'Nereid', 170, 1949, 2);
INSERT INTO public.moon VALUES (15, 6, 'Galatea', 87.4, 1989, 1);
INSERT INTO public.moon VALUES (16, 6, 'Despina', 75, 1989, 2);
INSERT INTO public.moon VALUES (17, 6, 'Proteus', 210, 1989, 2);
INSERT INTO public.moon VALUES (18, 6, 'Thalassa', 41, 1989, 2);
INSERT INTO public.moon VALUES (19, 6, 'Halimede', 31, 2002, 2);
INSERT INTO public.moon VALUES (20, 7, 'Titan', 2474.3, 1965, 1);
INSERT INTO public.moon VALUES (21, 7, 'Enceladus', 500, 1789, 1);
INSERT INTO public.moon VALUES (22, 7, 'Mimas', 198.2, 1789, 2);
INSERT INTO public.moon VALUES (23, 7, 'Atlas', 15, 1980, 1);
INSERT INTO public.moon VALUES (24, 7, 'Lapetus', 734.5, 1671, 2);
INSERT INTO public.moon VALUES (25, 5, 'Elara', 80, 1905, 1);
INSERT INTO public.moon VALUES (26, 5, 'Himalia', 149, 1904, 1);
INSERT INTO public.moon VALUES (27, 5, 'Callirrhoe', 1.3, 2000, 1);
INSERT INTO public.moon VALUES (28, 5, 'Carpo', 3, 2003, 1);
INSERT INTO public.moon VALUES (29, 8, 'Charon', 606, 1978, 1);
INSERT INTO public.moon VALUES (30, 5, 'Eukelade', 4, 2033, 3);
INSERT INTO public.moon VALUES (31, 7, 'Hyperion', 135, 1848, 1);
INSERT INTO public.moon VALUES (32, 7, 'Iapetus', 734.5, 1671, 1);
INSERT INTO public.moon VALUES (33, 9, 'Miranda', 500, 1986, 1);
INSERT INTO public.moon VALUES (34, 15, 'KOI-268.01_moon', NULL, 2013, 3);


--
-- Data for Name: obs_technology; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.obs_technology VALUES (1, 'optical', 1608, 'Germany-Dutch', 'Hans Lippershey');
INSERT INTO public.obs_technology VALUES (2, 'occultation', 1590, 'Germany', 'Michael Maestlin');
INSERT INTO public.obs_technology VALUES (3, 'X-ray astronomy', 1927, 'USA', 'US_Naval_Research_Laboratory');
INSERT INTO public.obs_technology VALUES (4, 'infrared', 1830, 'Scotland', 'Charles Piazzi Smyth');
INSERT INTO public.obs_technology VALUES (5, 'radio_astronomy', 1933, 'USA', 'Karl_Jansky');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 12742, NULL, true, 1, 2);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 6778, 1610, true, 2, 1);
INSERT INTO public.planet VALUES (3, 1, 'Mercury', 4871.4, 1631, false, 0, 1);
INSERT INTO public.planet VALUES (4, 1, 'Venus', 12104, 1610, false, 0, 1);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 139820, 1610, true, 80, 1);
INSERT INTO public.planet VALUES (6, 1, 'Neptune', 49244, 1846, true, 14, 1);
INSERT INTO public.planet VALUES (7, 1, 'Saturn', 58232, 1610, true, 83, 1);
INSERT INTO public.planet VALUES (8, 1, 'Pluto', 1188.3, 1930, true, 4, 1);
INSERT INTO public.planet VALUES (9, 1, 'Uranus', 25362, 1781, true, 27, 1);
INSERT INTO public.planet VALUES (10, 2, 'Kepler-1649c', 6753.3, 2020, NULL, NULL, 3);
INSERT INTO public.planet VALUES (11, 3, 'Gliese-163c', 28000, 2012, NULL, NULL, 2);
INSERT INTO public.planet VALUES (12, 6, '51_Pegasi_b', 135830, 1995, false, 0, 2);
INSERT INTO public.planet VALUES (13, 9, 'L 98-59-f', 3140, 2021, NULL, NULL, 2);
INSERT INTO public.planet VALUES (14, 12, 'Bocaprins', 167820, 2011, NULL, NULL, 4);
INSERT INTO public.planet VALUES (15, 13, 'KOI-268.01', 112000, 2013, true, 1, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'G2V', 450, true, 8, 1);
INSERT INTO public.star VALUES (2, 1, 'Kepler-1649', 'M5V', 2020, true, 2, 4);
INSERT INTO public.star VALUES (3, 5, 'Gliese 163', 'M3V', 2012, true, 5, 3);
INSERT INTO public.star VALUES (4, 2, 'Alpha_andromedae', 'A3V', 1993, false, 0, 3);
INSERT INTO public.star VALUES (5, 2, 'Mirach', 'M0III', 1521, false, 0, 5);
INSERT INTO public.star VALUES (6, 2, '51_pegasi', 'G2IV', 1995, true, 1, 3);
INSERT INTO public.star VALUES (7, 3, 'Delta_Centauri', 'B-type', NULL, false, 0, 3);
INSERT INTO public.star VALUES (8, 4, 'Canis_Major', 'DA2', 2000, NULL, NULL, 4);
INSERT INTO public.star VALUES (9, 3, 'L 98-59', 'M3V', 2019, true, 4, 3);
INSERT INTO public.star VALUES (10, 1, 'Antares', 'B2.5V', 1819, false, 0, 3);
INSERT INTO public.star VALUES (11, 1, 'Mu_Cephei', 'M2-Ia', 1881, false, 0, 5);
INSERT INTO public.star VALUES (12, 1, 'WASP-39 ', 'G8', 2011, true, 1, 4);
INSERT INTO public.star VALUES (13, 1, 'KOI-268', NULL, 2013, true, 1, 3);
INSERT INTO public.star VALUES (14, 2, 'Vega', 'A0Va', 2005, false, 0, 4);


--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_galaxy_id_seq', 6, true);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 34, true);


--
-- Name: obs_technology_tech_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.obs_technology_tech_id_seq', 5, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 15, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 14, true);


--
-- Name: galaxy galaxies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_name_key UNIQUE (name);


--
-- Name: galaxy galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_name_key UNIQUE (name);


--
-- Name: moon moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_id);


--
-- Name: obs_technology obs_technology_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.obs_technology
    ADD CONSTRAINT obs_technology_name_key UNIQUE (name);


--
-- Name: obs_technology obs_technology_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.obs_technology
    ADD CONSTRAINT obs_technology_pkey PRIMARY KEY (tech_id);


--
-- Name: planet planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_name_key UNIQUE (name);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_name_key UNIQUE (name);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_moom; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_moom FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy fk_tech_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_tech_galaxy FOREIGN KEY (tech_id) REFERENCES public.obs_technology(tech_id);


--
-- Name: moon fk_tech_moom; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_tech_moom FOREIGN KEY (tech_id) REFERENCES public.obs_technology(tech_id);


--
-- Name: planet fk_tech_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_tech_planet FOREIGN KEY (tech_id) REFERENCES public.obs_technology(tech_id);


--
-- Name: star fk_tech_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_tech_star FOREIGN KEY (tech_id) REFERENCES public.obs_technology(tech_id);


--
-- PostgreSQL database dump complete
--

