--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.9
-- Dumped by pg_dump version 9.5.5

-- Started on 2017-08-10 15:31:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 13 (class 2615 OID 1280199180)
-- Name: modelr; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA modelr;


SET search_path = modelr, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 799 (class 1259 OID 1306542632)
-- Name: algorithm; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE algorithm (
    idalgorithm integer NOT NULL,
    algorithm character varying(200),
    description character varying(5000)
);


--
-- TOC entry 798 (class 1259 OID 1306542630)
-- Name: algorithm_idalgorithm_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE algorithm_idalgorithm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6000 (class 0 OID 0)
-- Dependencies: 798
-- Name: algorithm_idalgorithm_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE algorithm_idalgorithm_seq OWNED BY algorithm.idalgorithm;


--
-- TOC entry 807 (class 1259 OID 1353790995)
-- Name: datasource; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE datasource (
    iddatasource integer NOT NULL,
    datasource character varying(100)
);


--
-- TOC entry 806 (class 1259 OID 1353790993)
-- Name: datasource_iddatasource_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE datasource_iddatasource_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6001 (class 0 OID 0)
-- Dependencies: 806
-- Name: datasource_iddatasource_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE datasource_iddatasource_seq OWNED BY datasource.iddatasource;


--
-- TOC entry 795 (class 1259 OID 1284566631)
-- Name: experiment; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE experiment (
    idexperiment integer NOT NULL,
    idproject integer,
    name character varying(200),
    description text,
    num_partition integer,
    projection boolean,
    datetime_inicio timestamp with time zone,
    datetime_fim timestamp with time zone,
    idstatusexperiment integer,
    extent_model character varying(100),
    extent_projection character varying(100),
    buffer numeric(10,2),
    idpartitiontype integer,
    num_points integer,
    tss numeric(10,2),
    iduser integer
);


--
-- TOC entry 794 (class 1259 OID 1284566629)
-- Name: experiment_idexperimento_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE experiment_idexperimento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6002 (class 0 OID 0)
-- Dependencies: 794
-- Name: experiment_idexperimento_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE experiment_idexperimento_seq OWNED BY experiment.idexperiment;


--
-- TOC entry 818 (class 1259 OID 1539928038)
-- Name: experiment_use_algorithm; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE experiment_use_algorithm (
    idexperiment_use_algorithm integer NOT NULL,
    idalgorithm integer,
    idexperiment integer
);


--
-- TOC entry 817 (class 1259 OID 1539928036)
-- Name: experiment_use_algorithm_idexperiment_use_algorithm_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE experiment_use_algorithm_idexperiment_use_algorithm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6003 (class 0 OID 0)
-- Dependencies: 817
-- Name: experiment_use_algorithm_idexperiment_use_algorithm_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE experiment_use_algorithm_idexperiment_use_algorithm_seq OWNED BY experiment_use_algorithm.idexperiment_use_algorithm;


--
-- TOC entry 821 (class 1259 OID 1611482426)
-- Name: experiment_use_raster; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE experiment_use_raster (
    idexperiment_use_raster integer NOT NULL,
    idexperiment integer,
    idraster integer
);


--
-- TOC entry 820 (class 1259 OID 1611482424)
-- Name: experiment_use_raster_idexperiment_use_raster_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE experiment_use_raster_idexperiment_use_raster_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6004 (class 0 OID 0)
-- Dependencies: 820
-- Name: experiment_use_raster_idexperiment_use_raster_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE experiment_use_raster_idexperiment_use_raster_seq OWNED BY experiment_use_raster.idexperiment_use_raster;


--
-- TOC entry 805 (class 1259 OID 1353790987)
-- Name: occurrence; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE occurrence (
    idoccurrence integer NOT NULL,
    idexperiment integer,
    iddatasource integer,
    lat numeric(10,6),
    long numeric(10,6),
    taxon character varying(200),
    collector character varying(100),
    collectnumber character varying(20),
    server character varying(100),
    path character varying(100),
    file character varying(100),
    idstatusoccurrence integer,
    lat2 numeric(10,6),
    long2 numeric(10,6),
    checked boolean DEFAULT false,
    country character varying(100),
    majorarea character varying(100),
    minorarea character varying(100)
);


--
-- TOC entry 804 (class 1259 OID 1353790985)
-- Name: occurrence_idoccurrence_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE occurrence_idoccurrence_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6005 (class 0 OID 0)
-- Dependencies: 804
-- Name: occurrence_idoccurrence_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE occurrence_idoccurrence_seq OWNED BY occurrence.idoccurrence;


--
-- TOC entry 803 (class 1259 OID 1306542651)
-- Name: partitiontype; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE partitiontype (
    idpartitiontype integer NOT NULL,
    partitiontype character varying(100)
);


--
-- TOC entry 802 (class 1259 OID 1306542649)
-- Name: partitiontype_idpartitiontype_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE partitiontype_idpartitiontype_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6006 (class 0 OID 0)
-- Dependencies: 802
-- Name: partitiontype_idpartitiontype_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE partitiontype_idpartitiontype_seq OWNED BY partitiontype.idpartitiontype;


--
-- TOC entry 785 (class 1259 OID 1280199241)
-- Name: periodo; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE periodo (
    idperiodo integer NOT NULL,
    periodo character varying(100)
);


--
-- TOC entry 784 (class 1259 OID 1280199239)
-- Name: periodo_idperiodo_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE periodo_idperiodo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6007 (class 0 OID 0)
-- Dependencies: 784
-- Name: periodo_idperiodo_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE periodo_idperiodo_seq OWNED BY periodo.idperiodo;


--
-- TOC entry 793 (class 1259 OID 1284566275)
-- Name: project; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE project (
    idproject integer NOT NULL,
    description character varying(200),
    project character varying(200),
    idusuario integer
);


--
-- TOC entry 792 (class 1259 OID 1284566273)
-- Name: project_idproject_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE project_idproject_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6008 (class 0 OID 0)
-- Dependencies: 792
-- Name: project_idproject_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE project_idproject_seq OWNED BY project.idproject;


--
-- TOC entry 787 (class 1259 OID 1280199257)
-- Name: raster; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE raster (
    idraster integer NOT NULL,
    raster character varying(200),
    idsource integer
);


--
-- TOC entry 786 (class 1259 OID 1280199255)
-- Name: raster_idraster_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE raster_idraster_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6009 (class 0 OID 0)
-- Dependencies: 786
-- Name: raster_idraster_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE raster_idraster_seq OWNED BY raster.idraster;


--
-- TOC entry 789 (class 1259 OID 1280199265)
-- Name: situacaousuario; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE situacaousuario (
    idsituacaousuario integer NOT NULL,
    situacaousuario character varying(100)
);


--
-- TOC entry 788 (class 1259 OID 1280199263)
-- Name: situacaousuario_idsituacaousuario_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE situacaousuario_idsituacaousuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6010 (class 0 OID 0)
-- Dependencies: 788
-- Name: situacaousuario_idsituacaousuario_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE situacaousuario_idsituacaousuario_seq OWNED BY situacaousuario.idsituacaousuario;


--
-- TOC entry 801 (class 1259 OID 1306542643)
-- Name: source; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE source (
    idsource integer NOT NULL,
    source character varying(150)
);


--
-- TOC entry 800 (class 1259 OID 1306542641)
-- Name: source_idsource_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE source_idsource_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6011 (class 0 OID 0)
-- Dependencies: 800
-- Name: source_idsource_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE source_idsource_seq OWNED BY source.idsource;


--
-- TOC entry 829 (class 1259 OID 1706177588)
-- Name: statusexperiment; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE statusexperiment (
    idstatusexperiment integer NOT NULL,
    statusexperiment character varying(100)
);


--
-- TOC entry 828 (class 1259 OID 1706177586)
-- Name: statusexperiment_idstatusexperiment_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE statusexperiment_idstatusexperiment_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6012 (class 0 OID 0)
-- Dependencies: 828
-- Name: statusexperiment_idstatusexperiment_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE statusexperiment_idstatusexperiment_seq OWNED BY statusexperiment.idstatusexperiment;


--
-- TOC entry 813 (class 1259 OID 1426642196)
-- Name: statusoccurrence; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE statusoccurrence (
    statusoccurrence character varying(100) NOT NULL,
    usefull boolean,
    idstatusoccurrence integer NOT NULL,
    pathicon character varying(100)
);


--
-- TOC entry 814 (class 1259 OID 1426642202)
-- Name: statusoccurrence_idstatusoccurrence_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE statusoccurrence_idstatusoccurrence_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6013 (class 0 OID 0)
-- Dependencies: 814
-- Name: statusoccurrence_idstatusoccurrence_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE statusoccurrence_idstatusoccurrence_seq OWNED BY statusoccurrence.idstatusoccurrence;


--
-- TOC entry 831 (class 1259 OID 1710705642)
-- Name: statususer; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE statususer (
    idstatususer integer NOT NULL,
    statususer character varying(100)
);


--
-- TOC entry 830 (class 1259 OID 1710705640)
-- Name: statususer_idstatususer_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE statususer_idstatususer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6014 (class 0 OID 0)
-- Dependencies: 830
-- Name: statususer_idstatususer_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE statususer_idstatususer_seq OWNED BY statususer.idstatususer;


--
-- TOC entry 816 (class 1259 OID 1435838969)
-- Name: tipousuario; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE tipousuario (
    idtipousuario integer NOT NULL,
    tipousuario character varying(100)
);


--
-- TOC entry 815 (class 1259 OID 1435838967)
-- Name: tipousuario_idtipousuario_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE tipousuario_idtipousuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6015 (class 0 OID 0)
-- Dependencies: 815
-- Name: tipousuario_idtipousuario_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE tipousuario_idtipousuario_seq OWNED BY tipousuario.idtipousuario;


--
-- TOC entry 833 (class 1259 OID 1710705662)
-- Name: user; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE "user" (
    iduser integer NOT NULL,
    name character varying(100),
    login character varying(100) NOT NULL,
    password character varying(50),
    email character varying(150) NOT NULL,
    idstatususer integer NOT NULL,
    idusertype integer
);


--
-- TOC entry 832 (class 1259 OID 1710705660)
-- Name: user_iduser_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE user_iduser_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6016 (class 0 OID 0)
-- Dependencies: 832
-- Name: user_iduser_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE user_iduser_seq OWNED BY "user".iduser;


--
-- TOC entry 835 (class 1259 OID 1710705670)
-- Name: usertype; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE usertype (
    idusertype integer NOT NULL,
    usertype character varying(100)
);


--
-- TOC entry 834 (class 1259 OID 1710705668)
-- Name: usertype_idusertype_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE usertype_idusertype_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6017 (class 0 OID 0)
-- Dependencies: 834
-- Name: usertype_idusertype_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE usertype_idusertype_seq OWNED BY usertype.idusertype;


--
-- TOC entry 791 (class 1259 OID 1280199291)
-- Name: usuario; Type: TABLE; Schema: modelr; Owner: -
--

CREATE TABLE usuario (
    idusuario integer NOT NULL,
    nome character varying(100),
    login character varying(100) NOT NULL,
    senha character varying(50),
    email character varying(150) NOT NULL,
    idsituacaousuario integer NOT NULL,
    datacadastro date,
    idtipousuario integer NOT NULL
);


--
-- TOC entry 790 (class 1259 OID 1280199289)
-- Name: usuario_idusuario_seq; Type: SEQUENCE; Schema: modelr; Owner: -
--

CREATE SEQUENCE usuario_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6018 (class 0 OID 0)
-- Dependencies: 790
-- Name: usuario_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: modelr; Owner: -
--

ALTER SEQUENCE usuario_idusuario_seq OWNED BY usuario.idusuario;


--
-- TOC entry 5691 (class 2604 OID 1306542635)
-- Name: idalgorithm; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY algorithm ALTER COLUMN idalgorithm SET DEFAULT nextval('algorithm_idalgorithm_seq'::regclass);


--
-- TOC entry 5696 (class 2604 OID 1353790998)
-- Name: iddatasource; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY datasource ALTER COLUMN iddatasource SET DEFAULT nextval('datasource_iddatasource_seq'::regclass);


--
-- TOC entry 5690 (class 2604 OID 1284566634)
-- Name: idexperiment; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY experiment ALTER COLUMN idexperiment SET DEFAULT nextval('experiment_idexperimento_seq'::regclass);


--
-- TOC entry 5699 (class 2604 OID 1539928041)
-- Name: idexperiment_use_algorithm; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY experiment_use_algorithm ALTER COLUMN idexperiment_use_algorithm SET DEFAULT nextval('experiment_use_algorithm_idexperiment_use_algorithm_seq'::regclass);


--
-- TOC entry 5700 (class 2604 OID 1611482429)
-- Name: idexperiment_use_raster; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY experiment_use_raster ALTER COLUMN idexperiment_use_raster SET DEFAULT nextval('experiment_use_raster_idexperiment_use_raster_seq'::regclass);


--
-- TOC entry 5694 (class 2604 OID 1353790990)
-- Name: idoccurrence; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY occurrence ALTER COLUMN idoccurrence SET DEFAULT nextval('occurrence_idoccurrence_seq'::regclass);


--
-- TOC entry 5693 (class 2604 OID 1306542654)
-- Name: idpartitiontype; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY partitiontype ALTER COLUMN idpartitiontype SET DEFAULT nextval('partitiontype_idpartitiontype_seq'::regclass);


--
-- TOC entry 5685 (class 2604 OID 1280199244)
-- Name: idperiodo; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY periodo ALTER COLUMN idperiodo SET DEFAULT nextval('periodo_idperiodo_seq'::regclass);


--
-- TOC entry 5689 (class 2604 OID 1284566278)
-- Name: idproject; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY project ALTER COLUMN idproject SET DEFAULT nextval('project_idproject_seq'::regclass);


--
-- TOC entry 5686 (class 2604 OID 1280199260)
-- Name: idraster; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY raster ALTER COLUMN idraster SET DEFAULT nextval('raster_idraster_seq'::regclass);


--
-- TOC entry 5687 (class 2604 OID 1280199268)
-- Name: idsituacaousuario; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY situacaousuario ALTER COLUMN idsituacaousuario SET DEFAULT nextval('situacaousuario_idsituacaousuario_seq'::regclass);


--
-- TOC entry 5692 (class 2604 OID 1306542646)
-- Name: idsource; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY source ALTER COLUMN idsource SET DEFAULT nextval('source_idsource_seq'::regclass);


--
-- TOC entry 5701 (class 2604 OID 1706177591)
-- Name: idstatusexperiment; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY statusexperiment ALTER COLUMN idstatusexperiment SET DEFAULT nextval('statusexperiment_idstatusexperiment_seq'::regclass);


--
-- TOC entry 5697 (class 2604 OID 1426642204)
-- Name: idstatusoccurrence; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY statusoccurrence ALTER COLUMN idstatusoccurrence SET DEFAULT nextval('statusoccurrence_idstatusoccurrence_seq'::regclass);


--
-- TOC entry 5702 (class 2604 OID 1710705645)
-- Name: idstatususer; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY statususer ALTER COLUMN idstatususer SET DEFAULT nextval('statususer_idstatususer_seq'::regclass);


--
-- TOC entry 5698 (class 2604 OID 1435838972)
-- Name: idtipousuario; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY tipousuario ALTER COLUMN idtipousuario SET DEFAULT nextval('tipousuario_idtipousuario_seq'::regclass);


--
-- TOC entry 5703 (class 2604 OID 1710705665)
-- Name: iduser; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY "user" ALTER COLUMN iduser SET DEFAULT nextval('user_iduser_seq'::regclass);


--
-- TOC entry 5704 (class 2604 OID 1710705673)
-- Name: idusertype; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY usertype ALTER COLUMN idusertype SET DEFAULT nextval('usertype_idusertype_seq'::regclass);


--
-- TOC entry 5688 (class 2604 OID 1280199294)
-- Name: idusuario; Type: DEFAULT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY usuario ALTER COLUMN idusuario SET DEFAULT nextval('usuario_idusuario_seq'::regclass);


--
-- TOC entry 5971 (class 0 OID 1306542632)
-- Dependencies: 799
-- Data for Name: algorithm; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY algorithm (idalgorithm, algorithm, description) FROM stdin;
1	Mahalanobis	\N
2	Maxent	\N
3	GLM	\N
4	SVN	\N
5	Bioclim	\N
6	Random Forest	\N
7	Domain	\N
\.


--
-- TOC entry 6019 (class 0 OID 0)
-- Dependencies: 798
-- Name: algorithm_idalgorithm_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('algorithm_idalgorithm_seq', 7, true);


--
-- TOC entry 5979 (class 0 OID 1353790995)
-- Dependencies: 807
-- Data for Name: datasource; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY datasource (iddatasource, datasource) FROM stdin;
\.


--
-- TOC entry 6020 (class 0 OID 0)
-- Dependencies: 806
-- Name: datasource_iddatasource_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('datasource_iddatasource_seq', 1, false);


--
-- TOC entry 5969 (class 0 OID 1284566631)
-- Dependencies: 795
-- Data for Name: experiment; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY experiment (idexperiment, idproject, name, description, num_partition, projection, datetime_inicio, datetime_fim, idstatusexperiment, extent_model, extent_projection, buffer, idpartitiontype, num_points, tss, iduser) FROM stdin;
34	11	teste	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	10
46	\N	Inga	subnuda	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	11
15	11	teste45		\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	10
27	20	teste	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	30
29	22	Teste		\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	24
33	24	Vriesea	\N	5	\N	\N	\N	1	-62.649;-34.443;6.41;-32.490	-62;-34;6.41;-32.490	1.80	1	578	0.10	31
35	24	v. chapadensis	\N	28	\N	\N	\N	1	-62.649;-34.443;6.41;-32.490	-62;-34;6.41;-32.490	1.70	1	1311	0.60	31
36	24	v. tijucana	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	31
37	24	outras	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	31
39	\N	testaewaaw aa		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	\N	Apenasteste	Apenastestedescricao	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	\N	testexxxx	testexxxx10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	\N	xxxx	xxxx	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	10
21	11	teste2	\N	13	\N	\N	\N	1	-62.649;-34.443;6.41;-32.490	-62;-34;6.41;-32.490	1.30	1	577	0.40	10
25	19	Inga		32	\N	\N	\N	2	-62.649;-34.443;6.41;-32.490	-62;-34;6.41;-32.490	1.70	1	852	0.60	11
14	11	teste		\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	10
17	11	Teste de 1	Teste de Alteração de nome apeós inclusão de registros de ocorrências	\N	\N	\N	\N	4			\N	\N	\N	\N	10
24	19			33	\N	\N	\N	1	-62.649;-34.443;6.41;-32.490		1.60	1	966	0.40	11
\.


--
-- TOC entry 6021 (class 0 OID 0)
-- Dependencies: 794
-- Name: experiment_idexperimento_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('experiment_idexperimento_seq', 46, true);


--
-- TOC entry 5985 (class 0 OID 1539928038)
-- Dependencies: 818
-- Data for Name: experiment_use_algorithm; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY experiment_use_algorithm (idexperiment_use_algorithm, idalgorithm, idexperiment) FROM stdin;
1	1	17
2	2	17
3	4	17
4	1	25
5	2	25
6	3	25
7	1	25
8	2	25
9	3	25
10	1	25
11	2	25
12	3	25
13	1	25
14	2	25
15	3	25
16	1	25
17	2	25
18	3	25
19	1	25
20	2	25
21	3	25
22	1	25
23	2	25
24	3	25
25	1	25
26	2	25
27	3	25
28	1	25
29	2	25
30	3	25
31	1	25
32	2	25
33	3	25
34	1	25
35	2	25
36	3	25
37	1	25
38	2	25
39	3	25
40	1	25
41	2	25
42	3	25
43	1	17
44	2	17
45	4	17
46	1	21
47	4	21
48	7	21
49	1	36
50	1	36
51	1	36
52	1	36
53	1	36
54	1	35
55	2	35
56	3	35
57	5	21
58	1	17
59	2	17
60	4	17
61	1	24
62	2	24
63	3	24
\.


--
-- TOC entry 6022 (class 0 OID 0)
-- Dependencies: 817
-- Name: experiment_use_algorithm_idexperiment_use_algorithm_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('experiment_use_algorithm_idexperiment_use_algorithm_seq', 63, true);


--
-- TOC entry 5987 (class 0 OID 1611482426)
-- Dependencies: 821
-- Data for Name: experiment_use_raster; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY experiment_use_raster (idexperiment_use_raster, idexperiment, idraster) FROM stdin;
1	25	19
2	25	18
3	25	17
4	25	19
5	25	18
6	25	17
7	25	19
8	25	18
9	25	17
10	25	19
11	25	18
12	25	17
13	25	19
14	25	18
15	25	17
16	17	19
17	17	18
18	17	17
19	17	11
20	21	9
21	21	5
22	21	4
23	33	19
24	33	18
25	33	17
26	33	16
27	36	19
28	36	42
29	36	41
30	36	7
31	35	19
32	34	19
33	34	10
34	34	4
35	34	1
36	34	19
37	34	10
38	34	4
39	34	1
40	36	19
41	36	7
42	35	19
43	35	18
44	21	9
45	21	5
46	21	4
47	24	19
48	24	18
49	24	16
\.


--
-- TOC entry 6023 (class 0 OID 0)
-- Dependencies: 820
-- Name: experiment_use_raster_idexperiment_use_raster_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('experiment_use_raster_idexperiment_use_raster_seq', 49, true);


