

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
-- TOC entry 290 (class 1259 OID 19564)
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
-- TOC entry 293 (class 1259 OID 19612)
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 19629)
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
-- TOC entry 318 (class 1259 OID 19820)
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
-- TOC entry 298 (class 1259 OID 19637)
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
-- TOC entry 300 (class 1259 OID 19645)
-- Name: LocationType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LocationType" (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public."LocationType" OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 19648)
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
-- TOC entry 305 (class 1259 OID 19669)
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
-- TOC entry 303 (class 1259 OID 19656)
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
-- TOC entry 319 (class 1259 OID 19828)
-- Name: Organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Organization" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public."Organization" OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 19676)
-- Name: Parameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Parameter" (
    id integer NOT NULL,
    code text,
    name text NOT NULL
);


ALTER TABLE public."Parameter" OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 19695)
-- Name: Purpose; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Purpose" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public."Purpose" OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 19701)
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
-- TOC entry 320 (class 1259 OID 20078)
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
-- TOC entry 312 (class 1259 OID 19719)
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
-- TOC entry 314 (class 1259 OID 19728)
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
-- TOC entry 315 (class 1259 OID 19730)
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
-- TOC entry 316 (class 1259 OID 19737)
-- Name: Unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Unit" (
    id integer NOT NULL,
    code text,
    name text
);


ALTER TABLE public."Unit" OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 19582)
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
-- TOC entry 5383 (class 0 OID 0)
-- Dependencies: 292
-- Name: basin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basin_id_seq OWNED BY public."Basin".id;


--
-- TOC entry 294 (class 1259 OID 19615)
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
-- TOC entry 5384 (class 0 OID 0)
-- Dependencies: 294
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public."Category".id;


--
-- TOC entry 296 (class 1259 OID 19633)
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
-- TOC entry 5385 (class 0 OID 0)
-- Dependencies: 296
-- Name: electronicinfoboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.electronicinfoboard_id_seq OWNED BY public."ElectronicBoard".id;


--
-- TOC entry 297 (class 1259 OID 19635)
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
-- TOC entry 299 (class 1259 OID 19643)
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
-- TOC entry 5386 (class 0 OID 0)
-- Dependencies: 299
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_id_seq OWNED BY public."Location".id;


--
-- TOC entry 302 (class 1259 OID 19654)
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
-- TOC entry 5387 (class 0 OID 0)
-- Dependencies: 302
-- Name: observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observation_id_seq OWNED BY public."Observation".id;


--
-- TOC entry 304 (class 1259 OID 19667)
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
-- TOC entry 306 (class 1259 OID 19674)
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
-- TOC entry 5388 (class 0 OID 0)
-- Dependencies: 306
-- Name: observationtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observationtype_id_seq OWNED BY public."ObservationType".id;


--
-- TOC entry 308 (class 1259 OID 19683)
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
-- TOC entry 5389 (class 0 OID 0)
-- Dependencies: 308
-- Name: parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parameter_id_seq OWNED BY public."Parameter".id;


--
-- TOC entry 311 (class 1259 OID 19710)
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
-- TOC entry 313 (class 1259 OID 19726)
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
-- TOC entry 5390 (class 0 OID 0)
-- Dependencies: 313
-- Name: standard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.standard_id_seq OWNED BY public."Standard".id;


--
-- TOC entry 317 (class 1259 OID 19740)
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
-- TOC entry 5391 (class 0 OID 0)
-- Dependencies: 317
-- Name: unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unit_id_seq OWNED BY public."Unit".id;


--
-- TOC entry 5059 (class 2604 OID 19751)
-- Name: Basin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Basin" ALTER COLUMN id SET DEFAULT nextval('public.basin_id_seq'::regclass);


--
-- TOC entry 5060 (class 2604 OID 19756)
-- Name: Category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category" ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 5062 (class 2604 OID 19758)
-- Name: ElectronicBoard id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ElectronicBoard" ALTER COLUMN id SET DEFAULT nextval('public.electronicinfoboard_id_seq'::regclass);


--
-- TOC entry 5063 (class 2604 OID 19759)
-- Name: Location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Location" ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- TOC entry 5064 (class 2604 OID 20057)
-- Name: Observation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observation" ALTER COLUMN id SET DEFAULT nextval('public.observation_id_seq'::regclass);


