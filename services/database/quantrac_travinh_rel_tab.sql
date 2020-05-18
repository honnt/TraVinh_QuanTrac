--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-05-18 16:14:32

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
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 18969)
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
-- TOC entry 204 (class 1259 OID 18975)
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
-- TOC entry 205 (class 1259 OID 18981)
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 18984)
-- Name: ElectronicBoard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ElectronicBoard" (
    id integer NOT NULL,
    name text NOT NULL,
    stationid integer DEFAULT 1,
    coordx character(1),
    coordy character(1),
    note text
);


ALTER TABLE public."ElectronicBoard" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 18991)
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
    email integer,
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
-- TOC entry 208 (class 1259 OID 18997)
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
-- TOC entry 209 (class 1259 OID 19003)
-- Name: LocationType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LocationType" (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public."LocationType" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 19006)
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
-- TOC entry 211 (class 1259 OID 19012)
-- Name: ObservationType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ObservationType" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    parentid integer,
    categoryid integer DEFAULT 1,
    icon character varying(255)
);


ALTER TABLE public."ObservationType" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 19019)
-- Name: Observationstation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Observationstation" (
    id integer NOT NULL,
    code integer,
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
    obstypes character varying(255)
);


ALTER TABLE public."Observationstation" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 19028)
-- Name: Organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Organization" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public."Organization" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 19034)
-- Name: Parameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Parameter" (
    id integer NOT NULL,
    code text,
    name text NOT NULL
);


ALTER TABLE public."Parameter" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 19040)
-- Name: Purpose; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Purpose" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public."Purpose" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 19046)
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
-- TOC entry 217 (class 1259 OID 19052)
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
-- TOC entry 218 (class 1259 OID 19058)
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
-- TOC entry 219 (class 1259 OID 19064)
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
-- TOC entry 220 (class 1259 OID 19066)
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
    analysismethod character varying(255)
);


ALTER TABLE public."StandardParameter" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 19070)
-- Name: Unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Unit" (
    id integer NOT NULL,
    code text,
    name text
);


ALTER TABLE public."Unit" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 19076)
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
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 222
-- Name: basin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basin_id_seq OWNED BY public."Basin".id;


--
-- TOC entry 223 (class 1259 OID 19078)
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
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 223
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public."Category".id;


--
-- TOC entry 224 (class 1259 OID 19080)
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
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 224
-- Name: electronicinfoboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.electronicinfoboard_id_seq OWNED BY public."ElectronicBoard".id;


--
-- TOC entry 225 (class 1259 OID 19082)
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
-- TOC entry 226 (class 1259 OID 19084)
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
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 226
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_id_seq OWNED BY public."Location".id;


--
-- TOC entry 227 (class 1259 OID 19086)
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
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 227
-- Name: observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observation_id_seq OWNED BY public."Observation".id;


--
-- TOC entry 228 (class 1259 OID 19088)
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
-- TOC entry 229 (class 1259 OID 19090)
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
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 229
-- Name: observationtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observationtype_id_seq OWNED BY public."ObservationType".id;


--
-- TOC entry 230 (class 1259 OID 19092)
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
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 230
-- Name: parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parameter_id_seq OWNED BY public."Parameter".id;


--
-- TOC entry 231 (class 1259 OID 19094)
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
-- TOC entry 232 (class 1259 OID 19096)
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
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 232
-- Name: standard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.standard_id_seq OWNED BY public."Standard".id;


--
-- TOC entry 233 (class 1259 OID 19098)
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
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 233
-- Name: unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unit_id_seq OWNED BY public."Unit".id;


--
-- TOC entry 2795 (class 2604 OID 19100)
-- Name: Basin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Basin" ALTER COLUMN id SET DEFAULT nextval('public.basin_id_seq'::regclass);


--
-- TOC entry 2796 (class 2604 OID 19101)
-- Name: Category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category" ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 2798 (class 2604 OID 19102)
-- Name: ElectronicBoard id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ElectronicBoard" ALTER COLUMN id SET DEFAULT nextval('public.electronicinfoboard_id_seq'::regclass);


