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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Name: game_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_game_id_seq OWNED BY public.game.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    total_games_played integer NOT NULL,
    best_game_guesses integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: game game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game ALTER COLUMN game_id SET DEFAULT nextval('public.game_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES (2, 12, 6);
INSERT INTO public.game VALUES (3, 12, 3);
INSERT INTO public.game VALUES (4, 12, 1);
INSERT INTO public.game VALUES (5, 12, 1);
INSERT INTO public.game VALUES (6, 13, 161);
INSERT INTO public.game VALUES (7, 13, 752);
INSERT INTO public.game VALUES (8, 14, 68);
INSERT INTO public.game VALUES (9, 14, 220);
INSERT INTO public.game VALUES (10, 13, 925);
INSERT INTO public.game VALUES (11, 13, 652);
INSERT INTO public.game VALUES (12, 13, 480);
INSERT INTO public.game VALUES (13, 15, 272);
INSERT INTO public.game VALUES (14, 15, 688);
INSERT INTO public.game VALUES (15, 16, 529);
INSERT INTO public.game VALUES (16, 16, 457);
INSERT INTO public.game VALUES (17, 15, 276);
INSERT INTO public.game VALUES (18, 15, 512);
INSERT INTO public.game VALUES (19, 15, 723);
INSERT INTO public.game VALUES (20, 17, 661);
INSERT INTO public.game VALUES (21, 17, 727);
INSERT INTO public.game VALUES (22, 18, 462);
INSERT INTO public.game VALUES (23, 18, 238);
INSERT INTO public.game VALUES (24, 17, 206);
INSERT INTO public.game VALUES (25, 17, 673);
INSERT INTO public.game VALUES (26, 17, 650);
INSERT INTO public.game VALUES (27, 19, 145);
INSERT INTO public.game VALUES (28, 19, 733);
INSERT INTO public.game VALUES (29, 20, 28);
INSERT INTO public.game VALUES (30, 20, 671);
INSERT INTO public.game VALUES (31, 19, 937);
INSERT INTO public.game VALUES (32, 19, 649);
INSERT INTO public.game VALUES (33, 19, 770);
INSERT INTO public.game VALUES (34, 12, 12);
INSERT INTO public.game VALUES (35, 21, 73);
INSERT INTO public.game VALUES (36, 21, 978);
INSERT INTO public.game VALUES (37, 22, 751);
INSERT INTO public.game VALUES (38, 22, 764);
INSERT INTO public.game VALUES (39, 21, 934);
INSERT INTO public.game VALUES (40, 21, 270);
INSERT INTO public.game VALUES (41, 21, 124);
INSERT INTO public.game VALUES (42, 23, 639);
INSERT INTO public.game VALUES (43, 23, 791);
INSERT INTO public.game VALUES (44, 24, 852);
INSERT INTO public.game VALUES (45, 24, 163);
INSERT INTO public.game VALUES (46, 23, 363);
INSERT INTO public.game VALUES (47, 23, 853);
INSERT INTO public.game VALUES (48, 23, 269);
INSERT INTO public.game VALUES (49, 25, 4);
INSERT INTO public.game VALUES (50, 25, 165);
INSERT INTO public.game VALUES (51, 26, 479);
INSERT INTO public.game VALUES (52, 26, 861);
INSERT INTO public.game VALUES (53, 25, 705);
INSERT INTO public.game VALUES (54, 25, 933);
INSERT INTO public.game VALUES (55, 25, 906);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (14, 'user_1728806739778', 2, 68);
INSERT INTO public.users VALUES (13, 'user_1728806739779', 5, 161);
INSERT INTO public.users VALUES (16, 'user_1728806815155', 2, 457);
INSERT INTO public.users VALUES (15, 'user_1728806815156', 5, 272);
INSERT INTO public.users VALUES (18, 'user_1728806861532', 2, 238);
INSERT INTO public.users VALUES (17, 'user_1728806861533', 5, 206);
INSERT INTO public.users VALUES (20, 'user_1728806939227', 2, 28);
INSERT INTO public.users VALUES (19, 'user_1728806939228', 5, 145);
INSERT INTO public.users VALUES (12, 'alishan', 5, 1);
INSERT INTO public.users VALUES (22, 'user_1728807310307', 2, 751);
INSERT INTO public.users VALUES (21, 'user_1728807310308', 5, 73);
INSERT INTO public.users VALUES (24, 'user_1728807355412', 2, 163);
INSERT INTO public.users VALUES (23, 'user_1728807355413', 5, 269);
INSERT INTO public.users VALUES (26, 'user_1728807422217', 2, 479);
INSERT INTO public.users VALUES (25, 'user_1728807422218', 5, 4);


--
-- Name: game_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_game_id_seq', 55, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 26, true);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: game game_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

