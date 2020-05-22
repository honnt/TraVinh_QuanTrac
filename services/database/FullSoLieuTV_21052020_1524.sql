--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-05-21 15:25:14

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
-- TOC entry 19 (class 2615 OID 18524)
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- TOC entry 22 (class 2615 OID 18794)
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- TOC entry 18 (class 2615 OID 18231)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 5421 (class 0 OID 0)
-- Dependencies: 18
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 8 (class 3079 OID 18375)
-- Name: address_standardizer; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;


--
-- TOC entry 5422 (class 0 OID 0)
-- Dependencies: 8
-- Name: EXTENSION address_standardizer; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';


--
-- TOC entry 1 (class 3079 OID 19147)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 5423 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 3 (class 3079 OID 18513)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 5424 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 4 (class 3079 OID 18509)
-- Name: ogr_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;


--
-- TOC entry 5425 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION ogr_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';


--
-- TOC entry 11 (class 3079 OID 16394)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 5426 (class 0 OID 0)
-- Dependencies: 11
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- TOC entry 9 (class 3079 OID 17990)
-- Name: pgrouting; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;


--
-- TOC entry 5427 (class 0 OID 0)
-- Dependencies: 9
-- Name: EXTENSION pgrouting; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';


--
-- TOC entry 6 (class 3079 OID 18402)
-- Name: pointcloud; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;


--
-- TOC entry 5428 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION pointcloud; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';


--
-- TOC entry 5 (class 3079 OID 18498)
-- Name: pointcloud_postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;


--
-- TOC entry 5429 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION pointcloud_postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';


--
-- TOC entry 10 (class 3079 OID 17396)
-- Name: postgis_raster; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;


--
-- TOC entry 5430 (class 0 OID 0)
-- Dependencies: 10
-- Name: EXTENSION postgis_raster; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';


--
-- TOC entry 7 (class 3079 OID 18382)
-- Name: postgis_sfcgal; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;


--
-- TOC entry 5431 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION postgis_sfcgal; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';


--
-- TOC entry 13 (class 3079 OID 18525)
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- TOC entry 5432 (class 0 OID 0)
-- Dependencies: 13
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- TOC entry 12 (class 3079 OID 18232)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 5433 (class 0 OID 0)
-- Dependencies: 12
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 291 (class 1259 OID 19156)
-- Name: Basin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Basin" (
    id integer NOT NULL,
    riverid character varying(50) NOT NULL,
    name character varying(255),
    parentriverbasinid integer,
    master character varying(255),
    purpose character varying(255),
    surfaceareanwt character varying(100),
    netcapacity character varying(100),
    deadcapacity character varying(100),
    risingofnormalwaterlevel character varying(100),
    deadwaterlevel character varying(100),
    beginning character varying(255),
    termini character varying(255),
    length character varying(100),
    riverbasinarea double precision,
    averageflowrate character varying(100),
    capacity character varying(100),
    normalwaterlevel double precision,
    standard character varying(50),
    description character varying(255)
);


ALTER TABLE public."Basin" OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 19162)
-- Name: Camera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Camera" (
    address text,
    id integer NOT NULL,
    name text,
    stationid integer,
    "user" text,
    pass integer,
    description text
);


ALTER TABLE public."Camera" OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 19168)
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- TOC entry 322 (class 1259 OID 28724)
-- Name: District; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."District" (
    id integer NOT NULL,
    code character varying(10),
    name character varying(255),
    provinceid integer
);


ALTER TABLE public."District" OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 19171)
-- Name: ElectronicBoard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ElectronicBoard" (
    id integer NOT NULL,
    name text NOT NULL,
    stationid integer DEFAULT 1,
    coordx double precision,
    coordy double precision,
    note text,
    the_geom public.geometry
);


ALTER TABLE public."ElectronicBoard" OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 19178)
-- Name: Enterprise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Enterprise" (
    id integer NOT NULL,
    name text,
    address text,
    phone text,
    type text,
    tin integer,
    fax text,
    email character varying,
    "accountNumber" text,
    active character(1),
    employees integer,
    "totalInvestment" text,
    profession text,
    agent text,
    title text
);