--
-- TOC entry 5977 (class 0 OID 1353790987)
-- Dependencies: 805
-- Data for Name: occurrence; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY occurrence (idoccurrence, idexperiment, iddatasource, lat, long, taxon, collector, collectnumber, server, path, file, idstatusoccurrence, lat2, long2, checked, country, majorarea, minorarea) FROM stdin;
3475	30	2	-22.736944	-57.448611	Cyrtocymura scorpioides (Lam.) H.Rob.	Zardini, E.M.	39732	imagens3.jbrj.gov.br	rb/0/40/1/52	00400152.jpg	8	\N	\N	f	Paraguai		
3476	30	2	-25.566667	-57.550000	Cyrtocymura scorpioides (Lam.) H.Rob.	Zardini, E.M.	33677	imagens3.jbrj.gov.br	rb/0/40/1/59	00400159.jpg	8	\N	\N	f	Paraguai		
3959	46	2	-22.754444	-42.335833	Inga subnuda ssp. luschnathiana (Benth.) T.D.Penn.	Lima, H.C. de	6168	imagens3.jbrj.gov.br	rb/0/11/45/67	00114567.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Araruama
3960	46	2	-12.047500	-37.723333	Inga subnuda ssp. luschnathiana (Benth.) T.D.Penn.	Silva, L.N.	57	imagens3.jbrj.gov.br	rb/0/16/22/69	00162269.jpg	8	\N	\N	f	Brasil	Bahia	Conde
3962	46	2	-15.200000	-39.050000	Inga subnuda Salzm. ex Benth.	Lewis, G.P.	721	imagens3.jbrj.gov.br	rb/0/16/25/35	00162535.jpg	8	\N	\N	f	Brasil	Bahia	Una
3963	46	2	-15.150000	-39.083333	Inga subnuda ssp. luschnathiana (Benth.) T.D.Penn.	Carvalho, A.M.V. de	4525	imagens3.jbrj.gov.br	rb/0/16/30/61	00163061.jpg	8	\N	\N	f	Brasil	Bahia	Una
2052	7	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	818	imagens3.jbrj.gov.br	rb/0/44/15/12	00441512.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2053	7	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	827	imagens3.jbrj.gov.br	rb/0/44/18/23	00441823.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2054	7	2	-22.500000	-42.250000	Euterpe edulis Mart.	Farias, D.S.	207	imagens3.jbrj.gov.br	rb/0/44/20/50	00442050.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2055	7	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12447	imagens3.jbrj.gov.br	rb/0/44/95/62	00449562.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2056	7	2	-22.550000	-42.500000	Euterpe edulis Mart.	Guedes, R.		imagens3.jbrj.gov.br	rb/0/44/95/64	00449564.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2057	7	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12746	imagens3.jbrj.gov.br	rb/0/44/95/68	00449568.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2058	7	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12410	imagens3.jbrj.gov.br	rb/0/44/95/76	00449576.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2059	7	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/47/65/16	00476516.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
2060	7	2	-19.135278	-39.932500	Euterpe edulis Mart.	Mansano, V.F.	07-443	imagens3.jbrj.gov.br	rb/0/49/54/73	00495473.jpg	8	\N	\N	f	Brasil	Espírito Santo	Linhares
2061	7	2	-19.950000	-40.516667	Euterpe edulis Mart.	H. Q. B. Fernandes s. n.					8	\N	\N	f	Brasil	Espírito Santo	Santa Teresa
2062	7	2	-20.267778	-40.525000	Euterpe edulis Mart.	Forzza, R.C.	5300	imagens3.jbrj.gov.br	rb/0/54/30/30	00543030.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
2063	7	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2064	7	2	-21.700000	-43.891667	Euterpe edulis Mart.	Forzza, R.C.	3616	imagens3.jbrj.gov.br	rb/0/55/13/51	00551351.jpg	8	\N	\N	f	Brasil	Minas Gerais	Lima Duarte
2065	7	2	-23.062778	-44.681945	Euterpe edulis Mart.	Rodrigo Rocha	011				8	\N	\N	f	Brasil	Rio de Janeiro	Paraty
3765	17	2	-17.033333	-39.483333	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Lewis, G.P.	774	imagens3.jbrj.gov.br	rb/0/16/68/79	00166879.jpg	17	\N	\N	f	Brasil	Bahia	Itamaraju
3766	17	2	-19.783333	-42.600000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Almeida, E. de F.	201	imagens3.jbrj.gov.br	rb/0/16/68/88	00166888.jpg	17	\N	\N	f	Brasil	Minas Gerais	Marliéria
3767	17	2	-15.458056	-40.646389	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	José Eduardo M. Brazão	77	imagens3.jbrj.gov.br	rb/0/16/69/9	00166909.jpg	17	\N	\N	f	Brasil	Bahia	Encruzilhada
2066	7	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				8	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2067	7	2	-23.067778	-44.679445	Euterpe edulis Mart.	Rodrigo Rocha	073				8	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2068	7	2	-22.968889	-43.248611	Euterpe edulis Mart.	Ricardo Reis, Vanderlei Rodinsky, Thaís Almeida	RCCReis 1184				8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3768	17	2	-22.916667	-43.333333	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Gentry, A.H.	49511	imagens3.jbrj.gov.br	rb/0/16/69/27	00166927.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	
1862	16	2	-26.192500	-49.047778	Ocotea catharinensis Mez	T.J.Cadorin	2033	imagens3.jbrj.gov.br	rb/0/60/91/92	00609192.jpg	8	\N	\N	f	Brasil	Santa Catarina	Joinville
1863	16	2	-29.786667	-50.998056	Ocotea catharinensis Mez	Eline Martins	48	imagens3.jbrj.gov.br	rb/0/76/10/57	00761057.jpg	8	\N	\N	f	Brasil	Rio Grande do Sul	Novo Hamburgo
1864	16	2	-25.597778	-48.869445	Ocotea catharinensis Mez	Brotto, M.L.	129	imagens3.jbrj.gov.br	rb/0/60/48/8	00604808.jpg	8	\N	\N	f	Brasil	Paraná	Morretes
1865	16	2	-26.910278	-49.500278	Ocotea catharinensis Mez	A. Korte	2093	imagens3.jbrj.gov.br	rb/0/60/48/25	00604825.jpg	8	\N	\N	f	Brasil	Santa Catarina	Benedito Novo
1866	16	2	-25.388611	-49.010833	Ocotea catharinensis Mez	Brotto, M.L	664	imagens3.jbrj.gov.br	rb/0/77/34/87	00773487.jpg	8	\N	\N	f	Brasil	Paraná	Quatro Barras
1867	16	2	-27.360000	-49.501667	Ocotea catharinensis Mez	M. Verdi	5277	imagens3.jbrj.gov.br	rb/0/65/13/74	00651374.jpg	8	\N	\N	f	Brasil	Santa Catarina	Ituporanga
1868	16	2	-22.456389	-42.000000	Ocotea catharinensis Mez	Eline Martins	47	imagens3.jbrj.gov.br	rb/0/76/10/56	00761056.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
1869	16	2	-27.092778	-49.194722	Ocotea catharinensis Mez	J.P. Maçaneiro	49	imagens3.jbrj.gov.br	rb/0/92/79/66	00927966.jpg	8	\N	\N	f	Brasil	Santa Catarina	Indaial
3769	17	2	-20.211111	-43.505278	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Sérgio M. de Faria	1768	imagens3.jbrj.gov.br	rb/0/16/69/33	00166933.jpg	17	\N	\N	f	Brasil	Minas Gerais	
3770	17	2	-14.884722	-40.718333	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Araújo, A.P.P. de	161	imagens3.jbrj.gov.br	rb/0/16/69/35	00166935.jpg	17	\N	\N	f	Brasil	Bahia	
1871	16	2	-27.360000	-49.501667	Ocotea catharinensis Mez	M. Verdi	5278	imagens3.jbrj.gov.br	rb/0/65/13/69	00651369.jpg	8	\N	\N	f	Brasil	Santa Catarina	Ituporanga
1872	16	2	-23.300000	-45.066667	Ocotea catharinensis Mez	R.A.A. Barreto	18	imagens3.jbrj.gov.br	rb/0/13/42/22	00134222.jpg	8	\N	\N	f	Brasil	São Paulo	
3477	30	2	6.500000	-58.216667	Cyrtocymura scorpioides (Lam.) H.Rob.	Hoffman, B.	831	imagens3.jbrj.gov.br	rb/0/40/1/83	00400183.jpg	8	\N	\N	f	Guiana		
1873	16	2	-26.999444	-50.129445	Ocotea catharinensis Mez	M. Verdi	5351	imagens3.jbrj.gov.br	rb/0/65/13/92	00651392.jpg	8	\N	\N	f	Brasil	Santa Catarina	Taió
1874	16	2	-25.750000	-49.050000	Ocotea catharinensis Mez	E. P. Santos 	1068	imagens3.jbrj.gov.br	rb/0/60/46/84	00604684.jpg	8	\N	\N	f	Brasil	Paraná	Guaratuba
1875	16	2	-25.868333	-48.965833	Ocotea catharinensis Mez	Eline Martins	44	imagens3.jbrj.gov.br	rb/0/76/10/53	00761053.jpg	8	\N	\N	f	Brasil	Paraná	Guaratuba
1876	16	2	-22.572500	-43.479445	Ocotea catharinensis Mez	Eline Martins	53	imagens3.jbrj.gov.br	rb/0/76/10/62	00761062.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
1877	16	2	-22.581389	-43.421389	Ocotea catharinensis Mez	Eline Martins	40	imagens3.jbrj.gov.br	rb/0/76/10/49	00761049.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
1878	16	2	-25.866945	-48.973889	Ocotea catharinensis Mez	Brotto, M.L.	347	imagens3.jbrj.gov.br	rb/0/60/48/83	00604883.jpg	8	\N	\N	f	Brasil	Paraná	Guaratuba
1879	16	2	-22.456389	-42.999167	Ocotea catharinensis Mez	M. Nafruz	1897	imagens3.jbrj.gov.br	rb/0/49/25/43	00492543.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
1880	16	2	-19.974722	-40.538333	Ocotea catharinensis Mez	Eline Martins	43	imagens3.jbrj.gov.br	rb/0/76/10/52	00761052.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Teresa
1881	16	2	-26.909722	-49.497778	Ocotea catharinensis Mez	J.L.Schmitt	1783	imagens3.jbrj.gov.br	rb/0/60/48/39	00604839.jpg	8	\N	\N	f	Brasil	Santa Catarina	Benedito Novo
1882	16	2	-22.539167	-43.421667	Ocotea catharinensis Mez	Negreiros, F.F.	57				8	\N	\N	f	Brasil	Rio de Janeiro	Miguel Pereira
3478	30	2	-22.719167	-41.968611	Cyrtocymura scorpioides (Lam.) H.Rob.	Dantas, H.G.	46	imagens3.jbrj.gov.br	rb/0/40/74/18	00407418.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Armação dos Búzios
2112	18	2	-15.150000	-39.083333	Miconia mirabilis (Aubl.) L.O.Williams	André M. de Carvalho 	6313	imagens3.jbrj.gov.br	rb/0/48/26/88	00482688.jpg	8	\N	\N	f	Brasil	Bahia	Una
3479	30	2	-22.753889	-22.758333	Cyrtocymura scorpioides (Lam.) H.Rob.	Machado, A.F.P.	236	imagens3.jbrj.gov.br	rb/0/40/74/67	00407467.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Armação dos Búzios
3480	30	2	-23.766667	-46.350000	Cyrtocymura scorpioides (Lam.) H.Rob.	Forero, E.	7629	imagens3.jbrj.gov.br	rb/0/40/74/95	00407495.jpg	8	\N	\N	f	Brasil	São Paulo	Santo André
3481	30	2	-22.700000	-46.750000	Cyrtocymura scorpioides (Lam.) H.Rob.	Groppo Jr., M.	831	imagens3.jbrj.gov.br	rb/0/40/75/47	00407547.jpg	8	\N	\N	f	Brasil	São Paulo	Amparo
3482	30	2	-19.966667	-43.450000	Cyrtocymura scorpioides (Lam.) H.Rob.	Almeida, E. de F.	132	imagens3.jbrj.gov.br	rb/0/40/75/54	00407554.jpg	8	\N	\N	f	Brasil	Minas Gerais	
3483	30	2	-22.833333	-43.333333	Cyrtocymura scorpioides (Lam.) H.Rob.	Landrum, L.R.	2039	imagens3.jbrj.gov.br	rb/0/40/76/39	00407639.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	
3965	46	2	-15.150000	-39.083333	Inga subnuda ssp. luschnathiana (Benth.) T.D.Penn.	S.C.de Sant´Anna	913	imagens3.jbrj.gov.br	rb/0/16/32/41	00163241.jpg	8	\N	\N	f	Brasil	Bahia	Una
3966	46	2	-13.944722	-40.109167	Inga subnuda Infr. luschnathiana (Benth) T.A.Penn.	Macedo, G.E.L.	2053	imagens3.jbrj.gov.br	rb/0/30/43/47	00304347.jpg	8	\N	\N	f	Brasil	Bahia	Jequié
3773	17	2	-15.150000	-39.083333	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Carvalho, A.M.V. de	4309	imagens3.jbrj.gov.br	rb/0/16/69/77	00166977.jpg	17	\N	\N	f	Brasil	Bahia	Una
3774	17	2	-13.466667	-40.316667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	José E. M. Brazão	108	imagens3.jbrj.gov.br	rb/0/16/71/1	00167101.jpg	17	\N	\N	f	Brasil	Bahia	
3775	17	2	-11.489722	-41.213889	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Orlandi, R.P.	305	imagens3.jbrj.gov.br	rb/0/16/71/31	00167131.jpg	17	\N	\N	f	Brasil	Bahia	
2071	7	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
2073	7	2	-19.135278	-39.932500	Euterpe edulis Mart.	Vidal de Freitas Mansano	07-443				8	\N	\N	f	Brasil	Espírito Santo	
2074	7	2	-27.990000	-48.869722	Euterpe edulis Mart.	M. Verdi	5167	imagens3.jbrj.gov.br	rb/0/90/90/21	00909021.jpg	8	\N	\N	f	Brasil	Santa Catarina	São Bonifácio
2076	7	2	-22.574722	-43.418333	Euterpe edulis Mart.	Haroldo C. de Lima	8265	imagens3.jbrj.gov.br	rb/1/14/24/74	01142474.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
2077	7	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 A	imagens3.jbrj.gov.br	rb/1/23/11/53	01231153.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
2078	7	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 B	imagens3.jbrj.gov.br	rb/1/23/11/59	01231159.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
2079	7	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 C	imagens3.jbrj.gov.br	rb/1/23/11/60	01231160.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
2075	7	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/99/12/10	00991210.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
2069	7	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2070	7	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2072	7	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				18	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
2090	7	2	-3.624167	-40.402778	Encholirium spectabile Mart. ex Schult. & Schult.f.	Martinelli, G.	15058	imagens3.jbrj.gov.br	rb/0/14/8/17	00140817.jpg	18	\N	\N	f	Brasil	Ceará	Meruoca
2091	7	2	-13.283056	-42.143056	Encholirium spectabile Mart. ex Schult. & Schult.f.	Fraga, C.N.	2754	imagens3.jbrj.gov.br	rb/0/57/36/35	00573635.jpg	18	\N	\N	f	Brasil	Bahia	Érico Cardoso
2092	7	2	-3.624167	-40.427222	Encholirium spectabile Mart. ex Schult. & Schult.f.	Martinelli, G.	15058				18	\N	\N	f	Brasil	Ceará	Meruoca
2093	7	2	-8.381945	-35.939444	Encholirium spectabile Mart. ex Schult. & Schult.f.	P.Gomes	864	imagens3.jbrj.gov.br	rb/0/60/40/57	00604057.jpg	18	\N	\N	f	Brasil	Pernambuco	
2094	7	2	-8.383333	-36.000000	Encholirium spectabile Mart. ex Schult. & Schult.f.	P.Gomes	661	imagens3.jbrj.gov.br	rb/0/60/40/69	00604069.jpg	18	\N	\N	f	Brasil	Pernambuco	Agrestina
2095	7	2	-13.583333	-41.833333	Encholirium spectabile Mart. ex Schult. & Schult.f.	Harley, R.M.	15153	imagens3.jbrj.gov.br	rb/0/64/18/53	00641853.jpg	18	\N	\N	f	Brasil	Mato Grosso	
2096	7	2	-12.869722	-39.854167	Encholirium spectabile Mart. ex Schult. & Schult.f.	Forzza, R.C.	7494	imagens3.jbrj.gov.br	rb/0/74/30/52	00743052.jpg	18	\N	\N	f	Brasil	Bahia	Milagres
2113	18	2	-15.150000	-39.083333	Miconia mirabilis (Aubl.) L.O.Williams	André M. A. Amorim 	1964	imagens3.jbrj.gov.br	rb/0/48/30/56	00483056.jpg	8	\N	\N	f	Brasil	Bahia	Una
1870	16	2	-74.396389	-53.233889	Ocotea catharinensis Mez	Souza, F.M.	553	imagens3.jbrj.gov.br	rb/0/23/70/20	00237020.jpg	6	-30.732826	-54.288576	f	Brasil	Rio de Janeiro	Paraty
2114	18	2	-20.302500	-40.481945	Miconia mirabilis (Aubl.) L.O.Williams	Kollmann, L.	10662	imagens3.jbrj.gov.br	rb/0/52/20/37	00522037.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
3484	30	2	-20.716667	-42.016667	Cyrtocymura scorpioides (Lam.) H.Rob.	Leoni, L.S.	4	imagens3.jbrj.gov.br	rb/0/40/77/15	00407715.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
2116	18	2	-20.276111	-40.525000	Miconia mirabilis (Aubl.) L.O.Williams	Goldenberg, R.	1091	imagens3.jbrj.gov.br	rb/0/52/91/31	00529131.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
1709	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Correia, C.M.B.	378	imagens3.jbrj.gov.br	rb/0/44/23/67	00442367.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3967	46	2	-13.944722	-40.109167	Inga subnuda Salzm. ex Benth.	Macedo, G.E.L.	2015	imagens3.jbrj.gov.br	rb/0/30/43/63	00304363.jpg	8	\N	\N	f	Brasil	Bahia	Jequié
3485	30	2	-16.366667	-41.050000	Cyrtocymura scorpioides (Lam.) H.Rob.	Harley, R.M.	25271	imagens3.jbrj.gov.br	rb/0/40/77/19	00407719.jpg	8	\N	\N	f	Brasil	Minas Gerais	Jequitibá
3486	30	2	-14.133333	-38.983333	Cyrtocymura scorpioides (Lam.) H.Rob.	Harley, R.M.	22094	imagens3.jbrj.gov.br	rb/0/40/82/13	00408213.jpg	8	\N	\N	f	Brasil	Bahia	
2343	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	818	imagens3.jbrj.gov.br	rb/0/44/15/12	00441512.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3487	30	2	-16.733333	-39.816667	Cyrtocymura scorpioides (Lam.) H.Rob.	Santos, M.M.	136	imagens3.jbrj.gov.br	rb/0/40/82/27	00408227.jpg	8	\N	\N	f	Brasil	Bahia	Guaratinga
1706	15	2	-7.100000	-34.850000	Tapirira guianensis Aubl.	L.A. Pereira	138	imagens3.jbrj.gov.br	rb/0/89/17/38	00891738.jpg	17	\N	\N	f	Brasil	Paraíba	João Pessoa
3777	17	2	-13.944722	-40.111111	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Macedo, G.E.L.	323	imagens3.jbrj.gov.br	rb/0/30/9/87	00300987.jpg	17	\N	\N	f	Brasil	Bahia	Jequié
3778	17	2	-13.944722	-40.109167	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Macedo, G.E.L.	935	imagens3.jbrj.gov.br	rb/0/30/10/7	00301007.jpg	17	\N	\N	f	Brasil	Bahia	Jequié
3779	17	2	-13.944722	-40.109167	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Macedo, G.E.L.	473	imagens3.jbrj.gov.br	rb/0/30/10/12	00301012.jpg	17	\N	\N	f	Brasil	Bahia	Jequié
3780	17	2	-13.944722	-40.109167	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Macedo, G.E.L.	1001	imagens3.jbrj.gov.br	rb/0/30/10/20	00301020.jpg	17	\N	\N	f	Brasil	Bahia	Jequié
3781	17	2	-13.944722	-40.109444	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Macedo, G.E.L.	1297	imagens3.jbrj.gov.br	rb/0/30/25/95	00302595.jpg	17	\N	\N	f	Brasil	Bahia	Jequié
3782	17	2	-22.268611	-42.852222	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Thier, O.	35	imagens3.jbrj.gov.br	rb/0/32/28/90	00322890.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
2299	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	818	imagens3.jbrj.gov.br	rb/0/44/15/12	00441512.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3783	17	2	-22.500000	-42.250000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Lima, H.C. de	4492	imagens3.jbrj.gov.br	rb/0/44/14/51	00441451.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2300	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	827	imagens3.jbrj.gov.br	rb/0/44/18/23	00441823.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3784	17	2	-22.500000	-42.250000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Sylvestre, L.	838	imagens3.jbrj.gov.br	rb/0/44/17/91	00441791.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3785	17	2	-22.500000	-42.250000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Luchiari, C.	41	imagens3.jbrj.gov.br	rb/0/44/27/84	00442784.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3786	17	2	-22.500000	-42.250000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Luchiari, C.	216	imagens3.jbrj.gov.br	rb/0/44/28/39	00442839.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2301	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Farias, D.S.	207	imagens3.jbrj.gov.br	rb/0/44/20/50	00442050.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2302	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12447	imagens3.jbrj.gov.br	rb/0/44/95/62	00449562.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
3787	17	2	-22.500000	-42.250000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Luchiari, C.	121	imagens3.jbrj.gov.br	rb/0/44/28/61	00442861.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2303	19	2	-22.550000	-42.500000	Euterpe edulis Mart.	Guedes, R.		imagens3.jbrj.gov.br	rb/0/44/95/64	00449564.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2304	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12746	imagens3.jbrj.gov.br	rb/0/44/95/68	00449568.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2305	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12410	imagens3.jbrj.gov.br	rb/0/44/95/76	00449576.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2306	19	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/47/65/16	00476516.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
2307	19	2	-19.135278	-39.932500	Euterpe edulis Mart.	Mansano, V.F.	07-443	imagens3.jbrj.gov.br	rb/0/49/54/73	00495473.jpg	8	\N	\N	f	Brasil	Espírito Santo	Linhares
2308	19	2	-19.950000	-40.516667	Euterpe edulis Mart.	H. Q. B. Fernandes s. n.					8	\N	\N	f	Brasil	Espírito Santo	Santa Teresa
2309	19	2	-20.267778	-40.525000	Euterpe edulis Mart.	Forzza, R.C.	5300	imagens3.jbrj.gov.br	rb/0/54/30/30	00543030.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
2310	19	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2311	19	2	-21.700000	-43.891667	Euterpe edulis Mart.	Forzza, R.C.	3616	imagens3.jbrj.gov.br	rb/0/55/13/51	00551351.jpg	8	\N	\N	f	Brasil	Minas Gerais	Lima Duarte
3788	17	2	-22.500000	-42.250000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Luchiari, C.	301	imagens3.jbrj.gov.br	rb/0/44/29/99	00442999.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3789	17	2	-19.883333	-40.383333	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Gomes, J.M.L.	1171				17	\N	\N	f	Brasil	Espírito Santo	Ibiraçu
3790	17	2	-22.500000	-42.250000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Luchiari, C.	170	imagens3.jbrj.gov.br	rb/0/47/65/88	00476588.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3902	44	2	-19.135278	-39.932500	Euterpe edulis Mart.	Vidal de Freitas Mansano	07-443				8	\N	\N	f	Brasil	Espírito Santo	
3488	30	2	-11.271945	-40.463333	Cyrtocymura scorpioides (Lam.) H.Rob.	Roberto Orlandi	241	imagens3.jbrj.gov.br	rb/0/40/82/44	00408244.jpg	8	\N	\N	f	Brasil	Bahia	Jacobina
3968	46	2	-13.944722	-40.109167	Inga subnuda Salzm. ex Benth.	Macedo, G.E.L.	1795	imagens3.jbrj.gov.br	rb/0/30/43/72	00304372.jpg	8	\N	\N	f	Brasil	Bahia	Jequié
3489	30	2	-14.350000	-39.500000	Cyrtocymura scorpioides (Lam.) H.Rob.	Brazão, J.E.M.	357	imagens3.jbrj.gov.br	rb/0/40/86/69	00408669.jpg	8	\N	\N	f	Brasil	Bahia	
2983	29	2	-24.923611	-58.185278	Solanum chacoense Bitter	Zardini, E.M.	54751	imagens3.jbrj.gov.br	rb/0/46/49/33	00464933.jpg	17	\N	\N	f	Paraguai		
2982	29	2	-26.866667	-53.500000	Solanum chacoense Bitter	Pedralli, G.	3061	imagens3.jbrj.gov.br	rb/0/46/49/26	00464926.jpg	17	\N	\N	f	Brasil	Santa Catarina	Pinhalzinho
3490	30	2	-22.417778	-43.208889	Cyrtocymura scorpioides (Lam.) H.Rob.	Giordano, L.C.	2531	imagens3.jbrj.gov.br	rb/0/43/77/77	00437777.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Petrópolis
3491	30	2	-19.336111	-40.608056	Cyrtocymura scorpioides (Lam.) H.Rob.	G. O. Romão 	1256	imagens3.jbrj.gov.br	rb/0/43/87/5	00438705.jpg	8	\N	\N	f	Brasil	Espírito Santo	Linhares
3492	30	2	-22.497778	-43.025278	Cyrtocymura scorpioides (Lam.) H.Rob.	M. Nadruz 	1848	imagens3.jbrj.gov.br	rb/0/49/11/13	00491113.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
1757	15	2	-22.500556	-42.269167	Tapirira guianensis Aubl.	A. G. Christo	323				17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3792	17	2	-22.583611	-43.424445	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Nina L. de A. Nunes	01	imagens3.jbrj.gov.br	rb/0/49/29/90	00492990.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
3793	17	2	-22.500556	-42.269167	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	A. G. Christo	266	imagens3.jbrj.gov.br	rb/0/51/81/5	00518105.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3794	17	2	-22.945833	-43.004444	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Barros, A.A.M. de	2961	imagens3.jbrj.gov.br	rb/0/51/90/27	00519027.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Niterói
3795	17	2	-22.532222	-42.346111	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	A. G. Christo	566	imagens3.jbrj.gov.br	rb/0/52/61/26	00526126.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3796	17	2	-22.536944	-42.909444	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Jorge Caruso		imagens3.jbrj.gov.br	rb/0/55/26/15	00552615.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
3797	17	2	-22.433333	-42.833333	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Lima, H.C. de	4332				17	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
3798	17	2	-22.433333	-42.833333	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Gomes, J.C.	65				17	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
3799	17	2	-22.433333	-42.833333	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	M.P.M.de Lima	218	imagens3.jbrj.gov.br	rb/0/55/95/89	00559589.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
3800	17	2	-22.433333	-42.833333	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Lima, H.C. de	4900	imagens3.jbrj.gov.br	rb/0/56/77/25	00567725.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
3801	17	2	-19.148611	-40.457778	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Demuner, V.	3036	imagens3.jbrj.gov.br	rb/0/57/64/7	00576407.jpg	17	\N	\N	f	Brasil	Espírito Santo	Governador Lindenberg
2117	18	2	-14.334722	-39.042778	Miconia mirabilis (Aubl.) L.O.Williams	E. J. Lucas	1025	imagens3.jbrj.gov.br	rb/0/53/9/88	00530988.jpg	8	\N	\N	f	Brasil	Bahia	Itacaré
2118	18	2	-20.302500	-40.481945	Miconia mirabilis (Aubl.) L.O.Williams	Forzza, R.C.	5060	imagens3.jbrj.gov.br	rb/0/54/9/12	00540912.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
2119	18	2	-20.319445	-40.537500	Miconia mirabilis (Aubl.) L.O.Williams	Goldenberg, R.	1261	imagens3.jbrj.gov.br	rb/0/54/94/64	00549464.jpg	8	\N	\N	f	Brasil	Espírito Santo	Viana
2312	19	2	-23.062778	-44.681945	Euterpe edulis Mart.	Rodrigo Rocha	011				8	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2313	19	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				8	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2314	19	2	-23.067778	-44.679445	Euterpe edulis Mart.	Rodrigo Rocha	073				8	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2315	19	2	-22.968889	-43.248611	Euterpe edulis Mart.	Ricardo Reis, Vanderlei Rodinsky, Thaís Almeida	RCCReis 1184				8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3802	17	2	-22.515833	-42.375278	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Pessoa, S.V.A.		imagens3.jbrj.gov.br	rb/0/58/94/91	00589491.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3803	17	2	-19.821945	-40.691667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Forzza, R.C.	5739	imagens3.jbrj.gov.br	rb/0/59/10/62	00591062.jpg	17	\N	\N	f	Brasil	Espírito Santo	Santa Teresa
2318	19	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3804	17	2	-23.045833	-43.595000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	M.J.F. Barros	91	imagens3.jbrj.gov.br	rb/0/60/36/78	00603678.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2320	19	2	-19.135278	-39.932500	Euterpe edulis Mart.	Vidal de Freitas Mansano	07-443				8	\N	\N	f	Brasil	Espírito Santo	
2321	19	2	-27.990000	-48.869722	Euterpe edulis Mart.	M. Verdi	5167	imagens3.jbrj.gov.br	rb/0/90/90/21	00909021.jpg	8	\N	\N	f	Brasil	Santa Catarina	São Bonifácio
3805	17	2	-22.250000	-44.566667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Lima, M.P.M. de	400	imagens3.jbrj.gov.br	rb/0/61/2/44	00610244.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
2323	19	2	-22.574722	-43.418333	Euterpe edulis Mart.	Haroldo C. de Lima	8265	imagens3.jbrj.gov.br	rb/1/14/24/74	01142474.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
3806	17	2	-22.250000	-44.566667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	M.P.M.de Lima	426	imagens3.jbrj.gov.br	rb/0/61/2/49	00610249.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
3807	17	2	-13.496944	-40.141111	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Ferreira, F.M.	1707	imagens3.jbrj.gov.br	rb/0/70/41/39	00704139.jpg	17	\N	\N	f	Brasil	Bahia	Itiruçu
3808	17	2	-22.550000	-43.266667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Lima, H.C. de	5370	imagens3.jbrj.gov.br	rb/0/71/5/52	00710552-1.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Duque de Caxias
3809	17	2	-16.500000	-39.250000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	G.M. Carvalho	340	imagens3.jbrj.gov.br	rb/0/74/71/93	00747193.jpg	17	\N	\N	f	Brasil	Bahia	Porto Seguro
3810	17	2	-20.054722	-40.495278	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Vervolet, R.R.	3304	imagens3.jbrj.gov.br	rb/0/76/69/23	00766923.jpg	17	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
3493	30	2	-22.497778	-43.025278	Cyrtocymura scorpioides (Lam.) H.Rob.	Nadruz, M.	1846	imagens3.jbrj.gov.br	rb/0/49/11/14	00491114.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3494	30	2	-22.650833	-42.877500	Cyrtocymura scorpioides (Lam.) H.Rob.	A. Rodarte	4Ca	imagens3.jbrj.gov.br	rb/0/49/29/53	00492953.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Itaboraí
3495	30	2	-22.505556	-42.275000	Cyrtocymura scorpioides (Lam.) H.Rob.	A. G. Christo	336	imagens3.jbrj.gov.br	rb/0/51/67/85	00516785.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2123	18	2	-15.277778	-39.027222	Miconia mirabilis (Aubl.) L.O.Williams	Fraga, C.N.	2593	imagens3.jbrj.gov.br	rb/0/57/34/71	00573471.jpg	8	\N	\N	f	Brasil	Bahia	Una
2125	18	2	-20.122778	-40.546111	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	2089	imagens3.jbrj.gov.br	rb/0/58/34/23	00583423.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2126	18	2	-20.200556	-40.490556	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	3640	imagens3.jbrj.gov.br	rb/0/58/34/27	00583427.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2127	18	2	-20.028889	-40.497222	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	1196	imagens3.jbrj.gov.br	rb/0/58/34/51	00583451.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2128	18	2	-19.348056	-40.550833	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	865	imagens3.jbrj.gov.br	rb/0/58/34/52	00583452.jpg	8	\N	\N	f	Brasil	Espírito Santo	Marilândia
2129	18	2	-19.348056	-40.550833	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	1384	imagens3.jbrj.gov.br	rb/0/58/34/53	00583453.jpg	8	\N	\N	f	Brasil	Espírito Santo	Marilândia
2130	18	2	-19.311667	-40.537500	Miconia mirabilis (Aubl.) L.O.Williams	L. F. S. Magnago	695	imagens3.jbrj.gov.br	rb/0/58/35/72	00583572.jpg	8	\N	\N	f	Brasil	Espírito Santo	Governador Lindenberg
2131	18	2	-20.028889	-40.497222	Miconia mirabilis (Aubl.) L.O.Williams	L. F. S. Magnago	1561	imagens3.jbrj.gov.br	rb/0/58/35/78	00583578.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2132	18	2	-20.026667	-40.492222	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	3608	imagens3.jbrj.gov.br	rb/0/58/35/79	00583579.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2133	18	2	-17.183333	-39.333333	Miconia mirabilis (Aubl.) L.O.Williams	F. B. Matos 	1703	imagens3.jbrj.gov.br	rb/0/58/92/68	00589268.jpg	8	\N	\N	f	Brasil	Bahia	Prado
2134	18	2	-15.181945	-39.063333	Miconia mirabilis (Aubl.) L.O.Williams	M.K. Caddah	789	imagens3.jbrj.gov.br	rb/0/65/50/24	00655024.jpg	8	\N	\N	f	Brasil	Bahia	Una
2135	18	2	-15.173611	-39.341667	Miconia mirabilis (Aubl.) L.O.Williams	A.B. Jardim	2	imagens3.jbrj.gov.br	rb/0/70/39/90	00703990.jpg	8	\N	\N	f	Brasil	Bahia	Arataca
2137	18	2	-13.605556	-39.854444	Miconia mirabilis (Aubl.) L.O.Williams	Milliken, W	5051	imagens3.jbrj.gov.br	rb/0/78/12/44	00781244.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
2138	18	2	-13.685000	-39.825278	Miconia mirabilis (Aubl.) L.O.Williams	Zappi, D.C	3399	imagens3.jbrj.gov.br	rb/0/78/12/86	00781286.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
2139	18	2	-13.668889	-39.818333	Miconia mirabilis (Aubl.) L.O.Williams	Zappi, D.C	3386	imagens3.jbrj.gov.br	rb/0/78/12/88	00781288.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
2140	18	2	-14.407222	-40.120833	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	1898	imagens3.jbrj.gov.br	rb/0/78/67/2	00786702.jpg	8	\N	\N	f	Brasil	Bahia	Boa Nova
2141	18	2	-13.583333	-39.716667	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	2322	imagens3.jbrj.gov.br	rb/0/78/88/59	00788859.jpg	8	\N	\N	f	Brasil	Bahia	Wenceslau Guimarães
2142	18	2	-19.351389	-40.548056	Miconia mirabilis (Aubl.) L.O.Williams	Forzza, R.C.	7567	imagens3.jbrj.gov.br	rb/0/81/0/79	00810079.jpg	8	\N	\N	f	Brasil	Espírito Santo	Marilândia
2143	18	2	-13.579445	-39.705833	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	2676	imagens3.jbrj.gov.br	rb/0/82/9/41	00820941.jpg	8	\N	\N	f	Brasil	Bahia	Wenceslau Guimarães
2144	18	2	-13.879445	-39.688333	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	3334	imagens3.jbrj.gov.br	rb/0/87/97/26	00879726.jpg	8	\N	\N	f	Brasil	Bahia	Apuarema
2324	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 A	imagens3.jbrj.gov.br	rb/1/23/11/53	01231153.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
2325	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 B	imagens3.jbrj.gov.br	rb/1/23/11/59	01231159.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
2326	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 C	imagens3.jbrj.gov.br	rb/1/23/11/60	01231160.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
2080	7	2	-3.624167	-40.402778	Encholirium spectabile Mart. ex Schult. & Schult.f.	Martinelli, G.	15058	imagens3.jbrj.gov.br	rb/0/14/8/17	00140817.jpg	8	\N	\N	f	Brasil	Ceará	Meruoca
2081	7	2	-13.283056	-42.143056	Encholirium spectabile Mart. ex Schult. & Schult.f.	Fraga, C.N.	2754	imagens3.jbrj.gov.br	rb/0/57/36/35	00573635.jpg	8	\N	\N	f	Brasil	Bahia	Érico Cardoso
2082	7	2	-3.624167	-40.427222	Encholirium spectabile Mart. ex Schult. & Schult.f.	Martinelli, G.	15058				8	\N	\N	f	Brasil	Ceará	Meruoca
2083	7	2	-8.381945	-35.939444	Encholirium spectabile Mart. ex Schult. & Schult.f.	P.Gomes	864	imagens3.jbrj.gov.br	rb/0/60/40/57	00604057.jpg	8	\N	\N	f	Brasil	Pernambuco	
2084	7	2	-8.383333	-36.000000	Encholirium spectabile Mart. ex Schult. & Schult.f.	P.Gomes	661	imagens3.jbrj.gov.br	rb/0/60/40/69	00604069.jpg	8	\N	\N	f	Brasil	Pernambuco	Agrestina
2085	7	2	-13.583333	-41.833333	Encholirium spectabile Mart. ex Schult. & Schult.f.	Harley, R.M.	15153	imagens3.jbrj.gov.br	rb/0/64/18/53	00641853.jpg	8	\N	\N	f	Brasil	Mato Grosso	
2086	7	2	-12.869722	-39.854167	Encholirium spectabile Mart. ex Schult. & Schult.f.	Forzza, R.C.	7494	imagens3.jbrj.gov.br	rb/0/74/30/52	00743052.jpg	8	\N	\N	f	Brasil	Bahia	Milagres
2087	7	2	-7.164167	-38.436389	Encholirium spectabile Mart. ex Schult. & Schult.f.	Fontana, A.P.	8814	imagens3.jbrj.gov.br	rb/1/14/79/7	01147907.jpg	8	\N	\N	f	Brasil	Paraíba	São José de Piranhas
2088	7	2	-6.035000	-37.677222	Encholirium spectabile Mart. ex Schult. & Schult.f.	E.C. Tomaz	30	imagens3.jbrj.gov.br	rb/1/18/28/86	01182886.jpg	8	\N	\N	f	Brasil	Rio Grande do Norte	Olho-d´Água do Borges
2089	7	2	-6.815556	-38.715833	Encholirium spectabile Mart. ex Schult. & Schult.f.	J.L. Costa-Lima	1226	imagens3.jbrj.gov.br	rb/1/32/11/30	01321130.jpg	8	\N	\N	f	Brasil	Ceará	Ipaumirim
2097	7	2	-7.164167	-38.436389	Encholirium spectabile Mart. ex Schult. & Schult.f.	Fontana, A.P.	8814	imagens3.jbrj.gov.br	rb/1/14/79/7	01147907.jpg	18	\N	\N	f	Brasil	Paraíba	São José de Piranhas
2098	7	2	-6.035000	-37.677222	Encholirium spectabile Mart. ex Schult. & Schult.f.	E.C. Tomaz	30	imagens3.jbrj.gov.br	rb/1/18/28/86	01182886.jpg	18	\N	\N	f	Brasil	Rio Grande do Norte	Olho-d´Água do Borges
3496	30	2	-14.703611	-39.602500	Cyrtocymura scorpioides (Lam.) H.Rob.	Paixão, J.L.	800	imagens3.jbrj.gov.br	rb/0/51/69/10	00516910.jpg	8	\N	\N	f	Brasil	Bahia	Almadina
2147	18	2	-22.956389	-43.285278	Miconia mirabilis (Aubl.) L.O.Williams	C. Baez	512	imagens3.jbrj.gov.br	rb/1/11/92/68	01119268.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2148	18	2	-22.966111	-43.256667	Miconia mirabilis (Aubl.) L.O.Williams	C.Baez	606	imagens3.jbrj.gov.br	rb/1/17/41/11	01174111.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2149	18	2	-22.959167	-43.277778	Miconia mirabilis (Aubl.) L.O.Williams	T. Lorenzetti	6	imagens3.jbrj.gov.br	rb/1/21/46/37	01214637.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2150	18	2	-22.958889	-43.277500	Miconia mirabilis (Aubl.) L.O.Williams	T. Lorenzetti	42				8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2110	18	2	-16.383333	-39.133333	Miconia mirabilis (Aubl.) L.O.Williams	Bautista, H.P.	1144	imagens3.jbrj.gov.br	rb/0/23/99/59	00239959.jpg	2	\N	\N	f	Brasil	Bahia	
2111	18	2	-22.833333	-43.333333	Miconia mirabilis (Aubl.) L.O.Williams	Landrum, L.R.	2016	imagens3.jbrj.gov.br	rb/0/24/22/96	00242296.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	
2115	18	2	-12.869445	-38.471667	Miconia mirabilis (Aubl.) L.O.Williams	M.L.C. Neves	486	imagens3.jbrj.gov.br	rb/0/52/30/72	00523072.jpg	2	\N	\N	f	Brasil	Bahia	Santa Teresinha
2120	18	2	-22.433333	-42.833333	Miconia mirabilis var. sanguinea	Martinelli, G.	10243	imagens3.jbrj.gov.br	rb/0/55/91/16	00559116.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
2121	18	2	-22.433333	-42.833333	Miconia mirabilis (Aubl.) L.O.Williams	Vieira, C.M.	150	imagens3.jbrj.gov.br	rb/0/55/91/95	00559195.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
2122	18	2	-15.173611	-39.341667	Miconia mirabilis (Aubl.) L.O.Williams	J.F.A. Baumgratz	1095	imagens3.jbrj.gov.br	rb/0/55/99/56	00559956.jpg	2	\N	\N	f	Brasil	Bahia	Ilhéus
2099	7	2	-6.815556	-38.715833	Encholirium spectabile Mart. ex Schult. & Schult.f.	J.L. Costa-Lima	1226	imagens3.jbrj.gov.br	rb/1/32/11/30	01321130.jpg	18	\N	\N	f	Brasil	Ceará	Ipaumirim
2100	7	2	-3.624167	-40.402778	Encholirium spectabile Mart. ex Schult. & Schult.f.	Martinelli, G.	15058	imagens3.jbrj.gov.br	rb/0/14/8/17	00140817.jpg	18	\N	\N	f	Brasil	Ceará	Meruoca
2101	7	2	-13.283056	-42.143056	Encholirium spectabile Mart. ex Schult. & Schult.f.	Fraga, C.N.	2754	imagens3.jbrj.gov.br	rb/0/57/36/35	00573635.jpg	18	\N	\N	f	Brasil	Bahia	Érico Cardoso
2102	7	2	-3.624167	-40.427222	Encholirium spectabile Mart. ex Schult. & Schult.f.	Martinelli, G.	15058				18	\N	\N	f	Brasil	Ceará	Meruoca
2103	7	2	-8.381945	-35.939444	Encholirium spectabile Mart. ex Schult. & Schult.f.	P.Gomes	864	imagens3.jbrj.gov.br	rb/0/60/40/57	00604057.jpg	18	\N	\N	f	Brasil	Pernambuco	
2104	7	2	-8.383333	-36.000000	Encholirium spectabile Mart. ex Schult. & Schult.f.	P.Gomes	661	imagens3.jbrj.gov.br	rb/0/60/40/69	00604069.jpg	18	\N	\N	f	Brasil	Pernambuco	Agrestina
2105	7	2	-13.583333	-41.833333	Encholirium spectabile Mart. ex Schult. & Schult.f.	Harley, R.M.	15153	imagens3.jbrj.gov.br	rb/0/64/18/53	00641853.jpg	18	\N	\N	f	Brasil	Mato Grosso	
2106	7	2	-12.869722	-39.854167	Encholirium spectabile Mart. ex Schult. & Schult.f.	Forzza, R.C.	7494	imagens3.jbrj.gov.br	rb/0/74/30/52	00743052.jpg	18	\N	\N	f	Brasil	Bahia	Milagres
2107	7	2	-7.164167	-38.436389	Encholirium spectabile Mart. ex Schult. & Schult.f.	Fontana, A.P.	8814	imagens3.jbrj.gov.br	rb/1/14/79/7	01147907.jpg	18	\N	\N	f	Brasil	Paraíba	São José de Piranhas
2108	7	2	-6.035000	-37.677222	Encholirium spectabile Mart. ex Schult. & Schult.f.	E.C. Tomaz	30	imagens3.jbrj.gov.br	rb/1/18/28/86	01182886.jpg	18	\N	\N	f	Brasil	Rio Grande do Norte	Olho-d´Água do Borges
2109	7	2	-6.815556	-38.715833	Encholirium spectabile Mart. ex Schult. & Schult.f.	J.L. Costa-Lima	1226	imagens3.jbrj.gov.br	rb/1/32/11/30	01321130.jpg	18	\N	\N	f	Brasil	Ceará	Ipaumirim
3497	30	2	-19.770833	-40.757500	Cyrtocymura scorpioides (Lam.) H.Rob.	M.M. Saavedra	642	imagens3.jbrj.gov.br	rb/0/51/73/17	00517317.jpg	8	\N	\N	f	Brasil	Espírito Santo	São Roque do Canaã
2136	18	2	-19.351111	-40.548056	Miconia mirabilis (Aubl.) L.O.Williams	J. R. Pirani	6107	imagens3.jbrj.gov.br	rb/0/73/60/76	00736076.jpg	2	\N	\N	f	Brasil	Espírito Santo	
2145	18	2	-16.283333	-39.600000	Miconia mirabilis (Aubl.) L.O.Williams	R. Goldenberg et. al.;	1721	imagens3.jbrj.gov.br	rb/0/93/29/8	00932908.jpg	2	\N	\N	f	Brasil	Bahia	Itamaraju
2146	18	2	-14.416667	-89.016667	Miconia mirabilis (Aubl.) L.O.Williams	Carvalho, A.M.V. de	3537	imagens3.jbrj.gov.br	rb/0/97/59/19	00975919.jpg	4	-14.416667	-39.000000	f	Brasil	Bahia	Uruçuca
2124	18	2	-20.294444	-40.697778	Miconia mirabilis (Aubl.) L.O.Williams	Fontana, A.P.	4923	imagens3.jbrj.gov.br	rb/0/58/30/2	00583002.jpg	6	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2151	19	2	-16.383333	-39.133333	Miconia mirabilis (Aubl.) L.O.Williams	Bautista, H.P.	1144	imagens3.jbrj.gov.br	rb/0/23/99/59	00239959.jpg	8	\N	\N	f	Brasil	Bahia	
2152	19	2	-22.833333	-43.333333	Miconia mirabilis (Aubl.) L.O.Williams	Landrum, L.R.	2016	imagens3.jbrj.gov.br	rb/0/24/22/96	00242296.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	
2153	19	2	-15.150000	-39.083333	Miconia mirabilis (Aubl.) L.O.Williams	André M. de Carvalho 	6313	imagens3.jbrj.gov.br	rb/0/48/26/88	00482688.jpg	8	\N	\N	f	Brasil	Bahia	Una
2154	19	2	-15.150000	-39.083333	Miconia mirabilis (Aubl.) L.O.Williams	André M. A. Amorim 	1964	imagens3.jbrj.gov.br	rb/0/48/30/56	00483056.jpg	8	\N	\N	f	Brasil	Bahia	Una
2155	19	2	-20.302500	-40.481945	Miconia mirabilis (Aubl.) L.O.Williams	Kollmann, L.	10662	imagens3.jbrj.gov.br	rb/0/52/20/37	00522037.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
2156	19	2	-12.869445	-38.471667	Miconia mirabilis (Aubl.) L.O.Williams	M.L.C. Neves	486	imagens3.jbrj.gov.br	rb/0/52/30/72	00523072.jpg	8	\N	\N	f	Brasil	Bahia	Santa Teresinha
2157	19	2	-20.276111	-40.525000	Miconia mirabilis (Aubl.) L.O.Williams	Goldenberg, R.	1091	imagens3.jbrj.gov.br	rb/0/52/91/31	00529131.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
2158	19	2	-14.334722	-39.042778	Miconia mirabilis (Aubl.) L.O.Williams	E. J. Lucas	1025	imagens3.jbrj.gov.br	rb/0/53/9/88	00530988.jpg	8	\N	\N	f	Brasil	Bahia	Itacaré
2159	19	2	-20.302500	-40.481945	Miconia mirabilis (Aubl.) L.O.Williams	Forzza, R.C.	5060	imagens3.jbrj.gov.br	rb/0/54/9/12	00540912.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
2160	19	2	-20.319445	-40.537500	Miconia mirabilis (Aubl.) L.O.Williams	Goldenberg, R.	1261	imagens3.jbrj.gov.br	rb/0/54/94/64	00549464.jpg	8	\N	\N	f	Brasil	Espírito Santo	Viana
2327	20	2	-11.642778	-40.929167	Prepusa montana Mart.	ROBERTO ORLANDI	268	imagens3.jbrj.gov.br	rb/0/11/35/22	00113522.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
2161	19	2	-22.433333	-42.833333	Miconia mirabilis var. sanguinea	Martinelli, G.	10243	imagens3.jbrj.gov.br	rb/0/55/91/16	00559116.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
2162	19	2	-22.433333	-42.833333	Miconia mirabilis (Aubl.) L.O.Williams	Vieira, C.M.	150	imagens3.jbrj.gov.br	rb/0/55/91/95	00559195.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
2163	19	2	-15.173611	-39.341667	Miconia mirabilis (Aubl.) L.O.Williams	J.F.A. Baumgratz	1095	imagens3.jbrj.gov.br	rb/0/55/99/56	00559956.jpg	8	\N	\N	f	Brasil	Bahia	Ilhéus
2164	19	2	-15.277778	-39.027222	Miconia mirabilis (Aubl.) L.O.Williams	Fraga, C.N.	2593	imagens3.jbrj.gov.br	rb/0/57/34/71	00573471.jpg	8	\N	\N	f	Brasil	Bahia	Una
2165	19	2	-20.294444	-40.697778	Miconia mirabilis (Aubl.) L.O.Williams	Fontana, A.P.	4923	imagens3.jbrj.gov.br	rb/0/58/30/2	00583002.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2166	19	2	-20.122778	-40.546111	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	2089	imagens3.jbrj.gov.br	rb/0/58/34/23	00583423.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2167	19	2	-20.200556	-40.490556	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	3640	imagens3.jbrj.gov.br	rb/0/58/34/27	00583427.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2168	19	2	-20.028889	-40.497222	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	1196	imagens3.jbrj.gov.br	rb/0/58/34/51	00583451.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2169	19	2	-19.348056	-40.550833	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	865	imagens3.jbrj.gov.br	rb/0/58/34/52	00583452.jpg	8	\N	\N	f	Brasil	Espírito Santo	Marilândia
2170	19	2	-19.348056	-40.550833	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	1384	imagens3.jbrj.gov.br	rb/0/58/34/53	00583453.jpg	8	\N	\N	f	Brasil	Espírito Santo	Marilândia
2171	19	2	-19.311667	-40.537500	Miconia mirabilis (Aubl.) L.O.Williams	L. F. S. Magnago	695	imagens3.jbrj.gov.br	rb/0/58/35/72	00583572.jpg	8	\N	\N	f	Brasil	Espírito Santo	Governador Lindenberg
2172	19	2	-20.028889	-40.497222	Miconia mirabilis (Aubl.) L.O.Williams	L. F. S. Magnago	1561	imagens3.jbrj.gov.br	rb/0/58/35/78	00583578.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2173	19	2	-20.026667	-40.492222	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	3608	imagens3.jbrj.gov.br	rb/0/58/35/79	00583579.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2174	19	2	-17.183333	-39.333333	Miconia mirabilis (Aubl.) L.O.Williams	F. B. Matos 	1703	imagens3.jbrj.gov.br	rb/0/58/92/68	00589268.jpg	8	\N	\N	f	Brasil	Bahia	Prado
2175	19	2	-15.181945	-39.063333	Miconia mirabilis (Aubl.) L.O.Williams	M.K. Caddah	789	imagens3.jbrj.gov.br	rb/0/65/50/24	00655024.jpg	8	\N	\N	f	Brasil	Bahia	Una
2176	19	2	-15.173611	-39.341667	Miconia mirabilis (Aubl.) L.O.Williams	A.B. Jardim	2	imagens3.jbrj.gov.br	rb/0/70/39/90	00703990.jpg	8	\N	\N	f	Brasil	Bahia	Arataca
2177	19	2	-19.351111	-40.548056	Miconia mirabilis (Aubl.) L.O.Williams	J. R. Pirani	6107	imagens3.jbrj.gov.br	rb/0/73/60/76	00736076.jpg	8	\N	\N	f	Brasil	Espírito Santo	
2178	19	2	-13.605556	-39.854444	Miconia mirabilis (Aubl.) L.O.Williams	Milliken, W	5051	imagens3.jbrj.gov.br	rb/0/78/12/44	00781244.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
2179	19	2	-13.685000	-39.825278	Miconia mirabilis (Aubl.) L.O.Williams	Zappi, D.C	3399	imagens3.jbrj.gov.br	rb/0/78/12/86	00781286.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
2180	19	2	-13.668889	-39.818333	Miconia mirabilis (Aubl.) L.O.Williams	Zappi, D.C	3386	imagens3.jbrj.gov.br	rb/0/78/12/88	00781288.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
2181	19	2	-14.407222	-40.120833	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	1898	imagens3.jbrj.gov.br	rb/0/78/67/2	00786702.jpg	8	\N	\N	f	Brasil	Bahia	Boa Nova
2182	19	2	-13.583333	-39.716667	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	2322	imagens3.jbrj.gov.br	rb/0/78/88/59	00788859.jpg	8	\N	\N	f	Brasil	Bahia	Wenceslau Guimarães
2183	19	2	-19.351389	-40.548056	Miconia mirabilis (Aubl.) L.O.Williams	Forzza, R.C.	7567	imagens3.jbrj.gov.br	rb/0/81/0/79	00810079.jpg	8	\N	\N	f	Brasil	Espírito Santo	Marilândia
2184	19	2	-13.579445	-39.705833	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	2676	imagens3.jbrj.gov.br	rb/0/82/9/41	00820941.jpg	8	\N	\N	f	Brasil	Bahia	Wenceslau Guimarães
2185	19	2	-13.879445	-39.688333	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	3334	imagens3.jbrj.gov.br	rb/0/87/97/26	00879726.jpg	8	\N	\N	f	Brasil	Bahia	Apuarema
2186	19	2	-16.283333	-39.600000	Miconia mirabilis (Aubl.) L.O.Williams	R. Goldenberg et. al.;	1721	imagens3.jbrj.gov.br	rb/0/93/29/8	00932908.jpg	8	\N	\N	f	Brasil	Bahia	Itamaraju
3498	30	2	-20.055000	-40.538889	Cyrtocymura scorpioides (Lam.) H.Rob.	Pereira, L.A. 	1551	imagens3.jbrj.gov.br	rb/0/51/81/46	00518146.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2188	19	2	-22.956389	-43.285278	Miconia mirabilis (Aubl.) L.O.Williams	C. Baez	512	imagens3.jbrj.gov.br	rb/1/11/92/68	01119268.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2189	19	2	-22.966111	-43.256667	Miconia mirabilis (Aubl.) L.O.Williams	C.Baez	606	imagens3.jbrj.gov.br	rb/1/17/41/11	01174111.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2190	19	2	-22.959167	-43.277778	Miconia mirabilis (Aubl.) L.O.Williams	T. Lorenzetti	6	imagens3.jbrj.gov.br	rb/1/21/46/37	01214637.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2191	19	2	-22.958889	-43.277500	Miconia mirabilis (Aubl.) L.O.Williams	T. Lorenzetti	42				8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3499	30	2	-21.967500	-42.017500	Cyrtocymura scorpioides (Lam.) H.Rob.	M.M. Saavedra	720	imagens3.jbrj.gov.br	rb/0/52/72/54	00527254.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Santa Maria Madalena
3500	30	2	-20.516111	-41.083611	Cyrtocymura scorpioides (Lam.) H.Rob.	M.M. Saavedra	731	imagens3.jbrj.gov.br	rb/0/52/86/26	00528626.jpg	8	\N	\N	f	Brasil	Espírito Santo	Castelo
2187	19	2	-14.416667	-89.016667	Miconia mirabilis (Aubl.) L.O.Williams	Carvalho, A.M.V. de	3537	imagens3.jbrj.gov.br	rb/0/97/59/19	00975919.jpg	10	\N	\N	f	Brasil	Bahia	Uruçuca
3501	30	2	-20.266667	-40.533333	Cyrtocymura scorpioides (Lam.) H.Rob.	M.M. Saavedra	764	imagens3.jbrj.gov.br	rb/0/52/86/59	00528659.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
2344	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	827	imagens3.jbrj.gov.br	rb/0/44/18/23	00441823.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3969	46	2	-13.944722	-40.109167	Inga subnuda Salzm. ex Benth.	Macedo, G.E.L.	1608	imagens3.jbrj.gov.br	rb/0/30/43/83	00304383.jpg	8	\N	\N	f	Brasil	Bahia	Jequié
2345	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Farias, D.S.	207	imagens3.jbrj.gov.br	rb/0/44/20/50	00442050.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1711	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	168	imagens3.jbrj.gov.br	rb/0/44/29/15	00442915.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1712	15	2	-22.433333	-42.833333	Tapirira guianensis Aubl.	T.S.Pereira	4	imagens3.jbrj.gov.br	rb/0/55/95/17	00559517.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
1714	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	526	imagens3.jbrj.gov.br	rb/0/44/27/4	00442704.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1715	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Farias, D.S.	327	imagens3.jbrj.gov.br	rb/0/44/25/66	00442566.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1719	15	2	-20.308889	-46.522778	Tapirira guianensis Aubl.	M. Groppo	23601	imagens3.jbrj.gov.br	rb/1/31/67/84	01316784.jpg	2	\N	\N	f	Brasil	Minas Gerais	Vargem Bonita
1720	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	528	imagens3.jbrj.gov.br	rb/0/44/27/5	00442705.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1721	15	2	-22.433333	-42.833333	Tapirira guianensis Aubl.	T.S.Pereira	5	imagens3.jbrj.gov.br	rb/0/55/95/18	00559518.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
1723	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	586	imagens3.jbrj.gov.br	rb/0/44/31/89	00443189.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1724	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	606	imagens3.jbrj.gov.br	rb/0/47/50/57	00475057.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1726	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	605	imagens3.jbrj.gov.br	rb/0/44/28/32	00442832.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1727	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	529	imagens3.jbrj.gov.br	rb/0/44/27/6	00442706.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1728	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Correia, C.M.B.	385	imagens3.jbrj.gov.br	rb/0/44/23/39	00442339.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1731	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	48	imagens3.jbrj.gov.br	rb/0/44/27/7	00442707.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1732	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Lima, H.C. de	4519	imagens3.jbrj.gov.br	rb/0/44/15/22	00441522.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1734	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	35	imagens3.jbrj.gov.br	rb/0/44/27/78	00442778.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1738	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	612	imagens3.jbrj.gov.br	rb/0/44/28/68	00442868.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1739	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	S.V.A.Pessoa	810	imagens3.jbrj.gov.br	rb/0/44/35/61	00443561.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1705	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	530	imagens3.jbrj.gov.br	rb/0/44/27/36	00442736.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1707	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	S.V.A.Pessoa	666	imagens3.jbrj.gov.br	rb/0/44/15/41	00441541.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1741	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Farias, D.S.	324	imagens3.jbrj.gov.br	rb/0/44/25/10	00442510.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1744	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Lima, H.C. de	4774	imagens3.jbrj.gov.br	rb/0/44/23/97	00442397.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1745	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	173	imagens3.jbrj.gov.br	rb/0/44/29/19	00442919-1.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1746	15	2	-22.916667	-42.233333	Tapirira guianensis Aubl.	Andrade, A.C.S.	AC100	imagens3.jbrj.gov.br	rb/0/85/70/19	00857019.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	
1749	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Farias, D.S.	134	imagens3.jbrj.gov.br	rb/0/44/24/96	00442496.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1751	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	531	imagens3.jbrj.gov.br	rb/0/44/31/45	00443145.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1752	15	2	-15.807222	-48.855833	Tapirira guianensis Aubl.	P. G. Delprete	10384	imagens3.jbrj.gov.br	rb/0/59/39/90	00593990.jpg	2	\N	\N	f	Brasil	Goiás	Pirenópolis
1756	15	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	532	imagens3.jbrj.gov.br	rb/0/44/31/26	00443126.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3970	46	2	-13.951667	-40.111667	Inga subnuda Salzm. ex Benth.	Macedo, G.E.L.	1610	imagens3.jbrj.gov.br	rb/0/30/43/96	00304396.jpg	8	\N	\N	f	Brasil	Bahia	Jequié
1760	15	2	-22.433333	-42.833333	Tapirira guianensis Aubl.	Lima, H.C. de	4346	imagens3.jbrj.gov.br	rb/0/55/87/70	00558770.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
1762	15	2	-22.706667	-48.304444	Tapirira guianensis Aubl.	Barreto, K.D.	3422	imagens3.jbrj.gov.br	rb/1/5/5/17	01050517.jpg	2	\N	\N	f	Brasil	São Paulo	Anhembi
1763	15	2	-15.963333	-47.897222	Tapirira guianensis Aubl.	M. L. M. Azevedo	430	imagens3.jbrj.gov.br	rb/0/48/91/65	00489165.jpg	2	\N	\N	f	Brasil	Distrito Federal	
1771	15	2	-20.716667	-42.483333	Tapirira guianensis Aubl.	L.S. Leoni	2329	imagens3.jbrj.gov.br	rb/1/17/76/1	01177601.jpg	2	\N	\N	f	Brasil	Minas Gerais	
1773	15	2	-22.560278	-43.415556	Tapirira guianensis Aubl.	Rodrigues, P.J.F.P.	6				2	\N	\N	f	Brasil	Rio de Janeiro	Miguel Pereira
1778	15	2	-24.815000	-47.742222	Tapirira guianensis Aubl.	G.D. Sanches	01	imagens3.jbrj.gov.br	rb/1/5/5/15	01050515.jpg	2	\N	\N	f	Brasil	São Paulo	
3502	30	2	-22.450000	-43.000000	Cyrtocymura scorpioides (Lam.) H.Rob.	Paula-Souza, J.	5946	imagens3.jbrj.gov.br	rb/0/54/81/29	00548129.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3503	30	2	-20.274445	-40.478333	Cyrtocymura scorpioides (Lam.) H.Rob.	Fraga, C.N.	2198	imagens3.jbrj.gov.br	rb/0/54/93/11	00549311.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
3504	30	2	-20.439167	-41.400833	Cyrtocymura scorpioides (Lam.) H.Rob.	C.C. Jorden Almaça		imagens3.jbrj.gov.br	rb/0/58/16/44	00581644.jpg	8	\N	\N	f	Brasil	Espírito Santo	Muniz Freire
3505	30	2	-14.705833	-39.603333	Cyrtocymura scorpioides (Lam.) H.Rob.	Cardoso, D.	2153	imagens3.jbrj.gov.br	rb/0/59/60/12	00596012.jpg	8	\N	\N	f	Brasil	Bahia	Almadina
3506	30	2	-18.963889	-43.764167	Cyrtocymura scorpioides (Lam.) H.Rob.	Zappi, D.C.	2037	imagens3.jbrj.gov.br	rb/0/59/60/19	00596019.jpg	8	\N	\N	f	Brasil	Minas Gerais	Santana de Pirapama
3507	30	2	-23.005556	-43.303611	Cyrtocymura scorpioides (Lam.) H.Rob.	Fraga, C.N.	2907	imagens3.jbrj.gov.br	rb/0/60/34/73	00603473.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2346	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12447	imagens3.jbrj.gov.br	rb/0/44/95/62	00449562.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
3508	30	2	-220.975278	-430.044444	Cyrtocymura scorpioides (Lam.) H.Rob.	D.M.S. Nepomucemo e  A.C. Siqueira	17	imagens3.jbrj.gov.br	rb/0/72/27/10	00722710.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Niterói
3971	46	2	-22.458611	-43.005000	Inga subnuda ssp. luschnathiana (Benth.) T.D.Penn.	Seele, C.C.S.	632	imagens3.jbrj.gov.br	rb/0/32/29/79	00322979.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3510	30	2	-22.563889	-41.980000	Cyrtocymura scorpioides (Lam.) H.Rob.	A.J. Castelo	33	imagens3.jbrj.gov.br	rb/0/76/12/45	00761245.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Casimiro de Abreu
3511	30	2	-23.015833	-43.415833	Cyrtocymura scorpioides (Lam.) H.Rob.	A.J. Castelo	67	imagens3.jbrj.gov.br	rb/0/76/12/79	00761279.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3512	30	2	-23.047500	-43.522500	Cyrtocymura scorpioides (Lam.) H.Rob.	A.J. Castelo	139	imagens3.jbrj.gov.br	rb/0/76/13/51	00761351.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3513	30	2	-22.289722	-41.673056	Cyrtocymura scorpioides (Lam.) H.Rob.	A.J. Castelo	165	imagens3.jbrj.gov.br	rb/0/76/13/77	00761377.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Macaé
2328	20	2	-11.623333	-41.000833	Prepusa montana Mart.	Oliveira, A.	64	imagens3.jbrj.gov.br	rb/0/11/35/42	00113542.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
2329	20	2	-13.000000	-41.400000	Prepusa montana Mart.	Mori, S.A.		imagens3.jbrj.gov.br	rb/0/11/35/92	00113592.jpg	8	\N	\N	f	Brasil	Bahia	Mucugê
2330	20	2	-11.450000	-41.116667	Prepusa montana Mart.	Coradin, L.	6230	imagens3.jbrj.gov.br	rb/0/11/36/7	00113607.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
2331	20	2	-21.710278	-43.817778	Prepusa montana Mart.	Fontana, A.P.	2271	imagens3.jbrj.gov.br	rb/0/56/21/13	00562113.jpg	8	\N	\N	f	Brasil	Minas Gerais	Ouro Preto
2332	20	2	-13.013056	-41.372778	Prepusa montana Mart.	Fraga, C.N.	2691	imagens3.jbrj.gov.br	rb/0/57/35/71	00573571.jpg	8	\N	\N	f	Brasil	Bahia	Mucugê
2333	20	2	-11.583333	-41.200000	Prepusa montana Mart.	Harley, R.M.	22755	imagens3.jbrj.gov.br	rb/0/70/34/96	00703496.jpg	8	\N	\N	f	Brasil	Bahia	
2334	20	2	-11.635833	-41.001389	Prepusa montana Mart.	Roque, N.	1111	imagens3.jbrj.gov.br	rb/0/70/44/46	00704446.jpg	8	\N	\N	f	Brasil	Bahia	
2335	19	2	-11.642778	-40.929167	Prepusa montana Mart.	ROBERTO ORLANDI	268	imagens3.jbrj.gov.br	rb/0/11/35/22	00113522.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
2336	19	2	-11.623333	-41.000833	Prepusa montana Mart.	Oliveira, A.	64	imagens3.jbrj.gov.br	rb/0/11/35/42	00113542.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
2337	19	2	-13.000000	-41.400000	Prepusa montana Mart.	Mori, S.A.		imagens3.jbrj.gov.br	rb/0/11/35/92	00113592.jpg	8	\N	\N	f	Brasil	Bahia	Mucugê
2338	19	2	-11.450000	-41.116667	Prepusa montana Mart.	Coradin, L.	6230	imagens3.jbrj.gov.br	rb/0/11/36/7	00113607.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
3514	30	2	-23.176945	-44.301389	Cyrtocymura scorpioides (Lam.) H.Rob.	A.J. Castelo	240	imagens3.jbrj.gov.br	rb/0/76/14/52	00761452.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Angra dos Reis
3515	30	2	-13.603611	-39.853611	Cyrtocymura scorpioides (Lam.) H.Rob.	W. Milliken	5055	imagens3.jbrj.gov.br	rb/0/76/61/52	00766152.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
3516	30	2	-17.856111	-41.260833	Cyrtocymura scorpioides (Lam.) H.Rob.	De Paula, L.F.A.	364	imagens3.jbrj.gov.br	rb/0/79/90/3	00799003.jpg	8	\N	\N	f	Brasil	Minas Gerais	Teófilo Otoni
3517	30	2	-19.292778	-43.539167	Cyrtocymura scorpioides (Lam.) H.Rob.	M. Verdi	6535	imagens3.jbrj.gov.br	rb/0/82/62/88	00826288.jpg	8	\N	\N	f	Brasil	Minas Gerais	Santana do Riacho
3518	30	2	-22.975556	-43.013611	Cyrtocymura scorpioides (Lam.) H.Rob.	A.A.M.de Barros	4895	imagens3.jbrj.gov.br	rb/0/83/57/57	00835757.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Niterói
3519	30	2	-22.988611	-43.033611	Cyrtocymura scorpioides (Lam.) H.Rob.	D.N.S.Machado	262	imagens3.jbrj.gov.br	rb/0/83/57/62	00835762.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Niterói
2339	19	2	-21.710278	-43.817778	Prepusa montana Mart.	Fontana, A.P.	2271	imagens3.jbrj.gov.br	rb/0/56/21/13	00562113.jpg	8	\N	\N	f	Brasil	Minas Gerais	Ouro Preto
3520	30	2	-22.166667	-44.700000	Cyrtocymura scorpioides (Lam.) H.Rob.	G.R. Souza	1150	imagens3.jbrj.gov.br	rb/0/97/72/66	00977266.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Paraty
3521	30	2	-24.481667	-46.675833	Cyrtocymura scorpioides (Lam.) H.Rob.	Adriana Melo Magalhães	59	imagens3.jbrj.gov.br	rb/1/3/97/74	01039774.jpg	8	\N	\N	f	Brasil	São Paulo	Itanhaém
3522	30	2	-22.973056	-43.024445	Cyrtocymura scorpioides (Lam.) H.Rob.	A.A.M de Barros	4599	imagens3.jbrj.gov.br	rb/1/11/35/46	01113546.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Niterói
3523	30	2	-21.760556	-41.654444	Cyrtocymura scorpioides (Lam.) H.Rob.	L.P.Mauad	401	imagens3.jbrj.gov.br	rb/1/14/1/1	01140101.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Campos dos Goytacazes
3524	30	2	-23.044444	-43.511111	Cyrtocymura scorpioides (Lam.) H.Rob.	L.P.Mauad	444	imagens3.jbrj.gov.br	rb/1/14/1/43	01140143.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3525	30	2	-22.938889	-42.963056	Cyrtocymura scorpioides (Lam.) H.Rob.	D.N.S. Machado	763	imagens3.jbrj.gov.br	rb/1/20/65/85	01206585.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Maricá
2340	19	2	-13.013056	-41.372778	Prepusa montana Mart.	Fraga, C.N.	2691	imagens3.jbrj.gov.br	rb/0/57/35/71	00573571.jpg	8	\N	\N	f	Brasil	Bahia	Mucugê
3526	30	2	-20.273889	-43.485833	Cyrtocymura scorpioides (Lam.) H.Rob.	Alves, M.	2014	imagens3.jbrj.gov.br	rb/1/21/8/98	01210898.jpg	8	\N	\N	f	Brasil	Minas Gerais	Ouro Preto
3527	30	2	-17.929167	-41.184722	Cyrtocymura scorpioides (Lam.) H.Rob.	L.F.A. de Paula	1113	imagens3.jbrj.gov.br	rb/1/23/27/62	01232762.jpg	8	\N	\N	f	Brasil	Minas Gerais	Teófilo Otoni
3509	30	2	-19.000000	-39.000000	Cyrtocymura scorpioides (Lam.) H.Rob.	J.C. Lopes	238	imagens3.jbrj.gov.br	rb/0/75/24/7	00752407.jpg	4	-19.209390	-39.962610	f	Brasil	Espírito Santo	Linhares
2341	19	2	-11.583333	-41.200000	Prepusa montana Mart.	Harley, R.M.	22755	imagens3.jbrj.gov.br	rb/0/70/34/96	00703496.jpg	8	\N	\N	f	Brasil	Bahia	
2342	19	2	-11.635833	-41.001389	Prepusa montana Mart.	Roque, N.	1111	imagens3.jbrj.gov.br	rb/0/70/44/46	00704446.jpg	8	\N	\N	f	Brasil	Bahia	
3813	17	2	-22.516667	-47.500000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Barreto, K.D.	1145	imagens3.jbrj.gov.br	rb/0/82/98/77	00829877.jpg	17	\N	\N	f	Brasil	São Paulo	Piracicaba
3814	17	2	-11.988611	-40.768889	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	E.P. Queiroz	3414	imagens3.jbrj.gov.br	rb/0/85/39/34	00853934.jpg	17	\N	\N	f	Brasil	Bahia	Tapiramutá
3815	17	2	-3.936944	-43.124722	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	L.R. Caires	35	imagens3.jbrj.gov.br	rb/0/86/27/81	00862781.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Niterói
3972	46	2	-18.615000	-39.749722	Inga subnuda Salzm. ex Benth.	Robson D. Ribeiro 	772	imagens3.jbrj.gov.br	rb/0/48/95/16	00489516.jpg	8	\N	\N	f	Brasil	Espírito Santo	Conceição da Barra
3974	46	2	-18.782778	-40.446389	Inga subnuda ssp. luschnathiana (Benth.) T.D.Penn.	P.H. Labiak	4694	imagens3.jbrj.gov.br	rb/0/52/17/54	00521754.jpg	8	\N	\N	f	Brasil	Espírito Santo	Nova Venécia
3975	46	2	-22.530833	-42.309722	Inga subnuda Salzm. ex Benth.	A. G. Christo	489	imagens3.jbrj.gov.br	rb/0/52/60/50	00526050.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3976	46	2	-22.530833	-42.309722	Inga subnuda Salzm. ex Benth.	A. G. Christo	491	imagens3.jbrj.gov.br	rb/0/52/60/51	00526051.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3977	46	2	-22.949167	-42.071945	Inga subnuda Salzm. ex Benth.	V.S.Fonseca-Kruel	516	imagens3.jbrj.gov.br	rb/0/52/88/26	00528826.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Arraial do Cabo
3978	46	2	-22.949167	-42.071945	Inga subnuda Salzm. ex Benth.	V.S.Fonseca-Kruel	574	imagens3.jbrj.gov.br	rb/0/52/88/78	00528878.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Arraial do Cabo
3979	46	2	-20.930556	-41.299444	Inga subnuda Salzm. ex Benth.	Fontana, A.P.	3147	imagens3.jbrj.gov.br	rb/0/57/60/9	00576009.jpg	8	\N	\N	f	Brasil	Espírito Santo	Muqui
3980	46	2	-18.944167	-40.798611	Inga subnuda Salzm. ex Benth.	L.F.S. Magnago	1328	imagens3.jbrj.gov.br	rb/0/57/63/68	00576368.jpg	8	\N	\N	f	Brasil	Espírito Santo	Águia Branca
3981	46	2	-14.759445	-39.068889	Inga subnuda Salzm. ex Benth.	V.F.Mansano	648	imagens3.jbrj.gov.br	rb/0/57/80/53	00578053.jpg	8	\N	\N	f	Brasil	Bahia	Ilhéus
3817	17	2	-15.176389	-39.059167	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Neves, D.M.	1675	imagens3.jbrj.gov.br	rb/0/87/91/65	00879165.jpg	17	\N	\N	f	Brasil	Bahia	Una
3818	17	2	-15.176389	-39.059167	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Neves, D.M.	1675	imagens3.jbrj.gov.br	rb/0/88/40/57	00884057.jpg	17	\N	\N	f	Brasil	Bahia	Una
3819	17	2	-22.898056	-43.043056	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	D.N.S. Machado	449	imagens3.jbrj.gov.br	rb/0/91/45/25	00914525.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Niterói
3820	17	2	-21.327222	-41.100278	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Haroldo C. de Lima	8289	imagens3.jbrj.gov.br	rb/1/15/33/9	01153309.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	São Francisco de Itabapoana
3821	17	2	-21.373611	-41.092500	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Haroldo C. de Lima	8292	imagens3.jbrj.gov.br	rb/1/15/33/12	01153312.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	São Francisco de Itabapoana
3822	17	2	-20.716667	-42.016667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	L.S. Leoni	1710	imagens3.jbrj.gov.br	rb/1/20/4/45	01200445.jpg	17	\N	\N	f	Brasil	Minas Gerais	Carangola
3823	17	2	-20.733333	-42.466667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	L.S. Leoni	1773	imagens3.jbrj.gov.br	rb/1/20/4/76	01200476.jpg	17	\N	\N	f	Brasil	Minas Gerais	
3824	17	2	-22.922778	-42.911944	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	D.N.S. Machado	1004	imagens3.jbrj.gov.br	rb/1/31/21/13	01312113.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Maricá
3825	17	2	-22.949167	-43.008056	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	D.N.S. Machado	1073	imagens3.jbrj.gov.br	rb/1/31/44/79	01314479.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Niterói
3826	17	2	-22.962778	-43.021945	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Barros, A.A.M. de	5242	imagens3.jbrj.gov.br	rb/1/31/98/3	01319803.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Niterói
3827	17	2	-22.911944	-42.981111	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	D.N.S. Machado	970	imagens3.jbrj.gov.br	rb/1/32/11/80	01321180.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Niterói
3828	17	2	-16.919722	-39.959722	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Rocha, F. O.	59	imagens3.jbrj.gov.br	rb/1/32/37/6	01323706.jpg	17	\N	\N	f	Brasil	Bahia	Jucuruçu
3829	17	2	-13.139722	-39.780278	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Oliveira, N. E.	341	imagens3.jbrj.gov.br	rb/1/32/44/52	01324452.jpg	17	\N	\N	f	Brasil	Bahia	Nova Itarana
3830	17	2	-22.922222	-43.085000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	D.N.S. Machado	1152				17	\N	\N	f	Brasil	Rio de Janeiro	Niterói
3857	25	2	-19.348056	-40.550833	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	865	imagens3.jbrj.gov.br	rb/0/58/34/52	00583452.jpg	17	\N	\N	f	Brasil	Espírito Santo	Marilândia
3858	25	2	-19.348056	-40.550833	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	1384	imagens3.jbrj.gov.br	rb/0/58/34/53	00583453.jpg	17	\N	\N	f	Brasil	Espírito Santo	Marilândia
3859	25	2	-19.311667	-40.537500	Miconia mirabilis (Aubl.) L.O.Williams	L. F. S. Magnago	695	imagens3.jbrj.gov.br	rb/0/58/35/72	00583572.jpg	17	\N	\N	f	Brasil	Espírito Santo	Governador Lindenberg
3860	25	2	-20.028889	-40.497222	Miconia mirabilis (Aubl.) L.O.Williams	L. F. S. Magnago	1561	imagens3.jbrj.gov.br	rb/0/58/35/78	00583578.jpg	17	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
3587	34	2	-15.391389	-45.902778	Eugenia aurata O.Berg	Silva, M.A. da	3451	imagens3.jbrj.gov.br	rb/0/30/60/59	00306059.jpg	1	\N	\N	f	Brasil	Minas Gerais	Formoso
3589	34	2	-21.616667	-52.357222	Eugenia aurata O.Berg	Amaral Jr., A.	180	imagens3.jbrj.gov.br	rb/0/30/62/36	00306236.jpg	1	\N	\N	f	Brasil	Mato Grosso do Sul	Santa Rita do Pardo
3591	34	2	-14.266667	-48.583333	Eugenia aurata O.Berg	Walter, B.M.T.	1526	imagens3.jbrj.gov.br	rb/0/41/11/29	00411129.jpg	1	\N	\N	f	Brasil	Goiás	Niquelândia
3592	34	2	-13.897222	-48.141389	Eugenia aurata O.Berg	R.C. Mendonça	5606	imagens3.jbrj.gov.br	rb/0/42/56/78	00425678.jpg	1	\N	\N	f	Brasil	Goiás	Colinas do Sul
2875	28	2	-12.026667	-38.142500	Swartzia apetala Raddi	Araújo, A.P.P. de		imagens3.jbrj.gov.br	rb/0/18/35/61	00183561.jpg	2	\N	\N	f	Brasil	Bahia	
3569	33	2	-19.247222	-43.518889	Vriesea atropurpurea Silveira	D. Maurenza	3	imagens3.jbrj.gov.br	rb/0/82/65/22	00826522.jpg	17	\N	\N	f	Brasil	Minas Gerais	Morro do Pilar
3568	33	2	-19.247222	-43.527222	Vriesea atropurpurea Silveira	D. Maurenza	3				4	\N	\N	f	Brasil	Minas Gerais	Santana do Riacho
3578	35	2	-12.242500	-41.845000	Vriesea chapadensis Leme	Brazão, J.E.M.	181	imagens3.jbrj.gov.br	rb/0/26/49/95	00264995.jpg	17	\N	\N	f	Brasil	Bahia	
3579	35	2	-13.250000	-41.916667	Vriesea chapadensis Leme	M.R.V.A. Campos	51111	imagens3.jbrj.gov.br	rb/0/59/15/22	00591522.jpg	17	\N	\N	f	Brasil	Bahia	Abaíra
3861	25	2	-20.026667	-40.492222	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	3608	imagens3.jbrj.gov.br	rb/0/58/35/79	00583579.jpg	17	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2877	28	2	-11.783333	-37.916667	Swartzia apetala Raddi	ROBERTO. P. ORLANDI		imagens3.jbrj.gov.br	rb/0/18/35/85	00183585.jpg	2	\N	\N	f	Brasil	Bahia	
2526	24	2	-15.150000	-39.083333	Miconia mirabilis (Aubl.) L.O.Williams	André M. de Carvalho 	6313	imagens3.jbrj.gov.br	rb/0/48/26/88	00482688.jpg	8	\N	\N	f	Brasil	Bahia	Una
2527	24	2	-15.150000	-39.083333	Miconia mirabilis (Aubl.) L.O.Williams	André M. A. Amorim 	1964	imagens3.jbrj.gov.br	rb/0/48/30/56	00483056.jpg	8	\N	\N	f	Brasil	Bahia	Una
2528	24	2	-20.302500	-40.481945	Miconia mirabilis (Aubl.) L.O.Williams	Kollmann, L.	10662	imagens3.jbrj.gov.br	rb/0/52/20/37	00522037.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
2879	28	2	-13.533333	-41.366667	Swartzia apetala Raddi var. apetala	Harley, R.M.	22466	imagens3.jbrj.gov.br	rb/0/18/35/93	00183593.jpg	2	\N	\N	f	Brasil	Bahia	Lençóis
2530	24	2	-20.276111	-40.525000	Miconia mirabilis (Aubl.) L.O.Williams	Goldenberg, R.	1091	imagens3.jbrj.gov.br	rb/0/52/91/31	00529131.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
2531	24	2	-14.334722	-39.042778	Miconia mirabilis (Aubl.) L.O.Williams	E. J. Lucas	1025	imagens3.jbrj.gov.br	rb/0/53/9/88	00530988.jpg	8	\N	\N	f	Brasil	Bahia	Itacaré
2532	24	2	-20.302500	-40.481945	Miconia mirabilis (Aubl.) L.O.Williams	Forzza, R.C.	5060	imagens3.jbrj.gov.br	rb/0/54/9/12	00540912.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
2533	24	2	-20.319445	-40.537500	Miconia mirabilis (Aubl.) L.O.Williams	Goldenberg, R.	1261	imagens3.jbrj.gov.br	rb/0/54/94/64	00549464.jpg	8	\N	\N	f	Brasil	Espírito Santo	Viana
2880	28	2	-12.056667	-37.690833	Swartzia apetala Raddi	Jost, T.	330	imagens3.jbrj.gov.br	rb/0/18/35/96	00183596.jpg	2	\N	\N	f	Brasil	Bahia	Esplanada
2882	28	2	-12.493056	-38.313056	Swartzia apetala Raddi var. apetala	Noblick, L.R.	2255	imagens3.jbrj.gov.br	rb/0/18/36/30	00183630.jpg	2	\N	\N	f	Brasil	Bahia	Feira de Santana
2889	28	2	-9.805000	-35.870000	Swartzia apetala Raddi var. apetala	S. M. de Faria	1899	imagens3.jbrj.gov.br	rb/0/19/18/80	00191880.jpg	2	\N	\N	f	Brasil		
2537	24	2	-15.277778	-39.027222	Miconia mirabilis (Aubl.) L.O.Williams	Fraga, C.N.	2593	imagens3.jbrj.gov.br	rb/0/57/34/71	00573471.jpg	8	\N	\N	f	Brasil	Bahia	Una
2890	28	2	-22.491667	-43.296944	Swartzia apetala var. glabra (Vogel) R.S. Cowan	Lima, H.C. de	6411	imagens3.jbrj.gov.br	rb/0/27/29/24	00272924.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	
2539	24	2	-20.122778	-40.546111	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	2089	imagens3.jbrj.gov.br	rb/0/58/34/23	00583423.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2540	24	2	-20.200556	-40.490556	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	3640	imagens3.jbrj.gov.br	rb/0/58/34/27	00583427.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2541	24	2	-20.028889	-40.497222	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	1196	imagens3.jbrj.gov.br	rb/0/58/34/51	00583451.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2542	24	2	-19.348056	-40.550833	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	865	imagens3.jbrj.gov.br	rb/0/58/34/52	00583452.jpg	8	\N	\N	f	Brasil	Espírito Santo	Marilândia
2543	24	2	-19.348056	-40.550833	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	1384	imagens3.jbrj.gov.br	rb/0/58/34/53	00583453.jpg	8	\N	\N	f	Brasil	Espírito Santo	Marilândia
2544	24	2	-19.311667	-40.537500	Miconia mirabilis (Aubl.) L.O.Williams	L. F. S. Magnago	695	imagens3.jbrj.gov.br	rb/0/58/35/72	00583572.jpg	8	\N	\N	f	Brasil	Espírito Santo	Governador Lindenberg
2545	24	2	-20.028889	-40.497222	Miconia mirabilis (Aubl.) L.O.Williams	L. F. S. Magnago	1561	imagens3.jbrj.gov.br	rb/0/58/35/78	00583578.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2546	24	2	-20.026667	-40.492222	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	3608	imagens3.jbrj.gov.br	rb/0/58/35/79	00583579.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2547	24	2	-17.183333	-39.333333	Miconia mirabilis (Aubl.) L.O.Williams	F. B. Matos 	1703	imagens3.jbrj.gov.br	rb/0/58/92/68	00589268.jpg	8	\N	\N	f	Brasil	Bahia	Prado
2548	24	2	-15.181945	-39.063333	Miconia mirabilis (Aubl.) L.O.Williams	M.K. Caddah	789	imagens3.jbrj.gov.br	rb/0/65/50/24	00655024.jpg	8	\N	\N	f	Brasil	Bahia	Una
2549	24	2	-15.173611	-39.341667	Miconia mirabilis (Aubl.) L.O.Williams	A.B. Jardim	2	imagens3.jbrj.gov.br	rb/0/70/39/90	00703990.jpg	8	\N	\N	f	Brasil	Bahia	Arataca
2897	28	2	-16.028611	-39.916945	Swartzia apetala Raddi	Thomas, W.W.	13724	imagens3.jbrj.gov.br	rb/0/34/87/97	00348797.jpg	2	\N	\N	f	Brasil	Minas Gerais	Salto da Divisa
2551	24	2	-13.605556	-39.854444	Miconia mirabilis (Aubl.) L.O.Williams	Milliken, W	5051	imagens3.jbrj.gov.br	rb/0/78/12/44	00781244.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
2552	24	2	-13.685000	-39.825278	Miconia mirabilis (Aubl.) L.O.Williams	Zappi, D.C	3399	imagens3.jbrj.gov.br	rb/0/78/12/86	00781286.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
2553	24	2	-13.668889	-39.818333	Miconia mirabilis (Aubl.) L.O.Williams	Zappi, D.C	3386	imagens3.jbrj.gov.br	rb/0/78/12/88	00781288.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
2554	24	2	-14.407222	-40.120833	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	1898	imagens3.jbrj.gov.br	rb/0/78/67/2	00786702.jpg	8	\N	\N	f	Brasil	Bahia	Boa Nova
2555	24	2	-13.583333	-39.716667	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	2322	imagens3.jbrj.gov.br	rb/0/78/88/59	00788859.jpg	8	\N	\N	f	Brasil	Bahia	Wenceslau Guimarães
2556	24	2	-19.351389	-40.548056	Miconia mirabilis (Aubl.) L.O.Williams	Forzza, R.C.	7567	imagens3.jbrj.gov.br	rb/0/81/0/79	00810079.jpg	8	\N	\N	f	Brasil	Espírito Santo	Marilândia
2557	24	2	-13.579445	-39.705833	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	2676	imagens3.jbrj.gov.br	rb/0/82/9/41	00820941.jpg	8	\N	\N	f	Brasil	Bahia	Wenceslau Guimarães
2558	24	2	-13.879445	-39.688333	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	3334	imagens3.jbrj.gov.br	rb/0/87/97/26	00879726.jpg	8	\N	\N	f	Brasil	Bahia	Apuarema
2902	28	2	-21.345556	-40.980000	Swartzia apetala Raddi	Lima, H.C. de	6862	imagens3.jbrj.gov.br	rb/0/51/76/14	00517614.jpg	2	\N	\N	f	Brasil	Espírito Santo	Presidente Kennedy
2907	28	2	-20.093889	-40.432222	Swartzia apetala Raddi	V. Demuner, 	3228	imagens3.jbrj.gov.br	rb/0/52/28/33	00522833.jpg	2	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2561	24	2	-22.956389	-43.285278	Miconia mirabilis (Aubl.) L.O.Williams	C. Baez	512	imagens3.jbrj.gov.br	rb/1/11/92/68	01119268.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2908	28	2	-19.379167	-40.610278	Swartzia apetala Raddi var. apetala	V. Demuner, 	2684	imagens3.jbrj.gov.br	rb/0/52/28/35	00522835.jpg	2	\N	\N	f	Brasil	Espírito Santo	Governador Lindenberg
2562	24	2	-22.966111	-43.256667	Miconia mirabilis (Aubl.) L.O.Williams	C.Baez	606	imagens3.jbrj.gov.br	rb/1/17/41/11	01174111.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2563	24	2	-22.959167	-43.277778	Miconia mirabilis (Aubl.) L.O.Williams	T. Lorenzetti	6	imagens3.jbrj.gov.br	rb/1/21/46/37	01214637.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2564	24	2	-22.958889	-43.277500	Miconia mirabilis (Aubl.) L.O.Williams	T. Lorenzetti	42				8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3760	17	2	-22.731667	-41.966667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Dantas, H.G.	3-54	imagens3.jbrj.gov.br	rb/0/16/67/72	00166772.JPG	10	\N	\N	f	Brasil	Rio de Janeiro	Armação dos Búzios
3536	31	2	-11.642778	-40.929167	Prepusa montana Mart.	ROBERTO ORLANDI	268	imagens3.jbrj.gov.br	rb/0/11/35/22	00113522.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
3537	31	2	-11.623333	-41.000833	Prepusa montana Mart.	Oliveira, A.	64	imagens3.jbrj.gov.br	rb/0/11/35/42	00113542.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
3538	31	2	-13.000000	-41.400000	Prepusa montana Mart.	Mori, S.A.		imagens3.jbrj.gov.br	rb/0/11/35/92	00113592.jpg	8	\N	\N	f	Brasil	Bahia	Mucugê
3539	31	2	-11.450000	-41.116667	Prepusa montana Mart.	Coradin, L.	6230	imagens3.jbrj.gov.br	rb/0/11/36/7	00113607.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
3540	31	2	-21.710278	-43.817778	Prepusa montana Mart.	Fontana, A.P.	2271	imagens3.jbrj.gov.br	rb/0/56/21/13	00562113.jpg	8	\N	\N	f	Brasil	Minas Gerais	Ouro Preto
3541	31	2	-13.013056	-41.372778	Prepusa montana Mart.	Fraga, C.N.	2691	imagens3.jbrj.gov.br	rb/0/57/35/71	00573571.jpg	8	\N	\N	f	Brasil	Bahia	Mucugê
3542	31	2	-11.583333	-41.200000	Prepusa montana Mart.	Harley, R.M.	22755	imagens3.jbrj.gov.br	rb/0/70/34/96	00703496.jpg	8	\N	\N	f	Brasil	Bahia	
3543	31	2	-11.635833	-41.001389	Prepusa montana Mart.	Roque, N.	1111	imagens3.jbrj.gov.br	rb/0/70/44/46	00704446.jpg	8	\N	\N	f	Brasil	Bahia	
3761	17	2	-22.731667	-41.966667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Dantas, H.G.	3-53	imagens3.jbrj.gov.br	rb/0/16/67/89	00166789.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Armação dos Búzios
3762	17	2	-22.901667	-41.966667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Dantas, H.G.	3-31	imagens3.jbrj.gov.br	rb/0/16/68/10	00166810.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Armação dos Búzios
3763	17	2	-22.731667	-41.966667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Dantas, H.G.	3-21	imagens3.jbrj.gov.br	rb/0/16/68/26	00166826.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Armação dos Búzios
3982	46	2	-22.916667	-42.200000	Inga subnuda ssp. luschnathiana (Benth.) T.D.Penn.	D.A.Carvalho	98	imagens3.jbrj.gov.br	rb/0/58/30/22	00583022.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Arraial do Cabo
3816	17	2	-22.975556	-43.013611	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	G.C.L. Paes	217	imagens3.jbrj.gov.br	rb/0/87/77/76	00877776.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Niterói
3983	46	2	-19.411667	-43.423333	Inga subnuda Salzm. ex Benth.	M.F. Santos	154	imagens3.jbrj.gov.br	rb/0/70/38/20	00703820.jpg	8	\N	\N	f	Brasil	Minas Gerais	Itambé do Mato Dentro
3764	17	2	-22.731667	-41.966667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Dantas, H.G.	3-49	imagens3.jbrj.gov.br	rb/0/16/68/41	00166841.jpg	17	-22.736100	-41.965294	f	Brasil	Rio de Janeiro	Armação dos Búzios
3580	36	2	-26.786111	-48.918889	Vriesea tijucana E.Pereira	Martinelli, G.	14969	imagens3.jbrj.gov.br	rb/0/14/7/76	00140776.jpg	17	\N	\N	f	Brasil	Santa Catarina	Ilhota
3581	36	2	-24.314444	-48.357500	Vriesea tijucana E.Pereira	Martinelli, G.	15828	imagens3.jbrj.gov.br	rb/0/14/11/50	00141150.jpg	17	\N	\N	f	Brasil	São Paulo	Ribeirão Grande
3582	36	2	-24.637778	-47.766667	Vriesea tijucana E.Pereira	Martinelli, G.	15856	imagens3.jbrj.gov.br	rb/0/14/11/70	00141170.jpg	17	\N	\N	f	Brasil	São Paulo	Pariquera-Açu
3583	36	2	-25.088889	-47.933056	Vriesea tijucana E.Pereira	Martinelli, G.	15876	imagens3.jbrj.gov.br	rb/0/14/11/86	00141186.jpg	17	\N	\N	f	Brasil	São Paulo	Cananéia
3584	36	2	-25.616667	-48.500000	Vriesea tijucana E.Pereira	J. B. S. Pereira 	306	imagens3.jbrj.gov.br	rb/0/56/87/69	00568769.jpg	17	\N	\N	f	Brasil	Paraná	Paranaguá
3586	36	2	-15.180556	-39.350000	Vriesea tijucana E.Pereira	Leitman, P.	291				16	\N	\N	f	Brasil	Bahia	
3585	36	2	-15.180556	-39.350000	Vriesea tijucana E.Pereira	Leitman, P.	291	imagens3.jbrj.gov.br	rb/0/64/26/99	00642699.jpg	17	\N	\N	f	Brasil	Bahia	Arataca
3862	25	2	-17.183333	-39.333333	Miconia mirabilis (Aubl.) L.O.Williams	F. B. Matos 	1703	imagens3.jbrj.gov.br	rb/0/58/92/68	00589268.jpg	17	\N	\N	f	Brasil	Bahia	Prado
3863	25	2	-15.181945	-39.063333	Miconia mirabilis (Aubl.) L.O.Williams	M.K. Caddah	789	imagens3.jbrj.gov.br	rb/0/65/50/24	00655024.jpg	17	\N	\N	f	Brasil	Bahia	Una
3864	25	2	-15.173611	-39.341667	Miconia mirabilis (Aubl.) L.O.Williams	A.B. Jardim	2	imagens3.jbrj.gov.br	rb/0/70/39/90	00703990.jpg	17	\N	\N	f	Brasil	Bahia	Arataca
3866	25	2	-13.605556	-39.854444	Miconia mirabilis (Aubl.) L.O.Williams	Milliken, W	5051	imagens3.jbrj.gov.br	rb/0/78/12/44	00781244.jpg	17	\N	\N	f	Brasil	Bahia	Jaguaquara
3876	25	2	-22.956389	-43.285278	Miconia mirabilis (Aubl.) L.O.Williams	C. Baez	512	imagens3.jbrj.gov.br	rb/1/11/92/68	01119268.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3877	25	2	-22.966111	-43.256667	Miconia mirabilis (Aubl.) L.O.Williams	C.Baez	606	imagens3.jbrj.gov.br	rb/1/17/41/11	01174111.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3878	25	2	-22.959167	-43.277778	Miconia mirabilis (Aubl.) L.O.Williams	T. Lorenzetti	6	imagens3.jbrj.gov.br	rb/1/21/46/37	01214637.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3874	25	2	-16.283333	-39.600000	Miconia mirabilis (Aubl.) L.O.Williams	R. Goldenberg et. al.;	1721	imagens3.jbrj.gov.br	rb/0/93/29/8	00932908.jpg	17	\N	\N	f	Brasil	Bahia	Itamaraju
3875	25	2	-14.416667	-89.016667	Miconia mirabilis (Aubl.) L.O.Williams	Carvalho, A.M.V. de	3537	imagens3.jbrj.gov.br	rb/0/97/59/19	00975919.jpg	17	\N	\N	f	Brasil	Bahia	Uruçuca
3595	34	2	-16.078333	-50.189444	Eugenia aurata O.Berg	R.F.Monteiro	439	imagens3.jbrj.gov.br	rb/0/70/87/11	00708711.jpg	1	\N	\N	f	Brasil	Goiás	Mossâmedes
3596	34	2	-19.351667	-39.725278	Eugenia aurata O.Berg	Menezes, L.F.T.	1638				1	\N	\N	f	Brasil	Espírito Santo	Linhares
3598	34	2	-22.288333	-47.901389	Eugenia aurata O.Berg	G.D. Colletta	2036	imagens3.jbrj.gov.br	rb/1/4/96/14	01049614.jpg	1	\N	\N	f	Brasil	São Paulo	Itirapina
3984	46	2	-19.414444	-43.431389	Inga subnuda Salzm. ex Benth.	M.F. Santos	282	imagens3.jbrj.gov.br	rb/0/70/38/28	00703828.jpg	8	\N	\N	f	Brasil	Minas Gerais	Itambé do Mato Dentro
2524	24	2	-16.383333	-39.133333	Miconia mirabilis (Aubl.) L.O.Williams	Bautista, H.P.	1144	imagens3.jbrj.gov.br	rb/0/23/99/59	00239959.jpg	2	\N	\N	f	Brasil	Bahia	
3771	17	2	-11.600000	-42.600000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Miranda, C.A.	291	imagens3.jbrj.gov.br	rb/0/16/69/66	00166966.jpg	17	\N	\N	f	Brasil	Bahia	
2529	24	2	-12.869445	-38.471667	Miconia mirabilis (Aubl.) L.O.Williams	M.L.C. Neves	486	imagens3.jbrj.gov.br	rb/0/52/30/72	00523072.jpg	2	\N	\N	f	Brasil	Bahia	Santa Teresinha
2534	24	2	-22.433333	-42.833333	Miconia mirabilis var. sanguinea	Martinelli, G.	10243	imagens3.jbrj.gov.br	rb/0/55/91/16	00559116.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
2535	24	2	-22.433333	-42.833333	Miconia mirabilis (Aubl.) L.O.Williams	Vieira, C.M.	150	imagens3.jbrj.gov.br	rb/0/55/91/95	00559195.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
2536	24	2	-15.173611	-39.341667	Miconia mirabilis (Aubl.) L.O.Williams	J.F.A. Baumgratz	1095	imagens3.jbrj.gov.br	rb/0/55/99/56	00559956.jpg	2	\N	\N	f	Brasil	Bahia	Ilhéus
2538	24	2	-20.294444	-40.697778	Miconia mirabilis (Aubl.) L.O.Williams	Fontana, A.P.	4923	imagens3.jbrj.gov.br	rb/0/58/30/2	00583002.jpg	2	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2550	24	2	-19.351111	-40.548056	Miconia mirabilis (Aubl.) L.O.Williams	J. R. Pirani	6107	imagens3.jbrj.gov.br	rb/0/73/60/76	00736076.jpg	2	\N	\N	f	Brasil	Espírito Santo	
2559	24	2	-16.283333	-39.600000	Miconia mirabilis (Aubl.) L.O.Williams	R. Goldenberg et. al.;	1721	imagens3.jbrj.gov.br	rb/0/93/29/8	00932908.jpg	2	\N	\N	f	Brasil	Bahia	Itamaraju
2525	24	2	-22.833333	-43.333333	Miconia mirabilis (Aubl.) L.O.Williams	Landrum, L.R.	2016	imagens3.jbrj.gov.br	rb/0/24/22/96	00242296.jpg	4	-22.709874	-35.301640	f	Brasil	Rio de Janeiro	
3544	32	2	-11.642778	-40.929167	Prepusa montana Mart.	ROBERTO ORLANDI	268	imagens3.jbrj.gov.br	rb/0/11/35/22	00113522.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
3545	32	2	-11.623333	-41.000833	Prepusa montana Mart.	Oliveira, A.	64	imagens3.jbrj.gov.br	rb/0/11/35/42	00113542.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
3986	46	2	-19.958611	-40.521667	Inga subnuda Salzm. ex Benth.	Neves, D.R.M.	1230	imagens3.jbrj.gov.br	rb/0/78/17/42	00781742.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Teresa
3988	46	2	-21.794167	-41.447500	Inga subnuda ssp. luschnathiana (Benth.) T.D.Penn.	Haroldo C. de Lima	7941	imagens3.jbrj.gov.br	rb/0/98/23/67	00982367.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Campos dos Goytacazes
3987	46	2	-78.472222	-30.174445	Inga subnuda Salzm. ex Benth. ssp. subnuda	Folli, D.A.	7111	imagens3.jbrj.gov.br	rb/0/84/34/89	00843489.jpg	10	\N	\N	f	Brasil	Espírito Santo	Baixo Guandu
2910	28	2	-12.377778	-37.942500	Swartzia apetala Raddi	Jost, T.	598	imagens3.jbrj.gov.br	rb/0/53/19/39	00531939.jpg	2	\N	\N	f	Brasil	Bahia	
2911	28	2	-12.189444	-38.305833	Swartzia apetala Raddi	Filardi, F.L.R.	859	imagens3.jbrj.gov.br	rb/0/53/67/80	00536780.jpg	2	\N	\N	f	Brasil	Bahia	Araçás
2912	28	2	-10.266667	-38.783333	Swartzia apetala Raddi var. apetala	Oliveira, M.	2532	imagens3.jbrj.gov.br	rb/0/54/83/69	00548369.jpg	2	\N	\N	f	Brasil	Bahia	Jeremoabo
2916	28	2	-21.550000	-41.200000	Swartzia apetala var. glabra (Vogel) R.S.Cowan	Gaglianone, M.C.		imagens3.jbrj.gov.br	rb/0/58/62/53	00586253.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	
2923	28	2	-11.691667	-49.496389	Swartzia apetala Raddi	E.N. Matos	249	imagens3.jbrj.gov.br	rb/0/76/16/48	00761648.jpg	2	\N	\N	f	Brasil	Bahia	Jandaíra
3546	32	2	-13.000000	-41.400000	Prepusa montana Mart.	Mori, S.A.		imagens3.jbrj.gov.br	rb/0/11/35/92	00113592.jpg	8	\N	\N	f	Brasil	Bahia	Mucugê
3547	32	2	-11.450000	-41.116667	Prepusa montana Mart.	Coradin, L.	6230	imagens3.jbrj.gov.br	rb/0/11/36/7	00113607.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
3772	17	2	-13.488333	-41.023056	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Pedro Vaillant	015	imagens3.jbrj.gov.br	rb/0/16/69/76	00166976.jpg	17	\N	\N	f	Brasil	Bahia	Iramaia
3549	32	2	-13.013056	-41.372778	Prepusa montana Mart.	Fraga, C.N.	2691	imagens3.jbrj.gov.br	rb/0/57/35/71	00573571.jpg	8	\N	\N	f	Brasil	Bahia	Mucugê
3550	32	2	-11.583333	-41.200000	Prepusa montana Mart.	Harley, R.M.	22755	imagens3.jbrj.gov.br	rb/0/70/34/96	00703496.jpg	8	\N	\N	f	Brasil	Bahia	
3551	32	2	-11.635833	-41.001389	Prepusa montana Mart.	Roque, N.	1111	imagens3.jbrj.gov.br	rb/0/70/44/46	00704446.jpg	8	\N	\N	f	Brasil	Bahia	
3548	32	2	-21.710278	-43.817778	Prepusa montana Mart.	Fontana, A.P.	2271	imagens3.jbrj.gov.br	rb/0/56/21/13	00562113.jpg	16	\N	\N	f	Brasil	Minas Gerais	Ouro Preto
3607	37	2	-11.173056	-40.506667	Apuleia leiocarpa (Vogel) J.F.Macbr.	SÉRIO M. DE FARIA	1830	imagens3.jbrj.gov.br	rb/0/13/56/46	00135646.jpg	8	\N	\N	f	Brasil		
3608	37	2	-14.277222	-47.583333	Apuleia leiocarpa (Vogel) J.F.Macbr.	R.C. MENDONÇA	2998	imagens3.jbrj.gov.br	rb/0/13/56/64	00135664.jpg	8	\N	\N	f	Brasil	Goiás	
3609	37	2	-16.250000	-46.750000	Apuleia leiocarpa (Vogel) J.F.Macbr.	Pereira, B.A.S.	2940	imagens3.jbrj.gov.br	rb/0/13/56/75	00135675.jpg	8	\N	\N	f	Brasil	Minas Gerais	Unaí
3610	37	2	-14.450000	-5.419167	Apuleia leiocarpa (Vogel) J.F.Macbr.	Walter, B.M.T.	1834	imagens3.jbrj.gov.br	rb/0/13/56/88	00135688.jpg	8	\N	\N	f	Brasil	Goiás	Niquelândia
3611	37	2	-10.033333	-63.333333	Apuleia leiocarpa (Vogel) J.F.Macbr.	Zarucchi, J.L.	2657	imagens3.jbrj.gov.br	rb/0/13/56/96	00135696.jpg	8	\N	\N	f	Brasil	Rondônia	
3776	17	2	-17.604167	-40.066389	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Pedro F.M.Vaillant	085	imagens3.jbrj.gov.br	rb/0/16/71/41	00167141.jpg	17	\N	\N	f	Brasil	Bahia	
3602	34	2	-15.016667	-55.066667	Eugenia aurata O.Berg	Souza, V.C.	20369	imagens3.jbrj.gov.br	rb/1/13/23/35	01132335.jpg	1	\N	\N	f	Brasil	Mato Grosso	Chapada dos Guimarães
3603	34	2	-22.604444	-50.381111	Eugenia aurata O.Berg	D.A. Medeiros	13202	imagens3.jbrj.gov.br	rb/1/13/23/38	01132338.jpg	1	\N	\N	f	Brasil	São Paulo	Assis
3604	34	2	-14.883333	-54.850000	Eugenia aurata O.Berg	Souza, V.C.	20607	imagens3.jbrj.gov.br	rb/1/13/23/49	01132349.jpg	1	\N	\N	f	Brasil	Mato Grosso	Nova Brasilândia
3606	34	2	-14.198333	-49.291944	Eugenia aurata O.Berg	J.E.Q. Faria	4136	imagens3.jbrj.gov.br	rb/1/14/84/67	01148467.jpg	1	\N	\N	f	Brasil	Goiás	Alto Horizonte
3961	46	2	-16.383333	-39.133333	Inga subnuda Salzm. ex Benth.	Santos, F.S.	736	imagens3.jbrj.gov.br	rb/0/16/24/34	00162434.jpg	2	\N	\N	f	Brasil	Bahia	Santa Cruz de Cabrália
3552	24	2	-11.642778	-40.929167	Prepusa montana Mart.	ROBERTO ORLANDI	268	imagens3.jbrj.gov.br	rb/0/11/35/22	00113522.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
2560	24	2	-14.416667	-89.016667	Miconia mirabilis (Aubl.) L.O.Williams	Carvalho, A.M.V. de	3537	imagens3.jbrj.gov.br	rb/0/97/59/19	00975919.jpg	10	-14.416667	-39.016667	f	Brasil	Bahia	Uruçuca
3553	24	2	-11.623333	-41.000833	Prepusa montana Mart.	Oliveira, A.	64	imagens3.jbrj.gov.br	rb/0/11/35/42	00113542.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
3554	24	2	-13.000000	-41.400000	Prepusa montana Mart.	Mori, S.A.		imagens3.jbrj.gov.br	rb/0/11/35/92	00113592.jpg	8	\N	\N	f	Brasil	Bahia	Mucugê
3555	24	2	-11.450000	-41.116667	Prepusa montana Mart.	Coradin, L.	6230	imagens3.jbrj.gov.br	rb/0/11/36/7	00113607.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
3556	24	2	-21.710278	-43.817778	Prepusa montana Mart.	Fontana, A.P.	2271	imagens3.jbrj.gov.br	rb/0/56/21/13	00562113.jpg	8	\N	\N	f	Brasil	Minas Gerais	Ouro Preto
3557	24	2	-13.013056	-41.372778	Prepusa montana Mart.	Fraga, C.N.	2691	imagens3.jbrj.gov.br	rb/0/57/35/71	00573571.jpg	8	\N	\N	f	Brasil	Bahia	Mucugê
3558	24	2	-11.583333	-41.200000	Prepusa montana Mart.	Harley, R.M.	22755	imagens3.jbrj.gov.br	rb/0/70/34/96	00703496.jpg	8	\N	\N	f	Brasil	Bahia	
3559	24	2	-11.635833	-41.001389	Prepusa montana Mart.	Roque, N.	1111	imagens3.jbrj.gov.br	rb/0/70/44/46	00704446.jpg	8	\N	\N	f	Brasil	Bahia	
3612	37	2	-16.383333	-39.133333	Apuleia leiocarpa (Vogel) J.F.Macbr.	Santos, F.S.	493	imagens3.jbrj.gov.br	rb/0/13/57/85	00135785.jpg	8	\N	\N	f	Brasil	Bahia	Santa Cruz de Cabrália
3613	37	2	-12.816667	-51.766667	Apuleia leiocarpa var. molaris (Spruce ex Benth.) Koeppen	Argent, G.C.G.	6743	imagens3.jbrj.gov.br	rb/0/13/57/86	00135786.jpg	8	\N	\N	f	Brasil	Mato Grosso	
3614	37	2	-13.866667	-42.316667	Apuleia leiocarpa (Vogel) J.F.Macbr.	Queiroz, L.P. de	3650	imagens3.jbrj.gov.br	rb/0/13/57/89	00135789.jpg	8	\N	\N	f	Brasil	Bahia	Livramento do Brumado
3615	37	2	-14.116667	-42.416667	Apuleia leiocarpa (Vogel) J.F.Macbr.	Garcia, F.C.P.	66	imagens3.jbrj.gov.br	rb/0/13/58/6	00135806.jpg	8	\N	\N	f	Brasil	Bahia	Caetité
3616	37	2	-13.731667	-42.346667	Apuleia leiocarpa (Vogel) J.F.Macbr.	Sérgio Barros da Silva	97	imagens3.jbrj.gov.br	rb/0/13/58/8	00135808.jpg	8	\N	\N	f	Brasil	Bahia	
3617	37	2	-22.068889	-42.845000	Apuleia leiocarpa (Vogel) J.F.Macbr.	Pereira, F.M. de B.	26/19	imagens3.jbrj.gov.br	rb/0/13/58/21	00135821.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Sapucaia
3618	37	2	-13.333333	-42.283333	Apuleia leiocarpa (Vogel) J.F.Macbr.	Oliveira f., L.C. de	115	imagens3.jbrj.gov.br	rb/0/13/58/24	00135824.jpg	8	\N	\N	f	Brasil	Bahia	Paramirim
3619	37	2	-22.351667	-42.351944	Apuleia leiocarpa (Vogel) J.F.Macbr.	Quinet, A.	46/81	imagens3.jbrj.gov.br	rb/0/13/58/37	00135837.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
3620	37	2	-22.878889	-42.532500	Apuleia leiocarpa (Vogel) J.F.Macbr.	Lima, H.C. de	6247	imagens3.jbrj.gov.br	rb/0/13/58/40	00135840.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Saquarema
3621	37	2	-9.968611	-48.317222	Apuleia leiocarpa (Vogel) J.F.Macbr.	Arbocz, G.F.	6710	imagens3.jbrj.gov.br	rb/0/13/58/42	00135842.jpg	8	\N	\N	f	Brasil	Tocantins	Palmas
3622	37	2	-14.450000	-5.419167	Apuleia leiocarpa (Vogel) J.F.Macbr.	Walter, B.M.T.	1834	imagens3.jbrj.gov.br	rb/0/13/58/51	00135851.jpg	8	\N	\N	f	Brasil	Goiás	Niquelândia
3623	37	2	-13.750000	-42.366667	Apuleia leiocarpa (Vogel) J.F.Macbr.	S. B. da Silva	198	imagens3.jbrj.gov.br	rb/0/13/58/83	00135883.jpg	8	\N	\N	f	Brasil	Bahia	Tanque Novo
3624	37	2	-10.463333	-50.481111	Apuleia leiocarpa (Vogel) J.F.Macbr.	Silva, M.A. da	4088	imagens3.jbrj.gov.br	rb/0/13/58/92	00135892.jpg	8	\N	\N	f	Brasil	Tocantins	Lagoa da Confusão
3625	37	2	-22.350000	-43.716667	Apuleia leiocarpa (Vogel) J.F.Macbr.	Spolidoro, M.L.C.V.	136	imagens3.jbrj.gov.br	rb/0/13/59/6	00135906.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Valença
3626	37	2	-21.966667	-41.966667	Apuleia leiocarpa (Vogel) J.F.Macbr.	Lima, H.C. de	3040	imagens3.jbrj.gov.br	rb/0/13/98/51	00139851.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Santa Maria Madalena
3627	37	2	-12.750000	-60.166667	Apuleia leiocarpa (Vogel) J.F.Macbr.	Vieira, M.G.	862	imagens3.jbrj.gov.br	rb/0/18/6/54	00180654.jpg	8	\N	\N	f	Brasil	Roraima	
3628	37	2	-22.588056	-43.424445	Apuleia leiocarpa (Vogel) J.F.Macbr.	Lima, H.C. de	6405	imagens3.jbrj.gov.br	rb/0/27/23/87	00272387.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
3629	37	2	-22.588056	-43.424445	Apuleia leiocarpa (Vogel) J.F.Macbr.	Lima, H.C. de	6407	imagens3.jbrj.gov.br	rb/0/27/25/25	00272525.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
3630	37	2	-22.446667	-44.081111	Apuleia leiocarpa (Vogel) J.F.Macbr.	Lima, H.C. de	6259	imagens3.jbrj.gov.br	rb/0/31/59/82	00315982.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Volta Redonda
3631	37	2	-22.276389	-42.843889	Apuleia leiocarpa (Vogel) J.F.Macbr.	Thier, O.	252	imagens3.jbrj.gov.br	rb/0/32/28/36	00322836.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3632	37	2	-22.500000	-42.250000	Apuleia leiocarpa (Vogel) J.F.Macbr.	Lima, H.C. de	4599	imagens3.jbrj.gov.br	rb/0/44/14/48	00441448.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3633	37	2	-22.500000	-42.250000	Apuleia leiocarpa (Vogel) J.F.Macbr.	Lima, H.C. de	4434	imagens3.jbrj.gov.br	rb/0/44/15/52	00441552.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3634	37	2	-22.500000	-42.250000	Apuleia leiocarpa (Vogel) J.F.Macbr.	Correia, C.M.B.	344	imagens3.jbrj.gov.br	rb/0/44/23/18	00442318.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3635	37	2	-22.500000	-42.250000	Apuleia leiocarpa (Vogel) J.F.Macbr.	Luchiari, C.	19	imagens3.jbrj.gov.br	rb/0/44/27/57	00442757.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3636	37	2	-22.500000	-42.250000	Apuleia leiocarpa (Vogel) J.F.Macbr.	Luchiari, C.	21	imagens3.jbrj.gov.br	rb/0/44/27/59	00442759.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3637	37	2	-22.588056	-43.424445	Apuleia leiocarpa (Vogel) J.F.Macbr.	Lima, H.C. de	6405				8	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
3638	37	2	-22.588056	-43.424445	Apuleia leiocarpa (Vogel) J.F.Macbr.	Lima, H.C. de	6407				8	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
3639	37	2	-22.288889	-42.873333	Apuleia leiocarpa (Vogel) J.F.Macbr.	C.H.R.de Paula	766	imagens3.jbrj.gov.br	rb/0/47/63/73	00476373.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3640	37	2	-22.357500	-42.255000	Apuleia leiocarpa (Vogel) J.F.Macbr.	Lima, H.C. de	6840	imagens3.jbrj.gov.br	rb/0/51/69/60	00516960.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Macaé
3791	17	2	-22.100000	-43.066667	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Ricardo Matheus		imagens3.jbrj.gov.br	rb/0/49/15/36	00491536.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Duque de Caxias
3964	46	2	-15.083333	-18.016667	Inga subnuda Salzm. ex Benth. ssp. subnuda	Coradin, L.	8678	imagens3.jbrj.gov.br	rb/0/16/31/44	00163144.jpg	10	\N	\N	f	Brasil	Bahia	Ilhéus
3973	46	2	-39.229167	-17.741111	Inga subnuda Salzm. ex Benth.	Robson D. Ribeiro	842	imagens3.jbrj.gov.br	rb/0/48/97/17	00489717.jpg	10	\N	\N	f	Brasil	Bahia	Caravelas
3985	46	2	-10.634444	-4.172778	Inga subnuda Salzm. ex Benth.	L.A. Gomes	245	imagens3.jbrj.gov.br	rb/0/75/9/39	00750939.jpg	10	\N	\N	f	Brasil	Sergipe	Capela
3641	37	2	-22.530833	-42.309722	Apuleia leiocarpa (Vogel) J.F.Macbr.	A. G. Christo	644	imagens3.jbrj.gov.br	rb/0/52/59/74	00525974.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3642	37	2	-10.026667	-36.298611	Apuleia leiocarpa (Vogel) J.F.Macbr.	Haroldo C. de Lima	6963	imagens3.jbrj.gov.br	rb/0/53/16/3	00531603.jpg	8	\N	\N	f	Brasil	Alagoas	
3643	37	2	-6.493611	-34.978611	Apuleia leiocarpa (Vogel) J.F.Macbr.	Gadelha Neto, P. C.	2027	imagens3.jbrj.gov.br	rb/0/54/89/56	00548956.jpg	8	\N	\N	f	Brasil	Paraíba	Mataraca
3644	37	2	-7.144444	-34.814167	Apuleia leiocarpa (Vogel) J.F.Macbr.	Lima I.B.	922	imagens3.jbrj.gov.br	rb/0/55/53/87	00555387.jpg	8	\N	\N	f	Brasil	Paraíba	João Pessoa
3645	37	2	-18.984167	-40.662222	Apuleia leiocarpa (Vogel) J.F.Macbr.	Demuner, V.	3533	imagens3.jbrj.gov.br	rb/0/57/46/31	00574631.jpg	8	\N	\N	f	Brasil	Espírito Santo	Águia Branca
3646	37	2	-19.123889	-43.725278	Apuleia leiocarpa (Vogel) J.F.Macbr.	Kamino L.H.Y	1017	imagens3.jbrj.gov.br	rb/0/57/93/84	00579384.jpg	8	\N	\N	f	Brasil	Minas Gerais	Conceição do Mato Dentro
3647	37	2	-9.442222	-68.594722	Apuleia leiocarpa var. molaris (Spruce ex Benth.) Koeppen	D.C. Daly	13178	imagens3.jbrj.gov.br	rb/0/58/75/32	00587532.jpg	8	\N	\N	f	Brasil	Acre	Sena Madureira
3648	37	2	-9.442222	-68.594722	Apuleia leiocarpa var. molaris (Spruce ex Benth.) Koeppen	D.C. Daly	13194	imagens3.jbrj.gov.br	rb/0/58/75/39	00587539.jpg	8	\N	\N	f	Brasil	Acre	Sena Madureira
3649	37	2	-9.442222	-68.594722	Apuleia leiocarpa var. molaris (Spruce ex Benth.) Koeppen	D.C. Daly	13200	imagens3.jbrj.gov.br	rb/0/58/75/83	00587583.jpg	8	\N	\N	f	Brasil	Acre	Sena Madureira
3650	37	2	-22.644445	-42.191667	Apuleia leiocarpa (Vogel) J.F.Macbr.	Nathália da Silva Braga	285	imagens3.jbrj.gov.br	rb/0/60/38/65	00603865.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	
3651	37	2	-15.505556	-48.159444	Apuleia leiocarpa (Vogel) J.F.Macbr.	Pereira, BAS	3587	imagens3.jbrj.gov.br	rb/0/60/43/28	00604328.jpg	8	\N	\N	f	Brasil	Distrito Federal	
3652	37	2	-7.180556	-34.799444	Apuleia leiocarpa (Vogel) J.F.Macbr.	Cardoso, D.	2375	imagens3.jbrj.gov.br	rb/0/60/59/78	00605978.jpg	8	\N	\N	f	Brasil	Paraíba	
3653	37	2	-22.440556	-42.762500	Apuleia leiocarpa (Vogel) J.F.Macbr.	O. Thier	OT 1275	imagens3.jbrj.gov.br	rb/0/66/8/0	00660800.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Cachoeiras de Macacu
3654	37	2	-6.593056	-35.063056	Apuleia leiocarpa (Vogel) J.F.Macbr.	Haroldo C. de Lima	7485	imagens3.jbrj.gov.br	rb/0/70/87/85	00708785.jpg	8	\N	\N	f	Brasil	Paraíba	Mataraca
3655	37	2	-7.133611	-34.863333	Apuleia leiocarpa (Vogel) J.F.Macbr.	Haroldo C. de Lima	7495	imagens3.jbrj.gov.br	rb/0/70/88/34	00708834.jpg	8	\N	\N	f	Brasil	Paraíba	João Pessoa
3656	37	2	-22.550000	-43.266667	Apuleia leiocarpa (Vogel) J.F.Macbr.	Silva Neto, S.J.	1489	imagens3.jbrj.gov.br	rb/0/70/97/66	00709766.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Duque de Caxias
3657	37	2	-4.443056	-46.895556	Apuleia leiocarpa (Vogel) J.F.Macbr.	Tyski, L	223	imagens3.jbrj.gov.br	rb/0/71/21/53	00712153.jpg	8	\N	\N	f	Brasil	Maranhão	Bom Jesus das Selvas
3658	37	2	-22.966667	-43.227778	Apuleia leiocarpa var. molaris (Spruce ex Benth.) Koeppen	Haroldo Cavalcante de Lima	7609	imagens3.jbrj.gov.br	rb/0/73/11/84	00731184.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	
3659	37	2	-6.626389	-35.265556	Apuleia leiocarpa (Vogel) J.F.Macbr.	P.C. Gadelha Neto	3217	imagens3.jbrj.gov.br	rb/0/73/85/22	00738522.jpg	8	\N	\N	f	Brasil	Paraíba	Jacaraú
3660	37	2	-10.570278	-49.575278	Apuleia leiocarpa (Vogel) J.F.Macbr.	F.C.A. Oliveira	1678	imagens3.jbrj.gov.br	rb/0/75/5/41	00750541.jpg	8	\N	\N	f	Brasil	Tocantins	Cristalândia
3661	37	2	-10.822222	-68.390556	Apuleia leiocarpa (Vogel) J.F.Macbr.	D.S. Costa	13	imagens3.jbrj.gov.br	rb/0/78/41/33	00784133.jpg	8	\N	\N	f	Brasil	Acre	Xapuri
3662	37	2	-15.683333	-52.333333	Apuleia leiocarpa (Vogel) J.F.Macbr.	Bernacci, L.C.	2628	imagens3.jbrj.gov.br	rb/0/78/41/50	00784150.jpg	8	\N	\N	f	Brasil	Mato Grosso	Barra do Garças
3663	37	2	-10.903333	-68.375000	Apuleia leiocarpa (Vogel) J.F.Macbr.	D.S. Costa	26	imagens3.jbrj.gov.br	rb/0/78/41/58	00784158.jpg	8	\N	\N	f	Brasil	Acre	Xapuri
3664	37	2	-22.771667	-43.000278	Apuleia leiocarpa (Vogel) J.F.Macbr.	Finotti	352				8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3665	37	2	-22.771667	-43.000278	Apuleia leiocarpa (Vogel) J.F.Macbr.	Finotti	352				8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3666	37	2	-9.276389	-64.645000	Apuleia leiocarpa (Vogel) J.F.Macbr.	G. Pereira-Silva	15220	imagens3.jbrj.gov.br	rb/0/82/40/94	00824094.jpg	8	\N	\N	f	Brasil	Rondônia	Jaci Paraná
3667	37	2	-9.469167	-68.333611	Apuleia leiocarpa (Vogel) J.F.Macbr.	S.M.M. Figueiredo	4	imagens3.jbrj.gov.br	rb/0/82/50/24	00825024.jpg	8	\N	\N	f	Brasil	Acre	Bujari
3668	37	2	-9.464444	-68.326389	Apuleia leiocarpa (Vogel) J.F.Macbr.	S.M.M. Figueiredo	13	imagens3.jbrj.gov.br	rb/0/82/50/26	00825026.jpg	8	\N	\N	f	Brasil	Acre	Bujari
3669	37	2	-21.428056	-41.136111	Apuleia leiocarpa (Vogel) J.F.Macbr.	Neves, D.M.	1820	imagens3.jbrj.gov.br	rb/0/84/60/42	00846042.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	São Francisco de Itabapoana
3670	37	2	-9.268611	-64.638889	Apuleia leiocarpa (Vogel) J.F.Macbr.	G. Pereira-Silva	14128	imagens3.jbrj.gov.br	rb/0/85/46/17	00854617.jpg	8	\N	\N	f	Brasil	Rondônia	Porto Velho
2595	26	2	-12.966945	-38.370278	Mesophyllum erubescens (Folie) Me.Lemoine	Bahia, R.G.		imagens3.jbrj.gov.br	rb/0/57/97/75	00579775.jpg	8	\N	\N	f	Brasil	Bahia	Salvador
2596	26	2	-3.841111	-32.392500	Mesophyllum erubescens (Folie) Me.Lemoine	RG Bahia		imagens3.jbrj.gov.br	rb/0/62/59/37	00625937-1.jpg	8	\N	\N	f	Brasil	Pernambuco	
2597	26	2	-3.815833	-32.393333	Mesophyllum erubescens (Folie) Me.Lemoine	RG Bahia & GM Amado Filho		imagens3.jbrj.gov.br	rb/0/69/47/74	00694774-1.jpg	8	\N	\N	f	Brasil	Pernambuco	
2598	26	2	-20.525278	-29.310278	Mesophyllum erubescens (Folie) Me.Lemoine	GM Amado Filho					8	\N	\N	f	Brasil	Espírito Santo	
2599	26	2	-17.962500	-38.695278	Mesophyllum erubescens (Folie) Me.Lemoine	GM Amado Filho		imagens3.jbrj.gov.br	rb/0/93/91/55	00939155.jpg	8	\N	\N	f	Brasil	Bahia	
2600	26	2	-17.962500	-38.695278	Mesophyllum erubescens (Folie) Me.Lemoine	RG Bahia		imagens3.jbrj.gov.br	rb/0/94/0/29	00940029.jpg	8	\N	\N	f	Brasil	Bahia	
2601	26	2	-18.083333	-38.600000	Mesophyllum erubescens (Folie) Me.Lemoine	GM Amado Filho		imagens3.jbrj.gov.br	rb/0/95/20/28	00952028.jpg	8	\N	\N	f	Brasil	Bahia	
3671	37	2	-7.115000	-34.863056	Apuleia leiocarpa (Vogel) J.F.Macbr.	R. Lima	2409	imagens3.jbrj.gov.br	rb/0/86/77/37	00867737.jpg	8	\N	\N	f	Brasil	Paraíba	João Pessoa
3672	37	2	-7.115000	-34.863056	Apuleia leiocarpa (Vogel) J.F.Macbr.	R. Lima	2404	imagens3.jbrj.gov.br	rb/0/86/77/53	00867753.jpg	8	\N	\N	f	Brasil	Paraíba	João Pessoa
3673	37	2	-15.178889	-39.063333	Apuleia leiocarpa (Vogel) J.F.Macbr.	Neves, D.M.	1676				8	\N	\N	f	Brasil	Bahia	Una
3674	37	2	-21.913611	-42.395556	Apuleia leiocarpa (Vogel) J.F.Macbr.	Brotto, M.L.	1652	imagens3.jbrj.gov.br	rb/0/90/71/18	00907118.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Cantagalo
3675	37	2	-15.516667	-48.166667	Apuleia leiocarpa (Vogel) J.F.Macbr.	V.V. Macenas	209	imagens3.jbrj.gov.br	rb/0/93/44/97	00934497.jpg	8	\N	\N	f	Brasil	Distrito Federal	Brasília
3676	37	2	-3.310000	-51.802222	Apuleia leiocarpa (Vogel) J.F.Macbr.	FAVERI, C.	PSACF_EX04577	imagens3.jbrj.gov.br	rb/0/93/68/46	00936846.jpg	8	\N	\N	f	Brasil	Pará	Vitória do Xingu
3677	37	2	-6.050000	-36.516667	Apuleia leiocarpa (Vogel) J.F.Macbr.	A.A. Roque et. al.;	1378	imagens3.jbrj.gov.br	rb/0/94/82/52	00948252.jpg	8	\N	\N	f	Brasil	Rio Grande do Norte	Lagoa Nova
3678	37	2	-3.146944	-51.719167	Apuleia leiocarpa (Vogel) J.F.Macbr.	FAVERI, C.	PSACFHBM2015030	imagens3.jbrj.gov.br	rb/0/97/3/73	00970373.jpg	8	\N	\N	f	Brasil	Pará	Vitória do Xingu
3679	37	2	-15.576667	-58.339167	Apuleia leiocarpa (Vogel) J.F.Macbr.	Haroldo C. de Lima	8065	imagens3.jbrj.gov.br	rb/1/2/42/34	01024234.jpg	8	\N	\N	f	Brasil	Mato Grosso	Glória d´Oeste
3680	37	2	-7.834167	-34.906389	Apuleia leiocarpa (Vogel) J.F.Macbr.	E.Córdula	1091	imagens3.jbrj.gov.br	rb/1/11/11/94	01111194.jpg	8	\N	\N	f	Brasil	Pernambuco	Igarassu
3681	37	2	-6.061944	-36.526389	Apuleia leiocarpa (Vogel) J.F.Macbr.	A.A. Roque	1378	imagens3.jbrj.gov.br	rb/1/18/25/31	01182531.jpg	8	\N	\N	f	Brasil	Rio Grande do Norte	Lagoa Nova
3682	37	2	-21.393333	-41.925833	Apuleia leiocarpa (Vogel) J.F.Macbr.	Haroldo C. de Lima	8475	imagens3.jbrj.gov.br	rb/1/20/81/24	01208124.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	São José de Ubá
3683	37	2	-20.716667	-42.016667	Apuleia leiocarpa (Vogel) J.F.Macbr.	L.S. Leoni	s.n.	imagens3.jbrj.gov.br	rb/1/23/0/29	01230029.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
3811	17	2	-20.400000	-41.533333	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	T.B. Flores	1573	imagens3.jbrj.gov.br	rb/0/78/47/81	00784781.jpg	17	\N	\N	f	Brasil	Espírito Santo	Ibitirama
3812	17	2	-16.500000	-39.250000	Pseudopiptadenia contorta (DC.) G.P.Lewis & M.P.Lima	Daneu, L	656	imagens3.jbrj.gov.br	rb/0/79/72/12	00797212.jpg	17	\N	\N	f	Brasil	Bahia	Porto Seguro
3879	25	2	-22.958889	-43.277500	Miconia mirabilis (Aubl.) L.O.Williams	T. Lorenzetti	42	imagens3.jbrj.gov.br	rb/1/21/79/13	01217913.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3839	25	2	-16.383333	-39.133333	Miconia mirabilis (Aubl.) L.O.Williams	Bautista, H.P.	1144	imagens3.jbrj.gov.br	rb/0/23/99/59	00239959.jpg	17	\N	\N	f	Brasil	Bahia	
3840	25	2	-22.833333	-43.333333	Miconia mirabilis (Aubl.) L.O.Williams	Landrum, L.R.	2016	imagens3.jbrj.gov.br	rb/0/24/22/96	00242296.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	
3844	25	2	-12.869445	-38.471667	Miconia mirabilis (Aubl.) L.O.Williams	M.L.C. Neves	486	imagens3.jbrj.gov.br	rb/0/52/30/72	00523072.jpg	17	\N	\N	f	Brasil	Bahia	Santa Teresinha
3849	25	2	-22.433333	-42.833333	Miconia mirabilis var. sanguinea	Martinelli, G.	10243	imagens3.jbrj.gov.br	rb/0/55/91/16	00559116.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
3850	25	2	-22.433333	-42.833333	Miconia mirabilis (Aubl.) L.O.Williams	Vieira, C.M.	150	imagens3.jbrj.gov.br	rb/0/55/91/95	00559195.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
3851	25	2	-15.173611	-39.341667	Miconia mirabilis (Aubl.) L.O.Williams	J.F.A. Baumgratz	1095	imagens3.jbrj.gov.br	rb/0/55/99/56	00559956.jpg	17	\N	\N	f	Brasil	Bahia	Ilhéus
3853	25	2	-20.294444	-40.697778	Miconia mirabilis (Aubl.) L.O.Williams	Fontana, A.P.	4923	imagens3.jbrj.gov.br	rb/0/58/30/2	00583002.jpg	17	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
3865	25	2	-19.351111	-40.548056	Miconia mirabilis (Aubl.) L.O.Williams	J. R. Pirani	6107	imagens3.jbrj.gov.br	rb/0/73/60/76	00736076.jpg	17	\N	\N	f	Brasil	Espírito Santo	
3903	44	2	-27.990000	-48.869722	Euterpe edulis Mart.	M. Verdi	5167	imagens3.jbrj.gov.br	rb/0/90/90/21	00909021.jpg	8	\N	\N	f	Brasil	Santa Catarina	São Bonifácio
3905	44	2	-22.574722	-43.418333	Euterpe edulis Mart.	Haroldo C. de Lima	8265	imagens3.jbrj.gov.br	rb/1/14/24/74	01142474.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
3906	44	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 A	imagens3.jbrj.gov.br	rb/1/23/11/53	01231153.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
3907	44	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 B	imagens3.jbrj.gov.br	rb/1/23/11/59	01231159.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
3908	44	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 C	imagens3.jbrj.gov.br	rb/1/23/11/60	01231160.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
2347	19	2	-22.550000	-42.500000	Euterpe edulis Mart.	Guedes, R.		imagens3.jbrj.gov.br	rb/0/44/95/64	00449564.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2348	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12746	imagens3.jbrj.gov.br	rb/0/44/95/68	00449568.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2602	27	2	-22.450278	-42.839444	Machaerium aculeatum Raddi	Pereira, F.B.	19/66	imagens3.jbrj.gov.br	rb/0/17/90/47	00179047.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Cachoeiras de Macacu
2603	27	2	-22.352222	-42.382500	Machaerium aculeatum Raddi	Quinet, A.	32/73	imagens3.jbrj.gov.br	rb/0/17/90/65	00179065.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2604	27	2	-15.316667	-40.316667	Machaerium aculeatum Raddi	Lima, J.C.A. de	149	imagens3.jbrj.gov.br	rb/0/17/92/95	00179295.jpg	8	\N	\N	f	Brasil	Bahia	Itapetinga
1759	15	2	-22.916667	-42.233333	Tapirira guianensis Aubl.	Carvalho, A.S.R.	AC089	imagens3.jbrj.gov.br	rb/0/85/70/18	00857018.jpg	4	-22.920462	-42.215480	f	Brasil	Rio de Janeiro	
3684	38	2	-15.500000	-46.333333	Tapirira guianensis Aubl.	Pereira, B.A.S.	2929	imagens3.jbrj.gov.br	rb/0/38/25/79	00382579.jpg	8	\N	\N	f	Brasil	Minas Gerais	Buritis
2607	27	2	-16.462500	-39.325278	Machaerium aculeatum Raddi	Jardim, J.G.	410	imagens3.jbrj.gov.br	rb/0/18/0/92	00180092.jpg	8	\N	\N	f	Brasil	Bahia	Porto Seguro
2608	27	2	-13.946389	-40.110833	Machaerium aculeatum Raddi	Macedo, G.E.L.	1318	imagens3.jbrj.gov.br	rb/0/30/8/60	00300860.jpg	8	\N	\N	f	Brasil	Bahia	Jequié
2609	27	2	-13.948056	-40.111389	Machaerium aculeatum Raddi	Macedo, G.E.L.	1509	imagens3.jbrj.gov.br	rb/0/30/9/40	00300940.jpg	8	\N	\N	f	Brasil	Bahia	Jequié
2610	27	2	-13.944722	-40.109167	Machaerium aculeatum Raddi	Macedo, G.E.L.	1745	imagens3.jbrj.gov.br	rb/0/30/9/57	00300957.jpg	8	\N	\N	f	Brasil	Bahia	Jequié
2611	27	2	-13.948056	-40.111389	Machaerium aculeatum Raddi	Macedo, G.E.L.	1516	imagens3.jbrj.gov.br	rb/0/30/10/32	00301032.jpg	8	\N	\N	f	Brasil	Bahia	Jequié
2612	27	2	-15.150000	-39.083333	Machaerium aculeatum Raddi	Jardim, J.G.	1714	imagens3.jbrj.gov.br	rb/0/36/69/95	00366995.jpg	8	\N	\N	f	Brasil	Bahia	Una
2613	27	2	-15.150000	-39.083333	Machaerium aculeatum Raddi	S.C.de Sant´Ana	915	imagens3.jbrj.gov.br	rb/0/36/70/62	00367062.jpg	8	\N	\N	f	Brasil	Bahia	Una
2614	27	2	-19.276111	-40.037222	Machaerium aculeatum Raddi	G. Q. Freire	25	imagens3.jbrj.gov.br	rb/0/42/19/77	00421977.jpg	8	\N	\N	f	Brasil	Espírito Santo	Linhares
2615	27	2	-14.019722	-39.170278	Machaerium aculeatum Raddi	Meireles, J.E.	432	imagens3.jbrj.gov.br	rb/0/47/12/0	00471200.jpg	8	\N	\N	f	Brasil	Bahia	Camamu
2616	27	2	-19.351667	-39.725278	Machaerium aculeatum Raddi	Robson D. Ribeiro 	810	imagens3.jbrj.gov.br	rb/0/49/1/89	00490189.jpg	8	\N	\N	f	Brasil	Espírito Santo	Linhares
3685	38	2	-13.666667	-46.333333	Tapirira guianensis Aubl.	Pereira, B.A.S.	2834	imagens3.jbrj.gov.br	rb/0/38/25/93	00382593.jpg	8	\N	\N	f	Brasil	Goiás	São Domingos
3686	38	2	-16.858056	-43.040556	Tapirira guianensis Aubl.	Mello-Silva, R.	2748	imagens3.jbrj.gov.br	rb/0/38/68/18	00386818.jpg	8	\N	\N	f	Brasil	Minas Gerais	Botumirim
3687	38	2	-16.857222	-43.040556	Tapirira guianensis Aubl.	Mello-Silva, R.	2749	imagens3.jbrj.gov.br	rb/0/38/68/29	00386829.jpg	8	\N	\N	f	Brasil	Minas Gerais	Botumirim
2620	27	2	-14.302500	-39.010556	Machaerium aculeatum Raddi	Filardi, F. L. R.	807	imagens3.jbrj.gov.br	rb/0/51/92/96	00519296.jpg	8	\N	\N	f	Brasil	Bahia	Itacaré
2621	27	2	-19.729167	-40.279167	Machaerium aculeatum Raddi	Robson D. Ribeiro	955	imagens3.jbrj.gov.br	rb/0/52/25/54	00522554.jpg	8	\N	\N	f	Brasil	Espírito Santo	Aracruz
2622	27	2	-10.026667	-36.298611	Machaerium aculeatum Raddi	Filardi, F.L.R.	873	imagens3.jbrj.gov.br	rb/0/53/67/94	00536794.jpg	8	\N	\N	f	Brasil	Alagoas	Coruripe
3688	38	2	-19.333333	-46.250000	Tapirira guianensis Aubl.	Silva, M.A.	518	imagens3.jbrj.gov.br	rb/0/38/68/64	00386864.jpg	8	\N	\N	f	Brasil	Minas Gerais	Rio Paranaíba
3689	38	2	-19.333333	-46.250000	Tapirira guianensis Aubl.	Silva, M.A.	514	imagens3.jbrj.gov.br	rb/0/38/68/78	00386878.jpg	8	\N	\N	f	Brasil	Minas Gerais	Rio Paranaíba
2625	27	2	-14.868333	-40.689722	Machaerium aculeatum Raddi	Fraga, C.N.	2763	imagens3.jbrj.gov.br	rb/0/57/36/44	00573644.jpg	8	\N	\N	f	Brasil	Bahia	Vitória da Conquista
3690	38	2	-14.340556	-48.426945	Tapirira guianensis Aubl.	Azevedo, M.L.M.	1200	imagens3.jbrj.gov.br	rb/0/40/89/16	00408916.jpg	8	\N	\N	f	Brasil	Goiás	Niquelândia
3691	38	2	-9.363611	-55.030000	Tapirira guianensis Aubl.	Silva, A.S.L. da	3897	imagens3.jbrj.gov.br	rb/0/42/15/58	00421558.jpg	8	\N	\N	f	Brasil	Pará	Novo Progresso
2628	27	2	-12.233056	-41.452222	Machaerium aculeatum Raddi	L.P. de Queiroz	16002	imagens3.jbrj.gov.br	rb/1/20/92/56	01209256.jpg	8	\N	\N	f	Brasil	Bahia	Iraquara
2629	27	2	-22.944167	-43.005000	Machaerium aculeatum Raddi	D.N.S. Machado	598	imagens3.jbrj.gov.br	rb/1/31/78/97	01317897.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Niterói
2605	27	2	-12.350000	-43.200000	Machaerium aculeatum Raddi	S.B. DA SILVA	169	imagens3.jbrj.gov.br	rb/0/17/93/9	00179309.jpg	2	\N	\N	f	Brasil	Bahia	Ibotirama
2617	27	2	-20.094444	-40.598611	Machaerium aculeatum Raddi	Filardi, F. L. R.	782	imagens3.jbrj.gov.br	rb/0/49/53/76	00495376.jpg	2	\N	\N	f	Brasil	Espírito Santo	Santa Teresa
2618	27	2	-22.946667	-43.003056	Machaerium aculeatum Raddi	Barros, A.A.M. de	3100	imagens3.jbrj.gov.br	rb/0/51/91/81	00519181.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Niterói
2619	27	2	-18.497778	-40.257222	Machaerium aculeatum Raddi	Filardi, F. L. R.	801	imagens3.jbrj.gov.br	rb/0/51/92/90	00519290.jpg	2	\N	\N	f	Brasil	Espírito Santo	Pinheiros
2623	27	2	-22.433333	-42.833333	Machaerium aculeatum Raddi	Lima, H.C. de	4256	imagens3.jbrj.gov.br	rb/0/55/86/14	00558614.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
2624	27	2	-22.433333	-42.833333	Machaerium aculeatum Raddi	Lima, H.C. de	4325	imagens3.jbrj.gov.br	rb/0/55/90/62	00559062.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
2626	27	2	-16.386111	-39.176945	Machaerium aculeatum Raddi	Haroldo C. de Lima	7768	imagens3.jbrj.gov.br	rb/0/84/11/99	00841199.jpg	2	\N	\N	f	Brasil	Bahia	Porto Seguro
2627	27	2	-14.302500	-39.010556	Machaerium aculeatum Raddi	Filardi, F. L. R.	807				2	\N	\N	f	Brasil	Bahia	
2606	27	2	-23.300000	-53.016667	Machaerium aculeatum Raddi	PETRONIO PIRES FURTADO	141	imagens3.jbrj.gov.br	rb/0/17/93/10	00179310.jpg	1	\N	\N	f	Brasil	Paraná	
1708	15	2	-15.500000	-46.333333	Tapirira guianensis Aubl.	Pereira, B.A.S.	2929	imagens3.jbrj.gov.br	rb/0/38/25/79	00382579.jpg	17	\N	\N	f	Brasil	Minas Gerais	Buritis
1710	15	2	-12.016667	-41.116667	Tapirira guianensis Aubl.	A. C. Sarmento	834	imagens3.jbrj.gov.br	rb/0/57/73/86	00577386.jpg	17	\N	\N	f	Brasil	Bahia	Utinga
1713	15	2	-7.812222	-34.992500	Tapirira guianensis Aubl.	Córdula,E.	1087	imagens3.jbrj.gov.br	rb/0/99/60/1	00996001.jpg	17	\N	\N	f	Brasil	Pernambuco	Igarassu
1716	15	2	-16.857222	-43.040556	Tapirira guianensis Aubl.	Mello-Silva, R.	2749	imagens3.jbrj.gov.br	rb/0/38/68/29	00386829.jpg	17	\N	\N	f	Brasil	Minas Gerais	Botumirim
1717	15	2	-9.363611	-55.030000	Tapirira guianensis Aubl.	Silva, A.S.L. da	3897	imagens3.jbrj.gov.br	rb/0/42/15/58	00421558.jpg	17	\N	\N	f	Brasil	Pará	Novo Progresso
1718	15	2	-16.858056	-43.040556	Tapirira guianensis Aubl.	Mello-Silva, R.	2748	imagens3.jbrj.gov.br	rb/0/38/68/18	00386818.jpg	17	\N	\N	f	Brasil	Minas Gerais	Botumirim
1722	15	2	-7.100000	-34.850000	Tapirira guianensis Aubl.	L.A. Pereira et. al.;	102	imagens3.jbrj.gov.br	rb/0/89/17/26	00891726.jpg	17	\N	\N	f	Brasil	Paraíba	João Pessoa
1725	15	2	-21.207222	-41.018889	Tapirira guianensis Aubl.	Maielo-Silva	110	imagens3.jbrj.gov.br	rb/0/58/14/30	00581430.jpg	17	\N	\N	f	Brasil	Espírito Santo	Presidente Kennedy
1729	15	2	-22.505556	-42.275000	Tapirira guianensis Aubl.	A. G. Christo	323	imagens3.jbrj.gov.br	rb/0/52/61/54	00526154.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1730	15	2	-2.518611	-54.931389	Tapirira guianensis Aubl.	L.L. Giacomin	2690	imagens3.jbrj.gov.br	rb/1/31/43/11	01314311.jpg	17	\N	\N	f	Brasil	Pará	Santarém
1733	15	2	-7.100000	-34.966667	Tapirira guianensis Aubl.	L.A. Pereira	305	imagens3.jbrj.gov.br	rb/0/89/17/43	00891743.jpg	17	\N	\N	f	Brasil	Paraíba	Santa Rita
1735	15	2	-21.798056	-41.046389	Tapirira guianensis Aubl.	A.D.Mattedi	260	imagens3.jbrj.gov.br	rb/0/93/52/17	00935217.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	São João da Barra
1736	15	2	-22.583333	-50.366667	Tapirira guianensis Aubl.	A.P. Savassi-Coutinho	655	imagens3.jbrj.gov.br	rb/0/99/99/98	00999998.jpg	17	\N	\N	f	Brasil	São Paulo	Assis
1737	15	2	-22.943611	-42.042500	Tapirira guianensis Aubl.	V.S.Fonseca-Kruel	551	imagens3.jbrj.gov.br	rb/0/52/88/55	00528855.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Arraial do Cabo
1740	15	2	-8.549167	-46.617222	Tapirira guianensis Aubl.	R.C.Oliveira	1184	imagens3.jbrj.gov.br	rb/0/58/59/56	00585956.jpg	17	\N	\N	f	Brasil	Maranhão	Balsas
1742	15	2	-19.276111	-40.037222	Tapirira guianensis Aubl.	M. A. Pinho-Ferreira 	520	imagens3.jbrj.gov.br	rb/0/46/57/3	00465703.jpg	17	\N	\N	f	Brasil	Espírito Santo	Linhares
1743	15	2	-21.207222	-41.018889	Tapirira guianensis Aubl.	Maielo-Silva	72	imagens3.jbrj.gov.br	rb/0/58/13/96	00581396.jpg	17	\N	\N	f	Brasil	Espírito Santo	Presidente Kennedy
1747	15	2	-22.532222	-42.346111	Tapirira guianensis Aubl.	A. G. Christo	415	imagens3.jbrj.gov.br	rb/0/52/61/55	00526155.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1748	15	2	-20.463333	-43.590000	Tapirira guianensis Aubl.	Souza, V.C.	8071	imagens3.jbrj.gov.br	rb/1/5/5/47	01050547.jpg	17	\N	\N	f	Brasil	Minas Gerais	Ouro Preto
1750	15	2	-22.525833	-42.347778	Tapirira guianensis Aubl.	Pessoa, S.V.A.	1125	imagens3.jbrj.gov.br	rb/0/59/3/65	00590365.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1753	15	2	-22.525833	-42.347778	Tapirira guianensis Aubl.	Pessoa, S.V.A.	1120	imagens3.jbrj.gov.br	rb/0/59/3/83	00590383.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
1754	15	2	-14.340556	-48.426945	Tapirira guianensis Aubl.	Azevedo, M.L.M.	1200	imagens3.jbrj.gov.br	rb/0/40/89/16	00408916.jpg	17	\N	\N	f	Brasil	Goiás	Niquelândia
1755	15	2	-5.929167	-35.188889	Tapirira guianensis Aubl.	P.C. Gadelha Neto	3436	imagens3.jbrj.gov.br	rb/1/0/28/54	01002854.jpg	17	\N	\N	f	Brasil	Rio Grande do Norte	Parnamirim
1758	15	2	-13.666667	-46.333333	Tapirira guianensis Aubl.	Pereira, B.A.S.	2834	imagens3.jbrj.gov.br	rb/0/38/25/93	00382593.jpg	17	\N	\N	f	Brasil	Goiás	São Domingos
1761	15	2	-14.164722	-47.632778	Tapirira guianensis Aubl.	Soares-Silva,L.H.	1253	imagens3.jbrj.gov.br	rb/0/57/77/54	00577754.jpg	17	\N	\N	f	Brasil	Goiás	Alto Paraíso de Goiás
1764	15	2	-19.333333	-46.250000	Tapirira guianensis Aubl.	Silva, M.A.	514	imagens3.jbrj.gov.br	rb/0/38/68/78	00386878.jpg	17	\N	\N	f	Brasil	Minas Gerais	Rio Paranaíba
1765	15	2	-15.736944	-47.918889	Tapirira guianensis Aubl.	C.R. Martins	1860	imagens3.jbrj.gov.br	rb/1/30/32/23	01303223.jpg	17	\N	\N	f	Brasil	Distrito Federal	Brasília
1766	15	2	-20.716667	-42.016667	Tapirira guianensis Aubl.	L.S. Leoni	2172	imagens3.jbrj.gov.br	rb/1/17/76/4	01177604.jpg	17	\N	\N	f	Brasil	Minas Gerais	Carangola
1767	15	2	-19.333333	-46.250000	Tapirira guianensis Aubl.	Silva, M.A.	518	imagens3.jbrj.gov.br	rb/0/38/68/64	00386864.jpg	17	\N	\N	f	Brasil	Minas Gerais	Rio Paranaíba
1768	15	2	-20.716667	-42.016667	Tapirira guianensis Aubl.	L.S. Leoni	440	imagens3.jbrj.gov.br	rb/1/17/75/81	01177581.jpg	17	\N	\N	f	Brasil	Minas Gerais	Carangola
1769	15	2	-2.494722	-54.957778	Tapirira guianensis Aubl.	T. Andre	70	imagens3.jbrj.gov.br	rb/1/21/50/17	01215017.jpg	17	\N	\N	f	Brasil	Pará	Santarém
1770	15	2	-7.598056	-72.962500	Tapirira guianensis Aubl.	Medeiros, H	1053	imagens3.jbrj.gov.br	rb/0/78/46/47	00784647.jpg	17	\N	\N	f	Brasil	Acre	Mâncio Lima
1772	15	2	-2.203333	-48.780556	Tapirira guianensis Aubl.	E.D. Cruz	818	imagens3.jbrj.gov.br	rb/1/30/21/70	01302170.jpg	17	\N	\N	f	Brasil	Pará	Moju
1774	15	2	-22.920556	-42.424445	Tapirira guianensis Aubl.	Ana Angélica M. de Barros	3521	imagens3.jbrj.gov.br	rb/0/61/22/60	00612260.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Saquarema
1775	15	2	-22.931667	-42.601944	Tapirira guianensis Aubl.	Carlos D. M. Ferreira	202	imagens3.jbrj.gov.br	rb/1/6/70/17	01067017.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Saquarema
1776	15	2	-13.124722	-60.000556	Tapirira guianensis Aubl.	Ivanauskas, N.M.	2152	imagens3.jbrj.gov.br	rb/1/6/32/63	01063263.jpg	17	\N	\N	f	Brasil	Mato Grosso	Comodoro
1777	15	2	-2.494722	-54.957778	Tapirira guianensis Aubl.	T. André	69	imagens3.jbrj.gov.br	rb/1/31/43/13	01314313.jpg	17	\N	\N	f	Brasil	Pará	Santarém
3881	44	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	818	imagens3.jbrj.gov.br	rb/0/44/15/12	00441512.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3882	44	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	827	imagens3.jbrj.gov.br	rb/0/44/18/23	00441823.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3883	44	2	-22.500000	-42.250000	Euterpe edulis Mart.	Farias, D.S.	207	imagens3.jbrj.gov.br	rb/0/44/20/50	00442050.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3884	44	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12447	imagens3.jbrj.gov.br	rb/0/44/95/62	00449562.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
3885	44	2	-22.550000	-42.500000	Euterpe edulis Mart.	Guedes, R.		imagens3.jbrj.gov.br	rb/0/44/95/64	00449564.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
3886	44	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12746	imagens3.jbrj.gov.br	rb/0/44/95/68	00449568.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
3887	44	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12410	imagens3.jbrj.gov.br	rb/0/44/95/76	00449576.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
3888	44	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/47/65/16	00476516.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
3889	44	2	-19.135278	-39.932500	Euterpe edulis Mart.	Mansano, V.F.	07-443	imagens3.jbrj.gov.br	rb/0/49/54/73	00495473.jpg	8	\N	\N	f	Brasil	Espírito Santo	Linhares
3890	44	2	-19.950000	-40.516667	Euterpe edulis Mart.	H. Q. B. Fernandes s. n.					8	\N	\N	f	Brasil	Espírito Santo	Santa Teresa
3714	38	2	-19.276111	-40.037222	Tapirira guianensis Aubl.	M. A. Pinho-Ferreira 	520	imagens3.jbrj.gov.br	rb/0/46/57/3	00465703.jpg	8	\N	\N	f	Brasil	Espírito Santo	Linhares
3891	44	2	-20.267778	-40.525000	Euterpe edulis Mart.	Forzza, R.C.	5300	imagens3.jbrj.gov.br	rb/0/54/30/30	00543030.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
3892	44	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3717	38	2	-22.500556	-42.269167	Tapirira guianensis Aubl.	A. G. Christo	323				8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3718	38	2	-22.505556	-42.275000	Tapirira guianensis Aubl.	A. G. Christo	323	imagens3.jbrj.gov.br	rb/0/52/61/54	00526154.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3719	38	2	-22.532222	-42.346111	Tapirira guianensis Aubl.	A. G. Christo	415	imagens3.jbrj.gov.br	rb/0/52/61/55	00526155.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3720	38	2	-22.943611	-42.042500	Tapirira guianensis Aubl.	V.S.Fonseca-Kruel	551	imagens3.jbrj.gov.br	rb/0/52/88/55	00528855.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Arraial do Cabo
3893	44	2	-21.700000	-43.891667	Euterpe edulis Mart.	Forzza, R.C.	3616	imagens3.jbrj.gov.br	rb/0/55/13/51	00551351.jpg	8	\N	\N	f	Brasil	Minas Gerais	Lima Duarte
3894	44	2	-23.062778	-44.681945	Euterpe edulis Mart.	Rodrigo Rocha	011				8	\N	\N	f	Brasil	Rio de Janeiro	Paraty
3895	44	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				8	\N	\N	f	Brasil	Rio de Janeiro	Paraty
3724	38	2	-12.016667	-41.116667	Tapirira guianensis Aubl.	A. C. Sarmento	834	imagens3.jbrj.gov.br	rb/0/57/73/86	00577386.jpg	8	\N	\N	f	Brasil	Bahia	Utinga
3725	38	2	-14.164722	-47.632778	Tapirira guianensis Aubl.	Soares-Silva,L.H.	1253	imagens3.jbrj.gov.br	rb/0/57/77/54	00577754.jpg	8	\N	\N	f	Brasil	Goiás	Alto Paraíso de Goiás
3726	38	2	-21.207222	-41.018889	Tapirira guianensis Aubl.	Maielo-Silva	72	imagens3.jbrj.gov.br	rb/0/58/13/96	00581396.jpg	8	\N	\N	f	Brasil	Espírito Santo	Presidente Kennedy
3727	38	2	-21.207222	-41.018889	Tapirira guianensis Aubl.	Maielo-Silva	110	imagens3.jbrj.gov.br	rb/0/58/14/30	00581430.jpg	8	\N	\N	f	Brasil	Espírito Santo	Presidente Kennedy
3728	38	2	-8.549167	-46.617222	Tapirira guianensis Aubl.	R.C.Oliveira	1184	imagens3.jbrj.gov.br	rb/0/58/59/56	00585956.jpg	8	\N	\N	f	Brasil	Maranhão	Balsas
3729	38	2	-22.525833	-42.347778	Tapirira guianensis Aubl.	Pessoa, S.V.A.	1125	imagens3.jbrj.gov.br	rb/0/59/3/65	00590365.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3730	38	2	-22.525833	-42.347778	Tapirira guianensis Aubl.	Pessoa, S.V.A.	1120	imagens3.jbrj.gov.br	rb/0/59/3/83	00590383.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3896	44	2	-23.067778	-44.679445	Euterpe edulis Mart.	Rodrigo Rocha	073				8	\N	\N	f	Brasil	Rio de Janeiro	Paraty
3732	38	2	-22.920556	-42.424445	Tapirira guianensis Aubl.	Ana Angélica M. de Barros	3521	imagens3.jbrj.gov.br	rb/0/61/22/60	00612260.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Saquarema
3733	38	2	-7.598056	-72.962500	Tapirira guianensis Aubl.	Medeiros, H	1053	imagens3.jbrj.gov.br	rb/0/78/46/47	00784647.jpg	8	\N	\N	f	Brasil	Acre	Mâncio Lima
3897	44	2	-22.968889	-43.248611	Euterpe edulis Mart.	Ricardo Reis, Vanderlei Rodinsky, Thaís Almeida	RCCReis 1184				8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2926	28	2	-19.209444	-39.965278	Swartzia apetala Raddi	J. Meirelles	583	imagens3.jbrj.gov.br	rb/0/76/18/37	00761837.jpg	10	\N	\N	f	Brasil	Espírito Santo	Linhares
2927	28	2	-18.366667	-39.833333	Swartzia apetala Raddi var. apetala	T. B. Flores	1277	imagens3.jbrj.gov.br	rb/0/76/81/80	00768180.jpg	10	\N	\N	f	Brasil	Espírito Santo	Conceição da Barra
2928	28	2	-18.350000	-39.683333	Swartzia apetala Raddi var. apetala	T. B. Flores	1235	imagens3.jbrj.gov.br	rb/0/76/81/90	00768190.jpg	10	\N	\N	f	Brasil	Espírito Santo	Conceição da Barra
2936	28	2	-18.495556	-39.777778	Swartzia apetala Raddi	S. Souza Silva	21				10	\N	\N	f	Brasil	Espírito Santo	Conceição da Barra
3900	44	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				8	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
2349	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12410	imagens3.jbrj.gov.br	rb/0/44/95/76	00449576.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2322	19	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/99/12/10	00991210.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
2351	19	2	-19.135278	-39.932500	Euterpe edulis Mart.	Mansano, V.F.	07-443	imagens3.jbrj.gov.br	rb/0/49/54/73	00495473.jpg	18	\N	\N	f	Brasil	Espírito Santo	Linhares
2352	19	2	-19.950000	-40.516667	Euterpe edulis Mart.	H. Q. B. Fernandes s. n.					18	\N	\N	f	Brasil	Espírito Santo	Santa Teresa
2353	19	2	-20.267778	-40.525000	Euterpe edulis Mart.	Forzza, R.C.	5300	imagens3.jbrj.gov.br	rb/0/54/30/30	00543030.jpg	18	\N	\N	f	Brasil	Espírito Santo	Cariacica
2316	19	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2874	28	2	-16.466667	-39.166667	Swartzia apetala Raddi	Lima, J.C.A. de	142	imagens3.jbrj.gov.br	rb/0/18/35/27	00183527.jpg	10	\N	\N	f	Brasil	Bahia	Porto Seguro
3736	38	2	-7.100000	-34.850000	Tapirira guianensis Aubl.	L.A. Pereira et. al.;	102	imagens3.jbrj.gov.br	rb/0/89/17/26	00891726.jpg	8	\N	\N	f	Brasil	Paraíba	João Pessoa
2876	28	2	-22.128333	-43.281945	Swartzia apetala Raddi var. apetala	Marquete, R.	3519	imagens3.jbrj.gov.br	rb/0/18/35/66	00183566.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Paraíba do Sul
3737	38	2	-7.100000	-34.850000	Tapirira guianensis Aubl.	L.A. Pereira	138	imagens3.jbrj.gov.br	rb/0/89/17/38	00891738.jpg	8	\N	\N	f	Brasil	Paraíba	João Pessoa
2878	28	2	-12.062500	-37.694167	Swartzia apetala Raddi	Ferreira, M.C.	817	imagens3.jbrj.gov.br	rb/0/18/35/89	00183589.jpg	10	\N	\N	f	Brasil	Bahia	Conde
2355	19	2	-21.700000	-43.891667	Euterpe edulis Mart.	Forzza, R.C.	3616	imagens3.jbrj.gov.br	rb/0/55/13/51	00551351.jpg	18	\N	\N	f	Brasil	Minas Gerais	Lima Duarte
3738	38	2	-7.100000	-34.966667	Tapirira guianensis Aubl.	L.A. Pereira	305	imagens3.jbrj.gov.br	rb/0/89/17/43	00891743.jpg	8	\N	\N	f	Brasil	Paraíba	Santa Rita
3739	38	2	-21.798056	-41.046389	Tapirira guianensis Aubl.	A.D.Mattedi	260	imagens3.jbrj.gov.br	rb/0/93/52/17	00935217.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	São João da Barra
3740	38	2	-7.812222	-34.992500	Tapirira guianensis Aubl.	Córdula,E.	1087	imagens3.jbrj.gov.br	rb/0/99/60/1	00996001.jpg	8	\N	\N	f	Brasil	Pernambuco	Igarassu
2356	19	2	-23.062778	-44.681945	Euterpe edulis Mart.	Rodrigo Rocha	011				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
3741	38	2	-22.583333	-50.366667	Tapirira guianensis Aubl.	A.P. Savassi-Coutinho	655	imagens3.jbrj.gov.br	rb/0/99/99/98	00999998.jpg	8	\N	\N	f	Brasil	São Paulo	Assis
2883	28	2	-22.852778	-42.372500	Swartzia apetala Raddi var. apetala	Lima, H.C. de	6185	imagens3.jbrj.gov.br	rb/0/18/36/67	00183667.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Araruama
2884	28	2	-12.921945	-38.333611	Swartzia apetala Raddi var. apetala	Bautista, H.P.	1568	imagens3.jbrj.gov.br	rb/0/18/36/74	00183674.jpg	10	\N	\N	f	Brasil	Bahia	Salvador
2885	28	2	-12.056667	-37.690833	Swartzia apetala Raddi var. apetala	T. JOAST	73	imagens3.jbrj.gov.br	rb/0/18/37/66	00183766.jpg	10	\N	\N	f	Brasil	Bahia	Conde
2317	19	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
3742	38	2	-5.929167	-35.188889	Tapirira guianensis Aubl.	P.C. Gadelha Neto	3436	imagens3.jbrj.gov.br	rb/1/0/28/54	01002854.jpg	8	\N	\N	f	Brasil	Rio Grande do Norte	Parnamirim
2887	28	2	-14.333333	-39.050000	Swartzia apetala Raddi var. apetala	Harley, R.M.	18435	imagens3.jbrj.gov.br	rb/0/18/38/1	00183801.jpg	10	\N	\N	f	Brasil	Bahia	Itacaré
2888	28	2	-14.316667	-39.016667	Swartzia apetala Raddi var. apetala	Harley, R.M.	18375	imagens3.jbrj.gov.br	rb/0/18/38/37	00183837.jpg	10	\N	\N	f	Brasil	Bahia	Itacaré
2891	28	2	-13.944722	-40.109444	Swartzia apetala Raddi	Macedo, G.E.L.	1401	imagens3.jbrj.gov.br	rb/0/30/25/21	00302521.jpg	10	\N	\N	f	Brasil	Bahia	Jequié
2358	19	2	-23.067778	-44.679445	Euterpe edulis Mart.	Rodrigo Rocha	073				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2892	28	2	-13.946667	-40.111111	Swartzia apetala Raddi var. apetala	Macedo, G.E.L.	1323	imagens3.jbrj.gov.br	rb/0/30/25/29	00302529.jpg	10	\N	\N	f	Brasil	Bahia	Jequié
2893	28	2	-13.780000	-40.111111	Swartzia apetala Raddi var. apetala	Macedo, G.E.L.	1910	imagens3.jbrj.gov.br	rb/0/30/25/36	00302536.jpg	10	\N	\N	f	Brasil	Bahia	Jequié
2894	28	2	-13.946667	-40.111111	Swartzia apetala Raddi var. apetala	Macedo, G.E.L.	1329	imagens3.jbrj.gov.br	rb/0/30/25/43	00302543.jpg	10	\N	\N	f	Brasil	Bahia	Jequié
2359	19	2	-22.968889	-43.248611	Euterpe edulis Mart.	Ricardo Reis, Vanderlei Rodinsky, Thaís Almeida	RCCReis 1184				18	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2895	28	2	-13.944722	-40.109444	Swartzia apetala Raddi	Macedo, G.E.L.	1367	imagens3.jbrj.gov.br	rb/0/30/25/71	00302571.jpg	10	\N	\N	f	Brasil	Bahia	Jequié
2896	28	2	-16.250000	-40.666667	Swartzia apetala Raddi var. apetala	Thomas, W.W.		imagens3.jbrj.gov.br	rb/0/34/54/15	00345415.jpg	10	\N	\N	f	Brasil	Minas Gerais	Almenara
3745	38	2	-20.463333	-43.590000	Tapirira guianensis Aubl.	Souza, V.C.	8071	imagens3.jbrj.gov.br	rb/1/5/5/47	01050547.jpg	8	\N	\N	f	Brasil	Minas Gerais	Ouro Preto
2898	28	2	-19.883333	-40.383333	Swartzia apetala var. glabra (Vogel) R.S. Cowan	Boudet Fernandes, H.Q.	2927	imagens3.jbrj.gov.br	rb/0/35/62/97	00356297.jpg	10	\N	\N	f	Brasil	Espírito Santo	Ibiraçu
2899	28	2	-13.578056	-39.707778	Swartzia apetala Raddi var. apetala	Amorim, A.M.A.	5118	imagens3.jbrj.gov.br	rb/0/41/97/49	00419749.jpg	10	\N	\N	f	Brasil	Bahia	Wenceslau Guimarães
2354	19	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2900	28	2	-22.028611	-41.456667	Swartzia apetala Raddi	Lima, H.C. de	6505	imagens3.jbrj.gov.br	rb/0/43/94/57	00439457.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Quissamã
2901	28	2	-19.974722	-40.157500	Swartzia apetala Raddi	Robson D.Ribeiro	816	imagens3.jbrj.gov.br	rb/0/47/64/19	00476419.jpg	10	\N	\N	f	Brasil	Espírito Santo	Aracruz
3746	38	2	-13.124722	-60.000556	Tapirira guianensis Aubl.	Ivanauskas, N.M.	2152	imagens3.jbrj.gov.br	rb/1/6/32/63	01063263.jpg	8	\N	\N	f	Brasil	Mato Grosso	Comodoro
2903	28	2	-22.946111	-43.003333	Swartzia apetala Raddi var. apetala	Barros, A.A.M. de	3094	imagens3.jbrj.gov.br	rb/0/51/91/73	00519173.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Niterói
2904	28	2	-20.058333	-40.506389	Swartzia apetala var. glabra (Vogel) R.S. Cowan	Demuner, V.	1877	imagens3.jbrj.gov.br	rb/0/52/28/19	00522819.jpg	10	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2905	28	2	-20.123056	-40.546389	Swartzia apetala Raddi var. apetala	L.F.S. Magnago	1020	imagens3.jbrj.gov.br	rb/0/52/28/25	00522825.jpg	10	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
2357	19	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2906	28	2	-18.970278	-40.734722	Swartzia apetala var. glabra (Vogel) R.S. Cowan	V. Demuner, 	2040	imagens3.jbrj.gov.br	rb/0/52/28/29	00522829.jpg	10	\N	\N	f	Brasil	Espírito Santo	Águia Branca
2319	19	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				18	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3747	38	2	-22.931667	-42.601944	Tapirira guianensis Aubl.	Carlos D. M. Ferreira	202	imagens3.jbrj.gov.br	rb/1/6/70/17	01067017.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Saquarema
2909	28	2	-11.898056	-37.588333	Swartzia apetala var. subcordata Cowan	Jost, T.	616	imagens3.jbrj.gov.br	rb/0/53/19/38	00531938.jpg	10	\N	\N	f	Brasil	Bahia	Conde
3749	38	2	-20.716667	-42.016667	Tapirira guianensis Aubl.	L.S. Leoni	440	imagens3.jbrj.gov.br	rb/1/17/75/81	01177581.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
2362	19	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				18	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3751	38	2	-20.716667	-42.016667	Tapirira guianensis Aubl.	L.S. Leoni	2172	imagens3.jbrj.gov.br	rb/1/17/76/4	01177604.jpg	8	\N	\N	f	Brasil	Minas Gerais	Carangola
2913	28	2	-17.738889	-39.758333	Swartzia apetala Raddi	Fraga, C.N.	2786	imagens3.jbrj.gov.br	rb/0/57/36/68	00573668.jpg	10	\N	\N	f	Brasil	Bahia	Caravelas
2914	28	2	-12.436111	-37.933333	Swartzia apetala Raddi var. apetala	V.F.Mansano	643	imagens3.jbrj.gov.br	rb/0/57/80/48	00578048.jpg	10	\N	\N	f	Brasil	Bahia	Mata de São João
2915	28	2	-10.063056	-36.337778	Swartzia apetala Raddi	M.A.B.L. Machado	174	imagens3.jbrj.gov.br	rb/0/57/93/71	00579371.jpg	10	\N	\N	f	Brasil	Alagoas	Coruripe
3752	38	2	-2.203333	-48.780556	Tapirira guianensis Aubl.	E.D. Cruz	818	imagens3.jbrj.gov.br	rb/1/30/21/70	01302170.jpg	8	\N	\N	f	Brasil	Pará	Moju
2917	28	2	-13.816667	-39.116667	Swartzia apetala var. blanchetii (Benth.) R.S.Cowan	Cardoso, D.	2270	imagens3.jbrj.gov.br	rb/0/60/83/26	00608326.jpg	10	\N	\N	f	Brasil	Bahia	Igrapiúna
2364	19	2	-19.135278	-39.932500	Euterpe edulis Mart.	Vidal de Freitas Mansano	07-443				18	\N	\N	f	Brasil	Espírito Santo	
3753	38	2	-15.736944	-47.918889	Tapirira guianensis Aubl.	C.R. Martins	1860	imagens3.jbrj.gov.br	rb/1/30/32/23	01303223.jpg	8	\N	\N	f	Brasil	Distrito Federal	Brasília
2919	28	2	-22.960833	-42.881945	Swartzia apetala Raddi var. apetala	Paula-Souza, J.	3809	imagens3.jbrj.gov.br	rb/0/70/40/47	00704047.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Maricá
2365	19	2	-27.990000	-48.869722	Euterpe edulis Mart.	M. Verdi	5167	imagens3.jbrj.gov.br	rb/0/90/90/21	00909021.jpg	18	\N	\N	f	Brasil	Santa Catarina	São Bonifácio
2920	28	2	-10.536111	-37.063333	Swartzia apetala Raddi	L. A. Gomes et. al.; 	385	imagens3.jbrj.gov.br	rb/0/73/69/29	00736929.jpg	10	\N	\N	f	Brasil	Sergipe	Capela
2921	28	2	-15.159722	-39.054722	Swartzia apetala Raddi	M. Melito	38	imagens3.jbrj.gov.br	rb/0/73/84/77	00738477.jpg	10	\N	\N	f	Brasil	Bahia	Una
2922	28	2	-14.900000	-39.083333	Swartzia apetala Raddi var. apetala	L. Daneu	324	imagens3.jbrj.gov.br	rb/0/73/84/87	00738487.jpg	10	\N	\N	f	Brasil	Bahia	Ilhéus
3754	38	2	-2.518611	-54.931389	Tapirira guianensis Aubl.	L.L. Giacomin	2690	imagens3.jbrj.gov.br	rb/1/31/43/11	01314311.jpg	8	\N	\N	f	Brasil	Pará	Santarém
2924	28	2	-11.889722	-37.597222	Swartzia apetala Raddi	E.N. Matos	860	imagens3.jbrj.gov.br	rb/0/76/16/61	00761661.jpg	10	\N	\N	f	Brasil	Bahia	Conde
2925	28	2	-15.303333	-39.003333	Swartzia apetala Raddi	E.N. de Matos	3408	imagens3.jbrj.gov.br	rb/0/76/16/94	00761694.jpg	10	\N	\N	f	Brasil	Bahia	Una
2350	19	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/47/65/16	00476516.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
2929	28	2	-18.266667	-39.800000	Swartzia apetala Raddi var. apetala	T. B. Flores	1183	imagens3.jbrj.gov.br	rb/0/76/81/99	00768199.jpg	10	\N	\N	f	Brasil	Espírito Santo	Conceição da Barra
2930	28	2	-18.266667	-39.800000	Swartzia apetala Raddi var. apetala	T. B. Flores	1258	imagens3.jbrj.gov.br	rb/0/76/82/5	00768205.jpg	10	\N	\N	f	Brasil	Espírito Santo	Conceição da Barra
2931	28	2	-22.128333	-43.281945	Swartzia apetala Raddi	R. Marquete et al	3519	imagens3.jbrj.gov.br	rb/0/77/34/64	00773464.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Paraíba do Sul
2932	28	2	-11.406667	-37.440556	Swartzia apetala Raddi	Deda, R.M 	99	imagens3.jbrj.gov.br	rb/0/77/98/45	00779845.jpg	10	\N	\N	f	Brasil	Sergipe	Santa Luzia do Itanhy
2933	28	2	-19.131111	-41.212222	Swartzia apetala Raddi	E.M.Saddi	813	imagens3.jbrj.gov.br	rb/0/78/8/7	00780807.jpg	10	\N	\N	f	Brasil	Minas Gerais	Resplendor
2367	19	2	-22.574722	-43.418333	Euterpe edulis Mart.	Haroldo C. de Lima	8265	imagens3.jbrj.gov.br	rb/1/14/24/74	01142474.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
3755	38	2	-2.494722	-54.957778	Tapirira guianensis Aubl.	T. André	69	imagens3.jbrj.gov.br	rb/1/31/43/13	01314313.jpg	8	\N	\N	f	Brasil	Pará	Santarém
2935	28	2	-14.412500	-40.129445	Swartzia apetala Raddi var. apetala	Aona, L.Y.S.	1979	imagens3.jbrj.gov.br	rb/0/81/59/90	00815990.jpg	10	\N	\N	f	Brasil	Bahia	Boa Nova
2937	28	2	-22.612500	-43.269722	Swartzia apetala var. glabra (Vogel) R.S.Cowan	Haroldo C. de Lima	7750	imagens3.jbrj.gov.br	rb/0/82/74/30	00827430.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Duque de Caxias
2368	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 A	imagens3.jbrj.gov.br	rb/1/23/11/53	01231153.jpg	18	\N	\N	f	Brasil	Minas Gerais	Carangola
2938	28	2	-22.612500	-43.269722	Swartzia apetala var. glabra (Vogel) R.S.Cowan	Haroldo C. de Lima	7752	imagens3.jbrj.gov.br	rb/0/82/74/31	00827431.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Duque de Caxias
2939	28	2	-15.871389	-38.895556	Swartzia apetala Raddi	Neves, D.M.	1771	imagens3.jbrj.gov.br	rb/0/85/19/76	00851976.jpg	10	\N	\N	f	Brasil	Bahia	Belmonte
2940	28	2	-15.871389	-38.895556	Swartzia apetala Raddi	Neves, D.M.	1770	imagens3.jbrj.gov.br	rb/0/85/19/79	00851979.jpg	10	\N	\N	f	Brasil	Bahia	Belmonte
2369	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 B	imagens3.jbrj.gov.br	rb/1/23/11/59	01231159.jpg	18	\N	\N	f	Brasil	Minas Gerais	Carangola
2941	28	2	-18.380833	-40.763056	Swartzia apetala Raddi var. apetala	Folli, D.A.	6852	imagens3.jbrj.gov.br	rb/0/85/40/7	00854007.jpg	10	\N	\N	f	Brasil	Espírito Santo	Ecoporanga
2942	28	2	-17.686944	-39.473333	Swartzia apetala Raddi	H.M.Dias	473	imagens3.jbrj.gov.br	rb/0/85/86/35	00858635.jpg	10	\N	\N	f	Brasil	Bahia	Caravelas
2370	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 C	imagens3.jbrj.gov.br	rb/1/23/11/60	01231160.jpg	18	\N	\N	f	Brasil	Minas Gerais	Carangola
2371	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	818	imagens3.jbrj.gov.br	rb/0/44/15/12	00441512.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2943	28	2	-14.411389	-40.113889	Swartzia apetala Raddi	Aona, L.Y.S.	2978	imagens3.jbrj.gov.br	rb/0/86/49/80	00864980.jpg	10	\N	\N	f	Brasil	Bahia	Boa Nova
2944	28	2	-12.455556	-41.466667	Swartzia apetala Raddi	D.M. Neves	1569	imagens3.jbrj.gov.br	rb/0/86/60/2	00866002.jpg	10	\N	\N	f	Brasil	Bahia	Palmeiras
2372	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	827	imagens3.jbrj.gov.br	rb/0/44/18/23	00441823.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2946	28	2	-13.598889	-39.719167	Swartzia apetala Raddi	Aona, L.Y.S.	3401	imagens3.jbrj.gov.br	rb/0/87/77/11	00877711.jpg	10	\N	\N	f	Brasil	Bahia	Wenceslau Guimarães
2373	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Farias, D.S.	207	imagens3.jbrj.gov.br	rb/0/44/20/50	00442050.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2947	28	2	-13.915000	-39.463333	Swartzia apetala var. blanchetii (Benth.) R.S.Cowan	Aona, L.Y.S.	3475	imagens3.jbrj.gov.br	rb/0/87/78/4	00877804.jpg	10	\N	\N	f	Brasil	Bahia	Ibirapitanga
2948	28	2	-22.593333	-43.432778	Swartzia apetala Raddi	Haroldo C. de Lima	7843	imagens3.jbrj.gov.br	rb/0/88/72/26	00887226.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
2374	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12447	imagens3.jbrj.gov.br	rb/0/44/95/62	00449562.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2949	28	2	-19.158889	-40.038611	Swartzia apetala var. glabra (Vogel) R.S.Cowan	Farias, G.L.	49	imagens3.jbrj.gov.br	rb/0/89/76/3	00897603.jpg	10	\N	\N	f	Brasil	Espírito Santo	Linhares
3757	38	2	-15.978333	-47.493056	Tapirira guianensis Aubl.	B.R. Teixeira	344	imagens3.jbrj.gov.br	rb/1/32/18/36	01321836.jpg	8	\N	\N	f	Brasil	Distrito Federal	Brasília
2375	19	2	-22.550000	-42.500000	Euterpe edulis Mart.	Guedes, R.		imagens3.jbrj.gov.br	rb/0/44/95/64	00449564.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2951	28	2	-20.855278	-40.727500	Swartzia apetala Raddi	F.L. Santos	93	imagens3.jbrj.gov.br	rb/0/90/24/75	00902475.jpg	10	\N	\N	f	Brasil	Espírito Santo	Piúma
2952	28	2	-20.849167	-40.726389	Swartzia apetala Raddi	F.L. Santos	131	imagens3.jbrj.gov.br	rb/0/90/24/80	00902480.jpg	10	\N	\N	f	Brasil	Espírito Santo	Piúma
2376	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12746	imagens3.jbrj.gov.br	rb/0/44/95/68	00449568.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2953	28	2	-19.676667	-40.150000	Swartzia apetala var. glabra (Vogel) R.S. Cowan	Haroldo Cavalcante de Lima	7914	imagens3.jbrj.gov.br	rb/0/90/47/86	00904786.jpg	10	\N	\N	f	Brasil	Espírito Santo	Aracruz
2954	28	2	-22.570278	-43.399722	Swartzia apetala Raddi	Haroldo C. de Lima	7929	imagens3.jbrj.gov.br	rb/0/91/18/48	00911848.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
2377	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12410	imagens3.jbrj.gov.br	rb/0/44/95/76	00449576.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2955	28	2	-21.794167	-41.447500	Swartzia apetala Raddi	Haroldo C. de Lima	7944	imagens3.jbrj.gov.br	rb/0/98/23/70	00982370.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Campos dos Goytacazes
2957	28	2	-22.931667	-42.602778	Swartzia apetala Raddi	Carlos D. M. Ferreira	304	imagens3.jbrj.gov.br	rb/1/16/96/16	01169616.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Saquarema
2958	28	2	-22.931667	-42.602778	Swartzia apetala Raddi	Carlos D. M. Ferreira	305	imagens3.jbrj.gov.br	rb/1/16/96/17	01169617.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Saquarema
3759	38	2	-15.757500	-47.980000	Tapirira guianensis Aubl.	B.R. Teixeira	249				8	\N	\N	f	Brasil	Distrito Federal	Brasília
2960	28	2	-20.250556	-40.278056	Swartzia apetala Raddi	C.N. Fraga	3705	imagens3.jbrj.gov.br	rb/1/20/28/75	01202875.jpg	10	\N	\N	f	Brasil	Espírito Santo	Vitória
2366	19	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/99/12/10	00991210.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
2961	28	2	-15.975833	-47.492222	Swartzia apetala Raddi	B.R. Teixeira	294	imagens3.jbrj.gov.br	rb/1/31/76/4	01317604.jpg	10	\N	\N	f	Brasil	Distrito Federal	Brasília
2881	28	2	-47.516667	-22.316667	Swartzia apetala Raddi var. apetala	Robson D. Ribeiro 	148	imagens3.jbrj.gov.br	rb/0/18/35/98	00183598.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Araruama
2379	19	2	-19.135278	-39.932500	Euterpe edulis Mart.	Mansano, V.F.	07-443	imagens3.jbrj.gov.br	rb/0/49/54/73	00495473.jpg	18	\N	\N	f	Brasil	Espírito Santo	Linhares
2886	28	2	-24.069167	-42.847222	Swartzia apetala var. glabra (Vogel) R.S. Cowan	Pereira, F.M. de B.	43/68	imagens3.jbrj.gov.br	rb/0/18/37/99	00183799.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Sapucaia
2918	28	2	86.272222	-57.305000	Swartzia apetala Raddi	Guedes, M.L.	9504	imagens3.jbrj.gov.br	rb/0/70/36/47	00703647.jpg	10	\N	\N	f	Brasil	Bahia	Lamarão
2380	19	2	-19.950000	-40.516667	Euterpe edulis Mart.	H. Q. B. Fernandes s. n.					18	\N	\N	f	Brasil	Espírito Santo	Santa Teresa
2934	28	2	-22.750833	-43.094444	Swartzia apetala Raddi	Neves, D.R.M.	1291	imagens3.jbrj.gov.br	rb/0/78/18/0	00781800.jpg	10	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
2950	28	2	-18.380833	-40.763056	Swartzia apetala Raddi var. apetala	Folli, D.A.	6852	imagens3.jbrj.gov.br	rb/0/89/76/10	00897610.jpg	18	\N	\N	f	Brasil	Espírito Santo	Ecoporanga
2381	19	2	-20.267778	-40.525000	Euterpe edulis Mart.	Forzza, R.C.	5300	imagens3.jbrj.gov.br	rb/0/54/30/30	00543030.jpg	18	\N	\N	f	Brasil	Espírito Santo	Cariacica
2945	28	2	-18.099444	-43.110000	Swartzia apetala Raddi var. apetala	Neves, D.M.	1604	imagens3.jbrj.gov.br	rb/0/87/31/58	00873158.jpg	2	\N	\N	f	Brasil	Minas Gerais	Felício dos Santos
2956	28	2	-10.180556	-41.235000	Swartzia apetala Raddi	E. Simonato	23	imagens3.jbrj.gov.br	rb/1/11/96/39	01119639.jpg	2	\N	\N	f	Brasil	Minas Gerais	Resplendor
2360	19	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2959	28	2	-22.891944	-43.116111	Swartzia apetala Raddi var. apetala	G. da Lessa	37	imagens3.jbrj.gov.br	rb/1/18/10/61	01181061.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	
3756	38	2	-20.308889	-46.522778	Tapirira guianensis Aubl.	M. Groppo	23601	imagens3.jbrj.gov.br	rb/1/31/67/84	01316784.jpg	2	\N	\N	f	Brasil	Minas Gerais	Vargem Bonita
3758	38	2	-14.193889	-49.276945	Tapirira guianensis Aubl.	J.E.Q. Faria	6499				2	\N	\N	f	Brasil	Goiás	Alto Horizonte
3843	25	2	-20.302500	-40.481945	Miconia mirabilis (Aubl.) L.O.Williams	Kollmann, L.	10662	imagens3.jbrj.gov.br	rb/0/52/20/37	00522037.jpg	17	\N	\N	f	Brasil	Espírito Santo	Cariacica
2383	19	2	-21.700000	-43.891667	Euterpe edulis Mart.	Forzza, R.C.	3616	imagens3.jbrj.gov.br	rb/0/55/13/51	00551351.jpg	18	\N	\N	f	Brasil	Minas Gerais	Lima Duarte
3692	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Lima, H.C. de	4519	imagens3.jbrj.gov.br	rb/0/44/15/22	00441522.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3693	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	S.V.A.Pessoa	666	imagens3.jbrj.gov.br	rb/0/44/15/41	00441541.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2384	19	2	-23.062778	-44.681945	Euterpe edulis Mart.	Rodrigo Rocha	011				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
3694	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Correia, C.M.B.	385	imagens3.jbrj.gov.br	rb/0/44/23/39	00442339.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3695	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Correia, C.M.B.	378	imagens3.jbrj.gov.br	rb/0/44/23/67	00442367.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3696	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Lima, H.C. de	4774	imagens3.jbrj.gov.br	rb/0/44/23/97	00442397.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3697	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Farias, D.S.	134	imagens3.jbrj.gov.br	rb/0/44/24/96	00442496.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2361	19	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
3698	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Farias, D.S.	324	imagens3.jbrj.gov.br	rb/0/44/25/10	00442510.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3699	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Farias, D.S.	327	imagens3.jbrj.gov.br	rb/0/44/25/66	00442566.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3700	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	526	imagens3.jbrj.gov.br	rb/0/44/27/4	00442704.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2386	19	2	-23.067778	-44.679445	Euterpe edulis Mart.	Rodrigo Rocha	073				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
3701	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	528	imagens3.jbrj.gov.br	rb/0/44/27/5	00442705.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3702	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	529	imagens3.jbrj.gov.br	rb/0/44/27/6	00442706.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2387	19	2	-22.968889	-43.248611	Euterpe edulis Mart.	Ricardo Reis, Vanderlei Rodinsky, Thaís Almeida	RCCReis 1184				18	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3703	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	48	imagens3.jbrj.gov.br	rb/0/44/27/7	00442707.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3704	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	530	imagens3.jbrj.gov.br	rb/0/44/27/36	00442736.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2382	19	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3705	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	35	imagens3.jbrj.gov.br	rb/0/44/27/78	00442778.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3706	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	605	imagens3.jbrj.gov.br	rb/0/44/28/32	00442832.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3707	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	612	imagens3.jbrj.gov.br	rb/0/44/28/68	00442868.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3708	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	168	imagens3.jbrj.gov.br	rb/0/44/29/15	00442915.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3709	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	173	imagens3.jbrj.gov.br	rb/0/44/29/19	00442919-1.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3710	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	532	imagens3.jbrj.gov.br	rb/0/44/31/26	00443126.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3711	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	531	imagens3.jbrj.gov.br	rb/0/44/31/45	00443145.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2385	19	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
3712	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	586	imagens3.jbrj.gov.br	rb/0/44/31/89	00443189.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3713	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	S.V.A.Pessoa	810	imagens3.jbrj.gov.br	rb/0/44/35/61	00443561.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3715	38	2	-22.500000	-42.250000	Tapirira guianensis Aubl.	Luchiari, C.	606	imagens3.jbrj.gov.br	rb/0/47/50/57	00475057.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3716	38	2	-15.963333	-47.897222	Tapirira guianensis Aubl.	M. L. M. Azevedo	430	imagens3.jbrj.gov.br	rb/0/48/91/65	00489165.jpg	2	\N	\N	f	Brasil	Distrito Federal	
3721	38	2	-22.433333	-42.833333	Tapirira guianensis Aubl.	Lima, H.C. de	4346	imagens3.jbrj.gov.br	rb/0/55/87/70	00558770.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
3722	38	2	-22.433333	-42.833333	Tapirira guianensis Aubl.	T.S.Pereira	4	imagens3.jbrj.gov.br	rb/0/55/95/17	00559517.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
2363	19	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				18	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
2390	19	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				18	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3723	38	2	-22.433333	-42.833333	Tapirira guianensis Aubl.	T.S.Pereira	5	imagens3.jbrj.gov.br	rb/0/55/95/18	00559518.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
3731	38	2	-15.807222	-48.855833	Tapirira guianensis Aubl.	P. G. Delprete	10384	imagens3.jbrj.gov.br	rb/0/59/39/90	00593990.jpg	2	\N	\N	f	Brasil	Goiás	Pirenópolis
3734	38	2	-22.916667	-42.233333	Tapirira guianensis Aubl.	Carvalho, A.S.R.	AC089	imagens3.jbrj.gov.br	rb/0/85/70/18	00857018.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	
3735	38	2	-22.916667	-42.233333	Tapirira guianensis Aubl.	Andrade, A.C.S.	AC100	imagens3.jbrj.gov.br	rb/0/85/70/19	00857019.jpg	2	\N	\N	f	Brasil	Rio de Janeiro	
3743	38	2	-24.815000	-47.742222	Tapirira guianensis Aubl.	G.D. Sanches	01	imagens3.jbrj.gov.br	rb/1/5/5/15	01050515.jpg	2	\N	\N	f	Brasil	São Paulo	
3744	38	2	-22.706667	-48.304444	Tapirira guianensis Aubl.	Barreto, K.D.	3422	imagens3.jbrj.gov.br	rb/1/5/5/17	01050517.jpg	2	\N	\N	f	Brasil	São Paulo	Anhembi
2392	19	2	-19.135278	-39.932500	Euterpe edulis Mart.	Vidal de Freitas Mansano	07-443				18	\N	\N	f	Brasil	Espírito Santo	
2393	19	2	-27.990000	-48.869722	Euterpe edulis Mart.	M. Verdi	5167	imagens3.jbrj.gov.br	rb/0/90/90/21	00909021.jpg	18	\N	\N	f	Brasil	Santa Catarina	São Bonifácio
2378	19	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/47/65/16	00476516.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
3748	38	2	-22.560278	-43.415556	Tapirira guianensis Aubl.	Rodrigues, P.J.F.P.	6				2	\N	\N	f	Brasil	Rio de Janeiro	Miguel Pereira
3750	38	2	-20.716667	-42.483333	Tapirira guianensis Aubl.	L.S. Leoni	2329	imagens3.jbrj.gov.br	rb/1/17/76/1	01177601.jpg	2	\N	\N	f	Brasil	Minas Gerais	
2395	19	2	-22.574722	-43.418333	Euterpe edulis Mart.	Haroldo C. de Lima	8265	imagens3.jbrj.gov.br	rb/1/14/24/74	01142474.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
2396	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 A	imagens3.jbrj.gov.br	rb/1/23/11/53	01231153.jpg	18	\N	\N	f	Brasil	Minas Gerais	Carangola
2397	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 B	imagens3.jbrj.gov.br	rb/1/23/11/59	01231159.jpg	18	\N	\N	f	Brasil	Minas Gerais	Carangola
2398	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 C	imagens3.jbrj.gov.br	rb/1/23/11/60	01231160.jpg	18	\N	\N	f	Brasil	Minas Gerais	Carangola
2399	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	818	imagens3.jbrj.gov.br	rb/0/44/15/12	00441512.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2400	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	827	imagens3.jbrj.gov.br	rb/0/44/18/23	00441823.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2401	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Farias, D.S.	207	imagens3.jbrj.gov.br	rb/0/44/20/50	00442050.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2402	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12447	imagens3.jbrj.gov.br	rb/0/44/95/62	00449562.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2403	19	2	-22.550000	-42.500000	Euterpe edulis Mart.	Guedes, R.		imagens3.jbrj.gov.br	rb/0/44/95/64	00449564.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2404	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12746	imagens3.jbrj.gov.br	rb/0/44/95/68	00449568.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2405	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12410	imagens3.jbrj.gov.br	rb/0/44/95/76	00449576.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2394	19	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/99/12/10	00991210.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
2407	19	2	-19.135278	-39.932500	Euterpe edulis Mart.	Mansano, V.F.	07-443	imagens3.jbrj.gov.br	rb/0/49/54/73	00495473.jpg	18	\N	\N	f	Brasil	Espírito Santo	Linhares
2408	19	2	-19.950000	-40.516667	Euterpe edulis Mart.	H. Q. B. Fernandes s. n.					18	\N	\N	f	Brasil	Espírito Santo	Santa Teresa
2409	19	2	-20.267778	-40.525000	Euterpe edulis Mart.	Forzza, R.C.	5300	imagens3.jbrj.gov.br	rb/0/54/30/30	00543030.jpg	18	\N	\N	f	Brasil	Espírito Santo	Cariacica
3845	25	2	-20.276111	-40.525000	Miconia mirabilis (Aubl.) L.O.Williams	Goldenberg, R.	1091	imagens3.jbrj.gov.br	rb/0/52/91/31	00529131.jpg	17	\N	\N	f	Brasil	Espírito Santo	Cariacica
3846	25	2	-14.334722	-39.042778	Miconia mirabilis (Aubl.) L.O.Williams	E. J. Lucas	1025	imagens3.jbrj.gov.br	rb/0/53/9/88	00530988.jpg	17	\N	\N	f	Brasil	Bahia	Itacaré
2388	19	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3847	25	2	-20.302500	-40.481945	Miconia mirabilis (Aubl.) L.O.Williams	Forzza, R.C.	5060	imagens3.jbrj.gov.br	rb/0/54/9/12	00540912.jpg	17	\N	\N	f	Brasil	Espírito Santo	Cariacica
3848	25	2	-20.319445	-40.537500	Miconia mirabilis (Aubl.) L.O.Williams	Goldenberg, R.	1261	imagens3.jbrj.gov.br	rb/0/54/94/64	00549464.jpg	17	\N	\N	f	Brasil	Espírito Santo	Viana
3852	25	2	-15.277778	-39.027222	Miconia mirabilis (Aubl.) L.O.Williams	Fraga, C.N.	2593	imagens3.jbrj.gov.br	rb/0/57/34/71	00573471.jpg	17	\N	\N	f	Brasil	Bahia	Una
2411	19	2	-21.700000	-43.891667	Euterpe edulis Mart.	Forzza, R.C.	3616	imagens3.jbrj.gov.br	rb/0/55/13/51	00551351.jpg	18	\N	\N	f	Brasil	Minas Gerais	Lima Duarte
2412	19	2	-23.062778	-44.681945	Euterpe edulis Mart.	Rodrigo Rocha	011				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2389	19	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2414	19	2	-23.067778	-44.679445	Euterpe edulis Mart.	Rodrigo Rocha	073				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2415	19	2	-22.968889	-43.248611	Euterpe edulis Mart.	Ricardo Reis, Vanderlei Rodinsky, Thaís Almeida	RCCReis 1184				18	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2410	19	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2413	19	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2391	19	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				18	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
2418	19	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				18	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
2420	19	2	-19.135278	-39.932500	Euterpe edulis Mart.	Vidal de Freitas Mansano	07-443				18	\N	\N	f	Brasil	Espírito Santo	
2421	19	2	-27.990000	-48.869722	Euterpe edulis Mart.	M. Verdi	5167	imagens3.jbrj.gov.br	rb/0/90/90/21	00909021.jpg	18	\N	\N	f	Brasil	Santa Catarina	São Bonifácio
3867	25	2	-13.685000	-39.825278	Miconia mirabilis (Aubl.) L.O.Williams	Zappi, D.C	3399	imagens3.jbrj.gov.br	rb/0/78/12/86	00781286.jpg	17	\N	\N	f	Brasil	Bahia	Jaguaquara
3868	25	2	-13.668889	-39.818333	Miconia mirabilis (Aubl.) L.O.Williams	Zappi, D.C	3386	imagens3.jbrj.gov.br	rb/0/78/12/88	00781288.jpg	17	\N	\N	f	Brasil	Bahia	Jaguaquara
3869	25	2	-14.407222	-40.120833	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	1898	imagens3.jbrj.gov.br	rb/0/78/67/2	00786702.jpg	17	\N	\N	f	Brasil	Bahia	Boa Nova
2406	19	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/47/65/16	00476516.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
3870	25	2	-13.583333	-39.716667	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	2322	imagens3.jbrj.gov.br	rb/0/78/88/59	00788859.jpg	17	\N	\N	f	Brasil	Bahia	Wenceslau Guimarães
2423	19	2	-22.574722	-43.418333	Euterpe edulis Mart.	Haroldo C. de Lima	8265	imagens3.jbrj.gov.br	rb/1/14/24/74	01142474.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
3871	25	2	-19.351389	-40.548056	Miconia mirabilis (Aubl.) L.O.Williams	Forzza, R.C.	7567	imagens3.jbrj.gov.br	rb/0/81/0/79	00810079.jpg	17	\N	\N	f	Brasil	Espírito Santo	Marilândia
2424	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 A	imagens3.jbrj.gov.br	rb/1/23/11/53	01231153.jpg	18	\N	\N	f	Brasil	Minas Gerais	Carangola
3872	25	2	-13.579445	-39.705833	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	2676	imagens3.jbrj.gov.br	rb/0/82/9/41	00820941.jpg	17	\N	\N	f	Brasil	Bahia	Wenceslau Guimarães
2425	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 B	imagens3.jbrj.gov.br	rb/1/23/11/59	01231159.jpg	18	\N	\N	f	Brasil	Minas Gerais	Carangola
3873	25	2	-13.879445	-39.688333	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	3334	imagens3.jbrj.gov.br	rb/0/87/97/26	00879726.jpg	17	\N	\N	f	Brasil	Bahia	Apuarema
2426	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 C	imagens3.jbrj.gov.br	rb/1/23/11/60	01231160.jpg	18	\N	\N	f	Brasil	Minas Gerais	Carangola
3880	25	2	-20.563889	-40.705278	Miconia mirabilis (Aubl.) L.O.Williams	J.F.A. Baumgratz	1516				17	\N	\N	f	Brasil	Espírito Santo	Alfredo Chaves
2427	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	818	imagens3.jbrj.gov.br	rb/0/44/15/12	00441512.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2428	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Sylvestre, L.	827	imagens3.jbrj.gov.br	rb/0/44/18/23	00441823.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2429	19	2	-22.500000	-42.250000	Euterpe edulis Mart.	Farias, D.S.	207	imagens3.jbrj.gov.br	rb/0/44/20/50	00442050.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2430	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12447	imagens3.jbrj.gov.br	rb/0/44/95/62	00449562.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2431	19	2	-22.550000	-42.500000	Euterpe edulis Mart.	Guedes, R.		imagens3.jbrj.gov.br	rb/0/44/95/64	00449564.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2432	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12746	imagens3.jbrj.gov.br	rb/0/44/95/68	00449568.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2433	19	2	-22.000000	-42.050000	Euterpe edulis Mart.	Martinelli, G.	12410	imagens3.jbrj.gov.br	rb/0/44/95/76	00449576.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Friburgo
2422	19	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/99/12/10	00991210.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
2435	19	2	-19.135278	-39.932500	Euterpe edulis Mart.	Mansano, V.F.	07-443	imagens3.jbrj.gov.br	rb/0/49/54/73	00495473.jpg	18	\N	\N	f	Brasil	Espírito Santo	Linhares
2436	19	2	-19.950000	-40.516667	Euterpe edulis Mart.	H. Q. B. Fernandes s. n.					18	\N	\N	f	Brasil	Espírito Santo	Santa Teresa
2437	19	2	-20.267778	-40.525000	Euterpe edulis Mart.	Forzza, R.C.	5300	imagens3.jbrj.gov.br	rb/0/54/30/30	00543030.jpg	18	\N	\N	f	Brasil	Espírito Santo	Cariacica
2416	19	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2439	19	2	-21.700000	-43.891667	Euterpe edulis Mart.	Forzza, R.C.	3616	imagens3.jbrj.gov.br	rb/0/55/13/51	00551351.jpg	18	\N	\N	f	Brasil	Minas Gerais	Lima Duarte
2440	19	2	-23.062778	-44.681945	Euterpe edulis Mart.	Rodrigo Rocha	011				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2417	19	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2442	19	2	-23.067778	-44.679445	Euterpe edulis Mart.	Rodrigo Rocha	073				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2443	19	2	-22.968889	-43.248611	Euterpe edulis Mart.	Ricardo Reis, Vanderlei Rodinsky, Thaís Almeida	RCCReis 1184				18	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
2438	19	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2441	19	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2419	19	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				18	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
2446	19	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				18	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
2448	19	2	-19.135278	-39.932500	Euterpe edulis Mart.	Vidal de Freitas Mansano	07-443				18	\N	\N	f	Brasil	Espírito Santo	
2449	19	2	-27.990000	-48.869722	Euterpe edulis Mart.	M. Verdi	5167	imagens3.jbrj.gov.br	rb/0/90/90/21	00909021.jpg	18	\N	\N	f	Brasil	Santa Catarina	São Bonifácio
2434	19	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/47/65/16	00476516.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
2451	19	2	-22.574722	-43.418333	Euterpe edulis Mart.	Haroldo C. de Lima	8265	imagens3.jbrj.gov.br	rb/1/14/24/74	01142474.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Nova Iguaçu
2452	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 A	imagens3.jbrj.gov.br	rb/1/23/11/53	01231153.jpg	18	\N	\N	f	Brasil	Minas Gerais	Carangola
2453	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 B	imagens3.jbrj.gov.br	rb/1/23/11/59	01231159.jpg	18	\N	\N	f	Brasil	Minas Gerais	Carangola
2454	19	2	-20.766667	-42.033333	Euterpe edulis Mart.	L.S. Leoni	1791 C	imagens3.jbrj.gov.br	rb/1/23/11/60	01231160.jpg	18	\N	\N	f	Brasil	Minas Gerais	Carangola
2450	19	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/99/12/10	00991210.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
2444	19	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
2445	19	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
2447	19	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				18	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3841	25	2	-15.150000	-39.083333	Miconia mirabilis (Aubl.) L.O.Williams	André M. de Carvalho 	6313	imagens3.jbrj.gov.br	rb/0/48/26/88	00482688.jpg	17	\N	\N	f	Brasil	Bahia	Una
3842	25	2	-15.150000	-39.083333	Miconia mirabilis (Aubl.) L.O.Williams	André M. A. Amorim 	1964	imagens3.jbrj.gov.br	rb/0/48/30/56	00483056.jpg	17	\N	\N	f	Brasil	Bahia	Una
3854	25	2	-20.122778	-40.546111	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	2089	imagens3.jbrj.gov.br	rb/0/58/34/23	00583423.jpg	17	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
3855	25	2	-20.200556	-40.490556	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	3640	imagens3.jbrj.gov.br	rb/0/58/34/27	00583427.jpg	17	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
3856	25	2	-20.028889	-40.497222	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	1196	imagens3.jbrj.gov.br	rb/0/58/34/51	00583451.jpg	17	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
3904	44	2	-22.250000	-44.566667	Euterpe edulis Mart.	Braga, J.M.A.	2387	imagens3.jbrj.gov.br	rb/0/99/12/10	00991210.jpg	18	\N	\N	f	Brasil	Rio de Janeiro	Itatiaia
3898	44	2	-22.522222	-42.549444	Euterpe edulis Mart.	Reis, R.C.C.	952				18	\N	\N	f	Brasil	Rio de Janeiro	Silva Jardim
3899	44	2	-23.071111	-44.686667	Euterpe edulis Mart.	Rodrigo Rocha	0022				18	\N	\N	f	Brasil	Rio de Janeiro	Paraty
3901	44	2	-22.771667	-43.000278	Euterpe edulis Mart.	Finotti	347				18	\N	\N	f	Brasil	Rio de Janeiro	Teresópolis
3593	34	2	-22.633333	-56.283333	Eugenia aurata O.Berg	Krapovickas, A.	46005	imagens3.jbrj.gov.br	rb/0/43/35/14	00433514.jpg	1	\N	\N	f	Paraguai		
3917	45	2	-16.383333	-39.133333	Miconia mirabilis (Aubl.) L.O.Williams	Bautista, H.P.	1144	imagens3.jbrj.gov.br	rb/0/23/99/59	00239959.jpg	17	\N	\N	f	Brasil	Bahia	
3599	34	2	-14.666667	-55.233333	Eugenia aurata O.Berg	Souza, V.C.	20449	imagens3.jbrj.gov.br	rb/1/11/69/60	01116960.jpg	1	\N	\N	f	Brasil	Mato Grosso	Rosário Oeste
3605	34	2	-47.917778	-22.295833	Eugenia aurata O.Berg	G.D. Colletta	2212	imagens3.jbrj.gov.br	rb/1/13/29/7	01132907.jpg	1	-22.295833	-47.917778	f	Brasil	São Paulo	Itirapina
3918	45	2	-22.833333	-43.333333	Miconia mirabilis (Aubl.) L.O.Williams	Landrum, L.R.	2016	imagens3.jbrj.gov.br	rb/0/24/22/96	00242296.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	
3597	34	2	-5.315556	-43.873056	Eugenia aurata O.Berg	E.M.Saddi	929	imagens3.jbrj.gov.br	rb/0/83/79/62	00837962.jpg	1	-5.971537	-43.873056	f	Brasil	Maranhão	Senador Alexandre Costa
3594	34	2	-20.208333	-44.468333	Eugenia aurata O.Berg	E.M.Saddi	529	imagens3.jbrj.gov.br	rb/0/69/53/51	00695351.jpg	17	\N	\N	f	Brasil	Minas Gerais	Itatiaiuçu
3590	34	2	-17.200000	-51.783333	Eugenia aurata O.Berg	Irwin, H.S.		imagens3.jbrj.gov.br	rb/0/30/67/67	00306767.jpg	17	\N	\N	f	Brasil	Goiás	
3588	34	2	-15.352778	-45.002500	Eugenia aurata O.Berg	Silva, M.A. da	3476	imagens3.jbrj.gov.br	rb/0/30/62/9	00306209.jpg	17	\N	\N	f	Brasil	Minas Gerais	Formoso
3601	34	2	-22.583333	-50.366667	Eugenia aurata O.Berg	A.P. Savassi-Coutinho	830	imagens3.jbrj.gov.br	rb/1/13/20/44	01132044.jpg	17	\N	\N	f	Brasil	São Paulo	Assis
3600	34	2	-55.027500	-28.357500	Eugenia aurata O.Berg	G.D. Colletta	2477	imagens3.jbrj.gov.br	rb/1/13/16/65	01131665.jpg	17	-28.357500	-55.027500	f	Brasil	São Paulo	Bauru
3909	14	2	-11.642778	-40.929167	Prepusa montana Mart.	ROBERTO ORLANDI	268	imagens3.jbrj.gov.br	rb/0/11/35/22	00113522.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
3910	14	2	-11.623333	-41.000833	Prepusa montana Mart.	Oliveira, A.	64	imagens3.jbrj.gov.br	rb/0/11/35/42	00113542.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
3911	14	2	-13.000000	-41.400000	Prepusa montana Mart.	Mori, S.A.		imagens3.jbrj.gov.br	rb/0/11/35/92	00113592.jpg	8	\N	\N	f	Brasil	Bahia	Mucugê
3912	14	2	-11.450000	-41.116667	Prepusa montana Mart.	Coradin, L.	6230	imagens3.jbrj.gov.br	rb/0/11/36/7	00113607.jpg	8	\N	\N	f	Brasil	Bahia	Morro do Chapéu
3913	14	2	-21.710278	-43.817778	Prepusa montana Mart.	Fontana, A.P.	2271	imagens3.jbrj.gov.br	rb/0/56/21/13	00562113.jpg	8	\N	\N	f	Brasil	Minas Gerais	Ouro Preto
3914	14	2	-13.013056	-41.372778	Prepusa montana Mart.	Fraga, C.N.	2691	imagens3.jbrj.gov.br	rb/0/57/35/71	00573571.jpg	8	\N	\N	f	Brasil	Bahia	Mucugê
3915	14	2	-11.583333	-41.200000	Prepusa montana Mart.	Harley, R.M.	22755	imagens3.jbrj.gov.br	rb/0/70/34/96	00703496.jpg	8	\N	\N	f	Brasil	Bahia	
3916	14	2	-11.635833	-41.001389	Prepusa montana Mart.	Roque, N.	1111	imagens3.jbrj.gov.br	rb/0/70/44/46	00704446.jpg	8	\N	\N	f	Brasil	Bahia	
3922	45	2	-12.869445	-38.471667	Miconia mirabilis (Aubl.) L.O.Williams	M.L.C. Neves	486	imagens3.jbrj.gov.br	rb/0/52/30/72	00523072.jpg	17	\N	\N	f	Brasil	Bahia	Santa Teresinha
3927	45	2	-22.433333	-42.833333	Miconia mirabilis var. sanguinea	Martinelli, G.	10243	imagens3.jbrj.gov.br	rb/0/55/91/16	00559116.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
3919	45	2	-15.150000	-39.083333	Miconia mirabilis (Aubl.) L.O.Williams	André M. de Carvalho 	6313	imagens3.jbrj.gov.br	rb/0/48/26/88	00482688.jpg	8	\N	\N	f	Brasil	Bahia	Una
3920	45	2	-15.150000	-39.083333	Miconia mirabilis (Aubl.) L.O.Williams	André M. A. Amorim 	1964	imagens3.jbrj.gov.br	rb/0/48/30/56	00483056.jpg	8	\N	\N	f	Brasil	Bahia	Una
3921	45	2	-20.302500	-40.481945	Miconia mirabilis (Aubl.) L.O.Williams	Kollmann, L.	10662	imagens3.jbrj.gov.br	rb/0/52/20/37	00522037.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
3923	45	2	-20.276111	-40.525000	Miconia mirabilis (Aubl.) L.O.Williams	Goldenberg, R.	1091	imagens3.jbrj.gov.br	rb/0/52/91/31	00529131.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
3924	45	2	-14.334722	-39.042778	Miconia mirabilis (Aubl.) L.O.Williams	E. J. Lucas	1025	imagens3.jbrj.gov.br	rb/0/53/9/88	00530988.jpg	8	\N	\N	f	Brasil	Bahia	Itacaré
3925	45	2	-20.302500	-40.481945	Miconia mirabilis (Aubl.) L.O.Williams	Forzza, R.C.	5060	imagens3.jbrj.gov.br	rb/0/54/9/12	00540912.jpg	8	\N	\N	f	Brasil	Espírito Santo	Cariacica
3926	45	2	-20.319445	-40.537500	Miconia mirabilis (Aubl.) L.O.Williams	Goldenberg, R.	1261	imagens3.jbrj.gov.br	rb/0/54/94/64	00549464.jpg	8	\N	\N	f	Brasil	Espírito Santo	Viana
3930	45	2	-15.277778	-39.027222	Miconia mirabilis (Aubl.) L.O.Williams	Fraga, C.N.	2593	imagens3.jbrj.gov.br	rb/0/57/34/71	00573471.jpg	8	\N	\N	f	Brasil	Bahia	Una
3932	45	2	-20.122778	-40.546111	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	2089	imagens3.jbrj.gov.br	rb/0/58/34/23	00583423.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
3933	45	2	-20.200556	-40.490556	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	3640	imagens3.jbrj.gov.br	rb/0/58/34/27	00583427.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
3934	45	2	-20.028889	-40.497222	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	1196	imagens3.jbrj.gov.br	rb/0/58/34/51	00583451.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
3935	45	2	-19.348056	-40.550833	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	865	imagens3.jbrj.gov.br	rb/0/58/34/52	00583452.jpg	8	\N	\N	f	Brasil	Espírito Santo	Marilândia
3936	45	2	-19.348056	-40.550833	Miconia mirabilis (Aubl.) L.O.Williams	L.F.S. Magnago	1384	imagens3.jbrj.gov.br	rb/0/58/34/53	00583453.jpg	8	\N	\N	f	Brasil	Espírito Santo	Marilândia
3937	45	2	-19.311667	-40.537500	Miconia mirabilis (Aubl.) L.O.Williams	L. F. S. Magnago	695	imagens3.jbrj.gov.br	rb/0/58/35/72	00583572.jpg	8	\N	\N	f	Brasil	Espírito Santo	Governador Lindenberg
3938	45	2	-20.028889	-40.497222	Miconia mirabilis (Aubl.) L.O.Williams	L. F. S. Magnago	1561	imagens3.jbrj.gov.br	rb/0/58/35/78	00583578.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
3939	45	2	-20.026667	-40.492222	Miconia mirabilis (Aubl.) L.O.Williams	Demuner, V.	3608	imagens3.jbrj.gov.br	rb/0/58/35/79	00583579.jpg	8	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
3940	45	2	-17.183333	-39.333333	Miconia mirabilis (Aubl.) L.O.Williams	F. B. Matos 	1703	imagens3.jbrj.gov.br	rb/0/58/92/68	00589268.jpg	8	\N	\N	f	Brasil	Bahia	Prado
3941	45	2	-15.181945	-39.063333	Miconia mirabilis (Aubl.) L.O.Williams	M.K. Caddah	789	imagens3.jbrj.gov.br	rb/0/65/50/24	00655024.jpg	8	\N	\N	f	Brasil	Bahia	Una
3942	45	2	-15.173611	-39.341667	Miconia mirabilis (Aubl.) L.O.Williams	A.B. Jardim	2	imagens3.jbrj.gov.br	rb/0/70/39/90	00703990.jpg	8	\N	\N	f	Brasil	Bahia	Arataca
3928	45	2	-22.433333	-42.833333	Miconia mirabilis (Aubl.) L.O.Williams	Vieira, C.M.	150	imagens3.jbrj.gov.br	rb/0/55/91/95	00559195.jpg	17	\N	\N	f	Brasil	Rio de Janeiro	Guapimirim
3944	45	2	-13.605556	-39.854444	Miconia mirabilis (Aubl.) L.O.Williams	Milliken, W	5051	imagens3.jbrj.gov.br	rb/0/78/12/44	00781244.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
3945	45	2	-13.685000	-39.825278	Miconia mirabilis (Aubl.) L.O.Williams	Zappi, D.C	3399	imagens3.jbrj.gov.br	rb/0/78/12/86	00781286.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
3946	45	2	-13.668889	-39.818333	Miconia mirabilis (Aubl.) L.O.Williams	Zappi, D.C	3386	imagens3.jbrj.gov.br	rb/0/78/12/88	00781288.jpg	8	\N	\N	f	Brasil	Bahia	Jaguaquara
3947	45	2	-14.407222	-40.120833	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	1898	imagens3.jbrj.gov.br	rb/0/78/67/2	00786702.jpg	8	\N	\N	f	Brasil	Bahia	Boa Nova
3948	45	2	-13.583333	-39.716667	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	2322	imagens3.jbrj.gov.br	rb/0/78/88/59	00788859.jpg	8	\N	\N	f	Brasil	Bahia	Wenceslau Guimarães
3949	45	2	-19.351389	-40.548056	Miconia mirabilis (Aubl.) L.O.Williams	Forzza, R.C.	7567	imagens3.jbrj.gov.br	rb/0/81/0/79	00810079.jpg	8	\N	\N	f	Brasil	Espírito Santo	Marilândia
3950	45	2	-13.579445	-39.705833	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	2676	imagens3.jbrj.gov.br	rb/0/82/9/41	00820941.jpg	8	\N	\N	f	Brasil	Bahia	Wenceslau Guimarães
3951	45	2	-13.879445	-39.688333	Miconia mirabilis (Aubl.) L.O.Williams	Aona, L.Y.S.	3334	imagens3.jbrj.gov.br	rb/0/87/97/26	00879726.jpg	8	\N	\N	f	Brasil	Bahia	Apuarema
3929	45	2	-15.173611	-39.341667	Miconia mirabilis (Aubl.) L.O.Williams	J.F.A. Baumgratz	1095	imagens3.jbrj.gov.br	rb/0/55/99/56	00559956.jpg	17	\N	\N	f	Brasil	Bahia	Ilhéus
3931	45	2	-20.294444	-40.697778	Miconia mirabilis (Aubl.) L.O.Williams	Fontana, A.P.	4923	imagens3.jbrj.gov.br	rb/0/58/30/2	00583002.jpg	17	\N	\N	f	Brasil	Espírito Santo	Santa Leopoldina
3954	45	2	-22.956389	-43.285278	Miconia mirabilis (Aubl.) L.O.Williams	C. Baez	512	imagens3.jbrj.gov.br	rb/1/11/92/68	01119268.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3955	45	2	-22.966111	-43.256667	Miconia mirabilis (Aubl.) L.O.Williams	C.Baez	606	imagens3.jbrj.gov.br	rb/1/17/41/11	01174111.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3956	45	2	-22.959167	-43.277778	Miconia mirabilis (Aubl.) L.O.Williams	T. Lorenzetti	6	imagens3.jbrj.gov.br	rb/1/21/46/37	01214637.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3957	45	2	-22.958889	-43.277500	Miconia mirabilis (Aubl.) L.O.Williams	T. Lorenzetti	42	imagens3.jbrj.gov.br	rb/1/21/79/13	01217913.jpg	8	\N	\N	f	Brasil	Rio de Janeiro	Rio de Janeiro
3958	45	2	-20.563889	-40.705278	Miconia mirabilis (Aubl.) L.O.Williams	J.F.A. Baumgratz	1516				8	\N	\N	f	Brasil	Espírito Santo	Alfredo Chaves
3953	45	2	-14.416667	-89.016667	Miconia mirabilis (Aubl.) L.O.Williams	Carvalho, A.M.V. de	3537	imagens3.jbrj.gov.br	rb/0/97/59/19	00975919.jpg	10	\N	\N	f	Brasil	Bahia	Uruçuca
3943	45	2	-19.351111	-40.548056	Miconia mirabilis (Aubl.) L.O.Williams	J. R. Pirani	6107	imagens3.jbrj.gov.br	rb/0/73/60/76	00736076.jpg	17	\N	\N	f	Brasil	Espírito Santo	
3952	45	2	-16.283333	-39.600000	Miconia mirabilis (Aubl.) L.O.Williams	R. Goldenberg et. al.;	1721	imagens3.jbrj.gov.br	rb/0/93/29/8	00932908.jpg	17	\N	\N	f	Brasil	Bahia	Itamaraju
\.


