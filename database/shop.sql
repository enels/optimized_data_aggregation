--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Ubuntu 16.8-1.pgdg22.04+1)
-- Dumped by pg_dump version 17.4 (Ubuntu 17.4-1.pgdg22.04+2)

-- Started on 2025-08-24 10:15:55 WAT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3585 (class 1262 OID 16406)
-- Name: shopdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE shopdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_NG';


ALTER DATABASE shopdb OWNER TO postgres;

\connect shopdb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 17196)
-- Name: pg_buffercache; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_buffercache WITH SCHEMA public;


--
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_buffercache; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_buffercache IS 'examine the shared buffer cache';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16642)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country_id integer NOT NULL,
    country_name character varying NOT NULL,
    region_id integer
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16641)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.countries ALTER COLUMN country_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16664)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying NOT NULL,
    price numeric(11,2) NOT NULL,
    quantity integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16663)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products ALTER COLUMN product_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16650)
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16649)
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.regions ALTER COLUMN region_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16885)
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
)
PARTITION BY RANGE (date);


ALTER TABLE public.sales OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16907)
-- Name: sales202401; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales202401 (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sales202401 OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16922)
-- Name: sales202402; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales202402 (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sales202402 OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16937)
-- Name: sales202403; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales202403 (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sales202403 OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16952)
-- Name: sales202404; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales202404 (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sales202404 OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16967)
-- Name: sales202405; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales202405 (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sales202405 OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16982)
-- Name: sales202406; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales202406 (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sales202406 OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16997)
-- Name: sales202407; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales202407 (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sales202407 OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17012)
-- Name: sales202408; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales202408 (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sales202408 OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17027)
-- Name: sales202409; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales202409 (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sales202409 OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17042)
-- Name: sales202410; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales202410 (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sales202410 OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17057)
-- Name: sales202411; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales202411 (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sales202411 OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17072)
-- Name: sales202412; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales202412 (
    id integer NOT NULL,
    product_id integer NOT NULL,
    region_id integer NOT NULL,
    country_id integer NOT NULL,
    date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sales202412 OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16884)
-- Name: sales_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.sales ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sales_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3291 (class 0 OID 0)
-- Name: sales202401; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ATTACH PARTITION public.sales202401 FOR VALUES FROM ('2024-01-01 00:00:00+01') TO ('2024-02-01 00:00:00+01');


--
-- TOC entry 3292 (class 0 OID 0)
-- Name: sales202402; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ATTACH PARTITION public.sales202402 FOR VALUES FROM ('2024-02-01 00:00:00+01') TO ('2024-03-01 00:00:00+01');


--
-- TOC entry 3293 (class 0 OID 0)
-- Name: sales202403; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ATTACH PARTITION public.sales202403 FOR VALUES FROM ('2024-03-01 00:00:00+01') TO ('2024-04-01 00:00:00+01');


--
-- TOC entry 3294 (class 0 OID 0)
-- Name: sales202404; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ATTACH PARTITION public.sales202404 FOR VALUES FROM ('2024-04-01 00:00:00+01') TO ('2024-05-01 00:00:00+01');


--
-- TOC entry 3295 (class 0 OID 0)
-- Name: sales202405; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ATTACH PARTITION public.sales202405 FOR VALUES FROM ('2024-05-01 00:00:00+01') TO ('2024-06-01 00:00:00+01');


--
-- TOC entry 3296 (class 0 OID 0)
-- Name: sales202406; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ATTACH PARTITION public.sales202406 FOR VALUES FROM ('2024-06-01 00:00:00+01') TO ('2024-07-01 00:00:00+01');


--
-- TOC entry 3297 (class 0 OID 0)
-- Name: sales202407; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ATTACH PARTITION public.sales202407 FOR VALUES FROM ('2024-07-01 00:00:00+01') TO ('2024-08-01 00:00:00+01');