ALTER TABLE public."Enterprise" OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 19184)
-- Name: Location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Location" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    locationtypeid integer,
    note character varying(255)
);


ALTER TABLE public."Location" OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 19190)
-- Name: LocationType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LocationType" (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public."LocationType" OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 19193)
-- Name: Observation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Observation" (
    id integer NOT NULL,
    day date NOT NULL,
    "time" time(6) without time zone NOT NULL,
    sampleid integer,
    note character varying(255),
    value text,
    stationid integer,
    standardparameterid integer,
    qualityindexid integer,
    detail text
);


ALTER TABLE public."Observation" OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 19199)
-- Name: ObservationType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ObservationType" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    parentid integer,
    categoryid integer DEFAULT 1,
    code character varying(10),
    level integer,
    ordering integer
);


ALTER TABLE public."ObservationType" OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 19206)
-- Name: Observationstation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Observationstation" (
    id integer NOT NULL,
    code character varying(255),
    name character varying(255),
    organizationid integer,
    categoryid integer DEFAULT 1,
    coordx double precision,
    coordy double precision,
    basinid integer,
    enterpriseid integer DEFAULT 87,
    districtid integer,
    wardid integer,
    locationid integer,
    establishyear date,
    terminatedate date,
    maintenance character varying(255),
    note character varying(255),
    active character(1) DEFAULT 'Y'::bpchar,
    ftpusername character varying(255),
    ftppassword character varying(255),
    obstypes character varying(255),
    the_geom public.geometry,
    district integer
);


ALTER TABLE public."Observationstation" OWNER TO postgres;

--
-- TOC entry 323 (class 1259 OID 31941)
-- Name: Obstype_Station; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Obstype_Station" (
    id integer NOT NULL,
    stationid integer,
    obstypesid integer
);


ALTER TABLE public."Obstype_Station" OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 19215)
-- Name: Organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Organization" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public."Organization" OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 19221)
-- Name: Parameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Parameter" (
    id integer NOT NULL,
    code text,
    name text NOT NULL
);


ALTER TABLE public."Parameter" OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 19227)
-- Name: Purpose; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Purpose" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public."Purpose" OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 19233)
-- Name: Qualityindex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Qualityindex" (
    id integer NOT NULL,
    name text,
    belowvalue double precision,
    abovevalue double precision,
    colorcode text,
    purpose text
);


ALTER TABLE public."Qualityindex" OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 19239)
-- Name: Sample_BanTuDong; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sample_BanTuDong" (
    id integer NOT NULL,
    symbol character varying(100),
    stationid integer,
    "time" time(6) with time zone,
    "dateOfSamping" date,
    "dateOfAnalysis" date,
    "samplingLocations" character varying(255),
    weather character varying(255)
);


ALTER TABLE public."Sample_BanTuDong" OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 19245)
-- Name: Standard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Standard" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    symbol character varying(50),
    obstypeid integer,
    dateoflssue date,
    organization character varying(100),
    attachment character varying(255)
);


ALTER TABLE public."Standard" OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 19251)
-- Name: standardparameter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.standardparameter_id_seq
    START WITH 4
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.standardparameter_id_seq OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 19253)
-- Name: StandardParameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StandardParameter" (
    id integer DEFAULT nextval('public.standardparameter_id_seq'::regclass) NOT NULL,
    standardid integer,
    parameterid integer,
    unitid integer,
    minvalue double precision,
    maxvalue double precision,
    purposeid integer,
    analysismethod text
);


ALTER TABLE public."StandardParameter" OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 19257)
-- Name: Unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Unit" (
    id integer NOT NULL,
    code text,
    name text
);


ALTER TABLE public."Unit" OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 19263)
-- Name: basin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basin_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basin_id_seq OWNER TO postgres;

--
-- TOC entry 5434 (class 0 OID 0)
-- Dependencies: 310
-- Name: basin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basin_id_seq OWNED BY public."Basin".id;


--
-- TOC entry 311 (class 1259 OID 19265)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 5435 (class 0 OID 0)
-- Dependencies: 311
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public."Category".id;