--
-- TOC entry 5069 (class 2604 OID 19761)
-- Name: ObservationType id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ObservationType" ALTER COLUMN id SET DEFAULT nextval('public.observationtype_id_seq'::regclass);


--
-- TOC entry 5070 (class 2604 OID 19762)
-- Name: Parameter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Parameter" ALTER COLUMN id SET DEFAULT nextval('public.parameter_id_seq'::regclass);


--
-- TOC entry 5071 (class 2604 OID 19763)
-- Name: Standard id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Standard" ALTER COLUMN id SET DEFAULT nextval('public.standard_id_seq'::regclass);


--
-- TOC entry 5073 (class 2604 OID 19764)
-- Name: Unit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Unit" ALTER COLUMN id SET DEFAULT nextval('public.unit_id_seq'::regclass);


--
-- TOC entry 5197 (class 2606 OID 20043)
-- Name: Camera Camera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Camera"
    ADD CONSTRAINT "Camera_pkey" PRIMARY KEY (id);


--
-- TOC entry 5227 (class 2606 OID 19827)
-- Name: Enterprise Enterprise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Enterprise"
    ADD CONSTRAINT "Enterprise_pkey" PRIMARY KEY (id);


--
-- TOC entry 5229 (class 2606 OID 19835)
-- Name: Organization Organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organization"
    ADD CONSTRAINT "Organization_pkey" PRIMARY KEY (id);


--
-- TOC entry 5231 (class 2606 OID 20085)
-- Name: Sample_BanTuDong Sample_BanTuDong_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sample_BanTuDong"
    ADD CONSTRAINT "Sample_BanTuDong_pkey" PRIMARY KEY (id);


--
-- TOC entry 5199 (class 2606 OID 19768)
-- Name: Basin basin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Basin"
    ADD CONSTRAINT basin_pkey PRIMARY KEY (id);


--
-- TOC entry 5201 (class 2606 OID 19778)
-- Name: Category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 5203 (class 2606 OID 19782)
-- Name: ElectronicBoard electronicinfoboard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ElectronicBoard"
    ADD CONSTRAINT electronicinfoboard_pkey PRIMARY KEY (id);


--
-- TOC entry 5205 (class 2606 OID 19784)
-- Name: Location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Location"
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- TOC entry 5207 (class 2606 OID 19786)
-- Name: LocationType locationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LocationType"
    ADD CONSTRAINT locationtype_pkey PRIMARY KEY (id);


--
-- TOC entry 5211 (class 2606 OID 20059)
-- Name: Observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observation"
    ADD CONSTRAINT observation_pkey PRIMARY KEY (id);


--
-- TOC entry 5213 (class 2606 OID 20027)
-- Name: Observationstation observationstation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Observationstation"
    ADD CONSTRAINT observationstation_pkey PRIMARY KEY (id);


--
-- TOC entry 5215 (class 2606 OID 19794)
-- Name: ObservationType observationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ObservationType"
    ADD CONSTRAINT observationtype_pkey PRIMARY KEY (id);


--
-- TOC entry 5217 (class 2606 OID 19796)
-- Name: Parameter parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Parameter"
    ADD CONSTRAINT parameter_pkey PRIMARY KEY (id);


--
-- TOC entry 5219 (class 2606 OID 19800)
-- Name: Purpose purpose_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Purpose"
    ADD CONSTRAINT purpose_pkey PRIMARY KEY (id);


--
-- TOC entry 5221 (class 2606 OID 19806)
-- Name: Standard standard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Standard"
    ADD CONSTRAINT standard_pkey PRIMARY KEY (id);


--
-- TOC entry 5223 (class 2606 OID 19808)
-- Name: StandardParameter standardparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StandardParameter"
    ADD CONSTRAINT standardparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 5225 (class 2606 OID 19814)
-- Name: Unit unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Unit"
    ADD CONSTRAINT unit_pkey PRIMARY KEY (id);


--
-- TOC entry 5208 (class 1259 OID 19817)
-- Name: find_by_station_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX find_by_station_idx ON public."Observation" USING btree (stationid);


--
-- TOC entry 5209 (class 1259 OID 19818)
-- Name: find_station_type_day_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX find_station_type_day_idx ON public."Observation" USING btree (stationid, standardparameterid, day);


-- Completed on 2020-05-15 15:53:55

--
-- PostgreSQL database dump complete
--

