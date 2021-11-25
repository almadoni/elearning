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
-- Name: answer; Type: TABLE; Schema: public; Owner: almadoni
--

CREATE TABLE public.answer (
    id integer NOT NULL,
    option1 character varying(255) NOT NULL,
    option2 character varying(255) NOT NULL,
    option3 character varying(255) NOT NULL,
    option4 character varying(255) NOT NULL,
    option_answer integer NOT NULL,
    question_id integer
);


ALTER TABLE public.answer OWNER TO almadoni;

--
-- Name: answer_id_seq; Type: SEQUENCE; Schema: public; Owner: almadoni
--

CREATE SEQUENCE public.answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answer_id_seq OWNER TO almadoni;

--
-- Name: answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: almadoni
--

ALTER SEQUENCE public.answer_id_seq OWNED BY public.answer.id;


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
-- Name: poin_exam; Type: TABLE; Schema: public; Owner: almadoni
--

CREATE TABLE public.poin_exam (
    id integer NOT NULL,
    exam_id integer,
    user_id integer,
    transaction_number character varying(100),
    score integer NOT NULL,
    create_date timestamp without time zone DEFAULT now(),
    status integer
);


ALTER TABLE public.poin_exam OWNER TO almadoni;

--
-- Name: poin_exam_detail; Type: TABLE; Schema: public; Owner: almadoni
--

CREATE TABLE public.poin_exam_detail (
    id integer NOT NULL,
    poin_exam_id integer,
    answer integer,
    istrue boolean,
    created_date timestamp without time zone DEFAULT now(),
    answer_id integer
);


ALTER TABLE public.poin_exam_detail OWNER TO almadoni;

--
-- Name: poin_exam_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: almadoni
--

CREATE SEQUENCE public.poin_exam_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poin_exam_detail_id_seq OWNER TO almadoni;

--
-- Name: poin_exam_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: almadoni
--

ALTER SEQUENCE public.poin_exam_detail_id_seq OWNED BY public.poin_exam_detail.id;


--
-- Name: poin_exam_id_seq; Type: SEQUENCE; Schema: public; Owner: almadoni
--

CREATE SEQUENCE public.poin_exam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poin_exam_id_seq OWNER TO almadoni;

--
-- Name: poin_exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: almadoni
--

ALTER SEQUENCE public.poin_exam_id_seq OWNED BY public.poin_exam.id;


--
-- Name: question; Type: TABLE; Schema: public; Owner: almadoni
--