--
-- TOC entry 6024 (class 0 OID 0)
-- Dependencies: 804
-- Name: occurrence_idoccurrence_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('occurrence_idoccurrence_seq', 3988, true);


--
-- TOC entry 5975 (class 0 OID 1306542651)
-- Dependencies: 803
-- Data for Name: partitiontype; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY partitiontype (idpartitiontype, partitiontype) FROM stdin;
1	KFOLD
2	Bootstrap
\.


--
-- TOC entry 6025 (class 0 OID 0)
-- Dependencies: 802
-- Name: partitiontype_idpartitiontype_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('partitiontype_idpartitiontype_seq', 2, true);


--
-- TOC entry 5959 (class 0 OID 1280199241)
-- Dependencies: 785
-- Data for Name: periodo; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY periodo (idperiodo, periodo) FROM stdin;
\.


--
-- TOC entry 6026 (class 0 OID 0)
-- Dependencies: 784
-- Name: periodo_idperiodo_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('periodo_idperiodo_seq', 1, false);


--
-- TOC entry 5967 (class 0 OID 1284566275)
-- Dependencies: 793
-- Data for Name: project; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY project (idproject, description, project, idusuario) FROM stdin;
11		teste23	10
14		teantsdoooo	22
15		Fulanaceae	20
18		Eugenia	10
19		Fulanaceae	11
20		Machaerium aculeatum	30
22		Solanum chacoense	24
24		Bromelia	31
\.