--
-- TOC entry 2799 (class 2604 OID 19103)
-- Name: Location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Location" ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- TOC entry 2800 (class 2604 OID 19104)
-- Name: Observation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observation" ALTER COLUMN id SET DEFAULT nextval('public.observation_id_seq'::regclass);


--
-- TOC entry 2802 (class 2604 OID 19105)
-- Name: ObservationType id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ObservationType" ALTER COLUMN id SET DEFAULT nextval('public.observationtype_id_seq'::regclass);


--
-- TOC entry 2806 (class 2604 OID 19106)
-- Name: Parameter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Parameter" ALTER COLUMN id SET DEFAULT nextval('public.parameter_id_seq'::regclass);


--
-- TOC entry 2807 (class 2604 OID 19107)
-- Name: Standard id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Standard" ALTER COLUMN id SET DEFAULT nextval('public.standard_id_seq'::regclass);


--
-- TOC entry 2809 (class 2604 OID 19108)
-- Name: Unit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Unit" ALTER COLUMN id SET DEFAULT nextval('public.unit_id_seq'::regclass);


--
-- TOC entry 2845 (class 2606 OID 19247)
-- Name: Qualityindex QualityIndex; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Qualityindex"
    ADD CONSTRAINT "QualityIndex" PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 19147)
-- Name: Basin basin; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Basin"
    ADD CONSTRAINT basin PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 19184)
-- Name: Category category; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT category PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 19168)
-- Name: Enterprise enterprise; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Enterprise"
    ADD CONSTRAINT enterprise PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 19176)
-- Name: Location location; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Location"
    ADD CONSTRAINT location PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 19231)
-- Name: LocationType location_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LocationType"
    ADD CONSTRAINT location_type PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 19192)
-- Name: Observationstation obs_station; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT obs_station PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 19223)
-- Name: ObservationType obserType; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ObservationType"
    ADD CONSTRAINT "obserType" PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 19160)
-- Name: Organization organization; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organization"
    ADD CONSTRAINT organization PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 19279)
-- Name: Parameter para; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Parameter"
    ADD CONSTRAINT para PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 19271)
-- Name: Purpose purpose; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Purpose"
    ADD CONSTRAINT purpose PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 19239)
-- Name: Sample_BanTuDong sample; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sample_BanTuDong"
    ADD CONSTRAINT sample PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 19263)
-- Name: Standard standard; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Standard"
    ADD CONSTRAINT standard PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 19255)
-- Name: StandardParameter standard_para; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StandardParameter"
    ADD CONSTRAINT standard_para PRIMARY KEY (id);


--
-- TOC entry 2859 (class 2606 OID 19287)
-- Name: Unit unit; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Unit"
    ADD CONSTRAINT unit PRIMARY KEY (id);


--
-- TOC entry 2823 (class 1259 OID 19143)
-- Name: find_by_station_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX find_by_station_idx ON public."Observation" USING btree (stationid);


--
-- TOC entry 2824 (class 1259 OID 19144)
-- Name: find_station_type_day_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX find_station_type_day_idx ON public."Observation" USING btree (stationid, standardparameterid, day);


--
-- TOC entry 2831 (class 1259 OID 19153)
-- Name: fki_basin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_basin ON public."Observationstation" USING btree (basinid);


--
-- TOC entry 2828 (class 1259 OID 19221)
-- Name: fki_category_connect_obserType; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_category_connect_obserType" ON public."ObservationType" USING btree (categoryid);


--
-- TOC entry 2832 (class 1259 OID 19190)
-- Name: fki_connect_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_connect_category ON public."Observationstation" USING btree (categoryid);


--
-- TOC entry 2833 (class 1259 OID 19174)
-- Name: fki_connect_enterprise; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_connect_enterprise ON public."Observationstation" USING btree (enterpriseid);