CREATE TABLE public.question (
    id integer NOT NULL,
    exam_id integer,
    name character varying(255) NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.question OWNER TO almadoni;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: almadoni
--

CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO almadoni;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: almadoni
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: answer id; Type: DEFAULT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.answer ALTER COLUMN id SET DEFAULT nextval('public.answer_id_seq'::regclass);


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
-- Name: poin_exam id; Type: DEFAULT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.poin_exam ALTER COLUMN id SET DEFAULT nextval('public.poin_exam_id_seq'::regclass);


--
-- Name: poin_exam_detail id; Type: DEFAULT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.poin_exam_detail ALTER COLUMN id SET DEFAULT nextval('public.poin_exam_detail_id_seq'::regclass);


--
-- Name: question id; Type: DEFAULT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


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
30	text\n	text	text\n	text\n	2021-11-23 15:02:11.265382	\N	\N	\N	1234	\N	\N
23	ilham	coba20	ilhamtp2008@gmail.com	ihshwj	2021-11-19 14:40:30.123674	2021-11-24 14:30:03.709	\N	\N	31213	\N	\N
1	almadoni	doni	almadoni@gmail.com	Almadoni	2021-11-16 06:46:14.95572	2021-11-25 14:03:56.472	\N	\N	\N	Admin	\N
\.


--
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.answer (id, option1, option2, option3, option4, option_answer, question_id) FROM stdin;
1	Komik	Pancasila	Majalah	Koran	2	2
2	Yogyakarta	Medan	DKI Jakarta	Surabaya	3	3
\.


--
-- Data for Name: commentar; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.commentar (id, discussion_id, comment, user_id, created_date) FROM stdin;
1	1	oke lah ya	1	2021-11-21 23:47:05.079504
2	2	biasa aja kayaknya...	1	2021-11-21 23:47:45.372921
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
19	27	jdjdidisjsueisnsidjejdi	23	2021-11-23 21:30:56.079144
20	27	menurut saya\n	23	2021-11-23 21:31:09.317158
21	4	tes	23	2021-11-23 21:31:29.081415
22	27	ikutan koment ciek	3	2021-11-23 22:12:46.512966
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
27	baru lho	23	2021-11-23 21:30:32.37044	0
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
-- Data for Name: poin_exam; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.poin_exam (id, exam_id, user_id, transaction_number, score, create_date, status) FROM stdin;
1	2	2	abc1234	0	2021-11-23 23:13:25.070235	0
7	2	3	\N	0	2021-11-25 00:03:18.44623	0
8	2	4	\N	0	2021-11-25 06:43:02.74211	0
9	2	5	\N	0	2021-11-25 06:47:03.622254	0
11	2	11	\N	200	2021-11-25 06:52:09.587159	1
\.


--
-- Data for Name: poin_exam_detail; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.poin_exam_detail (id, poin_exam_id, answer, istrue, created_date, answer_id) FROM stdin;
3	1	3	t	2021-11-23 23:26:08.554172	2
1	1	2	t	2021-11-23 23:15:59.531272	1
6	7	3	t	2021-11-25 04:32:02.096325	2
7	7	3	f	2021-11-25 06:41:24.656614	1
8	9	2	\N	2021-11-25 06:47:03.626031	1
9	11	2	t	2021-11-25 06:52:09.592097	1
10	11	1	f	2021-11-25 13:17:28.643774	2
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.question (id, exam_id, name, create_by, create_date) FROM stdin;
2	2	Apa dasar negara Indonesia	1	2021-11-23 23:01:35.122801
3	2	Apa nama ibu kota Indonesia	1	2021-11-23 23:02:44.724166
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.accounts_id_seq', 31, true);


--
-- Name: answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.answer_id_seq', 2, true);


--
-- Name: commentar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.commentar_id_seq', 22, true);


--
-- Name: discussion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.discussion_id_seq', 27, true);


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
-- Name: poin_exam_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.poin_exam_detail_id_seq', 10, true);


--
-- Name: poin_exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.poin_exam_id_seq', 11, true);


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.question_id_seq', 3, true);


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
-- Name: answer answer_pkey; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);


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
-- Name: poin_exam_detail poin_exam_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.poin_exam_detail
    ADD CONSTRAINT poin_exam_detail_pkey PRIMARY KEY (id);


--
-- Name: poin_exam poin_exam_pkey; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.poin_exam
    ADD CONSTRAINT poin_exam_pkey PRIMARY KEY (id);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


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
-- Name: answer answer_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(id);


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
-- Name: poin_exam_detail poin_exam_detail_answer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.poin_exam_detail
    ADD CONSTRAINT poin_exam_detail_answer_id_fkey FOREIGN KEY (answer_id) REFERENCES public.answer(id);


--
-- Name: poin_exam_detail poin_exam_detail_poin_exam_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.poin_exam_detail
    ADD CONSTRAINT poin_exam_detail_poin_exam_id_fkey FOREIGN KEY (poin_exam_id) REFERENCES public.poin_exam(id);


--
-- Name: poin_exam poin_exam_exam_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.poin_exam
    ADD CONSTRAINT poin_exam_exam_id_fkey FOREIGN KEY (exam_id) REFERENCES public.exam(id);


--
-- Name: poin_exam poin_exam_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.poin_exam
    ADD CONSTRAINT poin_exam_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.accounts(id);


--
-- Name: question question_create_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_create_by_fkey FOREIGN KEY (create_by) REFERENCES public.accounts(id);


--
-- Name: question question_exam_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_exam_id_fkey FOREIGN KEY (exam_id) REFERENCES public.exam(id);


--
-- PostgreSQL database dump complete
--

