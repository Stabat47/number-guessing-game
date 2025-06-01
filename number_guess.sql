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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 9);
INSERT INTO public.games VALUES (2, 10, 567);
INSERT INTO public.games VALUES (3, 10, 417);
INSERT INTO public.games VALUES (4, 11, 725);
INSERT INTO public.games VALUES (5, 11, 616);
INSERT INTO public.games VALUES (6, 10, 706);
INSERT INTO public.games VALUES (7, 10, 990);
INSERT INTO public.games VALUES (8, 10, 558);
INSERT INTO public.games VALUES (9, 12, 14);
INSERT INTO public.games VALUES (10, 12, 661);
INSERT INTO public.games VALUES (11, 13, 631);
INSERT INTO public.games VALUES (12, 13, 46);
INSERT INTO public.games VALUES (13, 12, 352);
INSERT INTO public.games VALUES (14, 12, 641);
INSERT INTO public.games VALUES (15, 12, 910);
INSERT INTO public.games VALUES (16, 14, 10);
INSERT INTO public.games VALUES (17, 14, 258);
INSERT INTO public.games VALUES (18, 15, 903);
INSERT INTO public.games VALUES (19, 15, 546);
INSERT INTO public.games VALUES (20, 14, 67);
INSERT INTO public.games VALUES (21, 14, 458);
INSERT INTO public.games VALUES (22, 14, 269);
INSERT INTO public.games VALUES (23, 16, 545);
INSERT INTO public.games VALUES (24, 16, 747);
INSERT INTO public.games VALUES (25, 17, 607);
INSERT INTO public.games VALUES (26, 17, 218);
INSERT INTO public.games VALUES (27, 16, 641);
INSERT INTO public.games VALUES (28, 16, 298);
INSERT INTO public.games VALUES (29, 16, 656);
INSERT INTO public.games VALUES (30, 18, 597);
INSERT INTO public.games VALUES (31, 18, 235);
INSERT INTO public.games VALUES (32, 19, 589);
INSERT INTO public.games VALUES (33, 19, 433);
INSERT INTO public.games VALUES (34, 18, 70);
INSERT INTO public.games VALUES (35, 18, 23);
INSERT INTO public.games VALUES (36, 18, 109);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'don', 1, 11);
INSERT INTO public.users VALUES (3, 'user_1748769459348', 2, 32);
INSERT INTO public.users VALUES (2, 'user_1748769459349', 5, 125);
INSERT INTO public.users VALUES (5, 'user_1748769518496', 2, 552);
INSERT INTO public.users VALUES (4, 'user_1748769518497', 5, 405);
INSERT INTO public.users VALUES (7, 'user_1748769550295', 2, 391);
INSERT INTO public.users VALUES (6, 'user_1748769550296', 5, 75);
INSERT INTO public.users VALUES (9, 'user_1748770096763', 2, 191);
INSERT INTO public.users VALUES (8, 'user_1748770096764', 5, 15);
INSERT INTO public.users VALUES (10, 'user_1748770458340', 0, NULL);
INSERT INTO public.users VALUES (11, 'user_1748770458339', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1748770653536', 0, NULL);
INSERT INTO public.users VALUES (13, 'user_1748770653535', 0, NULL);
INSERT INTO public.users VALUES (14, 'user_1748770691965', 0, NULL);
INSERT INTO public.users VALUES (15, 'user_1748770691964', 0, NULL);
INSERT INTO public.users VALUES (16, 'user_1748770729423', 0, NULL);
INSERT INTO public.users VALUES (17, 'user_1748770729422', 0, NULL);
INSERT INTO public.users VALUES (18, 'user_1748770826255', 0, NULL);
INSERT INTO public.users VALUES (19, 'user_1748770826254', 0, NULL);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 36, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 19, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


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
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