--
-- TOC entry 2834 (class 1259 OID 19182)
-- Name: fki_connect_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_connect_location ON public."Observationstation" USING btree (locationid);


--
-- TOC entry 2835 (class 1259 OID 19166)
-- Name: fki_connect_organization; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_connect_organization ON public."Observationstation" USING btree (organizationid);


--
-- TOC entry 2818 (class 1259 OID 19237)
-- Name: fki_location_connect_locType; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_location_connect_locType" ON public."Location" USING btree (locationtypeid);


--
-- TOC entry 2825 (class 1259 OID 19253)
-- Name: fki_qualityIndex_connect_observation; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_qualityIndex_connect_observation" ON public."Observation" USING btree (qualityindexid);


--
-- TOC entry 2826 (class 1259 OID 19245)
-- Name: fki_sampleid_connect_observation; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sampleid_connect_observation ON public."Observation" USING btree (sampleid);


--
-- TOC entry 2827 (class 1259 OID 19261)
-- Name: fki_standardPara_connect_observation; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_standardPara_connect_observation" ON public."Observation" USING btree (standardparameterid);


--
-- TOC entry 2852 (class 1259 OID 19285)
-- Name: fki_standardPara_connect_para; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_standardPara_connect_para" ON public."StandardParameter" USING btree (parameterid);


--
-- TOC entry 2853 (class 1259 OID 19277)
-- Name: fki_standardPara_connect_purpose; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_standardPara_connect_purpose" ON public."StandardParameter" USING btree (purposeid);


--
-- TOC entry 2854 (class 1259 OID 19269)
-- Name: fki_standardPara_connect_standard; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_standardPara_connect_standard" ON public."StandardParameter" USING btree (standardid);


--
-- TOC entry 2855 (class 1259 OID 19293)
-- Name: fki_standardPara_connect_unit; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_standardPara_connect_unit" ON public."StandardParameter" USING btree (unitid);


--
-- TOC entry 2849 (class 1259 OID 19229)
-- Name: fki_standard_connect_obserType; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_standard_connect_obserType" ON public."Standard" USING btree (obstypeid);


--
-- TOC entry 2815 (class 1259 OID 19204)
-- Name: fki_stationid_connect_ElecBoard; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_stationid_connect_ElecBoard" ON public."ElectronicBoard" USING btree (stationid);


--
-- TOC entry 2812 (class 1259 OID 19198)
-- Name: fki_stationid_connect_cam; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_stationid_connect_cam ON public."Camera" USING btree (stationid);


--
-- TOC entry 2846 (class 1259 OID 19215)
-- Name: fki_stationid_connect_observation; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_stationid_connect_observation ON public."Sample_BanTuDong" USING btree (stationid);


--
-- TOC entry 2867 (class 2606 OID 19216)
-- Name: ObservationType category_connect_obserType; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ObservationType"
    ADD CONSTRAINT "category_connect_obserType" FOREIGN KEY (categoryid) REFERENCES public."Category"(id) NOT VALID;


--
-- TOC entry 2868 (class 2606 OID 19154)
-- Name: Observationstation connect_basin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT connect_basin FOREIGN KEY (basinid) REFERENCES public."Basin"(id) NOT VALID;


--
-- TOC entry 2872 (class 2606 OID 19185)
-- Name: Observationstation connect_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT connect_category FOREIGN KEY (categoryid) REFERENCES public."Category"(id) NOT VALID;


--
-- TOC entry 2870 (class 2606 OID 19169)
-- Name: Observationstation connect_enterprise; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT connect_enterprise FOREIGN KEY (enterpriseid) REFERENCES public."Enterprise"(id) NOT VALID;


--
-- TOC entry 2871 (class 2606 OID 19177)
-- Name: Observationstation connect_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT connect_location FOREIGN KEY (locationid) REFERENCES public."Location"(id) NOT VALID;


--
-- TOC entry 2869 (class 2606 OID 19161)
-- Name: Observationstation connect_organization; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT connect_organization FOREIGN KEY (organizationid) REFERENCES public."Organization"(id) NOT VALID;