--
-- TOC entry 6027 (class 0 OID 0)
-- Dependencies: 792
-- Name: project_idproject_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('project_idproject_seq', 24, true);


--
-- TOC entry 5961 (class 0 OID 1280199257)
-- Dependencies: 787
-- Data for Name: raster; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY raster (idraster, raster, idsource) FROM stdin;
1	BIO1 Annual Mean Temperature	2
2	BIO2 Mean Diurnal Range (Mean of monthly)	2
3	BIO3 Isothermality	2
4	BIO4 Temperature Seasonality	2
5	BIO5 Max Temperature of Warmest Month	2
6	BIO6 Min Temperature of Coldest Month	2
7	BIO7 Temperature Annual Range	2
8	BIO8 Mean Temperature of Wettest Quarter	2
9	BIO9 Mean Temperature of Driest Quarter	2
10	BIO10 Mean Temperature of Warmest Quarter	2
11	BIO11 Mean Temperature of Coldest Quarter	2
12	BIO12 Annual Precipitation	2
13	BIO13 Precipitation of Wettest Month	2
14	BIO14 Precipitation of Driest Month	2
15	BIO15 Precipitation Seasonality	2
16	BIO16 Precipitation of Wettest Quarter	2
17	BIO17 Precipitation of Driest Quarter	2
18	BIO18 Precipitation of Warmest Quarter	2
19	BIO19 Precipitation of Coldest Quarter	2
20	calcite	1
21	chlomin	1
22	cloudmean	1
23	damean	1
24	nitrate	1
25	ph	1
26	silicate	1
27	sstmin	1
28	chlomax	1
29	chlorange	1
30	cloudmin	1
31	damin	1
32	parmax	1
33	phosphate	1
34	sstmax	1
35	sstrange	1
36	chlomean	1
37	cloudmax	1
38	damax	1
39	dissox	1
40	parmean	1
41	salinity	1
42	sstmean	1
\.