--
-- TOC entry 312 (class 1259 OID 19267)
-- Name: electronicinfoboard_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.electronicinfoboard_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.electronicinfoboard_id_seq OWNER TO postgres;

--
-- TOC entry 5436 (class 0 OID 0)
-- Dependencies: 312
-- Name: electronicinfoboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.electronicinfoboard_id_seq OWNED BY public."ElectronicBoard".id;


--
-- TOC entry 313 (class 1259 OID 19269)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 19271)
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_id_seq OWNER TO postgres;

--
-- TOC entry 5437 (class 0 OID 0)
-- Dependencies: 314
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_id_seq OWNED BY public."Location".id;


--
-- TOC entry 315 (class 1259 OID 19273)
-- Name: observation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.observation_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_id_seq OWNER TO postgres;

--
-- TOC entry 5438 (class 0 OID 0)
-- Dependencies: 315
-- Name: observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observation_id_seq OWNED BY public."Observation".id;


--
-- TOC entry 316 (class 1259 OID 19275)
-- Name: observationstation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.observationstation_id_seq
    START WITH 278
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observationstation_id_seq OWNER TO postgres;

--
-- TOC entry 317 (class 1259 OID 19277)
-- Name: observationtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.observationtype_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observationtype_id_seq OWNER TO postgres;

--
-- TOC entry 5439 (class 0 OID 0)
-- Dependencies: 317
-- Name: observationtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observationtype_id_seq OWNED BY public."ObservationType".id;


--
-- TOC entry 318 (class 1259 OID 19279)
-- Name: parameter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parameter_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parameter_id_seq OWNER TO postgres;

--
-- TOC entry 5440 (class 0 OID 0)
-- Dependencies: 318
-- Name: parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parameter_id_seq OWNED BY public."Parameter".id;


--
-- TOC entry 319 (class 1259 OID 19281)
-- Name: setting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setting_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setting_id_seq OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 19283)
-- Name: standard_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.standard_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.standard_id_seq OWNER TO postgres;

--
-- TOC entry 5441 (class 0 OID 0)
-- Dependencies: 320
-- Name: standard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.standard_id_seq OWNED BY public."Standard".id;


--
-- TOC entry 321 (class 1259 OID 19285)
-- Name: unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unit_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unit_id_seq OWNER TO postgres;

--
-- TOC entry 5442 (class 0 OID 0)
-- Dependencies: 321
-- Name: unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unit_id_seq OWNED BY public."Unit".id;


--
-- TOC entry 5070 (class 2604 OID 19287)
-- Name: Basin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Basin" ALTER COLUMN id SET DEFAULT nextval('public.basin_id_seq'::regclass);


--
-- TOC entry 5071 (class 2604 OID 19288)
-- Name: Category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category" ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 5073 (class 2604 OID 19289)
-- Name: ElectronicBoard id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ElectronicBoard" ALTER COLUMN id SET DEFAULT nextval('public.electronicinfoboard_id_seq'::regclass);


--
-- TOC entry 5074 (class 2604 OID 19290)
-- Name: Location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Location" ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- TOC entry 5075 (class 2604 OID 19291)
-- Name: Observation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observation" ALTER COLUMN id SET DEFAULT nextval('public.observation_id_seq'::regclass);


--
-- TOC entry 5077 (class 2604 OID 19292)
-- Name: ObservationType id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ObservationType" ALTER COLUMN id SET DEFAULT nextval('public.observationtype_id_seq'::regclass);


--
-- TOC entry 5081 (class 2604 OID 19293)
-- Name: Parameter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Parameter" ALTER COLUMN id SET DEFAULT nextval('public.parameter_id_seq'::regclass);


--
-- TOC entry 5082 (class 2604 OID 19294)
-- Name: Standard id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Standard" ALTER COLUMN id SET DEFAULT nextval('public.standard_id_seq'::regclass);


--
-- TOC entry 5084 (class 2604 OID 19295)
-- Name: Unit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Unit" ALTER COLUMN id SET DEFAULT nextval('public.unit_id_seq'::regclass);


--
-- TOC entry 5259 (class 2606 OID 28740)
-- Name: District District_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."District"
    ADD CONSTRAINT "District_pkey" PRIMARY KEY (id);