--
-- TOC entry 2862 (class 2606 OID 19232)
-- Name: Location location_connect_locType; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Location"
    ADD CONSTRAINT "location_connect_locType" FOREIGN KEY (locationtypeid) REFERENCES public."LocationType"(id) NOT VALID;


--
-- TOC entry 2865 (class 2606 OID 19248)
-- Name: Observation qualityIndex_connect_observation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observation"
    ADD CONSTRAINT "qualityIndex_connect_observation" FOREIGN KEY (qualityindexid) REFERENCES public."Qualityindex"(id) NOT VALID;


--
-- TOC entry 2864 (class 2606 OID 19240)
-- Name: Observation sampleid_connect_observation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observation"
    ADD CONSTRAINT sampleid_connect_observation FOREIGN KEY (sampleid) REFERENCES public."Sample_BanTuDong"(id) NOT VALID;


--
-- TOC entry 2866 (class 2606 OID 19256)
-- Name: Observation standardPara_connect_observation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observation"
    ADD CONSTRAINT "standardPara_connect_observation" FOREIGN KEY (standardparameterid) REFERENCES public."StandardParameter"(id) NOT VALID;


--
-- TOC entry 2877 (class 2606 OID 19280)
-- Name: StandardParameter standardPara_connect_para; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StandardParameter"
    ADD CONSTRAINT "standardPara_connect_para" FOREIGN KEY (parameterid) REFERENCES public."Parameter"(id) NOT VALID;


--
-- TOC entry 2876 (class 2606 OID 19272)
-- Name: StandardParameter standardPara_connect_purpose; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StandardParameter"
    ADD CONSTRAINT "standardPara_connect_purpose" FOREIGN KEY (purposeid) REFERENCES public."Purpose"(id) NOT VALID;


--
-- TOC entry 2875 (class 2606 OID 19264)
-- Name: StandardParameter standardPara_connect_standard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StandardParameter"
    ADD CONSTRAINT "standardPara_connect_standard" FOREIGN KEY (standardid) REFERENCES public."Standard"(id) NOT VALID;


--
-- TOC entry 2878 (class 2606 OID 19288)
-- Name: StandardParameter standardPara_connect_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StandardParameter"
    ADD CONSTRAINT "standardPara_connect_unit" FOREIGN KEY (unitid) REFERENCES public."Unit"(id) NOT VALID;


--
-- TOC entry 2874 (class 2606 OID 19224)
-- Name: Standard standard_connect_obserType; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Standard"
    ADD CONSTRAINT "standard_connect_obserType" FOREIGN KEY (obstypeid) REFERENCES public."ObservationType"(id) NOT VALID;


--
-- TOC entry 2861 (class 2606 OID 19199)
-- Name: ElectronicBoard stationid_connect_ElecBoard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ElectronicBoard"
    ADD CONSTRAINT "stationid_connect_ElecBoard" FOREIGN KEY (stationid) REFERENCES public."Observationstation"(id) NOT VALID;


--
-- TOC entry 2860 (class 2606 OID 19193)
-- Name: Camera stationid_connect_cam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Camera"
    ADD CONSTRAINT stationid_connect_cam FOREIGN KEY (stationid) REFERENCES public."Observationstation"(id) NOT VALID;


--
-- TOC entry 2863 (class 2606 OID 19205)
-- Name: Observation stationid_connect_observation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observation"
    ADD CONSTRAINT stationid_connect_observation FOREIGN KEY (stationid) REFERENCES public."Observationstation"(id) NOT VALID;


--
-- TOC entry 2873 (class 2606 OID 19210)
-- Name: Sample_BanTuDong stationid_connect_sample; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sample_BanTuDong"
    ADD CONSTRAINT stationid_connect_sample FOREIGN KEY (stationid) REFERENCES public."Observationstation"(id) NOT VALID;


-- Completed on 2020-05-18 16:14:32

--
-- PostgreSQL database dump complete
--

