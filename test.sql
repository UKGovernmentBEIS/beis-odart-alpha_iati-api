--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Ubuntu 11.2-1)
-- Dumped by pg_dump version 11.2 (Ubuntu 11.2-1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: api_budgets; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.api_budgets (
    budgets_identifier_id integer NOT NULL,
    budget_type_code integer,
    budget_period_start_date date,
    budget_currency text,
    budget_period_end_date date,
    budget_value numeric(10,2) NOT NULL,
    budget_value_date date,
    budget_status_code integer,
    activity_identifier_id character varying(20) NOT NULL
);


ALTER TABLE public.api_budgets OWNER TO test;

--
-- Name: api_budgets_budgets_identifier_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.api_budgets_budgets_identifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_budgets_budgets_identifier_id_seq OWNER TO test;

--
-- Name: api_budgets_budgets_identifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.api_budgets_budgets_identifier_id_seq OWNED BY public.api_budgets.budgets_identifier_id;


--
-- Name: api_documents_links; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.api_documents_links (
    documents_links_id integer NOT NULL,
    "Title" text,
    "Category" text,
    "Language" text,
    "Date" date,
    "URL" text,
    "Format" text,
    activity_identifier_id character varying(20) NOT NULL
);


ALTER TABLE public.api_documents_links OWNER TO test;

--
-- Name: api_documents_links_documents_links_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.api_documents_links_documents_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_documents_links_documents_links_id_seq OWNER TO test;

--
-- Name: api_documents_links_documents_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.api_documents_links_documents_links_id_seq OWNED BY public.api_documents_links.documents_links_id;


--
-- Name: api_mst_activities; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.api_mst_activities (
    mst_activity_id integer NOT NULL,
    identifier character varying(20) NOT NULL,
    title text,
    description text,
    activity_status_code integer,
    activity_start_date_type integer,
    planned_activity_start_date date,
    actual_activity_start_date date,
    planned_activity_end_date date,
    activity_end_date_type integer,
    actual_activity_end_date date,
    recipient_country_name character varying(20),
    recipient_country_code character varying(20),
    "recipient_region_Code" integer,
    recipient_region_vocabulary_code integer,
    sector_name character varying(20),
    sector_code character varying(20),
    humanitarian_flag character varying(20),
    collaboration_type_code integer,
    flow_type_code integer,
    finance_type_code integer,
    aid_type_code integer,
    tied_status_code character varying(20),
    other_identifier_reference character varying(20),
    other_identifier_type character varying(20),
    reporting_organisation_identifier text,
    reporting_organisation_type_code text,
    reporting_organisation_name text,
    contact_type text,
    contact_organisation text,
    directorate text,
    programme text,
    contact_email text,
    contact_website text,
    mailing_address text,
    default_currency text,
    last_updated date
);


ALTER TABLE public.api_mst_activities OWNER TO test;

--
-- Name: api_mst_activity_mst_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.api_mst_activity_mst_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_mst_activity_mst_activity_id_seq OWNER TO test;

--
-- Name: api_mst_activity_mst_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.api_mst_activity_mst_activity_id_seq OWNED BY public.api_mst_activities.mst_activity_id;


--
-- Name: api_participating_organisations; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.api_participating_organisations (
    po_identifier_id integer NOT NULL,
    participating_organisation_role_code integer,
    participating_organisation_name character varying(20),
    participating_organisation_id character varying(20),
    participating_organisation_type_code integer,
    activity_identifier_id character varying(20) NOT NULL
);


ALTER TABLE public.api_participating_organisations OWNER TO test;

--
-- Name: api_participating_organisations_po_identifier_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.api_participating_organisations_po_identifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_participating_organisations_po_identifier_id_seq OWNER TO test;

--
-- Name: api_participating_organisations_po_identifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.api_participating_organisations_po_identifier_id_seq OWNED BY public.api_participating_organisations.po_identifier_id;


--
-- Name: api_planned_transactions; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.api_planned_transactions (
    planned_transactions integer NOT NULL,
    planned_disbursement_type_code character varying(20),
    planned_disbursement_value character varying(20),
    transaction_currency numeric(10,2) NOT NULL,
    planned_disbursement_value_date date,
    planned_disbursement_period_start character varying(20),
    planned_disbursement_period_end character varying(20),
    planned_disbursement_provider_organisation_name text,
    transaction_provider_organisation_id character varying(20),
    transaction_provider_organisation_activity_id character varying(20),
    transaction_receiver_organisation_name text,
    transaction_receiver_organisation_id character varying(20),
    transaction_receiver_organisation_activity_id character varying(20),
    activity_identifier_id character varying(20) NOT NULL
);


ALTER TABLE public.api_planned_transactions OWNER TO test;

--
-- Name: api_planned_transections_planned_transections_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.api_planned_transections_planned_transections_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_planned_transections_planned_transections_seq OWNER TO test;

--
-- Name: api_planned_transections_planned_transections_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.api_planned_transections_planned_transections_seq OWNED BY public.api_planned_transactions.planned_transactions;


--
-- Name: api_sectors; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.api_sectors (
    sectors_identifier_id integer NOT NULL,
    sector_name text,
    sector_code text,
    sector_percentage integer,
    sector_vocabulary text,
    activity_identifier_id character varying(20) NOT NULL
);


ALTER TABLE public.api_sectors OWNER TO test;

--
-- Name: api_sectors_sectors_identifier_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.api_sectors_sectors_identifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_sectors_sectors_identifier_id_seq OWNER TO test;

--
-- Name: api_sectors_sectors_identifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.api_sectors_sectors_identifier_id_seq OWNED BY public.api_sectors.sectors_identifier_id;


--
-- Name: api_transactions; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.api_transactions (
    transactions_identifier_id integer NOT NULL,
    transaction_value character varying(20),
    transaction_currency numeric(10,2) NOT NULL,
    transaction_value_date date,
    transaction_date date,
    transaction_description text,
    transaction_type_code character varying(20),
    transaction_provider_organisation_name text,
    transaction_provider_organisation_id character varying(20),
    transaction_provider_organisation_activity_id character varying(20),
    transaction_receiver_organisation_name text,
    transaction_receiver_organisation_id character varying(20),
    transaction_receiver_organisation_activity_id character varying(20),
    activity_identifier_id character varying(20) NOT NULL
);


ALTER TABLE public.api_transactions OWNER TO test;

--
-- Name: api_transactions_transactions_identifier_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.api_transactions_transactions_identifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_transactions_transactions_identifier_id_seq OWNER TO test;

--
-- Name: api_transactions_transactions_identifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.api_transactions_transactions_identifier_id_seq OWNED BY public.api_transactions.transactions_identifier_id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO test;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO test;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO test;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO test;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO test;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO test;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO test;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO test;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO test;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO test;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO test;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO test;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: test
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


ALTER TABLE public.django_admin_log OWNER TO test;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO test;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO test;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO test;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO test;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO test;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO test;

--
-- Name: api_budgets budgets_identifier_id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_budgets ALTER COLUMN budgets_identifier_id SET DEFAULT nextval('public.api_budgets_budgets_identifier_id_seq'::regclass);


--
-- Name: api_documents_links documents_links_id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_documents_links ALTER COLUMN documents_links_id SET DEFAULT nextval('public.api_documents_links_documents_links_id_seq'::regclass);


--
-- Name: api_mst_activities mst_activity_id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_mst_activities ALTER COLUMN mst_activity_id SET DEFAULT nextval('public.api_mst_activity_mst_activity_id_seq'::regclass);


--
-- Name: api_participating_organisations po_identifier_id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_participating_organisations ALTER COLUMN po_identifier_id SET DEFAULT nextval('public.api_participating_organisations_po_identifier_id_seq'::regclass);


--
-- Name: api_planned_transactions planned_transactions; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_planned_transactions ALTER COLUMN planned_transactions SET DEFAULT nextval('public.api_planned_transections_planned_transections_seq'::regclass);


--
-- Name: api_sectors sectors_identifier_id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_sectors ALTER COLUMN sectors_identifier_id SET DEFAULT nextval('public.api_sectors_sectors_identifier_id_seq'::regclass);


--
-- Name: api_transactions transactions_identifier_id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_transactions ALTER COLUMN transactions_identifier_id SET DEFAULT nextval('public.api_transactions_transactions_identifier_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: api_budgets; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.api_budgets (budgets_identifier_id, budget_type_code, budget_period_start_date, budget_currency, budget_period_end_date, budget_value, budget_value_date, budget_status_code, activity_identifier_id) FROM stdin;
\.


--
-- Data for Name: api_documents_links; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.api_documents_links (documents_links_id, "Title", "Category", "Language", "Date", "URL", "Format", activity_identifier_id) FROM stdin;
\.


--
-- Data for Name: api_mst_activities; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.api_mst_activities (mst_activity_id, identifier, title, description, activity_status_code, activity_start_date_type, planned_activity_start_date, actual_activity_start_date, planned_activity_end_date, activity_end_date_type, actual_activity_end_date, recipient_country_name, recipient_country_code, "recipient_region_Code", recipient_region_vocabulary_code, sector_name, sector_code, humanitarian_flag, collaboration_type_code, flow_type_code, finance_type_code, aid_type_code, tied_status_code, other_identifier_reference, other_identifier_type, reporting_organisation_identifier, reporting_organisation_type_code, reporting_organisation_name, contact_type, contact_organisation, directorate, programme, contact_email, contact_website, mailing_address, default_currency, last_updated) FROM stdin;
\.


--
-- Data for Name: api_participating_organisations; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.api_participating_organisations (po_identifier_id, participating_organisation_role_code, participating_organisation_name, participating_organisation_id, participating_organisation_type_code, activity_identifier_id) FROM stdin;
\.


--
-- Data for Name: api_planned_transactions; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.api_planned_transactions (planned_transactions, planned_disbursement_type_code, planned_disbursement_value, transaction_currency, planned_disbursement_value_date, planned_disbursement_period_start, planned_disbursement_period_end, planned_disbursement_provider_organisation_name, transaction_provider_organisation_id, transaction_provider_organisation_activity_id, transaction_receiver_organisation_name, transaction_receiver_organisation_id, transaction_receiver_organisation_activity_id, activity_identifier_id) FROM stdin;
\.


--
-- Data for Name: api_sectors; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.api_sectors (sectors_identifier_id, sector_name, sector_code, sector_percentage, sector_vocabulary, activity_identifier_id) FROM stdin;
\.


--
-- Data for Name: api_transactions; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.api_transactions (transactions_identifier_id, transaction_value, transaction_currency, transaction_value_date, transaction_date, transaction_description, transaction_type_code, transaction_provider_organisation_name, transaction_provider_organisation_id, transaction_provider_organisation_activity_id, transaction_receiver_organisation_name, transaction_receiver_organisation_id, transaction_receiver_organisation_activity_id, activity_identifier_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add sectors	7	add_sectors
20	Can change sectors	7	change_sectors
21	Can delete sectors	7	delete_sectors
22	Can add planned_transections	8	add_planned_transections
23	Can change planned_transections	8	change_planned_transections
24	Can delete planned_transections	8	delete_planned_transections
25	Can add documents_links	9	add_documents_links
26	Can change documents_links	9	change_documents_links
27	Can delete documents_links	9	delete_documents_links
28	Can add mst_activity	10	add_mst_activity
29	Can change mst_activity	10	change_mst_activity
30	Can delete mst_activity	10	delete_mst_activity
31	Can add participating_organisations	11	add_participating_organisations
32	Can change participating_organisations	11	change_participating_organisations
33	Can delete participating_organisations	11	delete_participating_organisations
34	Can add transections	12	add_transections
35	Can change transections	12	change_transections
36	Can delete transections	12	delete_transections
37	Can add budgets	13	add_budgets
38	Can change budgets	13	change_budgets
39	Can delete budgets	13	delete_budgets
40	Can add transactions	14	add_transactions
41	Can change transactions	14	change_transactions
42	Can delete transactions	14	delete_transactions
43	Can add planned_transactions	8	add_planned_transactions
44	Can change planned_transactions	8	change_planned_transactions
45	Can delete planned_transactions	8	delete_planned_transactions
46	Can add mst_activities	10	add_mst_activities
47	Can change mst_activities	10	change_mst_activities
48	Can delete mst_activities	10	delete_mst_activities
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$osdBoFh0pw1T$LlWbi0rKEaOFNlANJnbbKLqNR+5CuhNXl9OK5sUPYD4=	2019-04-20 13:18:02.781078+05:30	t	test				t	t	2019-04-20 13:16:07.712424+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-04-20 13:29:41.144182+05:30	1	mst_activities object	1	[{"added": {}}]	10	1
2	2019-04-20 13:30:05.760532+05:30	2	mst_activities object	1	[{"added": {}}]	10	1
3	2019-04-20 13:30:20.298002+05:30	3	mst_activities object	1	[{"added": {}}]	10	1
4	2019-04-20 13:30:53.30367+05:30	1	participating_organisations object	1	[{"added": {}}]	11	1
5	2019-04-20 14:12:45.32973+05:30	4	mst_activities object	1	[{"added": {}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	api	sectors
9	api	documents_links
11	api	participating_organisations
12	api	transections
13	api	budgets
8	api	planned_transactions
14	api	transactions
10	api	mst_activities
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-04-20 13:15:30.022808+05:30
2	auth	0001_initial	2019-04-20 13:15:30.778096+05:30
3	admin	0001_initial	2019-04-20 13:15:30.955366+05:30
4	admin	0002_logentry_remove_auto_add	2019-04-20 13:15:30.998234+05:30
5	api	0001_initial	2019-04-20 13:15:32.152618+05:30
6	contenttypes	0002_remove_content_type_name	2019-04-20 13:15:32.218651+05:30
7	auth	0002_alter_permission_name_max_length	2019-04-20 13:15:32.24075+05:30
8	auth	0003_alter_user_email_max_length	2019-04-20 13:15:32.274025+05:30
9	auth	0004_alter_user_username_opts	2019-04-20 13:15:32.298013+05:30
10	auth	0005_alter_user_last_login_null	2019-04-20 13:15:32.32955+05:30
11	auth	0006_require_contenttypes_0002	2019-04-20 13:15:32.340376+05:30
12	auth	0007_alter_validators_add_error_messages	2019-04-20 13:15:32.364129+05:30
13	auth	0008_alter_user_username_max_length	2019-04-20 13:15:32.429682+05:30
14	sessions	0001_initial	2019-04-20 13:15:32.606654+05:30
15	api	0002_auto_20190420_0753	2019-04-20 13:23:56.829517+05:30
16	api	0003_auto_20190420_0757	2019-04-20 13:27:18.078055+05:30
17	api	0004_auto_20190420_0931	2019-04-20 15:01:45.033775+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
5hwm9g7viu1rn30soxijusfmdsgbq5y2	ZmU5ZTMyNjM2ZTc5ZjIyMmRmOTU3NzQyM2MwZjMwYTQwZmJhM2YxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjI1ZjgwNTViMTJkNjk4NTJjMGI1NmYyODRlNDZhN2YyNTI0YjNmOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-05-04 13:18:02.828368+05:30
\.


--
-- Name: api_budgets_budgets_identifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.api_budgets_budgets_identifier_id_seq', 1, false);


--
-- Name: api_documents_links_documents_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.api_documents_links_documents_links_id_seq', 1, false);


--
-- Name: api_mst_activity_mst_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.api_mst_activity_mst_activity_id_seq', 4, true);


--
-- Name: api_participating_organisations_po_identifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.api_participating_organisations_po_identifier_id_seq', 1, true);


--
-- Name: api_planned_transections_planned_transections_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.api_planned_transections_planned_transections_seq', 1, false);


--
-- Name: api_sectors_sectors_identifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.api_sectors_sectors_identifier_id_seq', 1, false);


--
-- Name: api_transactions_transactions_identifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.api_transactions_transactions_identifier_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 5, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 17, true);


--
-- Name: api_budgets api_budgets_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_budgets
    ADD CONSTRAINT api_budgets_pkey PRIMARY KEY (budgets_identifier_id);


--
-- Name: api_documents_links api_documents_links_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_documents_links
    ADD CONSTRAINT api_documents_links_pkey PRIMARY KEY (documents_links_id);


--
-- Name: api_mst_activities api_mst_activity_identifier_key; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_mst_activities
    ADD CONSTRAINT api_mst_activity_identifier_key UNIQUE (identifier);


--
-- Name: api_mst_activities api_mst_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_mst_activities
    ADD CONSTRAINT api_mst_activity_pkey PRIMARY KEY (mst_activity_id);


--
-- Name: api_participating_organisations api_participating_organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_participating_organisations
    ADD CONSTRAINT api_participating_organisations_pkey PRIMARY KEY (po_identifier_id);


--
-- Name: api_planned_transactions api_planned_transections_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_planned_transactions
    ADD CONSTRAINT api_planned_transections_pkey PRIMARY KEY (planned_transactions);


--
-- Name: api_sectors api_sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_sectors
    ADD CONSTRAINT api_sectors_pkey PRIMARY KEY (sectors_identifier_id);


--
-- Name: api_transactions api_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_transactions
    ADD CONSTRAINT api_transactions_pkey PRIMARY KEY (transactions_identifier_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: api_budgets_activity_identifier_id_b8f19ec3; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX api_budgets_activity_identifier_id_b8f19ec3 ON public.api_budgets USING btree (activity_identifier_id);


--
-- Name: api_documents_links_activity_identifier_id_8f7a5fe0; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX api_documents_links_activity_identifier_id_8f7a5fe0 ON public.api_documents_links USING btree (activity_identifier_id);


--
-- Name: api_documents_links_activity_identifier_id_8f7a5fe0_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX api_documents_links_activity_identifier_id_8f7a5fe0_like ON public.api_documents_links USING btree (activity_identifier_id varchar_pattern_ops);


--
-- Name: api_mst_activity_identifier_255a9f12_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX api_mst_activity_identifier_255a9f12_like ON public.api_mst_activities USING btree (identifier varchar_pattern_ops);


--
-- Name: api_participating_organi_activity_identifier_id_2865c4b2_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX api_participating_organi_activity_identifier_id_2865c4b2_like ON public.api_participating_organisations USING btree (activity_identifier_id varchar_pattern_ops);


--
-- Name: api_participating_organisations_activity_identifier_id_2865c4b2; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX api_participating_organisations_activity_identifier_id_2865c4b2 ON public.api_participating_organisations USING btree (activity_identifier_id);


--
-- Name: api_planned_transections_activity_identifier_id_a0456d2d; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX api_planned_transections_activity_identifier_id_a0456d2d ON public.api_planned_transactions USING btree (activity_identifier_id);


--
-- Name: api_planned_transections_activity_identifier_id_a0456d2d_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX api_planned_transections_activity_identifier_id_a0456d2d_like ON public.api_planned_transactions USING btree (activity_identifier_id varchar_pattern_ops);


--
-- Name: api_sectors_activity_identifier_id_80f8b61e; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX api_sectors_activity_identifier_id_80f8b61e ON public.api_sectors USING btree (activity_identifier_id);


--
-- Name: api_transactions_activity_identifier_id_397fa9fc; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX api_transactions_activity_identifier_id_397fa9fc ON public.api_transactions USING btree (activity_identifier_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: api_budgets api_budgets_activity_identifier__b8f19ec3_fk_api_mst_a; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_budgets
    ADD CONSTRAINT api_budgets_activity_identifier__b8f19ec3_fk_api_mst_a FOREIGN KEY (activity_identifier_id) REFERENCES public.api_mst_activities(identifier) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_documents_links api_documents_links_activity_identifier__8f7a5fe0_fk_api_mst_a; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_documents_links
    ADD CONSTRAINT api_documents_links_activity_identifier__8f7a5fe0_fk_api_mst_a FOREIGN KEY (activity_identifier_id) REFERENCES public.api_mst_activities(identifier) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_participating_organisations api_participating_or_activity_identifier__2865c4b2_fk_api_mst_a; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_participating_organisations
    ADD CONSTRAINT api_participating_or_activity_identifier__2865c4b2_fk_api_mst_a FOREIGN KEY (activity_identifier_id) REFERENCES public.api_mst_activities(identifier) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_planned_transactions api_planned_transact_activity_identifier__96073072_fk_api_mst_a; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_planned_transactions
    ADD CONSTRAINT api_planned_transact_activity_identifier__96073072_fk_api_mst_a FOREIGN KEY (activity_identifier_id) REFERENCES public.api_mst_activities(identifier) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_sectors api_sectors_activity_identifier__80f8b61e_fk_api_mst_a; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_sectors
    ADD CONSTRAINT api_sectors_activity_identifier__80f8b61e_fk_api_mst_a FOREIGN KEY (activity_identifier_id) REFERENCES public.api_mst_activities(identifier) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_transactions api_transactions_activity_identifier__397fa9fc_fk_api_mst_a; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_transactions
    ADD CONSTRAINT api_transactions_activity_identifier__397fa9fc_fk_api_mst_a FOREIGN KEY (activity_identifier_id) REFERENCES public.api_mst_activities(identifier) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

