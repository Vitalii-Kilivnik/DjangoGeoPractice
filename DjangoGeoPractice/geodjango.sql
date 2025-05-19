--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-02-06 14:25:18

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

--
-- TOC entry 8 (class 2615 OID 17990)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 2 (class 3079 OID 16395)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 3 (class 3079 OID 17433)
-- Name: postgis_raster; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_raster; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';


--
-- TOC entry 4 (class 3079 OID 17991)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 237 (class 1259 OID 18169)
-- Name: TestTask_building; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public."TestTask_building" (
    id bigint NOT NULL,
    address character varying(100),
    geom public.geometry(Geometry,4326) NOT NULL
);


ALTER TABLE public."TestTask_building" OWNER TO geo;

--
-- TOC entry 236 (class 1259 OID 18168)
-- Name: TestTask_building_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public."TestTask_building_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TestTask_building_id_seq" OWNER TO geo;

--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 236
-- Name: TestTask_building_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public."TestTask_building_id_seq" OWNED BY public."TestTask_building".id;


--
-- TOC entry 243 (class 1259 OID 18195)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO geo;

--
-- TOC entry 242 (class 1259 OID 18194)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO geo;

--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 242
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 245 (class 1259 OID 18204)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO geo;

--
-- TOC entry 244 (class 1259 OID 18203)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO geo;

--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 244
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 241 (class 1259 OID 18188)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO geo;

--
-- TOC entry 240 (class 1259 OID 18187)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO geo;

--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 240
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 247 (class 1259 OID 18211)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO geo;

--
-- TOC entry 249 (class 1259 OID 18220)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO geo;

--
-- TOC entry 248 (class 1259 OID 18219)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO geo;

--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 248
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 246 (class 1259 OID 18210)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO geo;

--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 246
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 251 (class 1259 OID 18227)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO geo;

--
-- TOC entry 250 (class 1259 OID 18226)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO geo;

--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 250
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 253 (class 1259 OID 18286)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO geo;

--
-- TOC entry 252 (class 1259 OID 18285)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO geo;

--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 252
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 239 (class 1259 OID 18179)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO geo;

--
-- TOC entry 238 (class 1259 OID 18178)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO geo;

--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 238
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 235 (class 1259 OID 18160)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO geo;

--
-- TOC entry 234 (class 1259 OID 18159)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: geo
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO geo;

--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geo
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 254 (class 1259 OID 18315)
-- Name: django_session; Type: TABLE; Schema: public; Owner: geo
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO geo;

--
-- TOC entry 4794 (class 2604 OID 18172)
-- Name: TestTask_building id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public."TestTask_building" ALTER COLUMN id SET DEFAULT nextval('public."TestTask_building_id_seq"'::regclass);


--
-- TOC entry 4797 (class 2604 OID 18198)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 4798 (class 2604 OID 18207)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 18191)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 4799 (class 2604 OID 18214)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 4800 (class 2604 OID 18223)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 4801 (class 2604 OID 18230)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 4802 (class 2604 OID 18289)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 18182)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 18163)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 4818 (class 2606 OID 18176)
-- Name: TestTask_building TestTask_building_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public."TestTask_building"
    ADD CONSTRAINT "TestTask_building_pkey" PRIMARY KEY (id);


--
-- TOC entry 4830 (class 2606 OID 18313)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 4835 (class 2606 OID 18243)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 4838 (class 2606 OID 18209)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4832 (class 2606 OID 18200)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 4825 (class 2606 OID 18234)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 4827 (class 2606 OID 18193)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 4846 (class 2606 OID 18225)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4849 (class 2606 OID 18258)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 4840 (class 2606 OID 18216)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 4852 (class 2606 OID 18232)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4855 (class 2606 OID 18272)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 4843 (class 2606 OID 18308)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 4858 (class 2606 OID 18294)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4820 (class 2606 OID 18186)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 4822 (class 2606 OID 18184)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4815 (class 2606 OID 18167)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4862 (class 2606 OID 18321)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 4816 (class 1259 OID 18325)
-- Name: TestTask_building_geom_76ff94b4_id; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX "TestTask_building_geom_76ff94b4_id" ON public."TestTask_building" USING gist (geom);


--
-- TOC entry 4828 (class 1259 OID 18314)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 4833 (class 1259 OID 18254)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 4836 (class 1259 OID 18255)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 4823 (class 1259 OID 18240)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 4844 (class 1259 OID 18270)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 4847 (class 1259 OID 18269)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 4850 (class 1259 OID 18284)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 4853 (class 1259 OID 18283)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 4841 (class 1259 OID 18309)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 4856 (class 1259 OID 18305)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 4859 (class 1259 OID 18306)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 4860 (class 1259 OID 18323)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 4863 (class 1259 OID 18322)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: geo
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 4866 (class 2606 OID 18249)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4865 (class 2606 OID 18244)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4864 (class 2606 OID 18235)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4868 (class 2606 OID 18264)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4867 (class 2606 OID 18259)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4870 (class 2606 OID 18278)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4869 (class 2606 OID 18273)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4871 (class 2606 OID 18295)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4872 (class 2606 OID 18300)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: geo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2022-02-06 14:25:19

--
-- PostgreSQL database dump complete
--