--
-- TOC entry 3298 (class 0 OID 0)
-- Name: sales202408; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ATTACH PARTITION public.sales202408 FOR VALUES FROM ('2024-08-01 00:00:00+01') TO ('2024-09-01 00:00:00+01');


--
-- TOC entry 3299 (class 0 OID 0)
-- Name: sales202409; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ATTACH PARTITION public.sales202409 FOR VALUES FROM ('2024-09-01 00:00:00+01') TO ('2024-10-01 00:00:00+01');


--
-- TOC entry 3300 (class 0 OID 0)
-- Name: sales202410; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ATTACH PARTITION public.sales202410 FOR VALUES FROM ('2024-10-01 00:00:00+01') TO ('2024-11-01 00:00:00+01');


--
-- TOC entry 3301 (class 0 OID 0)
-- Name: sales202411; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ATTACH PARTITION public.sales202411 FOR VALUES FROM ('2024-11-01 00:00:00+01') TO ('2024-12-01 00:00:00+01');


--
-- TOC entry 3302 (class 0 OID 0)
-- Name: sales202412; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ATTACH PARTITION public.sales202412 FOR VALUES FROM ('2024-12-01 00:00:00+01') TO ('2025-01-01 00:00:00+01');


--
-- TOC entry 3562 (class 0 OID 16642)
-- Dependencies: 219
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_id, country_name, region_id) FROM stdin;
1	Australia	4
2	England	3
3	USA	2
4	Brazil	5
5	Nigeria	1
6	Germany	3
7	Argentina	5
9	Uruguay	5
10	South Africa	1
11	Mexico	2
12	Italy	3
8	Spain	3
13	Ghana	1
14	Canada	2
15	Sweden	3
16	Paraguay	5
17	Portugal	3
18	Senegal	1
19	China	4
20	Japan	4
21	Chile	5
\.


--
-- TOC entry 3566 (class 0 OID 16664)
-- Dependencies: 223
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_name, price, quantity) FROM stdin;
\.


--
-- TOC entry 3564 (class 0 OID 16650)
-- Dependencies: 221
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (region_id, region_name) FROM stdin;
1	Africa
3	Europe
4	Asia
2	North America
5	South America
\.


--
-- TOC entry 3568 (class 0 OID 16907)
-- Dependencies: 226
-- Data for Name: sales202401; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales202401 (id, product_id, region_id, country_id, date) FROM stdin;
\.


--
-- TOC entry 3569 (class 0 OID 16922)
-- Dependencies: 227
-- Data for Name: sales202402; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales202402 (id, product_id, region_id, country_id, date) FROM stdin;
\.


--
-- TOC entry 3570 (class 0 OID 16937)
-- Dependencies: 228
-- Data for Name: sales202403; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales202403 (id, product_id, region_id, country_id, date) FROM stdin;
\.


--
-- TOC entry 3571 (class 0 OID 16952)
-- Dependencies: 229
-- Data for Name: sales202404; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales202404 (id, product_id, region_id, country_id, date) FROM stdin;
\.


--
-- TOC entry 3572 (class 0 OID 16967)
-- Dependencies: 230
-- Data for Name: sales202405; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales202405 (id, product_id, region_id, country_id, date) FROM stdin;
\.


--
-- TOC entry 3573 (class 0 OID 16982)
-- Dependencies: 231
-- Data for Name: sales202406; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales202406 (id, product_id, region_id, country_id, date) FROM stdin;
\.


--
-- TOC entry 3574 (class 0 OID 16997)
-- Dependencies: 232
-- Data for Name: sales202407; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales202407 (id, product_id, region_id, country_id, date) FROM stdin;
\.


--
-- TOC entry 3575 (class 0 OID 17012)
-- Dependencies: 233
-- Data for Name: sales202408; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales202408 (id, product_id, region_id, country_id, date) FROM stdin;
\.


