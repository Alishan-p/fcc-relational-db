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
    name character varying(20) NOT NULL,
    description text,
    galaxy_type character varying(50) NOT NULL,
    distance_from_earth double precision NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean DEFAULT false NOT NULL,
    CONSTRAINT galaxy_age_in_millions_of_years_check CHECK ((age_in_millions_of_years > 0)),
    CONSTRAINT galaxy_distance_from_earth_check CHECK ((distance_from_earth > (0)::double precision))
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxys_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxys_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxys_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxys_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxys_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    CONSTRAINT moon_age_in_millions_of_years_check CHECK ((age_in_millions_of_years > 0))
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    star_id integer,
    planet_type character varying(50) NOT NULL,
    distance_from_earth numeric(12,6) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean DEFAULT false NOT NULL,
    CONSTRAINT planet_age_in_millions_of_years_check CHECK ((age_in_millions_of_years > 0)),
    CONSTRAINT planet_distance_from_earth_check CHECK ((distance_from_earth >= (0)::numeric))
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
    name character varying(20),
    galaxy_id integer,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth double precision NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    CONSTRAINT star_age_in_millions_of_years_check CHECK ((age_in_millions_of_years >= 0)),
    CONSTRAINT star_distance_from_earth_check CHECK ((distance_from_earth >= (0)::double precision))
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_observation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_observation (
    star_observation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    observation_date date NOT NULL,
    site_name character varying(100) NOT NULL
);


ALTER TABLE public.star_observation OWNER TO freecodecamp;

--
-- Name: star_observation_star_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_observation_star_observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_observation_star_observation_id_seq OWNER TO freecodecamp;