--
-- TOC entry 5243 (class 2606 OID 19297)
-- Name: Qualityindex QualityIndex; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Qualityindex"
    ADD CONSTRAINT "QualityIndex" PRIMARY KEY (id);


--
-- TOC entry 5208 (class 2606 OID 19299)
-- Name: Basin basin; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Basin"
    ADD CONSTRAINT basin PRIMARY KEY (id);


--
-- TOC entry 5211 (class 2606 OID 19301)
-- Name: Category category; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT category PRIMARY KEY (id);


--
-- TOC entry 5214 (class 2606 OID 19303)
-- Name: Enterprise enterprise; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Enterprise"
    ADD CONSTRAINT enterprise PRIMARY KEY (id);


--
-- TOC entry 5217 (class 2606 OID 19305)
-- Name: Location location; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Location"
    ADD CONSTRAINT location PRIMARY KEY (id);


--
-- TOC entry 5219 (class 2606 OID 19307)
-- Name: LocationType location_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LocationType"
    ADD CONSTRAINT location_type PRIMARY KEY (id);


--
-- TOC entry 5261 (class 2606 OID 31945)
-- Name: Obstype_Station name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Obstype_Station"
    ADD CONSTRAINT name_pkey PRIMARY KEY (id);


--
-- TOC entry 5235 (class 2606 OID 19309)
-- Name: Observationstation obs_station; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT obs_station PRIMARY KEY (id);


--
-- TOC entry 5227 (class 2606 OID 19311)
-- Name: ObservationType obserType; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ObservationType"
    ADD CONSTRAINT "obserType" PRIMARY KEY (id);


--
-- TOC entry 5237 (class 2606 OID 19313)
-- Name: Organization organization; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organization"
    ADD CONSTRAINT organization PRIMARY KEY (id);


--
-- TOC entry 5239 (class 2606 OID 19315)
-- Name: Parameter para; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Parameter"
    ADD CONSTRAINT para PRIMARY KEY (id);


--
-- TOC entry 5241 (class 2606 OID 19317)
-- Name: Purpose purpose; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Purpose"
    ADD CONSTRAINT purpose PRIMARY KEY (id);


--
-- TOC entry 5246 (class 2606 OID 19319)
-- Name: Sample_BanTuDong sample; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sample_BanTuDong"
    ADD CONSTRAINT sample PRIMARY KEY (id);


--
-- TOC entry 5249 (class 2606 OID 19321)
-- Name: Standard standard; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Standard"
    ADD CONSTRAINT standard PRIMARY KEY (id);


--
-- TOC entry 5255 (class 2606 OID 19323)
-- Name: StandardParameter standard_para; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StandardParameter"
    ADD CONSTRAINT standard_para PRIMARY KEY (id);


--
-- TOC entry 5257 (class 2606 OID 19325)
-- Name: Unit unit; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Unit"
    ADD CONSTRAINT unit PRIMARY KEY (id);


--
-- TOC entry 5220 (class 1259 OID 19326)
-- Name: find_by_station_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX find_by_station_idx ON public."Observation" USING btree (stationid);


--
-- TOC entry 5221 (class 1259 OID 19327)
-- Name: find_station_type_day_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX find_station_type_day_idx ON public."Observation" USING btree (stationid, standardparameterid, day);


--
-- TOC entry 5228 (class 1259 OID 19328)
-- Name: fki_basin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_basin ON public."Observationstation" USING btree (basinid);


--
-- TOC entry 5225 (class 1259 OID 19329)
-- Name: fki_category_connect_obserType; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_category_connect_obserType" ON public."ObservationType" USING btree (categoryid);


--
-- TOC entry 5229 (class 1259 OID 19330)
-- Name: fki_connect_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_connect_category ON public."Observationstation" USING btree (categoryid);


--
-- TOC entry 5230 (class 1259 OID 28746)
-- Name: fki_connect_district; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_connect_district ON public."Observationstation" USING btree (districtid);


--
-- TOC entry 5231 (class 1259 OID 19331)
-- Name: fki_connect_enterprise; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_connect_enterprise ON public."Observationstation" USING btree (enterpriseid);


