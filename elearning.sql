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
    firebase_id character varying(255),
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
    question_id integer,
    option5 character varying(255)
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
    create_date timestamp without time zone DEFAULT now(),
    path character varying(255)
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
    name text NOT NULL,
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
-- Name: usage_history; Type: TABLE; Schema: public; Owner: almadoni
--

CREATE TABLE public.usage_history (
    id integer NOT NULL,
    user_id integer,
    type character varying(100) NOT NULL,
    description character varying(150),
    create_date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.usage_history OWNER TO almadoni;

--
-- Name: usage_history_id_seq; Type: SEQUENCE; Schema: public; Owner: almadoni
--

CREATE SEQUENCE public.usage_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usage_history_id_seq OWNER TO almadoni;

--
-- Name: usage_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: almadoni
--

ALTER SEQUENCE public.usage_history_id_seq OWNED BY public.usage_history.id;


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
-- Name: usage_history id; Type: DEFAULT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.usage_history ALTER COLUMN id SET DEFAULT nextval('public.usage_history_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.accounts (id, username, password, email, fullname, created_on, last_login, session_id, firebase_id, mahasiswa_id, status, active) FROM stdin;
2	nola	nola	nola@test.net	Nola	2021-11-16 08:34:29.43776	\N	\N	2323	009	\N	\N
4	romeo	123456	romeo@test.net	Remoe	2021-11-17 12:45:47.859644	\N	\N	\N	0546346	\N	\N
5	amir	12345	amir@test.mn	amir oke	2021-11-17 16:44:57.39173	\N	\N	\N	958425	\N	\N
11	Ajo rajo	12345	aji@test.m	ajo singa	2021-11-18 13:09:55.477377	\N	\N	\N	08526669	\N	\N
12	mesi	12345	test.m	mesi	2021-11-18 13:12:56.47992	\N	\N	\N	12345	\N	\N
13	uji coba	cobaisjs	test@oke.m	uji	2021-11-18 14:31:17.91324	\N	\N	\N	0854646	\N	\N
3	udin	12345	udin@test.net	Udin	2021-11-17 04:07:01.210256	\N	\N	eZZucGfqRnOq42AqyKp4ej:APA91bF8OM024r5K2sII842K8epIRQUvFpKoZ-PUpYtFUp70_h3HcU6wSOaiOAWJGFjcGBqdfnP4paBPBTShpONgOniD4by59nMezJGiEX6sO57Aq3KieRoMkMFppLtUzcm_Dwfgaw7k	02584644	\N	\N
23	ilham	coba20	ilhamtp2008@gmail.com	ihshwj	2021-11-19 14:40:30.123674	2021-11-24 14:30:03.709	\N	eZZucGfqRnOq42AqyKp4ej:APA91bF8OM024r5K2sII842K8epIRQUvFpKoZ-PUpYtFUp70_h3HcU6wSOaiOAWJGFjcGBqdfnP4paBPBTShpONgOniD4by59nMezJGiEX6sO57Aq3KieRoMkMFppLtUzcm_Dwfgaw7k	31213	\N	\N
22	uko	12345	test@test.m	Amir	2021-11-19 14:22:12.626541	\N	\N	\N	055847	\N	\N
1	almadoni	doni	almadoni@gmail.com	Almadoni	2021-11-16 06:46:14.95572	2021-11-27 13:32:46.476	\N	eZZucGfqRnOq42AqyKp4ej:APA91bF8OM024r5K2sII842K8epIRQUvFpKoZ-PUpYtFUp70_h3HcU6wSOaiOAWJGFjcGBqdfnP4paBPBTShpONgOniD4by59nMezJGiEX6sO57Aq3KieRoMkMFppLtUzcm_Dwfgaw7k	\N	Admin	\N
30	text\n	text	text\n	text\n	2021-11-23 15:02:11.265382	\N	\N	\N	1234	\N	\N
\.


--
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.answer (id, option1, option2, option3, option4, option_answer, question_id, option5) FROM stdin;
9	Politikos	Politik	Polis	Policy	2	17	Poli
10	 Hornby	Surbakti	Andrey Heywood	Budiardjo	3	18	Kartono
11	Faktor sifat kepribadian 	Faktor sosio-kognitif	Faktor-faktor psikodemografis	Faktor ekstraversi	3	19	Faktor media 
12	perwakilan presiden oleh wakil presiden jika presiden berhalangan	 lamanya presiden dan wakil presiden memegang jabatannya	hak presiden	sumpah janji presiden dan wakil presiden	2	20	presiden memegang kekuasaan
13	Hukum tertulis dan hukum tidak tertulis	Good governance dan clean government	Hukum transparancy dan hukum responsiveness	Hukum privat dan hukum publik	4	21	Hukum doktrin  dan Hukum adat
14	transparansi, penegakan hukum, partisipasi dan responsif	konsensus, kesetaraan, korup dan efektivitas 	efisiensi, akuntabilitas, ekslusif  dan visi strategis	responsif, provokatif, konsensus dan kesetaraan, 	1	22	efektivitas, efisiensi, akuntabilitas dan elitis
15	Parlementer	Presedensial	Liberal	Terpimpin	2	23	Mutlak 
16	Konfrensi Meja Bundar	Perjanjian Linggarjati	Disahkannya UUDS 1950	Supersemar	5	24	Dekrit Presiden 5 Juli 1959
17	Janur Kuning	Konstituante	G 30 S PKI	Maklumat X	3	25	APRA
18	 Partai Persatuan Pembangunan (PPP), Partai Demokrasi Indonesia (PDI), dan Golongan Karya (Golkar).	 Partai NU (PNU), Partai Demokrasi Indonesia (PDI), dan Golongan Karya (Golkar).	Partai Persatuan Pembangunan (PPP), Partai Nasional Indonesia (PNI), dan Golongan Karya (Golkar).	Partai Persatuan Pembangunan (PPP), Partai Demokrat Indonesia (PDI), dan Golongan Karya (Golkar).	1	26	Partai Karya Pembangunan (PPP), Partai Demokrasi Indonesia (PDI), dan Golongan Karya (Golkar).
19	15 partai politik	20 partai politik	24 partai politik	38 partai politik	2	27	48 partai politik
20	Ekologi	Ekonomi	Argonomi	Produksi	2	28	Koperasi 
21	Barang apa yang akan diproduksi, bagaimana barang tersebut diproduksi, untuk siapa barang tersebut diproduksi	Kebutuhan manusia adalah titik pangkal kegiatan perekonomian serta menjadi tujuan akhir kegiatan perekonomian	Manusia adalah makhluk yang tidak pernah merasa puas atas apa yang telah diperolehnya	Sebuah aksioma dalam ilmu ekonomi mengatakan bahwa manusia yang rasional selalu bertindak untuk memaksimalkan kepuasannya	1	29	Manusia yang rasional senantiasa berusaha memenuhi kepentingan pribadinya
22	Pemenuhan kebutuhan merupakan pendorong paling besar bagi manusia untuk melakukan kegiatan ekonomi 	Manusia yang rasional selalu bertindak untuk memaksimalkan kepuasannya 	Tindakan manusia yang dilakukan untuk memenuhi kebutuhan hidupnya	Kebutuhan manusia adalah titik pangkal kegiatan perekonomian	5	30	Dengan pengorbanan tertentu dapat memperoleh hasil/kepuasan yang setinggi-tingginya 
23	Rumah untuk tempat bernaung. 	Makanan dan minuman yang cukup.	Kendaraan yang cepat	Perawatan kesehatan dasar	3	31	Pakaian yang layak
24	Bertindak emosional, ekonomis dan menyusun skala prioritas	Bertindak rasional, ekonomis dan menyusun skala keinginan	Bertindak rasional, ekologis dan menyusun skala prioritas	Bertindak rasional, ekonomis dan menyusun skala prioritas	4	32	Bertindak sosial, ekonomis dan menyusun skala prioritas
25	Konsumsi	Distribusi	Produksi	Ekonomi	3	33	Prioritas
26	form utility, place utility, time utility dan ownership utility	quality utility, place utility, time utility dan ownership utility	form utility, place utility, package utility dan ownership utility	form utility, place utility, time utility dan input utility	1	34	form utility, place utility, input utility dan ownership utility
27	Modal	Sumberdaya	Kewirausahaan 	 Alam	3	35	Konsumsi
28	Utama	Priotitas	Pokok	Tambahan	4	36	Cadangan
29	Kebutuhan bertahan hidup dengan layak	Gaya hidup dan status sosial	Sumber kenyaman dan kemudahan	Kebutuhan dasar	2	37	Kebutuhan utama 
30	Perizinan, Adat Istiadat, Prakiraan harga dan Iklan	Penghasilan, Adat Istiadat, Prakiraan harga dan Iklan	Penghasilan, jumlah keluarga, Prakiraan harga dan Iklan	Kegunaan, Adat Istiadat, Prakiraan harga dan Iklan	2	38	Penghasilan, Adat Istiadat, Kenyamanan dan Iklan
31	Peraturan Presiden Republik Indonesia No.112 Tahun 2007	Peraturan Presiden Republik Indonesia No.112 Tahun 2008	Peraturan Presiden Republik Indonesia No.113 Tahun 2007	Peraturan Mentri Perdagangan Republik Indonesia No.112 Tahun 2007	1	39	Peraturan Mentri Perdagangan Republik Indonesia No.112 Tahun 2008
32	Pasar barang nyata dan pasar barang abstrak	Pasar persaingan sempurna dan pasar persaingan tidak sempurna	Pasar tradisional dan pasar modern	Pasar harian, pasar mingguan dan pasar bulanan	3	40	Pasar regional, pasar lingkungan dan pasar wilayah
33	Berdasarkan manajemennya	Berdasarkan strukturnya (jumlah penjual dan pembeli)	Berdasarkan waktu terjadinya pasar	Berdasarkan lokasi	2	41	Berdasarkan kemampuan pelayanannya
34	Menggunakan Data distribusi dan data pasar 	Menggunakan data pendapatan dan data konsumsi	Menggunakan data jaminan sosial dan rehabilitasi sosial	Menggunakan data kebahagian dan kepuasan	2	42	Menggunakan data produksi dan data konsumsi
35	Tingkat pembangunan manusia yang tinggi. 	Tingkat pembangunan manusia melalui lembaga pendidikan. 	Tingkat kesejahteraan 	Tingkat upah yang diterima	1	43	Tingkat perkembangan manusia
36	Terbentuknya persahabatan antar-negara	Meningkatkan kemakmuran	Menciptakan spesialisasi	Terbentuknya ketergantungan antar negara	4	44	Kestabilan harga
37	Jual-beli atau tukar-menukar barang dan jasa. 	Kerja sama di bidang ekonomi	Pertukaran politik negara	Pertukaran serta perluasan penggunaan teknologi.	3	45	Pergerakan sumber daya
38	Rate	Kurs	Exchange	Spot	2	46	Daily averages
39	6.98 USD	69.8 USD	143275.5 USD	1432755 USD	1	47	1432755000 USD 
40	Hotspot	Kreasi intelektual	Ekonomi kreatif	Daily averages	3	48	Ekonomi inovasi
41	Membuka lapangan pekerjaan baru bagi masyarakat Indonesia	Menguatkan nilai konsumsi masyarakat	Mengurangi pertumbuhan angka pengangguran	 Menciptakan masyarakat Indonesia yang kreatif dan inovatif	2	49	Kompetisi aktivitas dunia bisnis yang lebih sehat
42	Ilmu	Pengetahuan	Teknologi	Technicoas	1	50	IPTEK  
43	Pengetahuan yang terorganisir	Ilmu pengetahuan terapan	 Ilmu pengetahuan secara abstrak	Pembuatan penemuan baru, 	2	51	Terminologi
44	Pengertian ilmu pengetahuan dan teknologi	Dampak utama ilmu pengetahuan dan teknologi	Fungsi utama ilmu pengetahuan dan teknologi	Makna ilmu pengetahuan dan teknologi	3	52	Tantangan ilmu pengetahuan dan teknologi
45	Teknologi, manusia dan cara penggunaannya 	Alat, lingkungan, dan budaya	Manusia, alat, dan budaya	Manusia, lingkungan, dan budaya	4	53	Manusia, karakter, dan budaya
46	Memecahkan masalah	Membuat penemuan baru	 Menjawab pertanyaan	Menambah pengetahuan	1	54	Menciptakan taraf hidup
47	Manusia semakin kritis dalam berpikir dan semakin disiplin dalam bekerja	Semakin disiplin dalam bekerja dan semakin efisien dalam bertindak	Manusia semakin kritis dalam berpikir dan semakin efisien dalam bertindak	Merasa dibuai dengan semua fasilitas dan semakin efisien dalam bertindak	4	55	Semakin kritis dalam berpikir
48	Munculnya media masa elektronik yang dapat menjadi sumber ilmu dan informasi pendidikan.	Munculnya berbagai macam metode pembelajaran yang baru, sehingga memudahkan pelajar memahami materi-materi pelajaran. 	Meningkatkan produktivitas dalam dunia industri	Mempermudah sistem pembelajaran.	3	56	Mempermudah dalam mengolah data nilai dengan menggunakan IPTEK
49	Pendidikan	Ekonomi	Sosial budaya	Industri	3	57	Politik 
50	 Arus informasi yang berkembang cepat	Manusia sebagai pelaku yang menggeluti bidang penelitian dan Pengembangan serta rancang bangun dan perekayasaan.	Kearifan lokal yang dapat memberikan proteksi  masyarakat  	Modal yang dikeluarkan untuk pengembangan produk iptek	2	58	Lingkungan tempat pemanfaatan produk Iptek
51	Rendahnya kemampuan IPTEKS nasional dalam menghadapi perkembangan global	Rendahnya kontribusi IPTEKS nasional di sektor produksi  	 Lemahnya sinergi kebijakan IPTEKS	Kemerosotan moral di kalangan warga masyarakat.	4	59	Belum berkembangnya budaya IPTEKS di kalangan masyarakat
52	Kearifan lokal yang terdapat di masyarakat	Keinginan untuk belajar pada semua lapisan masyarakat	Mitigasi bencana yang sedang digalakkan 	 Penalaran objektif dan rasional	1	60	Pemahaman teknologi telah menjadi pengarah hidup manusia
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

COPY public.materi (id, name, create_date, path) FROM stdin;
1	Politik dan Pemerintahan di Indonesia	2021-11-17 06:03:20.637438	https://www.youtube.com/watch?v=9qWauD4cumE
2	Kegiatan Ekonomi, Uang dan Koperasi	2021-11-17 06:03:37.733136	https://www.youtube.com/watch?v=RRW2Cy2IR3U
3	Pasar, Kesejahtraan dan Perdagangan Internasional	2021-11-17 06:04:05.482091	https://www.youtube.com/watch?v=CwZHQusxdSw
4	Interaksi dalam Perkembangan IPTEK dan Masyarakat Global	2021-11-17 06:04:29.537983	https://www.youtube.com/watch?v=e38gK6qCMxA
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
7	1	1	2021-11-28 01:07:24.512209
8	2	1	2021-11-28 01:07:28.650662
9	3	1	2021-11-28 01:07:31.92488
10	4	1	2021-11-28 01:07:36.000536
\.


--
-- Data for Name: poin_exam; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.poin_exam (id, exam_id, user_id, transaction_number, score, create_date, status) FROM stdin;
57	3	23	kwh24v03	0	2021-11-27 00:10:27.699338	0
59	2	23	kwh3bjls	0	2021-11-27 00:43:39.136543	0
60	5	23	kwhsmvdr	0	2021-11-27 12:32:18.015267	0
58	4	23	kwh3b87k	27	2021-11-27 00:43:24.368738	1
61	3	3	kwhto7uf	0	2021-11-27 13:01:20.439419	0
56	2	3	kwh20j1i	100	2021-11-27 00:07:05.574448	1
\.


--
-- Data for Name: poin_exam_detail; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.poin_exam_detail (id, poin_exam_id, answer, istrue, created_date, answer_id) FROM stdin;
148	56	2	t	2021-11-27 00:07:05.577777	9
149	56	3	t	2021-11-27 00:07:07.023406	10
150	56	3	t	2021-11-27 00:07:08.922364	11
151	56	2	t	2021-11-27 00:07:12.852927	12
152	56	4	t	2021-11-27 00:07:13.840729	13
153	56	2	f	2021-11-27 00:07:14.817782	14
154	56	3	f	2021-11-27 00:07:15.802131	15
155	56	4	f	2021-11-27 00:07:16.986374	16
156	56	1	f	2021-11-27 00:07:20.377394	17
157	56	3	f	2021-11-27 00:07:22.616153	18
158	56	4	f	2021-11-27 00:07:24.472777	19
159	57	2	t	2021-11-27 00:10:27.701753	20
160	57	3	f	2021-11-27 00:10:29.389844	21
161	57	2	f	2021-11-27 00:10:32.760845	22
162	57	3	t	2021-11-27 00:10:34.317384	23
163	57	2	f	2021-11-27 00:10:36.089162	24
164	57	4	f	2021-11-27 00:10:38.183458	25
165	57	2	f	2021-11-27 00:10:40.093512	26
166	57	3	t	2021-11-27 00:10:41.945403	27
167	57	2	f	2021-11-27 00:10:43.493376	28
168	57	3	f	2021-11-27 00:10:46.838347	29
169	57	4	f	2021-11-27 00:10:49.180324	30
170	58	1	t	2021-11-27 00:43:24.375125	31
171	58	2	f	2021-11-27 00:43:28.917029	32
172	59	2	t	2021-11-27 00:43:39.138248	9
173	59	1	f	2021-11-27 00:43:43.62886	10
174	59	2	f	2021-11-27 00:43:45.277424	11
175	59	1	f	2021-11-27 00:43:47.921373	12
176	59	1	f	2021-11-27 00:43:49.788817	13
177	59	2	f	2021-11-27 00:43:51.986634	14
178	59	1	f	2021-11-27 00:43:53.329998	15
179	59	3	f	2021-11-27 00:43:55.200243	16
180	59	1	f	2021-11-27 00:43:57.672481	17
181	59	2	f	2021-11-27 00:44:00.017238	18
182	59	2	t	2021-11-27 00:44:02.732656	19
183	60	1	t	2021-11-27 12:32:18.020198	42
184	60	2	t	2021-11-27 12:32:20.21727	43
185	60	3	t	2021-11-27 12:32:21.480886	44
186	60	1	f	2021-11-27 12:32:22.754906	45
187	60	2	f	2021-11-27 12:32:24.020703	46
188	60	1	f	2021-11-27 12:32:25.86795	47
189	60	4	f	2021-11-27 12:32:28.377962	48
190	60	5	f	2021-11-27 12:32:30.391532	49
191	60	1	f	2021-11-27 12:32:31.993714	50
192	60	2	f	2021-11-27 12:32:34.063222	51
193	60	4	f	2021-11-27 12:32:35.871634	52
194	56	1	f	2021-11-27 12:52:02.589786	9
195	56	2	f	2021-11-27 12:52:09.502642	10
196	56	1	f	2021-11-27 12:52:11.517239	11
197	61	2	t	2021-11-27 13:01:20.44269	20
198	61	1	t	2021-11-27 13:01:22.551084	21
199	61	5	t	2021-11-27 13:01:28.161856	22
200	61	3	t	2021-11-27 13:01:32.58492	23
201	61	4	t	2021-11-27 13:01:35.779548	24
202	61	3	t	2021-11-27 13:01:38.593357	25
203	61	1	t	2021-11-27 13:01:44.016689	26
204	61	3	t	2021-11-27 13:01:49.600777	27
205	61	4	t	2021-11-27 13:01:55.773489	28
206	61	2	t	2021-11-27 13:02:03.190892	29
207	61	2	t	2021-11-27 13:02:07.323088	30
208	57	1	f	2021-11-28 00:47:52.699726	20
209	57	3	f	2021-11-28 00:47:59.053822	21
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.question (id, exam_id, name, create_by, create_date) FROM stdin;
17	2	Proses pembentukan dan pembagian kekuasaan dalam masyarakat yang antara lain berwujud proses pembuatan keputusan, khususnya dalam negara merupakan istilah menurut Kamus Besar Bahasa Indonesia untuk kata	1	2021-11-26 23:15:12.163633
18	2	Siapakah tokoh yang mengemukakan pandangan, bahwa politik itu adalah kegiatan suatu bangsa yang bertujuan untuk membuat, mempertahankan, dan mengamandemen peraturan-peraturan umum yang mengatur kehidupannya, yang berarti tidak dapat terlepas dari gejala konflik dan kerja sama....	1	2021-11-26 23:15:12.173471
19	2	Situasi pertetanggaan adalah salah satu faktor psikologis yang mempengaruhi Perilaku berpartisipasi dalam kegiatan politik, Situasi pertetanggaan adalah dikelompokkan pada faktor ….	1	2021-11-26 23:15:12.175753
20	2	Pasal 7 UUD 1945 mengatur tentang ….	1	2021-11-26 23:15:12.177854
21	2	Menurut isinya, hukum dibagi menjadi ….	1	2021-11-26 23:15:12.179782
22	2	Diantara prinsip-prinsip dasar pemerintahan yang baik adalah…	1	2021-11-26 23:15:12.181718
23	2	Bentuk pemerintahan Negara Indonesia setelah di proklamirkannya kemerdekaan adalah….	1	2021-11-26 23:15:12.18357
24	2	Penanda awal berlakunya demokrasi terpimpin di Indonesia adalah….	1	2021-11-26 23:15:12.185182
25	2	Pemberontakan yang dilakukan oleh Partai Komunis Indoesia di tahun 1965 dikenal dengan istilah ….	1	2021-11-26 23:15:12.188052
26	2	Pada tahun 1973, Presiden Soeharto memerintahkan untuk pelaksanaan penyederhanaan partai dan golongan, partai-partai dan golongan dimaksud adalah ….	1	2021-11-26 23:15:12.189762
27	2	Jumlah partai nasional kontestan pemilu 2019 adalah sebanyak….	1	2021-11-26 23:15:12.191512
28	3	 Ilmu yang mempelajari bagaimana manusia membuat pilihan- pilihan untuk menggunakan sumber daya yang terbatas dalam rangka memenuhi kebutuhan dan keinginan yang tidak terbatas merupakan definisi dari ….	1	2021-11-26 23:15:12.193067
29	3	Rumusan masalah ekonomi modern lebih spesifik yang dikemukakan oleh Sutatmi adalah :	1	2021-11-26 23:15:12.194631
30	3	Tindakan ekonomis yang dilakukan manusia didasari oleh apa yang disebut dengan prinsip ekonomi, yaitu ….	1	2021-11-26 23:15:12.196202
31	3	Pada dasarnya hanya ada empat hal yang dapat dikategorikan sebagai kebutuhan untuk dapat bertahan hidup, kecuali ….	1	2021-11-26 23:15:12.197813
32	3	Ciri manusia yang melakukan tindakan dengan dilandasi oleh prinsip ekonomi, adalah….	1	2021-11-26 23:15:12.199318
33	3	Memenuhi kebutuhan manusia dalam mencapai kemakmuran adalah tujuan dari …	1	2021-11-26 23:15:12.200884
34	3	Nilai guna barang yang dihasilkan atau bertambah akibat kegiatan produksi dapat dikategorikan sebagai berikut…	1	2021-11-26 23:15:12.20252
35	3	Efektifitas atau tingkat keberhasilan sebuah kegiatan produksi, baik kegiatan produksi barang maupun jasa, sangat tergantung dari kualitas dari faktor produksi, yaitu …	1	2021-11-26 23:15:12.20396
36	3	Memberi Informasi adalah salah satu fungsi distribusi dari kelompok …	1	2021-11-26 23:15:12.205557
37	3	Kebutuhan tersier adalah barang-barang yang disamping berfungsi untuk membantu kehidupan manusia namun juga berfungsi sebagai … 	1	2021-11-26 23:15:12.20701
38	3	Beberapa faktor yang menentukan besar kecilnya pengeluaran konsumsi yang dilakukan konsumen, diantaranya ….	1	2021-11-26 23:15:12.208517
39	4	Regulasi tentang Penataan dan Pembinaan Pasar Tradisional, Pusat Perbelanjaan dan Toko Modern adalah terdapat pada  ….	1	2021-11-26 23:15:12.210094
40	4	Menurut manajemennya, pasar dapat dibedakan menjadi...	1	2021-11-26 23:15:12.211587
41	4	Pasar persaingan sempurna dan Pasar persaingan tidak sempurna adalah pengelompokan pasar berdasarkan ….	1	2021-11-26 23:15:12.213244
42	4	2 cara yang dapat digunakan untuk mengukur kesejahteraan materi atau Indikator Kesejahteraan adalah ….	1	2021-11-26 23:15:12.214714
43	4	Brata mengemukakan bahwa kemampuan penduduk dalam mengelola sumber-sumber pertumbuhan ekonomi ditentukan oleh ….	1	2021-11-26 23:15:12.216221
44	4	Dampak negatif dari perdagangan internasional adalah…	1	2021-11-26 23:15:12.217776
45	4	Beberapa hal yang tidak terjadi ketika negara terlibat dalam perdagangan internasional adalah ….	1	2021-11-26 23:15:12.219264
46	4	Nilai mata uang yang dimiliki sebuah negara yang dinyatakan dengan nilai mata uang negara yang lain disebut dengan 	1	2021-11-26 23:15:12.220813
47	4	Nilai tukar dolar US saat ini terhadap rupiah adalah 1 USD = 14.440 IDR. Jika kita punya uang Rp 100.000.000. Setelah ditukar, mendapatkan uang $ sebesar….	1	2021-11-26 23:15:12.22242
48	4	Suatu konsep perekonomian di era ekonomi baru yang mengintensifkan informasi dan kreativitas, dengan mengedepankan ide dan berbagai pengetahuan dari sumber daya manusia itu sendiri disebut dengan ….	1	2021-11-26 23:15:12.225116
49	4	 Manfaat yang dapat diperoleh dengan berkembangannya bidang ekonomi kreatif ini, kecuali …	1	2021-11-26 23:15:12.227015
50	5	Melalui pikiran dan pikirannya agar menghasilkan pengetahuan yang bermakna sebagai seperangkat pengetahuan yang tersusun dalam suatu sistem aturan tertentu. Pengetahuan yang terorganisir ini disebut ….	1	2021-11-26 23:15:12.229874
51	5	Teknologi adalah istilah lain untuk	1	2021-11-26 23:15:12.231674
52	5	 Membantu manusia mempermudah kegiatan hidup, lancar, efisien, dan efektif, serta menjadikan hidupnya lebih bermakna dan efektif, hal ini adalah…	1	2021-11-26 23:15:12.233411
53	5	Dalam antropologi, terminologi atau pengertian ilmu pengetahuan dan teknologi sering digunakan untuk menyebut hubungan antara ….	1	2021-11-26 23:15:12.235028
54	5	Dalam penggunaan perangkat teknologi oleh manusia, ilmu pengetahuan digunakan untuk …	1	2021-11-26 23:15:12.236653
55	5	Suatu keadaan yang tidak seharusnya terjadi ketika semakin tinggi penguasaan atau semakin berkembangnya IPTEKS, akan terwujud…	1	2021-11-26 23:15:12.238359
56	5	Diantara manfaat perkembangan iptek di Indonesia pada bidang ekonomi adalah…	1	2021-11-26 23:15:12.239957
57	5	Kemajuan teknologi komunikasi yang cepat dapat mempermudah komunikasi antar manusia dari suatu tempat ke tempat yang lain adalah salah satu manfaat perkembangan IPTek di bidang	1	2021-11-26 23:15:12.241592
58	5	Faktor yang paling menentukan dalam hal penguasaan IPTEKS adalah….	1	2021-11-26 23:15:12.243154
59	5	Berikut adalah tantangan pengembangan iptek di indonesia, kecuali…	1	2021-11-26 23:15:12.244767
60	5	Proteksi  masyarakat  untuk  tetap  bertahan  di  tengah  perubahan  sosial yang  terjadi karena perkembangan iptek dewasa ini di Indonesia bisa diperoleh dari…	1	2021-11-26 23:15:12.246575
\.


--
-- Data for Name: usage_history; Type: TABLE DATA; Schema: public; Owner: almadoni
--

COPY public.usage_history (id, user_id, type, description, create_date) FROM stdin;
1	3	OPEN_KOMPENTENSI	Ketika membuka kompentensi	2021-11-27 22:42:54.339191
2	3	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-27 22:43:01.75454
3	3	PLAY_VIDEO	Ketika memulai memutar video	2021-11-27 22:43:10.78859
4	3	OPEN_EXAM	Ketika membuka menu ujian	2021-11-27 22:43:17.136664
5	3	PLAY_VIDEO	Ketika memulai memutar video	2021-11-27 23:38:15.777113
6	3	PLAY_VIDEO	Ketika memulai memutar video	2021-11-27 23:41:44.731197
7	3	PLAY_VIDEO	Ketika memulai memutar video	2021-11-27 23:42:34.146309
8	3	OPEN_SUB_MATERI	Ketika membuka sub menu, Politik dan Pemerintahan di Indonesia	2021-11-27 23:56:15.891256
9	3	PLAY_VIDEO	Ketika memulai memutar video	2021-11-27 23:56:21.443849
10	3	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-27 23:56:32.314937
11	3	OPEN_SUB_MATERI	Ketika membuka sub menu, Kegiatan Ekonomi, Uang dan Koperasi	2021-11-27 23:56:51.501122
12	3	OPEN_SUB_MATERI	Ketika membuka sub menu, Kegiatan Ekonomi, Uang dan Koperasi	2021-11-27 23:57:01.888878
13	3	OPEN_SUB_MATERI	Ketika membuka sub menu, Politik dan Pemerintahan di Indonesia	2021-11-28 00:11:51.235641
14	3	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 00:11:53.993529
15	3	OPEN_SUB_MATERI	Ketika membuka sub menu, Kegiatan Ekonomi, Uang dan Koperasi	2021-11-28 00:12:07.021373
16	3	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 00:12:08.258478
17	3	OPEN_SUB_MATERI	Ketika membuka sub menu, Kegiatan Ekonomi, Uang dan Koperasi	2021-11-28 00:22:09.437351
18	3	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 00:22:10.75106
19	3	OPEN_SUB_MATERI	Ketika membuka sub menu, Politik dan Pemerintahan di Indonesia	2021-11-28 00:22:24.329941
20	3	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 00:22:25.431734
21	3	OPEN_SUB_MATERI	Ketika membuka sub menu, Politik dan Pemerintahan di Indonesia	2021-11-28 00:26:15.539819
22	3	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 00:26:17.7428
23	3	OPEN_SUB_MATERI	Ketika membuka sub menu, Politik dan Pemerintahan di Indonesia	2021-11-28 00:27:41.441089
24	3	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 00:27:42.74031
25	3	OPEN_SUB_MATERI	Ketika membuka sub menu, Politik dan Pemerintahan di Indonesia	2021-11-28 00:29:27.758842
26	3	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 00:29:28.205527
27	3	OPEN_SUB_MATERI	Ketika membuka sub menu, Politik dan Pemerintahan di Indonesia	2021-11-28 00:32:38.775999
28	3	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 00:32:40.680567
29	3	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 00:34:27.768723
30	3	OPEN_SUB_MATERI	Ketika membuka sub menu, Politik dan Pemerintahan di Indonesia	2021-11-28 00:37:14.558693
31	3	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 00:37:15.763401
32	3	PLAY_VIDEO	Ketika memulai memutar video	2021-11-28 00:37:48.969684
33	23	OPEN_SUB_MATERI	Ketika membuka sub menu, Interaksi dalam Perkembangan IPTEK dan Masyarakat Global	2021-11-28 00:40:31.775549
34	23	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 00:40:32.201367
35	23	PLAY_VIDEO	Ketika memulai memutar video	2021-11-28 00:40:54.833524
36	23	OPEN_SUB_MATERI	Ketika membuka sub menu, Kegiatan Ekonomi, Uang dan Koperasi	2021-11-28 00:47:28.063849
37	23	PLAY_VIDEO	Ketika memulai memutar video	2021-11-28 00:47:29.898477
38	23	OPEN_EXAM	Ketika membuka menu ujian, Kegiatan Ekonomi, Uang dan Koperasi	2021-11-28 00:47:48.562443
39	1	OPEN_SUB_MATERI	Ketika membuka sub menu, Politik dan Pemerintahan di Indonesia	2021-11-28 01:07:46.492883
40	1	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 01:07:48.225214
41	1	OPEN_KOMPENTENSI	Ketika membuka kompentensi	2021-11-28 01:10:24.065383
42	1	OPEN_PEMBAHASAN	Ketika membuka pembahasan	2021-11-28 01:13:05.413391
43	1	PLAY_VIDEO	Ketika memulai memutar video	2021-11-28 01:16:56.069757
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.accounts_id_seq', 32, true);


--
-- Name: answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.answer_id_seq', 52, true);


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

SELECT pg_catalog.setval('public.materi_assign_id_seq', 10, true);


--
-- Name: materi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.materi_id_seq', 5, true);


--
-- Name: poin_exam_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.poin_exam_detail_id_seq', 209, true);


--
-- Name: poin_exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.poin_exam_id_seq', 61, true);


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.question_id_seq', 60, true);


--
-- Name: usage_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: almadoni
--

SELECT pg_catalog.setval('public.usage_history_id_seq', 43, true);


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
-- Name: usage_history usage_history_pkey; Type: CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.usage_history
    ADD CONSTRAINT usage_history_pkey PRIMARY KEY (id);


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
-- Name: usage_history usage_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: almadoni
--

ALTER TABLE ONLY public.usage_history
    ADD CONSTRAINT usage_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.accounts(id);


--
-- PostgreSQL database dump complete
--

