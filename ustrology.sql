--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorites (
    favorite_id integer NOT NULL,
    user_id integer,
    horoscope_id integer
);


ALTER TABLE public.favorites OWNER TO postgres;

--
-- Name: favorites_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favorites_favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_favorite_id_seq OWNER TO postgres;

--
-- Name: favorites_favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorites_favorite_id_seq OWNED BY public.favorites.favorite_id;


--
-- Name: horoscopes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horoscopes (
    horoscope_id integer NOT NULL,
    sign character varying(255) NOT NULL,
    date_range character varying(255) NOT NULL,
    prediction text NOT NULL,
    lucky_number integer,
    lucky_color character varying(255),
    lucky_day character varying(255),
    user_id integer
);


ALTER TABLE public.horoscopes OWNER TO postgres;

--
-- Name: horoscopes_horoscope_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.horoscopes_horoscope_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horoscopes_horoscope_id_seq OWNER TO postgres;

--
-- Name: horoscopes_horoscope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.horoscopes_horoscope_id_seq OWNED BY public.horoscopes.horoscope_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: favorites favorite_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites ALTER COLUMN favorite_id SET DEFAULT nextval('public.favorites_favorite_id_seq'::regclass);


--
-- Name: horoscopes horoscope_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horoscopes ALTER COLUMN horoscope_id SET DEFAULT nextval('public.horoscopes_horoscope_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (favorite_id, user_id, horoscope_id) FROM stdin;
1	1	2
2	1	3
3	2	1
\.


--
-- Data for Name: horoscopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horoscopes (horoscope_id, sign, date_range, prediction, lucky_number, lucky_color, lucky_day, user_id) FROM stdin;
1	Aries	March 21 - April 19	Today is a great day to take risks and pursue your goals.	7	Red	Tuesday	1
2	Aries	March 21 - April 19	Focus on your relationships today. Strengthen bonds with loved ones.	3	Orange	Sunday	2
3	Aries	March 21 - April 19	You may face some financial challenges today. Practice mindful spending.	9	Yellow	Friday	3
4	Taurus	April 20 - May 20	Focus on your health and well-being today. Take some time for self-care.	5	Green	Friday	1
5	Taurus	April 20 - May 20	Today is a good day for creativity. Express yourself through art or music.	6	Pink	Wednesday	2
6	Taurus	April 20 - May 20	You may receive good news regarding your career. Stay open to opportunities.	2	Purple	Monday	3
7	Gemini	May 21 - June 20	You might face some communication challenges today. Stay patient and listen attentively.	3	Yellow	Wednesday	1
8	Gemini	May 21 - June 20	Today is a favorable day for networking and making new connections.	8	Blue	Thursday	2
9	Gemini	May 21 - June 20	Focus on your personal growth today. Explore new hobbies or learn something new.	4	Silver	Sunday	3
10	Libra	September 23 - October 22	Today is a day for balance and harmony. Seek harmony in all areas of your life.	7	Pink	Friday	1
11	Libra	September 23 - October 22	Focus on your relationships today. Nurture and strengthen your connections.	2	Blue	Monday	2
12	Libra	September 23 - October 22	You may face some decision-making challenges today. Trust your instincts.	9	Green	Wednesday	3
13	Scorpio	October 23 - November 21	Today is a day to embrace your passions and delve into your deeper desires.	5	Maroon	Tuesday	1
14	Scorpio	October 23 - November 21	Focus on self-care and emotional well-being today. Take time for introspection.	3	Black	Sunday	2
15	Scorpio	October 23 - November 21	You may receive unexpected financial opportunities today. Stay open and aware.	8	Gold	Thursday	3
16	Sagittarius	November 22 - December 21	Today is a day for adventure and exploration. Embrace new experiences.	6	Purple	Thursday	1
17	Sagittarius	November 22 - December 21	Focus on your personal growth and self-improvement today. Seek knowledge.	4	Turquoise	Wednesday	2
18	Sagittarius	November 22 - December 21	You may face some challenges in your relationships today. Practice open communication.	1	Yellow	Monday	3
19	Capricorn	December 22 - January 19	Today is a day for hard work and perseverance. Stay focused on your goals.	8	Brown	Tuesday	1
20	Capricorn	December 22 - January 19	Focus on your financial stability today. Make wise financial decisions.	4	Gray	Friday	2
21	Capricorn	December 22 - January 19	You may face some challenges in your professional life today. Stay resilient.	1	Black	Monday	3
22	Aquarius	January 20 - February 18	Today is a day for social causes and making a positive impact in your community.	7	Blue	Saturday	1
23	Aquarius	January 20 - February 18	Focus on your personal relationships today. Express your love and appreciation.	2	Silver	Wednesday	2
24	Aquarius	January 20 - February 18	You may experience a surge of creativity today. Embrace and express your unique ideas.	6	Purple	Sunday	3
25	Pisces	February 19 - March 20	Today is a day for spirituality and introspection. Connect with your inner self.	3	Sea Green	Thursday	1
26	Pisces	February 19 - March 20	Focus on your emotional well-being today. Practice self-care and self-compassion.	9	Lavender	Monday	2
27	Pisces	February 19 - March 20	You may receive unexpected opportunities in your career today. Stay open and proactive.	5	Ocean Blue	Friday	3
28	Cancer	June 21 - July 22	Today is a day for emotional well-being. Take care of yourself and nurture your relationships.	7	Silver	Monday	1
29	Cancer	June 21 - July 22	Focus on your family and home today. Create a peaceful and harmonious environment.	2	Sea Green	Wednesday	2
30	Cancer	June 21 - July 22	You may feel more intuitive today. Trust your instincts in making important decisions.	6	White	Sunday	3
31	Leo	July 23 - August 22	Today is a day to embrace your leadership qualities. Step up and take charge.	5	Gold	Sunday	1
32	Leo	July 23 - August 22	Focus on your creativity and self-expression today. Let your talents shine.	1	Orange	Thursday	2
33	Leo	July 23 - August 22	You may experience some unexpected opportunities today. Embrace them with confidence.	9	Purple	Friday	3
34	Virgo	August 23 - September 22	Today is a day for attention to detail and practicality. Stay organized in your tasks.	3	Green	Wednesday	1
35	Virgo	August 23 - September 22	Focus on your health and well-being today. Prioritize self-care and healthy habits.	7	Navy Blue	Saturday	2
36	Virgo	August 23 - September 22	You may find yourself in a problem-solving mode today. Trust your analytical skills.	4	Gray	Tuesday	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, email, password) FROM stdin;
1	johnsmith	john@example.com	password123
2	janedoe	jane@example.com	abc123
3	alexwilson	alex@example.com	qwerty
4	johny	John100@marro.ch	deezNuts
5	AmgadDarwisch	Amgas@Darwisch.at	$2b$10$RWwvVBH6uuH4ZB6ODQ4hdO2bQNlgh2J4b/XjRLuCpo4.KX.JqDIPW
8	AmgadDarwish	Amgad@Darwish.at	$2b$10$zeFdy0su4btMBlzLbwi3FeJ1MarCjhr8TBAkcVBhkRi2nmKO32l9m
\.


--
-- Name: favorites_favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorites_favorite_id_seq', 3, true);


--
-- Name: horoscopes_horoscope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horoscopes_horoscope_id_seq', 36, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 8, true);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (favorite_id);


--
-- Name: horoscopes horoscopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horoscopes
    ADD CONSTRAINT horoscopes_pkey PRIMARY KEY (horoscope_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: favorites favorites_horoscope_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_horoscope_id_fkey FOREIGN KEY (horoscope_id) REFERENCES public.horoscopes(horoscope_id);


--
-- Name: favorites favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: horoscopes horoscopes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horoscopes
    ADD CONSTRAINT horoscopes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