--
-- TOC entry 3576 (class 0 OID 17027)
-- Dependencies: 234
-- Data for Name: sales202409; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales202409 (id, product_id, region_id, country_id, date) FROM stdin;
\.


--
-- TOC entry 3577 (class 0 OID 17042)
-- Dependencies: 235
-- Data for Name: sales202410; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales202410 (id, product_id, region_id, country_id, date) FROM stdin;
\.


--
-- TOC entry 3578 (class 0 OID 17057)
-- Dependencies: 236
-- Data for Name: sales202411; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales202411 (id, product_id, region_id, country_id, date) FROM stdin;
\.


--
-- TOC entry 3579 (class 0 OID 17072)
-- Dependencies: 237
-- Data for Name: sales202412; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales202412 (id, product_id, region_id, country_id, date) FROM stdin;
\.


--
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 218
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 21, true);


--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 222
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 1078, true);


--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 220
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_id_seq', 5, true);


--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 224
-- Name: sales_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_id_seq1', 306, true);


--
-- TOC entry 3317 (class 2606 OID 16648)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- TOC entry 3324 (class 2606 OID 16670)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3321 (class 2606 OID 16656)
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);


--
-- TOC entry 3328 (class 2606 OID 16890)
-- Name: sales unique_date; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT unique_date UNIQUE (id, date);


--
-- TOC entry 3330 (class 2606 OID 16912)
-- Name: sales202401 sales202401_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales202401
    ADD CONSTRAINT sales202401_id_date_key UNIQUE (id, date);


--
-- TOC entry 3334 (class 2606 OID 16927)
-- Name: sales202402 sales202402_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales202402
    ADD CONSTRAINT sales202402_id_date_key UNIQUE (id, date);


--
-- TOC entry 3338 (class 2606 OID 16942)
-- Name: sales202403 sales202403_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales202403
    ADD CONSTRAINT sales202403_id_date_key UNIQUE (id, date);


--
-- TOC entry 3342 (class 2606 OID 16957)
-- Name: sales202404 sales202404_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales202404
    ADD CONSTRAINT sales202404_id_date_key UNIQUE (id, date);


--
-- TOC entry 3346 (class 2606 OID 16972)
-- Name: sales202405 sales202405_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales202405
    ADD CONSTRAINT sales202405_id_date_key UNIQUE (id, date);


--
-- TOC entry 3350 (class 2606 OID 16987)
-- Name: sales202406 sales202406_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales202406
    ADD CONSTRAINT sales202406_id_date_key UNIQUE (id, date);


--
-- TOC entry 3354 (class 2606 OID 17002)
-- Name: sales202407 sales202407_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales202407
    ADD CONSTRAINT sales202407_id_date_key UNIQUE (id, date);


--
-- TOC entry 3358 (class 2606 OID 17017)
-- Name: sales202408 sales202408_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales202408
    ADD CONSTRAINT sales202408_id_date_key UNIQUE (id, date);


--
-- TOC entry 3362 (class 2606 OID 17032)
-- Name: sales202409 sales202409_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales202409
    ADD CONSTRAINT sales202409_id_date_key UNIQUE (id, date);


--
-- TOC entry 3366 (class 2606 OID 17047)
-- Name: sales202410 sales202410_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales202410
    ADD CONSTRAINT sales202410_id_date_key UNIQUE (id, date);


--
-- TOC entry 3370 (class 2606 OID 17062)
-- Name: sales202411 sales202411_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales202411
    ADD CONSTRAINT sales202411_id_date_key UNIQUE (id, date);


--
-- TOC entry 3374 (class 2606 OID 17077)
-- Name: sales202412 sales202412_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales202412
    ADD CONSTRAINT sales202412_id_date_key UNIQUE (id, date);


--
-- TOC entry 3318 (class 1259 OID 16728)
-- Name: country_name_lower_func_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX country_name_lower_func_idx ON public.countries USING btree (lower((country_name)::text));