--
-- TOC entry 6028 (class 0 OID 0)
-- Dependencies: 786
-- Name: raster_idraster_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('raster_idraster_seq', 42, true);


--
-- TOC entry 5963 (class 0 OID 1280199265)
-- Dependencies: 789
-- Data for Name: situacaousuario; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY situacaousuario (idsituacaousuario, situacaousuario) FROM stdin;
1	Ativo
2	Inativo
3	Suspenso
4	Excluido
\.


--
-- TOC entry 6029 (class 0 OID 0)
-- Dependencies: 788
-- Name: situacaousuario_idsituacaousuario_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('situacaousuario_idsituacaousuario_seq', 4, true);


--
-- TOC entry 5973 (class 0 OID 1306542643)
-- Dependencies: 801
-- Data for Name: source; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY source (idsource, source) FROM stdin;
2	WordClim
1	Bio-Oracle
\.


--
-- TOC entry 6030 (class 0 OID 0)
-- Dependencies: 800
-- Name: source_idsource_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('source_idsource_seq', 2, true);


--
-- TOC entry 5989 (class 0 OID 1706177588)
-- Dependencies: 829
-- Data for Name: statusexperiment; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY statusexperiment (idstatusexperiment, statusexperiment) FROM stdin;
3	Em processamento
4	Processado
1	Aguardando 
2	Liberado
\.


