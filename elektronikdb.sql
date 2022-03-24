--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
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
-- Name: File; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."File" (
    file_id integer NOT NULL
);


ALTER TABLE public."File" OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    user_id integer NOT NULL,
    "userEmail" character varying(25) NOT NULL,
    "userPassword" integer NOT NULL,
    "userName" character varying(15) NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: Yetki; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Yetki" (
    yetki_id integer NOT NULL
);


ALTER TABLE public."Yetki" OWNER TO postgres;

--
-- Name: kargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kargo (
    kargo_id integer NOT NULL,
    teslimat_tarihi timestamp with time zone NOT NULL,
    kargo_takip_no integer NOT NULL
);


ALTER TABLE public.kargo OWNER TO postgres;

--
-- Name: kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori (
    kategori_id integer NOT NULL,
    kategori_adi character varying(15) NOT NULL
);


ALTER TABLE public.kategori OWNER TO postgres;

--
-- Name: kategori_kategori_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kategori_kategori_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kategori_kategori_id_seq OWNER TO postgres;

--
-- Name: kategori_kategori_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kategori_kategori_id_seq OWNED BY public.kategori.kategori_id;


--
-- Name: marka; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marka (
    marka_id integer NOT NULL,
    marka_adi character varying(15) NOT NULL
);


ALTER TABLE public.marka OWNER TO postgres;

--
-- Name: sepet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sepet (
    sepet_id integer NOT NULL,
    urun_id integer NOT NULL,
    rezervasyon_tarihi timestamp with time zone NOT NULL
);


ALTER TABLE public.sepet OWNER TO postgres;

--
-- Name: siparis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siparis (
    siparis_id integer NOT NULL,
    urun_id integer NOT NULL,
    siparis_tarihi timestamp with time zone NOT NULL,
    kargo_id integer NOT NULL
);


ALTER TABLE public.siparis OWNER TO postgres;

--
-- Name: urun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urun (
    urun_id integer NOT NULL,
    marka_id integer NOT NULL,
    stok integer NOT NULL,
    "urunFiyat" integer NOT NULL,
    "urunResim" bytea,
    kategori_id integer NOT NULL
);


ALTER TABLE public.urun OWNER TO postgres;

--
-- Name: kategori kategori_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori ALTER COLUMN kategori_id SET DEFAULT nextval('public.kategori_kategori_id_seq'::regclass);


--
-- Data for Name: File; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."File" (file_id) FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (user_id, "userEmail", "userPassword", "userName") FROM stdin;
1	caner.167879@gmail.com	651	canerarik
2	sevval@gmail.com	1202	sevval1
3	ozge@gmail.com	1205	ozge5
\.


--
-- Data for Name: Yetki; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Yetki" (yetki_id) FROM stdin;
\.


--
-- Data for Name: kargo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kargo (kargo_id, teslimat_tarihi, kargo_takip_no) FROM stdin;
1	2022-03-20 00:00:00+03	46545
2	2022-03-24 00:00:00+03	45611
\.


--
-- Data for Name: kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategori (kategori_id, kategori_adi) FROM stdin;
1	bilgisayar
2	telefon
3	televizyon
4	beyaz esya
5	ev aletleri
6	aksesuar
\.


--
-- Data for Name: marka; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marka (marka_id, marka_adi) FROM stdin;
1	asus
2	sony
3	apple
4	xiaomi
5	huawei
6	arcelik
7	logitech
\.


--
-- Data for Name: sepet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sepet (sepet_id, urun_id, rezervasyon_tarihi) FROM stdin;
1	2	2022-03-09 00:00:00+03
2	1	2022-03-24 00:00:00+03
\.


--
-- Data for Name: siparis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siparis (siparis_id, urun_id, siparis_tarihi, kargo_id) FROM stdin;
1	2	2022-03-10 00:00:00+03	1
2	1	2022-03-25 00:00:00+03	2
\.


--
-- Data for Name: urun; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urun (urun_id, marka_id, stok, "urunFiyat", "urunResim", kategori_id) FROM stdin;
1	2	10	4000	\N	5
2	3	7	5000	\N	1
3	4	12	10000	\N	2
\.


--
-- Name: kategori_kategori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategori_kategori_id_seq', 15, true);


--
-- Name: File File_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."File"
    ADD CONSTRAINT "File_pkey" PRIMARY KEY (file_id);


--
-- Name: kargo Kargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kargo
    ADD CONSTRAINT "Kargo_pkey" PRIMARY KEY (kargo_id);


--
-- Name: sepet Sepet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sepet
    ADD CONSTRAINT "Sepet_pkey" PRIMARY KEY (sepet_id);


--
-- Name: siparis Siparis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siparis
    ADD CONSTRAINT "Siparis_pkey" PRIMARY KEY (siparis_id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (user_id);


--
-- Name: Yetki Yetki_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Yetki"
    ADD CONSTRAINT "Yetki_pkey" PRIMARY KEY (yetki_id);


--
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (kategori_id);


--
-- Name: marka markalar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marka
    ADD CONSTRAINT markalar_pkey PRIMARY KEY (marka_id);


--
-- Name: urun urunler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urun
    ADD CONSTRAINT urunler_pkey PRIMARY KEY (urun_id);


--
-- PostgreSQL database dump complete
--