--
-- TOC entry 3322 (class 1259 OID 16724)
-- Name: product_name_lower_func_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX product_name_lower_func_idx ON public.products USING btree (lower((product_name)::text));


--
-- TOC entry 3319 (class 1259 OID 16729)
-- Name: region_name_lower_func_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX region_name_lower_func_idx ON public.regions USING btree (lower((region_name)::text));


--
-- TOC entry 3325 (class 1259 OID 17217)
-- Name: sales_products_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales_products_id_idx ON ONLY public.sales USING hash (product_id);


--
-- TOC entry 3331 (class 1259 OID 17218)
-- Name: sales202401_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202401_product_id_idx ON public.sales202401 USING hash (product_id);


--
-- TOC entry 3326 (class 1259 OID 17230)
-- Name: sales_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales_region_id_idx ON ONLY public.sales USING hash (region_id);


--
-- TOC entry 3332 (class 1259 OID 17231)
-- Name: sales202401_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202401_region_id_idx ON public.sales202401 USING hash (region_id);


--
-- TOC entry 3335 (class 1259 OID 17219)
-- Name: sales202402_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202402_product_id_idx ON public.sales202402 USING hash (product_id);


--
-- TOC entry 3336 (class 1259 OID 17232)
-- Name: sales202402_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202402_region_id_idx ON public.sales202402 USING hash (region_id);


--
-- TOC entry 3339 (class 1259 OID 17220)
-- Name: sales202403_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202403_product_id_idx ON public.sales202403 USING hash (product_id);


--
-- TOC entry 3340 (class 1259 OID 17233)
-- Name: sales202403_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202403_region_id_idx ON public.sales202403 USING hash (region_id);


--
-- TOC entry 3343 (class 1259 OID 17221)
-- Name: sales202404_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202404_product_id_idx ON public.sales202404 USING hash (product_id);


--
-- TOC entry 3344 (class 1259 OID 17234)
-- Name: sales202404_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202404_region_id_idx ON public.sales202404 USING hash (region_id);


--
-- TOC entry 3347 (class 1259 OID 17222)
-- Name: sales202405_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202405_product_id_idx ON public.sales202405 USING hash (product_id);


--
-- TOC entry 3348 (class 1259 OID 17235)
-- Name: sales202405_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202405_region_id_idx ON public.sales202405 USING hash (region_id);


--
-- TOC entry 3351 (class 1259 OID 17223)
-- Name: sales202406_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202406_product_id_idx ON public.sales202406 USING hash (product_id);


--
-- TOC entry 3352 (class 1259 OID 17236)
-- Name: sales202406_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202406_region_id_idx ON public.sales202406 USING hash (region_id);


--
-- TOC entry 3355 (class 1259 OID 17224)
-- Name: sales202407_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202407_product_id_idx ON public.sales202407 USING hash (product_id);


--
-- TOC entry 3356 (class 1259 OID 17237)
-- Name: sales202407_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202407_region_id_idx ON public.sales202407 USING hash (region_id);


--
-- TOC entry 3359 (class 1259 OID 17225)
-- Name: sales202408_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202408_product_id_idx ON public.sales202408 USING hash (product_id);


--
-- TOC entry 3360 (class 1259 OID 17238)
-- Name: sales202408_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202408_region_id_idx ON public.sales202408 USING hash (region_id);


--
-- TOC entry 3363 (class 1259 OID 17226)
-- Name: sales202409_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202409_product_id_idx ON public.sales202409 USING hash (product_id);


--
-- TOC entry 3364 (class 1259 OID 17239)
-- Name: sales202409_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202409_region_id_idx ON public.sales202409 USING hash (region_id);


--
-- TOC entry 3367 (class 1259 OID 17227)
-- Name: sales202410_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202410_product_id_idx ON public.sales202410 USING hash (product_id);


--
-- TOC entry 3368 (class 1259 OID 17240)
-- Name: sales202410_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202410_region_id_idx ON public.sales202410 USING hash (region_id);