--
-- TOC entry 6031 (class 0 OID 0)
-- Dependencies: 828
-- Name: statusexperiment_idstatusexperiment_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('statusexperiment_idstatusexperiment_seq', 4, true);


--
-- TOC entry 5980 (class 0 OID 1426642196)
-- Dependencies: 813
-- Data for Name: statusoccurrence; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY statusoccurrence (statusoccurrence, usefull, idstatusoccurrence, pathicon) FROM stdin;
Duplicatas	\N	18	yellow-dot.png
Identificação errada da espécie	f	1	red-dot.png
Coordenada fora do município informado na coleta	t	2	yellow-dot.png
Coordenada imprecisa	t	6	red-dot.png
Coordenadas invertidas	t	12	yellow-dot.png
Coordenadas com zero	t	13	yellow-dot.png
Conferido (Liberado para a modelagem)	\N	17	green-dot.png
Ajuste de coordenada	t	4	green-dot.png
Coordenadas no mar	t	11	yellow-dot.png
Ponto excluido	\N	16	red-dot.png
Coordenadas fora do limite do brasil	t	10	yellow-dot.png
Coordenadas não conferidas	t	8	blue-dot.png
\.


--
-- TOC entry 6032 (class 0 OID 0)
-- Dependencies: 814
-- Name: statusoccurrence_idstatusoccurrence_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('statusoccurrence_idstatusoccurrence_seq', 18, true);


