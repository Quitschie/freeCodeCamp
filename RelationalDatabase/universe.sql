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
    description text NOT NULL,
    isactive boolean NOT NULL,
    name character varying DEFAULT 'name'::character varying NOT NULL
);


ALTER TABLE public.additional_table OWNER TO freecodecamp;

--
-- Name: additional_table_additional_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.additional_table ALTER COLUMN additional_table_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.additional_table_additional_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    isactive boolean NOT NULL,
    isexpanding boolean DEFAULT false,
    isfullyexplored boolean DEFAULT false NOT NULL,
    name character varying
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    isonlymoon boolean DEFAULT true NOT NULL,
    isactive boolean DEFAULT true NOT NULL,
    name character varying
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    populated boolean NOT NULL,
    diameter integer,
    distancetoearth numeric,
    haswater boolean,
    star_id integer,
    name character varying
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    mass integer,
    galaxy_id integer,
    isactive boolean DEFAULT true NOT NULL,
    name character varying
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: additional_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.additional_table OVERRIDING SYSTEM VALUE VALUES (1, 'row1', true, 'name');
INSERT INTO public.additional_table OVERRIDING SYSTEM VALUE VALUES (2, 'row2', true, 'name');
INSERT INTO public.additional_table OVERRIDING SYSTEM VALUE VALUES (3, 'row3', false, 'name');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, true, false, false, 'Andromeda');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, true, false, false, 'Canis Major Swarf');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, true, false, false, 'Cygnus A.');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, true, false, false, 'Maffei I and II');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, true, false, false, 'Magellanic Clouds');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, true, false, false, 'Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 1, true, true, 'moon1');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 1, true, true, 'moon2');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 2, true, true, 'moon3');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 2, true, true, 'moon4');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 3, true, true, 'moon5');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 3, true, true, 'moon6');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 4, true, true, 'moon7');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 4, true, true, 'moon8');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 5, true, true, 'moon9');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 5, true, true, 'moon10');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 6, true, true, 'moon11');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 6, true, true, 'moon12');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 7, true, true, 'moon13');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 7, true, true, 'moon14');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 8, true, true, 'moon15');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 9, true, true, 'moon17');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 9, true, true, 'moon18');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 10, true, true, 'moon19');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 10, true, true, 'moon20');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 8, true, true, 'moon16');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, true, 1, 1, true, 1, 'planet1');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, true, 2, 2, true, 2, 'planet2');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, true, 3, 3, true, 3, 'planet3');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, true, 4, 4, false, 4, 'planet4');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, true, 5, 5, false, 5, 'planet5');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, true, 6, 6, false, 6, 'planet6');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, false, 7, 7, true, 1, 'planet7');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, false, 8, 8, true, 2, 'planet8');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, false, 9, 9, true, 3, 'planet9');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, false, 10, 10, false, 4, 'planet10');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, false, 11, 11, false, 5, 'planet11');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, false, 12, 12, false, 6, 'planet12');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, true, 'star1');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 2, 2, true, 'star2');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 3, 3, true, 'star3');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 4, 4, true, 'star4');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 5, 5, true, 'star5');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 6, 6, true, 'star6');


--
-- Name: additional_table_additional_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.additional_table_additional_table_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: additional_table additional_table_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table
    ADD CONSTRAINT additional_table_name_key UNIQUE (description);


--
-- Name: additional_table additional_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table
    ADD CONSTRAINT additional_table_pkey PRIMARY KEY (additional_table_id);


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
-- Name: moon moon_idplanet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_idplanet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_idstar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_idstar_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_idgalaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_idgalaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