--
-- TOC entry 3371 (class 1259 OID 17228)
-- Name: sales202411_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202411_product_id_idx ON public.sales202411 USING hash (product_id);


--
-- TOC entry 3372 (class 1259 OID 17241)
-- Name: sales202411_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202411_region_id_idx ON public.sales202411 USING hash (region_id);


--
-- TOC entry 3375 (class 1259 OID 17229)
-- Name: sales202412_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202412_product_id_idx ON public.sales202412 USING hash (product_id);


--
-- TOC entry 3376 (class 1259 OID 17242)
-- Name: sales202412_region_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sales202412_region_id_idx ON public.sales202412 USING hash (region_id);


--
-- TOC entry 3377 (class 0 OID 0)
-- Name: sales202401_id_date_key; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.unique_date ATTACH PARTITION public.sales202401_id_date_key;


--
-- TOC entry 3378 (class 0 OID 0)
-- Name: sales202401_product_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_products_id_idx ATTACH PARTITION public.sales202401_product_id_idx;


--
-- TOC entry 3379 (class 0 OID 0)
-- Name: sales202401_region_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_region_id_idx ATTACH PARTITION public.sales202401_region_id_idx;


--
-- TOC entry 3380 (class 0 OID 0)
-- Name: sales202402_id_date_key; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.unique_date ATTACH PARTITION public.sales202402_id_date_key;


--
-- TOC entry 3381 (class 0 OID 0)
-- Name: sales202402_product_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_products_id_idx ATTACH PARTITION public.sales202402_product_id_idx;


--
-- TOC entry 3382 (class 0 OID 0)
-- Name: sales202402_region_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_region_id_idx ATTACH PARTITION public.sales202402_region_id_idx;


--
-- TOC entry 3383 (class 0 OID 0)
-- Name: sales202403_id_date_key; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.unique_date ATTACH PARTITION public.sales202403_id_date_key;


--
-- TOC entry 3384 (class 0 OID 0)
-- Name: sales202403_product_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_products_id_idx ATTACH PARTITION public.sales202403_product_id_idx;


--
-- TOC entry 3385 (class 0 OID 0)
-- Name: sales202403_region_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_region_id_idx ATTACH PARTITION public.sales202403_region_id_idx;


--
-- TOC entry 3386 (class 0 OID 0)
-- Name: sales202404_id_date_key; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.unique_date ATTACH PARTITION public.sales202404_id_date_key;


--
-- TOC entry 3387 (class 0 OID 0)
-- Name: sales202404_product_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_products_id_idx ATTACH PARTITION public.sales202404_product_id_idx;


--
-- TOC entry 3388 (class 0 OID 0)
-- Name: sales202404_region_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_region_id_idx ATTACH PARTITION public.sales202404_region_id_idx;


--
-- TOC entry 3389 (class 0 OID 0)
-- Name: sales202405_id_date_key; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.unique_date ATTACH PARTITION public.sales202405_id_date_key;


--
-- TOC entry 3390 (class 0 OID 0)
-- Name: sales202405_product_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_products_id_idx ATTACH PARTITION public.sales202405_product_id_idx;


--
-- TOC entry 3391 (class 0 OID 0)
-- Name: sales202405_region_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_region_id_idx ATTACH PARTITION public.sales202405_region_id_idx;


--
-- TOC entry 3392 (class 0 OID 0)
-- Name: sales202406_id_date_key; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.unique_date ATTACH PARTITION public.sales202406_id_date_key;


--
-- TOC entry 3393 (class 0 OID 0)
-- Name: sales202406_product_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_products_id_idx ATTACH PARTITION public.sales202406_product_id_idx;


--
-- TOC entry 3394 (class 0 OID 0)
-- Name: sales202406_region_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_region_id_idx ATTACH PARTITION public.sales202406_region_id_idx;


