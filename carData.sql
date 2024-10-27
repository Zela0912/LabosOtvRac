--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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
-- Name: car; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car (
    id integer NOT NULL,
    vin character varying(17) NOT NULL,
    county character varying(50),
    city character varying(50),
    state character varying(2),
    postal_code character varying(10),
    model_year integer,
    make_id integer,
    model_id integer,
    electric_vehicle_type character varying(50),
    cafv_eligibility character varying(100)
);


ALTER TABLE public.car OWNER TO postgres;

--
-- Name: car_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_id_seq OWNER TO postgres;

--
-- Name: car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.car_id_seq OWNED BY public.car.id;


--
-- Name: make; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.make (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.make OWNER TO postgres;

--
-- Name: make_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.make_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.make_id_seq OWNER TO postgres;

--
-- Name: make_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.make_id_seq OWNED BY public.make.id;


--
-- Name: model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model (
    id integer NOT NULL,
    make_id integer,
    name character varying(50) NOT NULL
);


ALTER TABLE public.model OWNER TO postgres;

--
-- Name: model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.model_id_seq OWNER TO postgres;

--
-- Name: model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.model_id_seq OWNED BY public.model.id;


--
-- Name: car id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car ALTER COLUMN id SET DEFAULT nextval('public.car_id_seq'::regclass);


--
-- Name: make id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.make ALTER COLUMN id SET DEFAULT nextval('public.make_id_seq'::regclass);


--
-- Name: model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model ALTER COLUMN id SET DEFAULT nextval('public.model_id_seq'::regclass);


--
-- Data for Name: car; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car (id, vin, county, city, state, postal_code, model_year, make_id, model_id, electric_vehicle_type, cafv_eligibility) FROM stdin;
1	5UXTA6C0XM	Kitsap	Seabeck	WA	98380	2021	1	1	Plug-in Hybrid Electric Vehicle (PHEV)	Clean Alternative Fuel Vehicle Eligible
2	5YJ3E1EB1J	Kitsap	Poulsbo	WA	98370	2018	2	2	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
3	WP0AD2A73G	Snohomish	Bothell	WA	98012	2016	3	5	Plug-in Hybrid Electric Vehicle (PHEV)	Not eligible due to low battery range
4	5YJ3E1EB5J	Kitsap	Bremerton	WA	98310	2018	2	2	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
5	1N4AZ1CP3K	King	Redmond	WA	98052	2019	4	6	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
6	3FA6P0PU5F	Snohomish	Bothell	WA	98012	2015	5	7	Plug-in Hybrid Electric Vehicle (PHEV)	Not eligible due to low battery range
7	5YJYGDEEXL	King	Renton	WA	98055	2020	2	3	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
8	5UXTS1C06M	King	Seattle	WA	98107	2021	1	1	Plug-in Hybrid Electric Vehicle (PHEV)	Not eligible due to low battery range
9	1N4AZ0CP0F	King	Bellevue	WA	98007	2015	4	6	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
10	5YJSA1E20H	King	Seattle	WA	98125	2017	2	4	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
11	1G1FX6S03H	Kitsap	Port Orchard	WA	98366	2017	6	8	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
12	5YJ3E1EA5K	Snohomish	Lynnwood	WA	98087	2019	2	2	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
13	JTMAB3FV5R	Kitsap	Poulsbo	WA	98370	2024	7	9	Plug-in Hybrid Electric Vehicle (PHEV)	Clean Alternative Fuel Vehicle Eligible
14	5YJSA1DPXC	Thurston	Olympia	WA	98502	2012	2	4	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
15	YV4H60LF5R	Yakima	Yakima	WA	98908	2024	8	10	Plug-in Hybrid Electric Vehicle (PHEV)	Clean Alternative Fuel Vehicle Eligible
16	5YJYGDEF8L	Snohomish	Edmonds	WA	98026	2020	2	3	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
17	5YJ3E1EA6L	King	Duvall	WA	98019	2020	2	2	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
18	1C4RJXN64R	Thurston	Olympia	WA	98502	2024	9	11	Plug-in Hybrid Electric Vehicle (PHEV)	Not eligible due to low battery range
19	5YJSA1H28F	King	Bothell	WA	98011	2015	2	4	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
20	5YJ3E1EB7K	King	Seattle	WA	98115	2019	2	2	Battery Electric Vehicle (BEV)	Clean Alternative Fuel Vehicle Eligible
\.


--
-- Data for Name: make; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.make (id, name) FROM stdin;
1	BMW
2	TESLA
3	PORSCHE
4	NISSAN
5	FORD
6	CHEVROLET
7	TOYOTA
8	VOLVO
9	JEEP
\.


--
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model (id, make_id, name) FROM stdin;
1	1	X5
2	2	MODEL 3
3	2	MODEL Y
4	2	MODEL S
5	3	PANAMERA
6	4	LEAF
7	5	FUSION
8	6	BOLT EV
9	7	RAV4 PRIME
10	8	XC90
11	9	WRANGLER
12	1	X3
\.


--
-- Name: car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_id_seq', 20, true);


--
-- Name: make_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.make_id_seq', 9, true);


--
-- Name: model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.model_id_seq', 12, true);


--
-- Name: car car_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (id);


--
-- Name: car car_vin_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_vin_key UNIQUE (vin);


--
-- Name: make make_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.make
    ADD CONSTRAINT make_name_key UNIQUE (name);


--
-- Name: make make_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.make
    ADD CONSTRAINT make_pkey PRIMARY KEY (id);


--
-- Name: model model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (id);


--
-- Name: car car_make_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_make_id_fkey FOREIGN KEY (make_id) REFERENCES public.make(id);


--
-- Name: car car_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.model(id);


--
-- Name: model model_make_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_make_id_fkey FOREIGN KEY (make_id) REFERENCES public.make(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

