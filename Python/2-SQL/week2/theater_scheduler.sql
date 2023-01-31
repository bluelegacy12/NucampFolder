--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: conflicts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conflicts (
    date date NOT NULL
);


ALTER TABLE public.conflicts OWNER TO postgres;

--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    id integer NOT NULL,
    name text NOT NULL,
    email character varying(255) NOT NULL,
    phone character(10) NOT NULL,
    conflicts date
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: directors_conflicts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors_conflicts (
    director_id integer NOT NULL,
    conflict_date date NOT NULL
);


ALTER TABLE public.directors_conflicts OWNER TO postgres;

--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_id_seq OWNER TO postgres;

--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_id_seq OWNED BY public.directors.id;


--
-- Name: performers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.performers (
    id integer NOT NULL,
    name text NOT NULL,
    email character varying(255) NOT NULL,
    phone character(10) NOT NULL,
    conflicts date
);


ALTER TABLE public.performers OWNER TO postgres;

--
-- Name: performers_conflicts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.performers_conflicts (
    performer_id integer NOT NULL,
    conflict_date date NOT NULL
);


ALTER TABLE public.performers_conflicts OWNER TO postgres;

--
-- Name: performers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.performers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.performers_id_seq OWNER TO postgres;

--
-- Name: performers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.performers_id_seq OWNED BY public.performers.id;


--
-- Name: rehearsal_venues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rehearsal_venues (
    id integer NOT NULL,
    name text NOT NULL,
    location text NOT NULL
);


ALTER TABLE public.rehearsal_venues OWNER TO postgres;

--
-- Name: rehearsal_venue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rehearsal_venue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rehearsal_venue_id_seq OWNER TO postgres;