--
-- TOC entry 5991 (class 0 OID 1710705642)
-- Dependencies: 831
-- Data for Name: statususer; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY statususer (idstatususer, statususer) FROM stdin;
1	Taxonomistas
2	Administrador
\.


--
-- TOC entry 6033 (class 0 OID 0)
-- Dependencies: 830
-- Name: statususer_idstatususer_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('statususer_idstatususer_seq', 1, false);


--
-- TOC entry 5983 (class 0 OID 1435838969)
-- Dependencies: 816
-- Data for Name: tipousuario; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY tipousuario (idtipousuario, tipousuario) FROM stdin;
2	Administradoir
1	Taxonomista
\.


--
-- TOC entry 6034 (class 0 OID 0)
-- Dependencies: 815
-- Name: tipousuario_idtipousuario_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('tipousuario_idtipousuario_seq', 2, true);


--
-- TOC entry 5993 (class 0 OID 1710705662)
-- Dependencies: 833
-- Data for Name: user; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY "user" (iduser, name, login, password, email, idstatususer, idusertype) FROM stdin;
23	Domingos Benício Oliveira Silva Cardoso	domingos	trocar	cardosobot@gmail.com	1	1
25	Marcelo Trovó Lopes de Oliveira	marcelo	trocar	martrovo@gmail.com	1	1
26	Marco Octávio de Oliveira Pellegrini	marco	trocar	marcooctavio.pellegrini@gmail.com	1	1
3	Rafael Oliveira Lima	rafael.jbrj		rafaeloliveiralima@ibest.com.br	1	1
28	Rafael Almeida	rafael	trocar	dealmeida.rafaelfelipe@gmail.com	1	1
29	Vanessa Graziele Staggemeier	vanessa	trocar	v.staggemeier@gmail.com	1	1
30	Fabiana	fabiana	trocar	faranzato@gmail.com	1	1
11	Diogo SB Rocha	diogo	diogo	diogosbr@gmail.com	1	1
24	Gustavo Heiden	gustavo	wpm978	gustavo.heiden@embrapa.br	1	1
21	Anderson Ferreira Pinto Machado	anderson	12model@	afpmbot@gmail.com	1	1
31	Ricardo Moura	rmoura	moura9	rmoura@acd.ufrj.br	1	1
32	Andrea Sánchez-Tapia	andrea		katori@gmail.com	1	1
1	teste	teste	trocar	teste@jbrj.gov.br	1	2
10	Marinez	marinez	trocar	marinez.siqueira1@gmail.com	1	1
4	Administrador Geral	model-r	model-r	model-r@jbrj.gov.br	1	2
2	Guilherme Gall	guilherme		gmgall@lncc.br	1	1
\.


