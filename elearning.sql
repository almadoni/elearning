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
-- Name: commentar; Type: TABLE; Schema: public; Owner: almadoni
--

CREATE TABLE public.commentar (
    id integer NOT NULL,
    discussion_id integer,
    comment character varying(255) NOT NULL,
    user_id integer,
    created_date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.commentar OWNER TO almadoni;

--
-- Name: commentar_id_seq; Type: SEQUENCE; Schema: public; Owner: almadoni
--

CREATE SEQUENCE public.commentar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commentar_id_seq OWNER TO almadoni;

--
-- Name: commentar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: almadoni
--

ALTER SEQUENCE public.commentar_id_seq OWNED BY public.commentar.id;


--
-- Name: discussion; Type: TABLE; Schema: public; Owner: almadoni
--

CREATE TABLE public.discussion (
    id integer NOT NULL,
    materi character varying(255) NOT NULL,
    posted_by integer,
    create_date timestamp without time zone DEFAULT now(),
    actived integer DEFAULT 0
);


ALTER TABLE public.discussion OWNER TO almadoni;

--
-- Name: discussion_id_seq; Type: SEQUENCE; Schema: public; Owner: almadoni
--

CREATE SEQUENCE public.discussion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discussion_id_seq OWNER TO almadoni;

--
-- Name: discussion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: almadoni
--

ALTER SEQUENCE public.discussion_id_seq OWNED BY public.discussion.id;


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
-- Name: commentar id; Type: DEFAULT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.commentar ALTER COLUMN id SET DEFAULT nextval('public.commentar_id_seq'::regclass);


--
-- Name: discussion id; Type: DEFAULT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.discussion ALTER COLUMN id SET DEFAULT nextval('public.discussion_id_seq'::regclass);


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
11	Ajo rajo	12345	aji@test.m	ajo singa	2021-11-18 13:09:55.477377	\N	\N	\N	08526669	\N	\N
12	mesi	12345	test.m	mesi	2021-11-18 13:12:56.47992	\N	\N	\N	12345	\N	\N
13	uji coba	cobaisjs	test@oke.m	uji	2021-11-18 14:31:17.91324	\N	\N	\N	0854646	\N	\N
22	uko	12345	test@test.m	Amir	2021-11-19 14:22:12.626541	\N	\N	\N	055847	\N	\N
23	ilham	coba20	ilhamtp2008@gmail.com	ihshwj	2021-11-19 14:40:30.123674	\N	\N	\N	31213	\N	\N
1	almadoni	doni	almadoni@gmail.com	Almadoni	2021-11-16 06:46:14.95572	2021-11-23 14:08:59.511	\N	\N	\N	Admin	\N
\.


--
-- Data for Name: commentar; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.commentar (id, discussion_id, comment, user_id, created_date) FROM stdin;
1	1	oke lah ya	1	2021-11-21 23:47:05.079504
2	2	biasa aja kayaknya...	1	2021-11-21 23:47:45.372921
3	\N	coba buat online	1	2021-11-22 16:19:18.977153
4	\N	buat baru om	1	2021-11-22 16:23:45.008095
5	\N	test	1	2021-11-22 16:28:26.493178
6	\N	koment interaksi dr hp	1	2021-11-22 16:31:33.129151
7	\N	dr hp no 4	1	2021-11-22 16:33:18.504887
8	\N	test	1	2021-11-22 16:37:34.338976
9	4	harusnya sdh ada ini\n\nbenar or betul???	1	2021-11-22 16:45:23.264972
10	4	lagi	1	2021-11-22 16:46:54.172428
11	4	coba terus	1	2021-11-22 16:49:01.52247
12	4	ini ke 4 ya	1	2021-11-22 16:52:27.048843
13	4	ini ke 5 ya	1	2021-11-22 16:54:15.733714
14	3	ini satu 1	1	2021-11-22 16:54:40.60395
15	3	ini dua ya	1	2021-11-22 16:55:18.755733
16	4	klu 6 gmn	1	2021-11-22 16:57:36.631426
17	1	ikut komet ya	3	2021-11-22 16:59:47.063777
18	4	ke 7 gmn	3	2021-11-22 22:42:41.040634
\.


--
-- Data for Name: discussion; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.discussion (id, materi, posted_by, create_date, actived) FROM stdin;
1	Politik dan Pemerintahan di Indonesia	1	2021-11-20 23:37:08.1333	0
2	Kegiatan Ekonomi, Uang dan Koperasi	1	2021-11-20 23:37:08.1333	0
3	Pasar, Kesejahtraan dan Perdagangan Internasional	1	2021-11-20 23:37:08.1333	0
4	Interaksi dalam Perkembangan IPTEK dan Masyarakat Global	1	2021-11-20 23:37:08.1333	0
5	test buat topik baru	3	2021-11-22 23:42:07.371095	0
25	klau gini gmn om...	3	2021-11-23 14:03:45.92334	0
26	ini harus di atas	3	2021-11-23 14:04:46.630704	0
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
-- Name: commentar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.commentar_id_seq', 18, true);


--
-- Name: discussion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.discussion_id_seq', 26, true);


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
-- Name: commentar commentar_pkey; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.commentar
    ADD CONSTRAINT commentar_pkey PRIMARY KEY (id);


--
-- Name: discussion discussion_pkey; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.discussion
    ADD CONSTRAINT discussion_pkey PRIMARY KEY (id);


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
-- Name: idx_comment_discussionid_comment; Type: INDEX; Schema: public; Owner: almadoni
--

CREATE INDEX idx_comment_discussionid_comment ON public.commentar USING btree (discussion_id, comment);


--
-- Name: idx_discussion_materi; Type: INDEX; Schema: public; Owner: almadoni
--

CREATE INDEX idx_discussion_materi ON public.discussion USING btree (materi);


--
-- Name: idx_materi_name; Type: INDEX; Schema: public; Owner: almadoni
--

CREATE INDEX idx_materi_name ON public.materi USING btree (name);


--
-- Name: commentar commentar_discussion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.commentar
    ADD CONSTRAINT commentar_discussion_id_fkey FOREIGN KEY (discussion_id) REFERENCES public.discussion(id);


--
-- Name: commentar commentar_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.commentar
    ADD CONSTRAINT commentar_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.accounts(id);


--
-- Name: discussion discussion_posted_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.discussion
    ADD CONSTRAINT discussion_posted_by_fkey FOREIGN KEY (posted_by) REFERENCES public.accounts(id);


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

