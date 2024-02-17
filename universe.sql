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
    name character varying(50) NOT NULL,
    constellation text,
    is_local boolean NOT NULL,
    is_spheric boolean NOT NULL,
    diameter integer,
    distance numeric(6,4) NOT NULL,
    number_of_stars_bln integer
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
    name character varying(50) NOT NULL,
    temperature_kel integer,
    mass numeric(6,4),
    type text,
    semi_major_axis_km integer,
    has_atmosphere boolean,
    tidally_locked boolean,
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
    name character varying(50) NOT NULL,
    planet_type text,
    has_moon boolean NOT NULL,
    habitable boolean,
    mass numeric(6,4),
    distance_mln_miles integer,
    temperature_kel integer,
    star_id integer
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
-- Name: ring; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ring (
    ring_id integer NOT NULL,
    name character varying(50) NOT NULL,
    note text,
    radius_km integer NOT NULL,
    outer_radius_km integer NOT NULL,
    dust_fraction_percent numeric(3,2) NOT NULL,
    is_thin boolean NOT NULL,
    substantial_debris boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.ring OWNER TO freecodecamp;

--
-- Name: ring_ring_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ring_ring_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ring_ring_id_seq OWNER TO freecodecamp;

--
-- Name: ring_ring_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ring_ring_id_seq OWNED BY public.ring.ring_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    spectral_type text,
    temperature_kel integer,
    luminosity integer,
    mass numeric(6,4) NOT NULL,
    has_planet boolean NOT NULL,
    is_binary_system boolean,
    galaxy_id integer
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: ring ring_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring ALTER COLUMN ring_id SET DEFAULT nextval('public.ring_ring_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', true, true, 152000, 2.5000, 1000);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', true, true, 87400, 0.0270, 400);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy (M33)', 'Triangulum', true, true, 61100, 3.2000, 40);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Tucana', true, false, 18900, 0.2000, 3);
INSERT INTO public.galaxy VALUES (4, 'NGC 300', 'Sculptor', true, false, 94000, 6.0700, NULL);
INSERT INTO public.galaxy VALUES (6, 'Phoenix Dwarf Galaxy', 'Phoenix', true, false, NULL, 0.4000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 233, 1.0659, 'C-type rock', 9377, false, true, 4);
INSERT INTO public.moon VALUES (2, 'Deimos', 233, 1.4762, 'C-type rock', 23463, false, true, 4);
INSERT INTO public.moon VALUES (3, 'Europa', 144, 1.0000, 'Galilean moon', 670900, true, true, 5);
INSERT INTO public.moon VALUES (4, 'IO', 1300, 0.0150, 'Volcanic moon', 421700, true, true, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 1500, 1.4800, 'Planetary-mass moon', 1070400, true, true, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 165, 1.0759, 'Galilean moon', 1882700, true, true, 5);
INSERT INTO public.moon VALUES (7, 'Charon', 53, 1.5860, 'Natural sattelite', 19591, false, true, 6);
INSERT INTO public.moon VALUES (8, 'Nix', 55, 2.6000, 'Natural sattelite', 48694, true, false, 6);
INSERT INTO public.moon VALUES (9, 'Styx', 55, 7.5000, 'Natural sattelite', 42656, true, false, 6);
INSERT INTO public.moon VALUES (10, 'Kerberos', 55, 1.6500, 'Natural sattelite', 57783, true, false, 6);
INSERT INTO public.moon VALUES (11, 'Hydra', 23, 3.0100, 'Natural sattelite', 64738, true, false, 6);
INSERT INTO public.moon VALUES (12, 'Miranda', 60, 6.4000, 'Natural sattelite', 129390, false, true, 7);
INSERT INTO public.moon VALUES (13, 'Ariel', 173, 1.2510, 'Natural sattelite', 191020, false, true, 7);
INSERT INTO public.moon VALUES (14, 'Umbriel', 176, 1.2700, 'Natural sattelite', 266000, false, true, 7);
INSERT INTO public.moon VALUES (15, 'Titania', 98, 3.4000, 'Natural sattelite', 435910, true, true, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 80, 3.0760, 'Natural sattelite', 583520, false, true, 7);
INSERT INTO public.moon VALUES (17, 'Naiad', 51, 1.9000, 'Potato-shaped', 48224, false, true, 8);
INSERT INTO public.moon VALUES (18, 'Thalassa', 51, 1.2300, 'Irregular moon', 50074, false, true, 8);
INSERT INTO public.moon VALUES (19, 'Despina', 51, 2.2000, 'Regular moon', 52525, false, true, 8);
INSERT INTO public.moon VALUES (20, 'Galatea', 51, 2.1200, 'Regular moon', 61952, false, true, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Rocky', false, false, 0.0550, 48, 440, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Rocky', false, false, 0.8150, 38, 735, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Rocky', true, true, 1.0000, NULL, 288, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Rocky', true, false, 0.1070, 250, 210, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', true, false, 1.3210, 444, 165, 1);
INSERT INTO public.planet VALUES (6, 'Pluto', 'Dwarf Planet', true, false, 1.3090, 4670, 40, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', true, false, 14.5400, 1600, 59, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', true, false, 17.1500, 2770, 74, 1);
INSERT INTO public.planet VALUES (9, 'Andromeda 3 b', 'Ice Giant', true, false, 5.2000, NULL, NULL, 5);
INSERT INTO public.planet VALUES (10, 'Andromeda 5 b', 'Rocky', false, false, 1.8000, NULL, 260, 7);
INSERT INTO public.planet VALUES (11, 'Andromeda 9 c', 'Gas Giant', false, false, 3.1000, NULL, NULL, 8);
INSERT INTO public.planet VALUES (12, 'Andromeda 11 b', 'Rocky', true, true, 0.9000, NULL, 300, 9);


--
-- Data for Name: ring; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ring VALUES (1, 'Halo', NULL, 92000, 122500, 1.00, false, true, 5);
INSERT INTO public.ring VALUES (2, 'Main', 'Bounded by Adrastea', 122500, 129000, 0.25, false, false, 5);
INSERT INTO public.ring VALUES (3, 'Amalthea', 'Connected with Amalthea', 181366, 182000, 1.00, true, false, 5);
INSERT INTO public.ring VALUES (4, 'Thebe', 'Connected with Thebe. There is an extension beyond the orbit of Thebe', 129180, 129030, 1.00, true, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'G2V', 5772, 1, 1.0000, true, false, 1);
INSERT INTO public.star VALUES (2, 'Vega', 'A0V', 9546, 40, 2.0000, true, false, 1);
INSERT INTO public.star VALUES (3, 'Andromeda Sun 1', 'G3V', 5700, 1, 1.0000, false, false, 2);
INSERT INTO public.star VALUES (4, 'Andromeda Sun 2', 'F5V', 6500, 2, 1.1000, true, false, 2);
INSERT INTO public.star VALUES (5, 'Andromeda Star 3', 'O9I', 30000, 200000, 25.0000, false, true, 2);
INSERT INTO public.star VALUES (6, 'Andromeda Star 4', 'B3III', 14000, 15000, 10.0000, true, false, 2);
INSERT INTO public.star VALUES (7, 'Andromeda Star 5', 'A2V', 9800, 35, 2.0000, true, true, 2);
INSERT INTO public.star VALUES (8, 'Andromeda Star 9', 'G0V', 5900, 2, 1.1000, true, false, 2);
INSERT INTO public.star VALUES (9, 'Andromeda Star 11', 'M4III', 3000, 800, 7.0000, true, false, 2);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: ring_ring_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ring_ring_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


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
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


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
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: ring ring_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT ring_name_key UNIQUE (name);


--
-- Name: ring ring_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT ring_pkey PRIMARY KEY (ring_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


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
-- Name: ring ring_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT ring_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