--
-- TOC entry 5232 (class 1259 OID 19332)
-- Name: fki_connect_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_connect_location ON public."Observationstation" USING btree (locationid);


--
-- TOC entry 5233 (class 1259 OID 19333)
-- Name: fki_connect_organization; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_connect_organization ON public."Observationstation" USING btree (organizationid);


--
-- TOC entry 5215 (class 1259 OID 19334)
-- Name: fki_location_connect_locType; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_location_connect_locType" ON public."Location" USING btree (locationtypeid);


--
-- TOC entry 5222 (class 1259 OID 19335)
-- Name: fki_qualityIndex_connect_observation; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_qualityIndex_connect_observation" ON public."Observation" USING btree (qualityindexid);


--
-- TOC entry 5223 (class 1259 OID 19336)
-- Name: fki_sampleid_connect_observation; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sampleid_connect_observation ON public."Observation" USING btree (sampleid);


--
-- TOC entry 5224 (class 1259 OID 19337)
-- Name: fki_standardPara_connect_observation; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_standardPara_connect_observation" ON public."Observation" USING btree (standardparameterid);


--
-- TOC entry 5250 (class 1259 OID 19338)
-- Name: fki_standardPara_connect_para; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_standardPara_connect_para" ON public."StandardParameter" USING btree (parameterid);


--
-- TOC entry 5251 (class 1259 OID 19339)
-- Name: fki_standardPara_connect_purpose; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_standardPara_connect_purpose" ON public."StandardParameter" USING btree (purposeid);


--
-- TOC entry 5252 (class 1259 OID 19340)
-- Name: fki_standardPara_connect_standard; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_standardPara_connect_standard" ON public."StandardParameter" USING btree (standardid);


--
-- TOC entry 5253 (class 1259 OID 19341)
-- Name: fki_standardPara_connect_unit; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_standardPara_connect_unit" ON public."StandardParameter" USING btree (unitid);


--
-- TOC entry 5247 (class 1259 OID 19342)
-- Name: fki_standard_connect_obserType; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_standard_connect_obserType" ON public."Standard" USING btree (obstypeid);


--
-- TOC entry 5212 (class 1259 OID 19343)
-- Name: fki_stationid_connect_ElecBoard; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_stationid_connect_ElecBoard" ON public."ElectronicBoard" USING btree (stationid);


--
-- TOC entry 5209 (class 1259 OID 19344)
-- Name: fki_stationid_connect_cam; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_stationid_connect_cam ON public."Camera" USING btree (stationid);


--
-- TOC entry 5244 (class 1259 OID 19345)
-- Name: fki_stationid_connect_observation; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_stationid_connect_observation ON public."Sample_BanTuDong" USING btree (stationid);


--
-- TOC entry 5269 (class 2606 OID 19346)
-- Name: ObservationType category_connect_obserType; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ObservationType"
    ADD CONSTRAINT "category_connect_obserType" FOREIGN KEY (categoryid) REFERENCES public."Category"(id) NOT VALID;


--
-- TOC entry 5270 (class 2606 OID 19351)
-- Name: Observationstation connect_basin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT connect_basin FOREIGN KEY (basinid) REFERENCES public."Basin"(id) NOT VALID;


--
-- TOC entry 5271 (class 2606 OID 19356)
-- Name: Observationstation connect_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT connect_category FOREIGN KEY (categoryid) REFERENCES public."Category"(id) NOT VALID;


--
-- TOC entry 5272 (class 2606 OID 28741)
-- Name: Observationstation connect_district; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT connect_district FOREIGN KEY (districtid) REFERENCES public."District"(id) NOT VALID;


--
-- TOC entry 5273 (class 2606 OID 19361)
-- Name: Observationstation connect_enterprise; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT connect_enterprise FOREIGN KEY (enterpriseid) REFERENCES public."Enterprise"(id) NOT VALID;


--
-- TOC entry 5274 (class 2606 OID 19366)
-- Name: Observationstation connect_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT connect_location FOREIGN KEY (locationid) REFERENCES public."Location"(id) NOT VALID;


