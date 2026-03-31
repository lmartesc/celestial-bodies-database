--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(40) NOT NULL,
    es_supermasivo boolean,
    year_descubrimiento integer NOT NULL,
    notas_destacadas text,
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    tipo character varying(40) NOT NULL,
    distancia_a_la_tierra numeric,
    numero_de_estrellas_estimado numeric(30,0),
    constelacion character varying(40),
    diametro numeric
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
    planet_id integer NOT NULL,
    diametro numeric(10,1),
    periodo_orbital numeric(10,2),
    descubridor character varying(100) NOT NULL,
    year_de_descubrimiento integer,
    tipo character varying(50),
    descripcion text
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
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    tipo character varying(40),
    radio_km numeric(10,2),
    masa_kg numeric(30,0),
    periodo_orbital_dias numeric(30,0),
    star_id integer NOT NULL,
    tiene_anillos boolean NOT NULL
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
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    tipo_espectral character varying(40) NOT NULL,
    masa_solar numeric(4,2),
    radio_solar numeric(6,2),
    temperatura_superficial integer,
    galaxy_id integer NOT NULL,
    distancia_tierra numeric(6,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', true, 1974, 'Centro de la Vía Láctea', 1);
INSERT INTO public.black_hole VALUES (2, 'M87*', true, 2019, 'Primer agujero negro fotografiado', 2);
INSERT INTO public.black_hole VALUES (3, 'Gaia BH1', false, 2022, 'Agujero negro estelar más cercano conocido', 1);
INSERT INTO public.black_hole VALUES (4, 'Gaia BH3', false, 2024, 'Agujero negro estelar más masivo en la Vía Láctea', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'Espiral barrada', 0.0, 200000000000, 'Sagitario', 105700.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Espiral', 2537000.0, 1000000000000, 'Andromeda', 220000.0);
INSERT INTO public.galaxy VALUES (3, 'Triangulo', 'Espiral', 2730000.0, 40000000000, 'Triangulum', 60000.0);
INSERT INTO public.galaxy VALUES (4, 'Gran nube de Magallanes', 'Irregular', 163000.0, 300000000000, 'Dorado', 14000.0);
INSERT INTO public.galaxy VALUES (5, 'Pequenna nube de Magallanes', 'Irregular', 200000.0, 3000000000, 'Turcana', 7000.0);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Eliptica', 53000000.0, 1000000000000, 'Virgo', 240000.0);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool M51', 'Espiral', 23000000.0, 100000000000, 'Canes Venatici', 76000.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Fobos', 2, 22.4, 0.32, 'Asaph Hall', 1877, 'Rocosa irregular', 'Pequeña luna de Marte con forma irregular y muchos cráteres; orbita muy cerca del planeta.');
INSERT INTO public.moon VALUES (2, 'Titan', 4, 5150.0, 15.95, 'Christiaan Huygens', 1655, 'Helada con atmósfera densa', 'La luna más grande de Saturno; posee una atmósfera espesa rica en nitrógeno y lagos de metano y etano');
INSERT INTO public.moon VALUES (3, 'Mimas', 4, 396.0, 0.94, 'William Herschel', 1789, 'Helada', 'Luna de Saturno conocida por su gran cráter Herschel que le da apariencia similar a una Estrella de la Muerte"');
INSERT INTO public.moon VALUES (4, 'Triton', 7, 2706.8, 5.88, 'William Lassell', 1846, 'Helada', 'Luna más grande de Neptuno; tiene órbita retrograda y actividad geológica con geiseres de nitrógeno');
INSERT INTO public.moon VALUES (5, 'Calisto', 8, 4820.6, 16.69, 'Galileo Galilei', 1610, 'Rocosa y helada', 'Una de las lunas grandes de Júpiter; superficie muy antigua y llena de cráteres');
INSERT INTO public.moon VALUES (6, 'Deimos', 2, 12.4, 1.26, 'Asaph Hall', 1877, 'Rocosa irregular', 'Luna pequeña de Marte con forma irregular y menos cráteres que Fobos');
INSERT INTO public.moon VALUES (7, 'Oberon', 10, 1522.8, 13.46, 'William Herschel', 1787, 'Helada y rocosa', 'Luna más externa grande de Urano; superficie oscura con grandes cráteres y algunos cañones');
INSERT INTO public.moon VALUES (8, 'Io', 8, 3643.2, 1.77, 'Galileo Galilei', 1610, 'Rocosa volcánica', 'Luna de Júpiter muy activa geológicamente, con numerosos volcanes y superficie en constante cambio');
INSERT INTO public.moon VALUES (9, 'Europa', 8, 3121.6, 3.55, 'Galileo Galilei', 1610, 'Helada', 'Luna de Júpiter cubierta de hielo; se cree que tiene un océano subterráneo de agua líquida');
INSERT INTO public.moon VALUES (10, 'Ganímedes', 8, 5268.2, 7.15, 'Galileo Galilei', 1610, 'Helada y rocosa', 'La luna más grande del sistema solar y también orbita a Júpiter; posee campo magnético propio');
INSERT INTO public.moon VALUES (11, 'Encélado', 4, 504.2, 1.37, 'William Herschel', 1789, 'Helada', 'Luna de Saturno con géiseres de agua y hielo que salen desde su superficie');
INSERT INTO public.moon VALUES (12, 'Tetis', 4, 1062.2, 1.89, 'Giovanni Domenico Cassini', 1684, 'Helada', 'Luna de Saturno con grandes cráteres y un enorme valle llamado Ithaca Chasma');
INSERT INTO public.moon VALUES (13, 'Dione', 4, 1122.8, 2.74, 'Giovanni Domenico Cassini', 1684, 'Helada y rocosa', 'Luna de Saturno con superficie brillante y señales de actividad geológica pasada');
INSERT INTO public.moon VALUES (14, 'Rea', 4, 1527.6, 4.52, 'Giovanni Domenico Cassini', 1672, 'Helada', 'Segunda luna más grande de Saturno, compuesta principalmente de hielo de agua');
INSERT INTO public.moon VALUES (15, 'Japeto', 4, 1469.0, 79.32, 'Giovanni Domenico Cassini', 1671, 'Helada', 'Luna de Saturno famosa por su gran contraste entre un hemisferio oscuro y otro claro');
INSERT INTO public.moon VALUES (16, 'Titania', 10, 1577.8, 8.71, 'William Herschel', 1787, 'Helada y rocosa', 'La luna más grande de Urano; tiene grandes cañones y fallas tectónicas');
INSERT INTO public.moon VALUES (17, 'Oberon', 10, 1522.8, 13.46, 'William Herschel', 1787, 'Helada y rocosa', 'Luna exterior grande de Urano con muchos cráteres y superficie oscura');
INSERT INTO public.moon VALUES (18, 'Ariel', 10, 1157.8, 2.52, 'William Lassell', 1851, 'Helada', 'Luna de Urano con superficie relativamente joven y grandes cañones');
INSERT INTO public.moon VALUES (19, 'Umbriel', 10, 1169.4, 4.14, 'William Lassell', 1851, 'Helada', 'Luna oscura de Urano con numerosos cráteres y poca actividad geológica reciente');
INSERT INTO public.moon VALUES (20, 'Miranda', 10, 471.6, 1.41, 'Gerard Kuiper', 1948, 'Helada', 'Luna pequeña de Urano con una superficie muy irregular y grandes acantilados');
INSERT INTO public.moon VALUES (21, 'Namaka', 12, 150.0, 18.28, 'Michael E. Brown', 2005, 'Pequeña', 'Namaka es la luna más pequeña e interior del planeta enano Haumea, ubicado en el cinturón de Kuiper. Es un cuerpo de forma irregular, cuya superficie está compuesta principalmente de hielo de agua. Su órbita es elíptica y está fuertemente perturbada por la influencia gravitacional de la luna mayor, Hiʻiaka, y por la forma alargada de Haumea, lo que provoca que su órbita sea caótica. Su nombre proviene de Nāmaka, una deidad del agua en la mitología hawaiana e hija de Haumea');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Pluton', 'Planeta enano helado', 1188.30, 130300000000000000000000, 90560, 8, false);
INSERT INTO public.planet VALUES (2, 'Marte', 'Planeta rocoso', 3389.50, 641700000000000000000000, 687, 8, false);
INSERT INTO public.planet VALUES (3, 'Venus', 'Planeta rocoso', 6051.80, 4867500000000000000000000, 225, 8, false);
INSERT INTO public.planet VALUES (4, 'Saturno', 'Gigante gaseoso', 58232.00, 568340000000000000000000000, 10759, 8, true);
INSERT INTO public.planet VALUES (5, 'Ceres', 'Planeta enano del cinturon de asteroides', 473.00, 939000000000000000000, 1680, 8, false);
INSERT INTO public.planet VALUES (6, 'Eris', 'Planeta helado', 1163.00, 16600000000000000000000, 203830, 8, false);
INSERT INTO public.planet VALUES (7, 'Neptuno', 'Gigante helado', 24622.00, 102413000000000000000000000, 60190, 8, true);
INSERT INTO public.planet VALUES (8, 'Jupiter', 'Gigante gaseoso', 69911.00, 1898000000000000000000000000, 4333, 8, true);
INSERT INTO public.planet VALUES (9, 'Tierra', 'Planeta rocoso', 6371.00, 5972000000000000000000000, 365, 8, false);
INSERT INTO public.planet VALUES (10, 'Urano', 'Gigante helado', 25362.00, 86810000000000000000000000, 30687, 8, true);
INSERT INTO public.planet VALUES (11, 'Mercurio', 'Planeta rocoso', 2439.70, 330200000000000000000000, 88, 8, false);
INSERT INTO public.planet VALUES (12, 'Haumea', 'Planeta enano', 780.00, 4006000000000000000000, 103468, 8, true);
INSERT INTO public.planet VALUES (13, 'Makemake', 'Planeta enano', 715.00, 4000000000000000000000, 113183, 8, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (8, 'El Sol', 'G2V', 1.00, 1.00, 5778, 1, 0.00);
INSERT INTO public.star VALUES (9, 'Sirio', 'A1V', 2.02, 1.71, 10500, 1, 8.60);
INSERT INTO public.star VALUES (10, 'Canopus', 'F0II', 8.50, 71.00, 7280, 1, 309.00);
INSERT INTO public.star VALUES (11, 'Arturo', 'K1.5III', 1.08, 25.40, 4286, 1, 36.70);
INSERT INTO public.star VALUES (12, 'Alfa Centauri A', 'G2V', 1.10, 1.20, 5790, 1, 4.40);
INSERT INTO public.star VALUES (13, 'Vega', 'A0V', 2.14, 2.26, 9602, 1, 25.00);
INSERT INTO public.star VALUES (14, 'Capella', 'G8III', 2.70, 12.20, 4940, 1, 42.20);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 1, false);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: moon moon_descripcion_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_descripcion_key UNIQUE (descripcion);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

