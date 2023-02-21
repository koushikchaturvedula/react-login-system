--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: employee_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_info (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL,
    gender character varying(10) NOT NULL,
    joined_date character varying(30) NOT NULL
);


ALTER TABLE public.employee_info OWNER TO postgres;

--
-- Name: employee_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_info_id_seq OWNER TO postgres;

--
-- Name: employee_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_info_id_seq OWNED BY public.employee_info.id;


--
-- Name: employee_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_user (
    userid bigint NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    phone_number character varying(32) NOT NULL,
    gender character varying(32) NOT NULL,
    email character varying(32) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255)
);


ALTER TABLE public.employee_user OWNER TO postgres;

--
-- Name: employee_user_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_user_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_user_userid_seq OWNER TO postgres;

--
-- Name: employee_user_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_user_userid_seq OWNED BY public.employee_user.userid;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    id bigint NOT NULL,
    access_token character varying(500) NOT NULL,
    userid bigint NOT NULL
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: tokens_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tokens_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_userid_seq OWNER TO postgres;

--
-- Name: tokens_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tokens_userid_seq OWNED BY public.tokens.userid;


--
-- Name: employee_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_info ALTER COLUMN id SET DEFAULT nextval('public.employee_info_id_seq'::regclass);


--
-- Name: employee_user userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_user ALTER COLUMN userid SET DEFAULT nextval('public.employee_user_userid_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: tokens userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens ALTER COLUMN userid SET DEFAULT nextval('public.tokens_userid_seq'::regclass);


--
-- Data for Name: employee_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_info (id, first_name, last_name, email, phone_number, gender, joined_date) FROM stdin;
3	Janes 	Doe Sas	janedoe@example.com	955-531-56	male	2021/12/01
13	koushik	koushik	jirdecifyi@gufum.com	955-531-56	male	2023-01-31
15	Jacobs	Methew	koushik@gmail.com	65322217	male	2018/02/01
\.


--
-- Data for Name: employee_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_user (userid, first_name, last_name, phone_number, gender, email, password, role) FROM stdin;
1	Jane	Doe	556200	female	janedoe@example.com	$2a$08$VIsKFb/Gzc4oTl4CQ.Gp5ugINJZyggYYOpslK5vgGcm4GLyYb4YMO	STANDARD
2	Alice	Johnson	874541521	male	alicejohnson@example.com	$2a$08$jptD5Ljs0Nmo.CaoeojUX.CEXzhfNZoFG5gFCM4dyHBoWXZLg48Zq	ADMIN
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (id, access_token, userid) FROM stdin;
1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4Mzc4ODd9.rdiLJTZDAayito9A-nHIM0oSkGgrZCMo7tEtKqaUfQU	2
2	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4Mzc5ODl9.aNLDYUnzkB3qprortB8PK5Ldl4wYU1N9v5UO2lhs5e0	2
3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4MzgwMzJ9.3tsbV5Pg2fEflANUSni4DxmqjGlhZ7ee5d1NsrU8XqA	2
4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4MzgwNjF9.JbaupekU-5o-rB5Z-S7orOvQJSqVfiJmyLaQAdN0in4	2
5	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4MzgxOTF9.SKH0ptDcitPIGuivyqXhcEpQf9fKds2EEuxb2jikb4c	2
6	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4Mzg5MDB9.soWFcRfXl9CG9p8VUdV_3SlxOQeAxaXnmcD4Th4Pnws	2
7	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4Mzg5NDd9.g37zldzURm02GJZZTsnp1R20itRwVnKET9ofR-PU4kc	2
8	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4MzkwNDh9.xCSBTV9NeusNovZ1O27wY7hCi6qNlciSNs7xAvr9vpQ	2
9	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4MzkxMTB9.t6fJujxdUI8fxduYFgiF2XWiQH0nA0Bl-Bbi5G2kieA	2
10	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4MzkxMzN9.7blf-oVGaqrt1zsgekG4NitrG2hah27z3rmQH4eFNpE	2
11	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4MzkxNTd9.hGNS8mFfqpaedagjhxt0e6oTTpQSD76eAxfKGNZBKn8	2
12	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4MzkxOTR9.S98JkFj3dADyTKuAGXdPXgcqmurIBP0Q9Mzlp-X5mV0	2
13	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4MzkyMjl9.bMym03M8p8nPaIN2jqSAgozIa_RfwaGjmELRCVA8YCE	2
14	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4MzkyNzl9.7Lp461-7mwcsh-5iBWR5f2n6FSzxM5GiRQ1YqLpaJgQ	2
15	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4MzkzMDl9.0CUkcbOOUt_-ztaZiUeHyspAK56wRqVLPBsojC8U6k0	2
16	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4Mzk0MDZ9.WboiXvBTyrLF8mCZgE_PsHNPXIlvptruOaCg_xWjyKo	2
17	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4Mzk0MDd9.RRXwQ2RavfjOWNRB0T8A1FwjFYLss4w2YvnHDE94WZc	2
18	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4Mzk0MzF9.EgsiD42Rj0WDiMvQ565Kfx3rBU40EB-UVY-Hz5DWQGQ	2
19	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4Mzk5OTh9.vV4jYhnKnSlOzT7mj5yRs1lEYeTwFC1ss2IFD7D24bU	2
20	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NDAxMTZ9.PyzrCIJl3Ibse3xyjR14zet72-HlMto4QlvvQqJtQ3Q	2
21	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NDAxMzd9.IQI5areTyzKUSVtFFn2RKU-PQZ2ZAeAZPJVzgnwhpvs	2
22	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NDA1Mjd9.SgutwKWt76yH_0FyEHqS6VrDe8bpozE6jVvcyArGpCw	2
23	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NDA3NDJ9.M-8cnVriYeudS4ov2JqBpkAwqYPOgZq3SL7HhwhWLUQ	2
24	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NDA3NTR9.n0OU3h2WL5RxIq_ZRfo-EliDD5dyJxP43PpwUYf6Sm4	2
25	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NDA4MDl9.4hxDfLN-cO1HHMSfg3fGHU08HAYBAQagdlxzTA_oFf8	2
26	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NDA4Mzd9.y78xWKHizLeEKszbM9DhlhGZ2ODA84_eS2ttjWwzISE	2
27	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NDEyMjh9.gFs5okjpHm5xmkVjFnO9r7_0tooSi5NoZ2cZMRpUoEY	2
28	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NDEyMzl9.JSaMhgxWaQbUGnOXjFORHb-7c9qSJEy7670SBwQIxu8	2
29	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NjA1MzZ9.MpfwihKyX9MOHza3hBfz1d8rMMbAt-FlyMYtGDVYzU4	2
30	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NjA4MTZ9.kFpYWwKWTsMDdGkHQbcvlyIRq_eEhkV84ig3iCVQr9A	2
31	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NjA4NDJ9.EDtTL6nTE38LJ27hlEbG2m9IW9XD7HIopmy0qDh0fHU	2
32	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NjA4NzR9.A4wjqmHSG5htf2pw_CLIzKItj0e-V3s3sOYkw68zjMw	2
33	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NjcxNjF9.djKwwB0YrQhlUG2ZbZwx2zH0XP2KI6xCMY46sLxoi84	2
34	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4Njc5MDV9.U8a31OqDLycVYBw9S94MTjG84xXMCRwfezCzh22jbK4	2
35	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NzEzMzl9.LQ__cLNqMylN9zcnG3wowa6oeqhEzaE3BzNdKFAc4K8	2
36	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NzE4ODZ9.x3zUtkiaKeT7i0uTgQyLa5PJGleeFyrHUJ8vwsdt52g	2
37	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NzIwMDd9.8b370FJyvG5Nnm1wxucrObfnS9e81NmdMfpMk6oXzTY	2
38	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NzIwMjd9.vI1gFQynVWo1OLZMKK43A031qLUHYy979QdWSe0ShMo	2
39	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NzIwNDZ9.DvhSzRivz5S65BqCRmHzVRLcmCAgRJ8HjvWb4-DDsTk	2
40	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NzIwOTB9.4y2yeOxRfY2bfrFuTgNBLJolyHuwUpa5ke4p8UvdQuc	2
41	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4NzIxMTB9.2R-Oy6bTTtOHYTq3bmbsURYUvFKZ6JuwO5PT1HY0ur8	2
42	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4Nzk1OTZ9.WevauzjwANO_SpHJ0mV671ZsQ1Vxmj0y9h90bdh5ka8	2
43	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTA2OTd9.WluOE10ZkYZXrUdMKvQpvSW76Dkpn-0uBwxF3eWUUBo	2
44	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTMzNjB9.6pA0FitniCP7LCXbxA64PD98CUnP4H28cKK4draCR2o	2
45	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJqaXJkZWNpZnlpQGd1ZnVtLmNvbSIsImlhdCI6MTY3Njg5MzM4NH0.1U5m5WGBi4QXN5qtB8dc6vrVco0uZ4OdjotZAljVIMk	1
46	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTM0NDl9.M4ELzj2ebDvJoKtbP1alBioxgvKqyC7Fh_hRzRqCHhk	2
47	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJqaXJkZWNpZnlpQGd1ZnVtLmNvbSIsImlhdCI6MTY3Njg5MzQ4MH0._nNpKwkrKZFa8kpR9edpxD7pQrMbrVnNSkz8MR23Hqk	1
48	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTQ1MTB9.suSUg17l5o4wU7L5aRNeCdwXUCJUOS5kBwOZoOqD9Oo	2
49	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTUzOTh9.FO7ujwYomDR3OaMA31kBMG13lu1wHy73Zfmk9xBGMjI	2
50	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTkyNjJ9.FP7w73BZShQzZwWFhfq0qQe1RUxNY5iup3dktwhtiF4	2
51	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTkzNTB9.Fg4IdBr4nVXSU7FBgpOJmmesM5AP-fbcI83jMZmqs34	2
52	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTk0MDd9.r6HScNhJAh9SACYOA3WqH6gQl93_5zQfr6X-w7tD2jE	2
53	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTk0MDl9.ICBng80EmoT-0I0fw7v5hRckqCiBUSF8x8jmrjTqFRo	2
54	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTk0MzV9.TvAXKEmyQk2wdZ-nHqCGuagh9jFypDZT6-zv-2Y9ZT4	2
55	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTk0NjF9.n6JLnj1mbullFEi9L8EphQ8nefFR57bQiRm5EX8mo3Q	2
56	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTk0Njd9.NaLzgjrq3QjkAn9fP7koo6Bu_ceNom36i5f3FPK8TuQ	2
57	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTk2MTd9.M8NWREEYcORzWbygn6yf-ysXQnrC5lSCMMgi4Fsk2V4	2
58	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY4OTk2NjJ9.5LhgUj_BjV_32Vwn9zURJtO3VL8EfEVjASUCzpCD8zQ	2
59	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY5MDA3Mjl9.jC4xJ4cv0CYTEAQ2xanRAfFghUDhMVS097TrKrUMzOg	2
60	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY5MDk5NDh9.6lNlrnZO-lqSb3Da4BHlhTBZT27IBVFTb_DX-MgKhm0	2
61	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJqaXJkZWNpZnlpQGd1ZnVtLmNvbSIsImlhdCI6MTY3NjkxMTgyNn0.e3NhJJnvkE71nJypO8_LrXHhvI6bYuknv7QB8ZixKKE	1
62	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY5MTE5MzR9.z_AFoB6YgVdHuSKZNQVn4JyGD8P4iUdqqgi_0WAwoJE	2
63	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJrb3VzaGlrLmNAbWluZC1ncmFwaC5jb20iLCJpYXQiOjE2NzY5MTk5NDd9.Ed-xdwS-E9SZEJSI9Jo-bmfxOXhgS20Ef3PZT01A7nM	2
64	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJqYW5lZG9lQGV4YW1wbGUuY29tIiwiaWF0IjoxNjc2OTIwMTY5fQ.SmKym5JzX7rjxk-uU_pa_EQqklSWUam1ajgFditqhQQ	1
65	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJhbGljZWpvaG5zb25AZXhhbXBsZS5jb20iLCJpYXQiOjE2NzY5MjMxODZ9.SaqNdIlnFEx4ikwHwLnTzp7ouIBzrVpCGGZjqkLx4y0	2
66	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJqYW5lZG9lQGV4YW1wbGUuY29tIiwiaWF0IjoxNjc2OTIzNjA3fQ.0iPUjmRG8mMWI44lZKm8nE16By6fI5jp8NBcz9AXBZI	1
67	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJhbGljZWpvaG5zb25AZXhhbXBsZS5jb20iLCJpYXQiOjE2NzY5MjM2OTB9.nHtR0kdbJ_2KXm1eyplpC1XLDovF504PiWv51Z_KNpY	2
68	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJhbGljZWpvaG5zb25AZXhhbXBsZS5jb20iLCJpYXQiOjE2NzY5MjQwNzV9.SPRBx70YLdeeS3_JZGTY8SsQ4AjNaww1BdZPzDGDTmE	2
69	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJhbGljZWpvaG5zb25AZXhhbXBsZS5jb20iLCJpYXQiOjE2NzY5MjQxNTJ9.mGFeqs4yoUfkXOjY3fd76yiBhX6wpVRDwkzbGvQKL6o	2
70	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJhbGljZWpvaG5zb25AZXhhbXBsZS5jb20iLCJpYXQiOjE2NzY5MjQyNjR9.I0zREhNIJZUtmPbB84f4MzhjFTj24n-t-yqNEdMGqDg	2
71	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJhbGljZWpvaG5zb25AZXhhbXBsZS5jb20iLCJpYXQiOjE2NzY5MjQzNDF9.y30HzGnOXQmY7aP61bBdtSzEy-3wKB09K08vjtS3bt4	2
72	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJhbGljZWpvaG5zb25AZXhhbXBsZS5jb20iLCJpYXQiOjE2NzY5MjQ3MDl9.KohCXgzJOO_sfCKBRWDsQ5gRHMh8Wn3S-N7GD9T_jxU	2
73	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJhbGljZWpvaG5zb25AZXhhbXBsZS5jb20iLCJpYXQiOjE2NzY5MjQ5Njh9.SDmx4u4jCk_ztoJGlsdtYJ8fMAIYGt7DYDkKsdhZKzk	2
74	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIyIiwiZW1haWwiOiJhbGljZWpvaG5zb25AZXhhbXBsZS5jb20iLCJpYXQiOjE2NzY5MjUxMDJ9.X9rMInwyYEjLRVbLd9uj03u66-6sG2XZU-rp2I7L1BA	2
\.


--
-- Name: employee_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_info_id_seq', 15, true);


--
-- Name: employee_user_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_user_userid_seq', 2, true);


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tokens_id_seq', 74, true);


--
-- Name: tokens_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tokens_userid_seq', 1, false);


--
-- Name: employee_info employee_info_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_info
    ADD CONSTRAINT employee_info_email_key UNIQUE (email);


--
-- Name: employee_info employee_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_info
    ADD CONSTRAINT employee_info_pkey PRIMARY KEY (id);


--
-- Name: employee_user employee_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_user
    ADD CONSTRAINT employee_user_email_key UNIQUE (email);


--
-- Name: employee_user employee_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_user
    ADD CONSTRAINT employee_user_pkey PRIMARY KEY (userid);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_userid_fkey FOREIGN KEY (userid) REFERENCES public.employee_user(userid);


--
-- PostgreSQL database dump complete
--