--
-- TOC entry 5275 (class 2606 OID 19371)
-- Name: Observationstation connect_organization; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT connect_organization FOREIGN KEY (organizationid) REFERENCES public."Organization"(id) NOT VALID;


--
-- TOC entry 5264 (class 2606 OID 19376)
-- Name: Location location_connect_locType; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Location"
    ADD CONSTRAINT "location_connect_locType" FOREIGN KEY (locationtypeid) REFERENCES public."LocationType"(id) NOT VALID;


--
-- TOC entry 5265 (class 2606 OID 19381)
-- Name: Observation qualityIndex_connect_observation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observation"
    ADD CONSTRAINT "qualityIndex_connect_observation" FOREIGN KEY (qualityindexid) REFERENCES public."Qualityindex"(id) NOT VALID;


--
-- TOC entry 5266 (class 2606 OID 19386)
-- Name: Observation sampleid_connect_observation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observation"
    ADD CONSTRAINT sampleid_connect_observation FOREIGN KEY (sampleid) REFERENCES public."Sample_BanTuDong"(id) NOT VALID;


--
-- TOC entry 5267 (class 2606 OID 19391)
-- Name: Observation standardPara_connect_observation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observation"
    ADD CONSTRAINT "standardPara_connect_observation" FOREIGN KEY (standardparameterid) REFERENCES public."StandardParameter"(id) NOT VALID;


--
-- TOC entry 5278 (class 2606 OID 19396)
-- Name: StandardParameter standardPara_connect_para; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StandardParameter"
    ADD CONSTRAINT "standardPara_connect_para" FOREIGN KEY (parameterid) REFERENCES public."Parameter"(id) NOT VALID;


--
-- TOC entry 5279 (class 2606 OID 19401)
-- Name: StandardParameter standardPara_connect_purpose; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StandardParameter"
    ADD CONSTRAINT "standardPara_connect_purpose" FOREIGN KEY (purposeid) REFERENCES public."Purpose"(id) NOT VALID;


--
-- TOC entry 5280 (class 2606 OID 19406)
-- Name: StandardParameter standardPara_connect_standard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StandardParameter"
    ADD CONSTRAINT "standardPara_connect_standard" FOREIGN KEY (standardid) REFERENCES public."Standard"(id) NOT VALID;


--
-- TOC entry 5281 (class 2606 OID 19411)
-- Name: StandardParameter standardPara_connect_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StandardParameter"
    ADD CONSTRAINT "standardPara_connect_unit" FOREIGN KEY (unitid) REFERENCES public."Unit"(id) NOT VALID;


--
-- TOC entry 5277 (class 2606 OID 19416)
-- Name: Standard standard_connect_obserType; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Standard"
    ADD CONSTRAINT "standard_connect_obserType" FOREIGN KEY (obstypeid) REFERENCES public."ObservationType"(id) NOT VALID;


--
-- TOC entry 5263 (class 2606 OID 19421)
-- Name: ElectronicBoard stationid_connect_ElecBoard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ElectronicBoard"
    ADD CONSTRAINT "stationid_connect_ElecBoard" FOREIGN KEY (stationid) REFERENCES public."Observationstation"(id) NOT VALID;


--
-- TOC entry 5262 (class 2606 OID 19426)
-- Name: Camera stationid_connect_cam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Camera"
    ADD CONSTRAINT stationid_connect_cam FOREIGN KEY (stationid) REFERENCES public."Observationstation"(id) NOT VALID;


--
-- TOC entry 5268 (class 2606 OID 19431)
-- Name: Observation stationid_connect_observation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observation"
    ADD CONSTRAINT stationid_connect_observation FOREIGN KEY (stationid) REFERENCES public."Observationstation"(id) NOT VALID;


--
-- TOC entry 5276 (class 2606 OID 19436)
-- Name: Sample_BanTuDong stationid_connect_sample; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sample_BanTuDong"
    ADD CONSTRAINT stationid_connect_sample FOREIGN KEY (stationid) REFERENCES public."Observationstation"(id) NOT VALID;


-- Completed on 2020-05-21 15:25:16

--
-- PostgreSQL database dump complete
--