--
-- TOC entry 3395 (class 0 OID 0)
-- Name: sales202407_id_date_key; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.unique_date ATTACH PARTITION public.sales202407_id_date_key;


--
-- TOC entry 3396 (class 0 OID 0)
-- Name: sales202407_product_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_products_id_idx ATTACH PARTITION public.sales202407_product_id_idx;


--
-- TOC entry 3397 (class 0 OID 0)
-- Name: sales202407_region_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_region_id_idx ATTACH PARTITION public.sales202407_region_id_idx;


--
-- TOC entry 3398 (class 0 OID 0)
-- Name: sales202408_id_date_key; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.unique_date ATTACH PARTITION public.sales202408_id_date_key;


--
-- TOC entry 3399 (class 0 OID 0)
-- Name: sales202408_product_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_products_id_idx ATTACH PARTITION public.sales202408_product_id_idx;


--
-- TOC entry 3400 (class 0 OID 0)
-- Name: sales202408_region_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_region_id_idx ATTACH PARTITION public.sales202408_region_id_idx;


--
-- TOC entry 3401 (class 0 OID 0)
-- Name: sales202409_id_date_key; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.unique_date ATTACH PARTITION public.sales202409_id_date_key;


--
-- TOC entry 3402 (class 0 OID 0)
-- Name: sales202409_product_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_products_id_idx ATTACH PARTITION public.sales202409_product_id_idx;


--
-- TOC entry 3403 (class 0 OID 0)
-- Name: sales202409_region_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_region_id_idx ATTACH PARTITION public.sales202409_region_id_idx;


--
-- TOC entry 3404 (class 0 OID 0)
-- Name: sales202410_id_date_key; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.unique_date ATTACH PARTITION public.sales202410_id_date_key;


--
-- TOC entry 3405 (class 0 OID 0)
-- Name: sales202410_product_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_products_id_idx ATTACH PARTITION public.sales202410_product_id_idx;


--
-- TOC entry 3406 (class 0 OID 0)
-- Name: sales202410_region_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_region_id_idx ATTACH PARTITION public.sales202410_region_id_idx;


--
-- TOC entry 3407 (class 0 OID 0)
-- Name: sales202411_id_date_key; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.unique_date ATTACH PARTITION public.sales202411_id_date_key;


--
-- TOC entry 3408 (class 0 OID 0)
-- Name: sales202411_product_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_products_id_idx ATTACH PARTITION public.sales202411_product_id_idx;


--
-- TOC entry 3409 (class 0 OID 0)
-- Name: sales202411_region_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_region_id_idx ATTACH PARTITION public.sales202411_region_id_idx;


--
-- TOC entry 3410 (class 0 OID 0)
-- Name: sales202412_id_date_key; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.unique_date ATTACH PARTITION public.sales202412_id_date_key;


--
-- TOC entry 3411 (class 0 OID 0)
-- Name: sales202412_product_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_products_id_idx ATTACH PARTITION public.sales202412_product_id_idx;


--
-- TOC entry 3412 (class 0 OID 0)
-- Name: sales202412_region_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.sales_region_id_idx ATTACH PARTITION public.sales202412_region_id_idx;


--
-- TOC entry 3413 (class 2606 OID 16657)
-- Name: countries country_region_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT country_region_fkey FOREIGN KEY (region_id) REFERENCES public.regions(region_id);


--
-- TOC entry 3414 (class 2606 OID 16891)
-- Name: sales sales_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.sales
    ADD CONSTRAINT sales_country_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id);


--
-- TOC entry 3415 (class 2606 OID 17114)
-- Name: sales sales_products_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.sales
    ADD CONSTRAINT sales_products_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3416 (class 2606 OID 17155)
-- Name: sales sales_regions_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.sales
    ADD CONSTRAINT sales_regions_fkey FOREIGN KEY (region_id) REFERENCES public.regions(region_id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2025-08-24 10:16:02 WAT

--
-- PostgreSQL database dump complete
--