--
-- Name: rehearsal_venue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rehearsal_venue_id_seq OWNED BY public.rehearsal_venues.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name text NOT NULL,
    show_id integer NOT NULL,
    performer_id integer NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: scenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scenes (
    id integer NOT NULL,
    show_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.scenes OWNER TO postgres;

--
-- Name: scenes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scenes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scenes_id_seq OWNER TO postgres;

--
-- Name: scenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scenes_id_seq OWNED BY public.scenes.id;


--
-- Name: scenes_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scenes_roles (
    scene_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.scenes_roles OWNER TO postgres;

--
-- Name: shows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shows (
    id integer NOT NULL,
    title text NOT NULL,
    rehearsal_start date NOT NULL,
    show_open date NOT NULL,
    director_id integer NOT NULL
);


ALTER TABLE public.shows OWNER TO postgres;

--
-- Name: shows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shows_id_seq OWNER TO postgres;

--
-- Name: shows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shows_id_seq OWNED BY public.shows.id;


--
-- Name: shows_venues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shows_venues (
    show_id integer NOT NULL,
    venue_id integer NOT NULL
);


ALTER TABLE public.shows_venues OWNER TO postgres;

--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN id SET DEFAULT nextval('public.directors_id_seq'::regclass);


--
-- Name: performers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performers ALTER COLUMN id SET DEFAULT nextval('public.performers_id_seq'::regclass);


--
-- Name: rehearsal_venues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rehearsal_venues ALTER COLUMN id SET DEFAULT nextval('public.rehearsal_venue_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: scenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scenes ALTER COLUMN id SET DEFAULT nextval('public.scenes_id_seq'::regclass);


--
-- Name: shows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shows ALTER COLUMN id SET DEFAULT nextval('public.shows_id_seq'::regclass);


--
-- Data for Name: conflicts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conflicts (date) FROM stdin;
2022-10-31
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (id, name, email, phone, conflicts) FROM stdin;
1	William Luis	w@email.com	2222222222	\N
\.


--
-- Data for Name: directors_conflicts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors_conflicts (director_id, conflict_date) FROM stdin;
\.


--
-- Data for Name: performers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.performers (id, name, email, phone, conflicts) FROM stdin;
1	Dylan	dylan@email.com	0000000000	\N
2	Alexis	alexis@email.com	1111111111	\N
\.


--
-- Data for Name: performers_conflicts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.performers_conflicts (performer_id, conflict_date) FROM stdin;
1	2022-10-31
\.


--
-- Data for Name: rehearsal_venues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rehearsal_venues (id, name, location) FROM stdin;
1	Main Stage	123 Theater St.
2	Dance Hall	456 Broadway Ave.
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, show_id, performer_id) FROM stdin;
2	Belle	2	2
3	Gaston	2	1
\.


--
-- Data for Name: scenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scenes (id, show_id, name) FROM stdin;
1	2	Prologue
2	2	Belle song
\.


--
-- Data for Name: scenes_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scenes_roles (scene_id, role_id) FROM stdin;
1	2
2	2
2	3
\.


--
-- Data for Name: shows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shows (id, title, rehearsal_start, show_open, director_id) FROM stdin;
2	Beauty and the Beast	2022-10-20	2022-12-01	1
\.


--
-- Data for Name: shows_venues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shows_venues (show_id, venue_id) FROM stdin;
2	1
2	2
\.


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_id_seq', 1, true);


--
-- Name: performers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.performers_id_seq', 2, true);


--
-- Name: rehearsal_venue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rehearsal_venue_id_seq', 2, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: scenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scenes_id_seq', 2, true);


--
-- Name: shows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shows_id_seq', 2, true);


--
-- Name: conflicts conflicts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conflicts
    ADD CONSTRAINT conflicts_pkey PRIMARY KEY (date);


--
-- Name: directors_conflicts directors_conflicts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors_conflicts
    ADD CONSTRAINT directors_conflicts_pkey PRIMARY KEY (director_id, conflict_date);


--
-- Name: directors directors_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_email_key UNIQUE (email);


--
-- Name: directors directors_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_name_key UNIQUE (name);


--
-- Name: directors directors_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_phone_key UNIQUE (phone);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: performers_conflicts performers_conflicts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performers_conflicts
    ADD CONSTRAINT performers_conflicts_pkey PRIMARY KEY (performer_id, conflict_date);


--
-- Name: performers performers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performers
    ADD CONSTRAINT performers_email_key UNIQUE (email);


--
-- Name: performers performers_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performers
    ADD CONSTRAINT performers_name_key UNIQUE (name);


--
-- Name: performers performers_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performers
    ADD CONSTRAINT performers_phone_key UNIQUE (phone);


--
-- Name: performers performers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performers
    ADD CONSTRAINT performers_pkey PRIMARY KEY (id);


--
-- Name: rehearsal_venues rehearsal_venue_location_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rehearsal_venues
    ADD CONSTRAINT rehearsal_venue_location_key UNIQUE (location);


--
-- Name: rehearsal_venues rehearsal_venue_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rehearsal_venues
    ADD CONSTRAINT rehearsal_venue_name_key UNIQUE (name);


--
-- Name: rehearsal_venues rehearsal_venue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rehearsal_venues
    ADD CONSTRAINT rehearsal_venue_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: scenes scenes_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scenes
    ADD CONSTRAINT scenes_name_key UNIQUE (name);


--
-- Name: scenes scenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scenes
    ADD CONSTRAINT scenes_pkey PRIMARY KEY (id);


--
-- Name: scenes_roles scenes_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scenes_roles
    ADD CONSTRAINT scenes_roles_pkey PRIMARY KEY (scene_id, role_id);


--
-- Name: shows shows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shows
    ADD CONSTRAINT shows_pkey PRIMARY KEY (id);


--
-- Name: shows shows_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shows
    ADD CONSTRAINT shows_title_key UNIQUE (title);


--
-- Name: shows_venues shows_venues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shows_venues
    ADD CONSTRAINT shows_venues_pkey PRIMARY KEY (show_id, venue_id);


--
-- Name: directors_conflicts fk_directors_conflicts_conflicts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors_conflicts
    ADD CONSTRAINT fk_directors_conflicts_conflicts FOREIGN KEY (conflict_date) REFERENCES public.conflicts(date);


--
-- Name: directors_conflicts fk_directors_conflicts_directors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors_conflicts
    ADD CONSTRAINT fk_directors_conflicts_directors FOREIGN KEY (director_id) REFERENCES public.directors(id);


--
-- Name: performers_conflicts fk_performers_conflicts_conflicts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performers_conflicts
    ADD CONSTRAINT fk_performers_conflicts_conflicts FOREIGN KEY (conflict_date) REFERENCES public.conflicts(date);


--
-- Name: performers_conflicts fk_performers_conflicts_performers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performers_conflicts
    ADD CONSTRAINT fk_performers_conflicts_performers FOREIGN KEY (performer_id) REFERENCES public.performers(id);


--
-- Name: roles fk_roles_performers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT fk_roles_performers FOREIGN KEY (performer_id) REFERENCES public.performers(id);


--
-- Name: roles fk_roles_shows; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT fk_roles_shows FOREIGN KEY (show_id) REFERENCES public.shows(id);


--
-- Name: scenes_roles fk_scenes_roles_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scenes_roles
    ADD CONSTRAINT fk_scenes_roles_roles FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: scenes_roles fk_scenes_roles_scenes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scenes_roles
    ADD CONSTRAINT fk_scenes_roles_scenes FOREIGN KEY (scene_id) REFERENCES public.scenes(id);


--
-- Name: scenes fk_scenes_shows; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scenes
    ADD CONSTRAINT fk_scenes_shows FOREIGN KEY (show_id) REFERENCES public.shows(id);


--
-- Name: shows fk_shows_directors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shows
    ADD CONSTRAINT fk_shows_directors FOREIGN KEY (director_id) REFERENCES public.directors(id);


--
-- Name: shows_venues fk_shows_venues_shows; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shows_venues
    ADD CONSTRAINT fk_shows_venues_shows FOREIGN KEY (show_id) REFERENCES public.shows(id);


--
-- Name: shows_venues fk_shows_venues_venues; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shows_venues
    ADD CONSTRAINT fk_shows_venues_venues FOREIGN KEY (venue_id) REFERENCES public.rehearsal_venues(id);


--
-- PostgreSQL database dump complete
--