--
-- TOC entry 6035 (class 0 OID 0)
-- Dependencies: 832
-- Name: user_iduser_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('user_iduser_seq', 2, true);


--
-- TOC entry 5995 (class 0 OID 1710705670)
-- Dependencies: 835
-- Data for Name: usertype; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY usertype (idusertype, usertype) FROM stdin;
1	Taxonomista
2	Administrador
\.


--
-- TOC entry 6036 (class 0 OID 0)
-- Dependencies: 834
-- Name: usertype_idusertype_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('usertype_idusertype_seq', 1, false);


--
-- TOC entry 5965 (class 0 OID 1280199291)
-- Dependencies: 791
-- Data for Name: usuario; Type: TABLE DATA; Schema: modelr; Owner: -
--

COPY usuario (idusuario, nome, login, senha, email, idsituacaousuario, datacadastro, idtipousuario) FROM stdin;
10	Marinez	marinez	trocar	marinez.siqueira1@gmail.com	1	\N	1
4	Administrador Geral	model-r	model-r	model-r@jbrj.gov.br	1	\N	2
23	Domingos Benício Oliveira Silva Cardoso	domingos	trocar	cardosobot@gmail.com	1	\N	1
25	Marcelo Trovó Lopes de Oliveira	marcelo	trocar	martrovo@gmail.com	1	\N	1
26	Marco Octávio de Oliveira Pellegrini	marco	trocar	marcooctavio.pellegrini@gmail.com	1	\N	1
3	Rafael Oliveira Lima	rafael.jbrj		rafaeloliveiralima@ibest.com.br	1	\N	1
28	Rafael Almeida	rafael	trocar	dealmeida.rafaelfelipe@gmail.com	1	\N	1
29	Vanessa Graziele Staggemeier	vanessa	trocar	v.staggemeier@gmail.com	1	\N	1
30	Fabiana	fabiana	trocar	faranzato@gmail.com	1	\N	1
11	Diogo SB Rocha	diogo	diogo	diogosbr@gmail.com	1	\N	1
24	Gustavo Heiden	gustavo	wpm978	gustavo.heiden@embrapa.br	1	\N	1
21	Anderson Ferreira Pinto Machado	anderson	12model@	afpmbot@gmail.com	1	\N	1
31	Ricardo Moura	rmoura	moura9	rmoura@acd.ufrj.br	1	\N	1
32	Andrea Sánchez-Tapia	andrea		katori@gmail.com	1	\N	1
\.


--
-- TOC entry 6037 (class 0 OID 0)
-- Dependencies: 790
-- Name: usuario_idusuario_seq; Type: SEQUENCE SET; Schema: modelr; Owner: -
--

SELECT pg_catalog.setval('usuario_idusuario_seq', 32, true);


--
-- TOC entry 5724 (class 2606 OID 1306542640)
-- Name: algorithm_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY algorithm
    ADD CONSTRAINT algorithm_pkey PRIMARY KEY (idalgorithm);


--
-- TOC entry 5733 (class 2606 OID 1353791000)
-- Name: datasource_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY datasource
    ADD CONSTRAINT datasource_pkey PRIMARY KEY (iddatasource);


--
-- TOC entry 5721 (class 2606 OID 1284566639)
-- Name: experiment_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY experiment
    ADD CONSTRAINT experiment_pkey PRIMARY KEY (idexperiment);


--
-- TOC entry 5739 (class 2606 OID 1539928043)
-- Name: experiment_use_algorithm_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY experiment_use_algorithm
    ADD CONSTRAINT experiment_use_algorithm_pkey PRIMARY KEY (idexperiment_use_algorithm);


--
-- TOC entry 5741 (class 2606 OID 1611482431)
-- Name: experiment_use_raster_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY experiment_use_raster
    ADD CONSTRAINT experiment_use_raster_pkey PRIMARY KEY (idexperiment_use_raster);


--
-- TOC entry 5731 (class 2606 OID 1353790992)
-- Name: occurrence_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY occurrence
    ADD CONSTRAINT occurrence_pkey PRIMARY KEY (idoccurrence);


--
-- TOC entry 5728 (class 2606 OID 1306542656)
-- Name: partitiontype_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY partitiontype
    ADD CONSTRAINT partitiontype_pkey PRIMARY KEY (idpartitiontype);


--
-- TOC entry 5706 (class 2606 OID 1280199246)
-- Name: periodo_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_pkey PRIMARY KEY (idperiodo);


--
-- TOC entry 5719 (class 2606 OID 1284566280)
-- Name: project_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pkey PRIMARY KEY (idproject);


--
-- TOC entry 5709 (class 2606 OID 1280199262)
-- Name: raster_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY raster
    ADD CONSTRAINT raster_pkey PRIMARY KEY (idraster);


--
-- TOC entry 5711 (class 2606 OID 1280199270)
-- Name: situacaousuario_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY situacaousuario
    ADD CONSTRAINT situacaousuario_pkey PRIMARY KEY (idsituacaousuario);


--
-- TOC entry 5726 (class 2606 OID 1306542648)
-- Name: source_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY source
    ADD CONSTRAINT source_pkey PRIMARY KEY (idsource);


--
-- TOC entry 5743 (class 2606 OID 1706177593)
-- Name: statusexperiment_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY statusexperiment
    ADD CONSTRAINT statusexperiment_pkey PRIMARY KEY (idstatusexperiment);


--
-- TOC entry 5735 (class 2606 OID 1426642211)
-- Name: statusoccurrence_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY statusoccurrence
    ADD CONSTRAINT statusoccurrence_pkey PRIMARY KEY (idstatusoccurrence);


--
-- TOC entry 5745 (class 2606 OID 1710705647)
-- Name: statususer_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY statususer
    ADD CONSTRAINT statususer_pkey PRIMARY KEY (idstatususer);


--
-- TOC entry 5737 (class 2606 OID 1435838974)
-- Name: tipousuario_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (idtipousuario);


--
-- TOC entry 5747 (class 2606 OID 1710705667)
-- Name: user_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (iduser);


--
-- TOC entry 5749 (class 2606 OID 1710705675)
-- Name: usertype_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY usertype
    ADD CONSTRAINT usertype_pkey PRIMARY KEY (idusertype);


--
-- TOC entry 5713 (class 2606 OID 1484397164)
-- Name: usuario_email_key; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 5715 (class 2606 OID 1484397162)
-- Name: usuario_login_key; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_login_key UNIQUE (login);


--
-- TOC entry 5717 (class 2606 OID 1280199296)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 5707 (class 1259 OID 1310983433)
-- Name: fki_sorce; Type: INDEX; Schema: modelr; Owner: -
--

CREATE INDEX fki_sorce ON raster USING btree (idsource);


--
-- TOC entry 5722 (class 1259 OID 1706177599)
-- Name: fki_statusexperiment; Type: INDEX; Schema: modelr; Owner: -
--

CREATE INDEX fki_statusexperiment ON experiment USING btree (idstatusexperiment);


--
-- TOC entry 5729 (class 1259 OID 1426642217)
-- Name: fki_statusoccurrence; Type: INDEX; Schema: modelr; Owner: -
--

CREATE INDEX fki_statusoccurrence ON occurrence USING btree (idstatusoccurrence);


--
-- TOC entry 5756 (class 2606 OID 1539928044)
-- Name: experiment_use_algorithm_idalgorithm_fkey; Type: FK CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY experiment_use_algorithm
    ADD CONSTRAINT experiment_use_algorithm_idalgorithm_fkey FOREIGN KEY (idalgorithm) REFERENCES algorithm(idalgorithm);


--
-- TOC entry 5755 (class 2606 OID 1539928049)
-- Name: experiment_use_algorithm_idexperiment_fkey; Type: FK CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY experiment_use_algorithm
    ADD CONSTRAINT experiment_use_algorithm_idexperiment_fkey FOREIGN KEY (idexperiment) REFERENCES experiment(idexperiment);


--
-- TOC entry 5753 (class 2606 OID 1284566640)
-- Name: fk_1; Type: FK CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY experiment
    ADD CONSTRAINT fk_1 FOREIGN KEY (idproject) REFERENCES project(idproject);


--
-- TOC entry 5751 (class 2606 OID 1280199297)
-- Name: fk_situacaousuario; Type: FK CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_situacaousuario FOREIGN KEY (idsituacaousuario) REFERENCES situacaousuario(idsituacaousuario) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5750 (class 2606 OID 1310983428)
-- Name: fk_sorce; Type: FK CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY raster
    ADD CONSTRAINT fk_sorce FOREIGN KEY (idsource) REFERENCES source(idsource) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5752 (class 2606 OID 1706177594)
-- Name: fk_statusexperiment; Type: FK CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY experiment
    ADD CONSTRAINT fk_statusexperiment FOREIGN KEY (idstatusexperiment) REFERENCES statusexperiment(idstatusexperiment) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5754 (class 2606 OID 1426642212)
-- Name: fk_statusoccurrence; Type: FK CONSTRAINT; Schema: modelr; Owner: -
--

ALTER TABLE ONLY occurrence
    ADD CONSTRAINT fk_statusoccurrence FOREIGN KEY (idstatusoccurrence) REFERENCES statusoccurrence(idstatusoccurrence);


-- Completed on 2017-08-10 15:31:02

--
-- PostgreSQL database dump complete
--