--
-- Name: star_observation_star_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_observation_star_observation_id_seq OWNED BY public.star_observation.star_observation_id;


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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxys_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Name: star_observation star_observation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_observation ALTER COLUMN star_observation_id SET DEFAULT nextval('public.star_observation_star_observation_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral.', 'Spiral', 0.1, 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large galaxy to the Milky Way, destined to collide with it in the future.', 'Spiral', 2537000, 10000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Part of the Local Group, a small spiral galaxy.', 'Spiral', 3000000, 10000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Famous for its interaction with a smaller companion galaxy.', 'Spiral', 23000000, 6000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'A bright galaxy with a distinctive dust lane.', 'Elliptical', 29000000, 9000, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant elliptical galaxy with a supermassive black hole.', 'Elliptical', 53000000, 13000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 1, 'Ice-covered moon with a possible subsurface ocean.', false, true, 4000);
INSERT INTO public.moon VALUES (2, 'Titan', 2, 'Largest moon of Saturn, has a thick atmosphere.', false, true, 4500);
INSERT INTO public.moon VALUES (3, 'Ganymede', 1, 'Largest moon in the solar system.', false, true, 4600);
INSERT INTO public.moon VALUES (4, 'Phobos', 3, 'Small and irregularly shaped moon of Mars.', false, false, 4500);
INSERT INTO public.moon VALUES (5, 'Callisto', 1, 'A heavily cratered moon of Jupiter.', false, true, 4600);
INSERT INTO public.moon VALUES (6, 'Triton', 4, 'Largest moon of Neptune, orbits in the opposite direction of Neptune’s rotation.', false, true, 4500);
INSERT INTO public.moon VALUES (7, 'Enceladus', 2, 'Moon of Saturn, known for geysers ejecting water vapor.', false, true, 4600);
INSERT INTO public.moon VALUES (8, 'Io', 1, 'Most volcanically active body in the solar system.', false, true, 4600);
INSERT INTO public.moon VALUES (9, 'Deimos', 3, 'Small moon of Mars, smoother than Phobos.', false, false, 4500);
INSERT INTO public.moon VALUES (10, 'Mimas', 2, 'Has a large crater resembling the Death Star.', false, true, 4500);
INSERT INTO public.moon VALUES (11, 'Iapetus', 2, 'Known for its distinctive two-tone coloration.', false, true, 4600);
INSERT INTO public.moon VALUES (12, 'Charon', 5, 'Largest moon of Pluto, forms a binary system with the dwarf planet.', false, true, 4500);
INSERT INTO public.moon VALUES (13, 'Oberon', 6, 'Second-largest moon of Uranus.', false, true, 4500);
INSERT INTO public.moon VALUES (14, 'Rhea', 2, 'Second-largest moon of Saturn.', false, true, 4500);
INSERT INTO public.moon VALUES (15, 'Dione', 2, 'Has wispy surface markings and icy cliffs.', false, true, 4500);
INSERT INTO public.moon VALUES (16, 'Ariel', 6, 'Brightest moon of Uranus with an icy surface.', false, true, 4500);
INSERT INTO public.moon VALUES (17, 'Umbriel', 6, 'Darkest moon of Uranus, mostly ice and rock.', false, true, 4500);
INSERT INTO public.moon VALUES (18, 'Hyperion', 2, 'Irregularly shaped moon with a sponge-like appearance.', false, false, 4500);
INSERT INTO public.moon VALUES (19, 'Miranda', 6, 'Smallest of Uranus’s major moons, has giant canyons.', false, true, 4500);
INSERT INTO public.moon VALUES (20, 'Himalia', 1, 'One of Jupiter’s outer moons, part of the Himalia group.', false, false, 4600);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 0.000000, 'The only planet known to support life.', true, 4500, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 0.000016, 'Known as the Red Planet, possibly habitable in the future.', true, 4500, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 0.000082, 'The largest planet in the Solar System, a gas giant.', true, 4500, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 0.000085, 'Famous for its stunning ring system.', true, 4500, false);
INSERT INTO public.planet VALUES (5, 'Neptune', 1, 'Ice Giant', 0.000030, 'An ice giant, the farthest planet in the Solar System.', true, 4500, false);
INSERT INTO public.planet VALUES (6, 'Proxima b', 2, 'Terrestrial', 4.243000, 'Exoplanet orbiting Proxima Centauri, in the habitable zone.', true, 4600, false);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bb', 3, 'Terrestrial', 4.367000, 'Potential rocky exoplanet orbiting Alpha Centauri B.', true, 4600, false);
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 4, 'Super-Earth', 620.000000, 'A possible ocean planet in the habitable zone.', true, 5000, false);
INSERT INTO public.planet VALUES (9, 'Gliese 581g', 5, 'Terrestrial', 20.300000, 'A controversial exoplanet with potential for habitability.', true, 5000, false);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 6, 'Gas Giant', 153.000000, 'An exoplanet known as Osiris, the first to be detected transiting its star.', true, 6000, false);
INSERT INTO public.planet VALUES (11, 'Tau Ceti e', 5, 'Terrestrial', 11.900000, 'Potentially habitable exoplanet orbiting Tau Ceti.', true, 5000, false);
INSERT INTO public.planet VALUES (12, '55 Cancri e', 4, 'Super-Earth', 40.000000, 'A super-Earth that is incredibly hot due to its proximity to its star.', true, 8000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The central star of the Solar System, supports life on Earth.', true, 4600, 0, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 'The closest known star to the Sun.', true, 4500, 4.24, false);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'The brightest star in the night sky, part of the Milky Way.', true, 250, 8.6, false);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'A red supergiant in the Orion constellation, nearing the end of its life.', true, 8500, 642.5, false);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 2, 'Part of the Alpha Centauri system, a close neighbor of Proxima Centauri.', true, 4600, 4.37, false);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'A blue supergiant in the Orion constellation, one of the brightest stars in the night sky.', true, 8600, 860, false);


--
-- Data for Name: star_observation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_observation VALUES (1, 'Hubble Observation 2024', 1, '2024-09-01', 'Hubble Space Telescope');
INSERT INTO public.star_observation VALUES (2, 'Chandra X-ray Observation', 2, '2023-05-15', 'Chandra X-ray Observatory');
INSERT INTO public.star_observation VALUES (3, 'James Webb Infrared Scan', 3, '2024-01-30', 'James Webb Space Telescope');


--
-- Name: galaxys_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxys_galaxy_id_seq', 6, true);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 20, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 12, true);


--
-- Name: star_observation_star_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_observation_star_observation_id_seq', 3, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxys_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxys_pkey PRIMARY KEY (galaxy_id);


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
-- Name: moon moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star_observation star_observation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_observation
    ADD CONSTRAINT star_observation_name_key UNIQUE (name);


--
-- Name: star_observation star_observation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_observation
    ADD CONSTRAINT star_observation_pkey PRIMARY KEY (star_observation_id);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


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
-- Name: star_observation star_observation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_observation
    ADD CONSTRAINT star_observation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

