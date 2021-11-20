--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: almadoni
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    fullname character varying(100) NOT NULL,
    created_on timestamp without time zone DEFAULT now(),
    last_login timestamp without time zone,
    session_id character varying(100),
    firebase_id character varying(150),
    mahasiswa_id character varying(100),
    status character varying(100),
    active boolean
);


ALTER TABLE public.accounts OWNER TO almadoni;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: almadoni
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO almadoni;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: almadoni
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: exam; Type: TABLE; Schema: public; Owner: almadoni
--

CREATE TABLE public.exam (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    materi_id integer NOT NULL,
    create_date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.exam OWNER TO almadoni;

--
-- Name: exam_id_seq; Type: SEQUENCE; Schema: public; Owner: almadoni
--

CREATE SEQUENCE public.exam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exam_id_seq OWNER TO almadoni;

--
-- Name: exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: almadoni
--

ALTER SEQUENCE public.exam_id_seq OWNED BY public.exam.id;


--
-- Name: materi; Type: TABLE; Schema: public; Owner: almadoni
--

CREATE TABLE public.materi (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    create_date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.materi OWNER TO almadoni;

--
-- Name: materi_assign; Type: TABLE; Schema: public; Owner: almadoni
--

CREATE TABLE public.materi_assign (
    id integer NOT NULL,
    materi_id integer NOT NULL,
    account_id integer NOT NULL,
    create_date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.materi_assign OWNER TO almadoni;

--
-- Name: materi_assign_id_seq; Type: SEQUENCE; Schema: public; Owner: almadoni
--

CREATE SEQUENCE public.materi_assign_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materi_assign_id_seq OWNER TO almadoni;

--
-- Name: materi_assign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: almadoni
--

ALTER SEQUENCE public.materi_assign_id_seq OWNED BY public.materi_assign.id;


--
-- Name: materi_id_seq; Type: SEQUENCE; Schema: public; Owner: almadoni
--

CREATE SEQUENCE public.materi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materi_id_seq OWNER TO almadoni;

--
-- Name: materi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: almadoni
--

ALTER SEQUENCE public.materi_id_seq OWNED BY public.materi.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: exam id; Type: DEFAULT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.exam ALTER COLUMN id SET DEFAULT nextval('public.exam_id_seq'::regclass);


--
-- Name: materi id; Type: DEFAULT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.materi ALTER COLUMN id SET DEFAULT nextval('public.materi_id_seq'::regclass);


--
-- Name: materi_assign id; Type: DEFAULT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.materi_assign ALTER COLUMN id SET DEFAULT nextval('public.materi_assign_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.accounts (id, username, password, email, fullname, created_on, last_login, session_id, firebase_id, mahasiswa_id, status, active) FROM stdin;
2	nola	nola	nola@test.net	Nola	2021-11-16 08:34:29.43776	\N	\N	2323	009	\N	\N
3	udin	12345	udin@test.net	Udin	2021-11-17 04:07:01.210256	\N	\N	\N	02584644	\N	\N
4	romeo	123456	romeo@test.net	Remoe	2021-11-17 12:45:47.859644	\N	\N	\N	0546346	\N	\N
5	amir	12345	amir@test.mn	amir oke	2021-11-17 16:44:57.39173	\N	\N	\N	958425	\N	\N
6			text\n		2021-11-17 17:48:59.228305	\N	\N	\N	1234	\N	\N
11	Ajo rajo	12345	aji@test.m	ajo singa	2021-11-18 13:09:55.477377	\N	\N	\N	08526669	\N	\N
12	mesi	12345	test.m	mesi	2021-11-18 13:12:56.47992	\N	\N	\N	12345	\N	\N
13	uji coba	cobaisjs	test@oke.m	uji	2021-11-18 14:31:17.91324	\N	\N	\N	0854646	\N	\N
22	uko	12345	test@test.m	Amir	2021-11-19 14:22:12.626541	\N	\N	\N	055847	\N	\N
23	ilham	coba20	ilhamtp2008@gmail.com	ihshwj	2021-11-19 14:40:30.123674	\N	\N	\N	31213	\N	\N
1	almadoni	doni	almadoni@gmail.com	Almadoni	2021-11-16 06:46:14.95572	2021-11-20 15:05:31.745	\N	\N	\N	Admin	\N
\.


--
-- Data for Name: exam; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.exam (id, name, materi_id, create_date) FROM stdin;
2	Latihan Materi 1	1	2021-11-17 06:18:01.476694
3	Latihan Materi 2	2	2021-11-17 06:19:28.720595
4	Latihan Materi 3	3	2021-11-17 06:19:34.285135
5	Latihan Materi 4	4	2021-11-17 06:19:40.882556
\.


--
-- Data for Name: materi; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.materi (id, name, create_date) FROM stdin;
1	Politik dan Pemerintahan di Indonesia	2021-11-17 06:03:20.637438
2	Kegiatan Ekonomi, Uang dan Koperasi	2021-11-17 06:03:37.733136
3	Pasar, Kesejahtraan dan Perdagangan Internasional	2021-11-17 06:04:05.482091
4	Interaksi dalam Perkembangan IPTEK dan Masyarakat Global	2021-11-17 06:04:29.537983
\.


--
-- Data for Name: materi_assign; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.materi_assign (id, materi_id, account_id, create_date) FROM stdin;
1	1	3	2021-11-17 06:07:18.176707
2	2	3	2021-11-17 06:07:23.023479
3	1	23	2021-11-19 14:44:17.07329
4	2	23	2021-11-19 14:44:22.324381
5	3	23	2021-11-19 14:44:26.003464
6	4	23	2021-11-19 14:44:30.515992
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.accounts_id_seq', 29, true);


--
-- Name: exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.exam_id_seq', 5, true);


--
-- Name: materi_assign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.materi_assign_id_seq', 6, true);


--
-- Name: materi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.materi_id_seq', 4, true);


--
-- Name: accounts accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_email_key UNIQUE (email);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: accounts accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_username_key UNIQUE (username);


--
-- Name: exam exam_pkey; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (id);


--
-- Name: materi_assign materi_assign_pkey; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.materi_assign
    ADD CONSTRAINT materi_assign_pkey PRIMARY KEY (id);


--
-- Name: materi materi_pkey; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.materi
    ADD CONSTRAINT materi_pkey PRIMARY KEY (id);


--
-- Name: idx_accounts_username; Type: INDEX; Schema: public; Owner: almadoni
--

CREATE INDEX idx_accounts_username ON public.accounts USING btree (username);


--
-- Name: exam exam_materi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_materi_id_fkey FOREIGN KEY (materi_id) REFERENCES public.materi(id);


--
-- Name: materi_assign materi_assign_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.materi_assign
    ADD CONSTRAINT materi_assign_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: materi_assign materi_assign_materi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.materi_assign
    ADD CONSTRAINT materi_assign_materi_id_fkey FOREIGN KEY (materi_id) REFERENCES public.materi(id);


--
-- PostgreSQL database dump complete
--

