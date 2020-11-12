--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2020-11-12 00:45:11

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
-- TOC entry 227 (class 1259 OID 18036)
-- Name: emem_afiliaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emem_afiliaciones (
    idafiliacion text NOT NULL,
    afiliacion text
);


ALTER TABLE public.emem_afiliaciones OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18044)
-- Name: emem_participantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emem_participantes (
    idparticipante text NOT NULL,
    primernombre text,
    segundonombre text,
    primerapellido text,
    segundoapellido text,
    correo text,
    contra text,
    idafiliacion text
);


ALTER TABLE public.emem_participantes OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17791)
-- Name: math_autor_resumen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.math_autor_resumen (
    cedula text NOT NULL,
    nombre text,
    correo text,
    institucion text
);


ALTER TABLE public.math_autor_resumen OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17749)
-- Name: math_bd_articulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.math_bd_articulos (
    id_articulo text NOT NULL,
    titulo text,
    resumen text,
    autores text,
    nombre_revista text,
    volumen text,
    paginas text,
    fecha text,
    objetivos text,
    metodologia text,
    conclusiones text
);


ALTER TABLE public.math_bd_articulos OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17820)
-- Name: math_bibliografia_resumen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.math_bibliografia_resumen (
    id_bibliografia text NOT NULL,
    bibliografia text,
    id_resumen text
);


ALTER TABLE public.math_bibliografia_resumen OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17778)
-- Name: math_palabras_clave; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.math_palabras_clave (
    id_palabra_clave text NOT NULL,
    palabra text,
    id_resumen text
);


ALTER TABLE public.math_palabras_clave OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17757)
-- Name: math_participante_emem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.math_participante_emem (
    cedula text NOT NULL,
    correo text,
    nombre text,
    tipo_participacion text,
    contra text
);


ALTER TABLE public.math_participante_emem OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17765)
-- Name: math_resumen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.math_resumen (
    id_resumen text NOT NULL,
    titulo text,
    resumen text,
    linea text,
    tipo text,
    objetivo text,
    capacidad text,
    materiales text,
    prerequisito text,
    requiere_sala text,
    evaluado text,
    nombre_autor text,
    subtitulo text,
    salon text,
    fecha text,
    id_autor text
);


ALTER TABLE public.math_resumen OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17833)
-- Name: math_resumen_participante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.math_resumen_participante (
    id_participante text NOT NULL,
    id_resumen text
);


ALTER TABLE public.math_resumen_participante OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17801)
-- Name: math_resumenes_autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.math_resumenes_autor (
    id_resumen_autor integer NOT NULL,
    cedula text,
    id_resumen text
);


ALTER TABLE public.math_resumenes_autor OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17799)
-- Name: math_resumenes_autor_id_resumen_autor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.math_resumenes_autor_id_resumen_autor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.math_resumenes_autor_id_resumen_autor_seq OWNER TO postgres;

--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 210
-- Name: math_resumenes_autor_id_resumen_autor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.math_resumenes_autor_id_resumen_autor_seq OWNED BY public.math_resumenes_autor.id_resumen_autor;


--
-- TOC entry 204 (class 1259 OID 17741)
-- Name: math_rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.math_rol (
    id_rol text NOT NULL,
    nombre text
);


ALTER TABLE public.math_rol OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17733)
-- Name: math_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.math_usuario (
    cedula text NOT NULL,
    correo text,
    nombre text,
    contra text
);


ALTER TABLE public.math_usuario OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17725)
-- Name: math_visitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.math_visitas (
    id_visita text NOT NULL,
    contador text
);


ALTER TABLE public.math_visitas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17969)
-- Name: siap_actividades_docentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_actividades_docentes (
    idactividaddocente text NOT NULL,
    actividad text,
    idfunciondocente text
);


ALTER TABLE public.siap_actividades_docentes OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18216)
-- Name: siap_actividades_funciones_docente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_actividades_funciones_docente (
    idactividadprograma text NOT NULL,
    idfuncion text,
    idactividad text,
    idsubactividad text,
    actividad text,
    iddocente integer,
    periodo text,
    horas real,
    calculada text
);


ALTER TABLE public.siap_actividades_funciones_docente OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17935)
-- Name: siap_agendas_servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_agendas_servicios (
    idagendaservicio text NOT NULL,
    iddocente integer,
    idservicioprograma text,
    periodo text,
    numerocontrato text,
    actafacultad text,
    actaprograma text,
    concertada text
);


ALTER TABLE public.siap_agendas_servicios OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18119)
-- Name: siap_areasprofundizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_areasprofundizacion (
    idareaprofundizacion text NOT NULL,
    nombre text
);


ALTER TABLE public.siap_areasprofundizacion OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17854)
-- Name: siap_categoria_docentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_categoria_docentes (
    idcategoriadocente text NOT NULL,
    categoria text
);


ALTER TABLE public.siap_categoria_docentes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17953)
-- Name: siap_configuraciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_configuraciones (
    idconfiguracion text NOT NULL,
    nombredirector text,
    nombredecano text,
    semanassemestre text
);


ALTER TABLE public.siap_configuraciones OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17862)
-- Name: siap_docentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_docentes (
    iddocente integer NOT NULL,
    nombre text,
    correo text,
    telefono text,
    idcategoriadocente text,
    idtipocontrato text,
    activo text,
    documento text
);


ALTER TABLE public.siap_docentes OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18082)
-- Name: siap_egresados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_egresados (
    idegresado text NOT NULL,
    nombre text,
    celular text,
    correo text,
    esegresado text,
    fecha text,
    gradoescolaridad text,
    secretaria text,
    institucion text,
    municipio text,
    cargo text,
    nivellabora text
);


ALTER TABLE public.siap_egresados OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17880)
-- Name: siap_errores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_errores (
    iderror text NOT NULL,
    hora text,
    fecha text,
    procedimiento text,
    mensaje text
);


ALTER TABLE public.siap_errores OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17888)
-- Name: siap_facultades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_facultades (
    idfacultad text NOT NULL,
    facultad text
);


ALTER TABLE public.siap_facultades OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18244)
-- Name: siap_favoritos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_favoritos (
    idfavorito text NOT NULL,
    titulo text,
    icono text,
    ruta text,
    frecuencia integer
);


ALTER TABLE public.siap_favoritos OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17961)
-- Name: siap_funciones_docentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_funciones_docentes (
    idfunciondocente text NOT NULL,
    funcion text
);


ALTER TABLE public.siap_funciones_docentes OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18098)
-- Name: siap_gruposinvestigacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_gruposinvestigacion (
    idgrupoinvestigacion text NOT NULL,
    nombre text,
    sigla text,
    iddirector integer,
    mision text,
    vision text
);


ALTER TABLE public.siap_gruposinvestigacion OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17922)
-- Name: siap_horarios_servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_horarios_servicios (
    idhorarioservicio text NOT NULL,
    dia text,
    inicio text,
    fin text,
    idservicioprograma text,
    salon text
);


ALTER TABLE public.siap_horarios_servicios OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18111)
-- Name: siap_modalidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_modalidades (
    idmodalidad text NOT NULL,
    nombre text
);


ALTER TABLE public.siap_modalidades OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 18208)
-- Name: siap_periodos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_periodos (
    idperiodo text NOT NULL,
    periodo text,
    hormaxcarrera integer,
    hormaxcontrato integer,
    hormaxcatedratico integer
);


ALTER TABLE public.siap_periodos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17896)
-- Name: siap_programas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_programas (
    idprograma text NOT NULL,
    programa text,
    idfacultad text
);


ALTER TABLE public.siap_programas OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17909)
-- Name: siap_servicios_programas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_servicios_programas (
    idservicioprograma text NOT NULL,
    asignatura text,
    idprograma text,
    horas integer,
    aulas text,
    periodo text,
    jornada text,
    grupo text,
    semanas text,
    tipo text
);


ALTER TABLE public.siap_servicios_programas OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17982)
-- Name: siap_subactividades_docentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_subactividades_docentes (
    idsubactividaddocente text NOT NULL,
    subactividad text,
    idactividaddocente text
);


ALTER TABLE public.siap_subactividades_docentes OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17846)
-- Name: siap_tipo_contrato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_tipo_contrato (
    idtipocontrato text NOT NULL,
    contrato text,
    horas text
);


ALTER TABLE public.siap_tipo_contrato OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18127)
-- Name: siap_trabajosgrado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siap_trabajosgrado (
    idtrabajogrado text NOT NULL,
    titulo text,
    estudiante1 text,
    estudiante2 text,
    estudiante3 text,
    idjurado1 integer,
    idjurado2 integer,
    idjurado3 integer,
    iddirector integer,
    idmodalidad text,
    idareaprofundizacion text,
    idgrupoinvestigacion text,
    actapropuesta text,
    fechasustentacion text,
    calificacion text
);


ALTER TABLE public.siap_trabajosgrado OWNER TO postgres;

--
-- TOC entry 2853 (class 2604 OID 17804)
-- Name: math_resumenes_autor id_resumen_autor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_resumenes_autor ALTER COLUMN id_resumen_autor SET DEFAULT nextval('public.math_resumenes_autor_id_resumen_autor_seq'::regclass);


--
-- TOC entry 3101 (class 0 OID 18036)
-- Dependencies: 227
-- Data for Name: emem_afiliaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emem_afiliaciones (idafiliacion, afiliacion) FROM stdin;
azhn-udsg-lupd-ijfv	docente
ytpk-dlqe-bqav-drtx	estudiante
eloi-zqyl-seuj-plea	administrativo
brrr-jzlf-iuvf-jbjb	invitado
\.


--
-- TOC entry 3102 (class 0 OID 18044)
-- Dependencies: 228
-- Data for Name: emem_participantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emem_participantes (idparticipante, primernombre, segundonombre, primerapellido, segundoapellido, correo, contra, idafiliacion) FROM stdin;
1098308059	julián	andrés	rincón	penagos	jarincon@uniquindio.edu.co	donmatematicas	azhn-udsg-lupd-ijfv
\.


--
-- TOC entry 3083 (class 0 OID 17791)
-- Dependencies: 209
-- Data for Name: math_autor_resumen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.math_autor_resumen (cedula, nombre, correo, institucion) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 17749)
-- Dependencies: 205
-- Data for Name: math_bd_articulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.math_bd_articulos (id_articulo, titulo, resumen, autores, nombre_revista, volumen, paginas, fecha, objetivos, metodologia, conclusiones) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 17820)
-- Dependencies: 212
-- Data for Name: math_bibliografia_resumen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.math_bibliografia_resumen (id_bibliografia, bibliografia, id_resumen) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 17778)
-- Dependencies: 208
-- Data for Name: math_palabras_clave; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.math_palabras_clave (id_palabra_clave, palabra, id_resumen) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 17757)
-- Dependencies: 206
-- Data for Name: math_participante_emem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.math_participante_emem (cedula, correo, nombre, tipo_participacion, contra) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 17765)
-- Dependencies: 207
-- Data for Name: math_resumen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.math_resumen (id_resumen, titulo, resumen, linea, tipo, objetivo, capacidad, materiales, prerequisito, requiere_sala, evaluado, nombre_autor, subtitulo, salon, fecha, id_autor) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 17833)
-- Dependencies: 213
-- Data for Name: math_resumen_participante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.math_resumen_participante (id_participante, id_resumen) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 17801)
-- Dependencies: 211
-- Data for Name: math_resumenes_autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.math_resumenes_autor (id_resumen_autor, cedula, id_resumen) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 17741)
-- Dependencies: 204
-- Data for Name: math_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.math_rol (id_rol, nombre) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 17733)
-- Dependencies: 203
-- Data for Name: math_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.math_usuario (cedula, correo, nombre, contra) FROM stdin;
1098308059	jarincon@uniquindio.edu.co	Julián Andrés Rincón Penagos	c6f9fba34b0a1dc18f534f40eb9c1d3b
18492637	hdtoro@uniquindio.edu.co	Hernán Darío Toro Zapata	4adf1aa1d9debfc014bd58a97ece3b89
1094901163	licenciaturaenmatematicas@uniquindio.edu.co	Jhoana Paola Solano Carmona	fd76c1964c7a0c7c25057d259b5aff4c
\.


--
-- TOC entry 3076 (class 0 OID 17725)
-- Dependencies: 202
-- Data for Name: math_visitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.math_visitas (id_visita, contador) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 17969)
-- Dependencies: 225
-- Data for Name: siap_actividades_docentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_actividades_docentes (idactividaddocente, actividad, idfunciondocente) FROM stdin;
yegs-ysif-vlkf-vupc	investigación y/o desarrollo tecnológico	srpe-ooho-opgu-couw
dzns-phqg-tqbf-dyhw	docencia indirecta 	gjer-sgrz-gecn-gxvk
kbkk-licc-laul-dwec	fundamentación	gjer-sgrz-gecn-gxvk
uiwh-ttec-pail-yndb	actividades orgánico complementarias	gjer-sgrz-gecn-gxvk
tndl-wiai-duhz-zade	actividades académico administrativas	gjer-sgrz-gecn-gxvk
qxyf-obgt-tvrt-gwhc	otras actividades académicas	gjer-sgrz-gecn-gxvk
rrzz-jrhg-pfbr-rsny	docencia directa	opab-twsv-tohj-dipx
\.


--
-- TOC entry 3109 (class 0 OID 18216)
-- Dependencies: 235
-- Data for Name: siap_actividades_funciones_docente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_actividades_funciones_docente (idactividadprograma, idfuncion, idactividad, idsubactividad, actividad, iddocente, periodo, horas, calculada) FROM stdin;
yutk-hpyb-rxzt-yobp	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	24575565	2020-1	123	semestrales
vunj-rydr-wtjb-bcks	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor de extesión y desarrollo social: coordinadora slm	41942993	2020-1	3	semanales
vdiu-kanv-pyae-ilcx	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 964	41942993	2020-1	9	semanales
nhld-hrlr-cppx-sthp	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	un trabajo de grado de pregrado	41942993	2020-1	1	semanales
jlva-pnap-wolg-jvou	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	eljk-wywl-ibeg-sgyq	lider grupo sigma	41942993	2020-1	2	semanales
pnbu-ywqz-snoo-ecze	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 954	14241527	2020-1	10	\N
lxry-okze-wlhy-vrfs	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	wchd-ftrn-ezkj-wkrg	proyecto de deserción	41942473	2020-1	10	\N
zebo-zfwg-fjpt-syuo	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	kjji-otcb-tqhk-uuwq	consejo curricular licenciatura en matemáticas	41942473	2020-1	2	\N
hbaj-enxl-svse-psfi	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	un trabajo de grado de maestría	41942473	2020-1	4	\N
sgzt-qhtf-hkis-dsci	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	41942993	2020-1	40	semestrales
edlq-oidp-xwtj-benw	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	pruebas saber pro institucionales	7555071	2020-1	10	semanales
hqlf-afxx-tott-ldtd	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor extensión y proyección social: programa de capacitación docentes de básica	7555071	2020-1	3	semanales
ubad-urpb-ahgl-ehkn	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	41942993	2020-1	21	semestrales
ayjz-awgk-yxbb-rxlw	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor docentes y estudiantes	9734313	2020-1	3	semanales
jnav-nlkd-vuuo-bqnu	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	7555071	2020-1	55	semestrales
zana-ithf-kdpn-klro	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor docentes y estudiantes	24575565	2020-1	3	semanales
gaky-phjv-lgyy-twsg	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	eljk-wywl-ibeg-sgyq	líder laboratorio de didáctica de las matemáticas	24575565	2020-1	4	semanales
qkay-bxay-ejui-tpwb	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	24575565	2020-1	40	semestrales
tyuc-qkfq-odqa-avxt	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 922	9734313	2020-1	8	semanales
npfg-zclr-qsng-zdyu	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 964	9734313	2020-1	8	semanales
preu-xowj-otgk-ihfo	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	9734313	2020-1	40	semestrales
pnxb-rtpp-ulbr-xbex	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	9734313	2020-1	21	semestrales
agyx-izvj-sdku-fnni	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor internacionalización	41923401	2020-1	3	semanales
dpex-rfdu-gsjl-yodp	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	un trabajo de grado pregrado	41923401	2020-1	4	semanales
orur-vtpr-qkhy-kdya	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	eljk-wywl-ibeg-sgyq	representante de la universidad del quindío en la red clema	41923401	2020-1	4	semanales
htja-yzsk-ikiz-kjnp	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	41923401	2020-1	40	semestrales
rzol-cvyn-kaou-dwsv	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	41923401	2020-1	21	semestrales
ekbd-kpxd-utuc-byte	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor extensión y proyección social  (graduados)	29925352	2020-1	3	semanales
gleo-qelw-lpkv-oaeu	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 954	29925352	2020-1	6	semanales
cgow-verj-pyfd-sadh	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	sznl-koef-vskc-drqs	consejo curricular  licenciatura en matemáticas 	29925352	2020-1	2	semanales
kvcz-aqgw-thdy-iork	opab-twsv-tohj-dipx	rrzz-jrhg-pfbr-rsny	afoq-qbib-jtdx-kqwb	coordinadora del club de matemáticas y plan padrino	29925352	2020-1	6	semanales
kpys-tjtp-qykv-yfqa	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	29925352	2020-1	40	semestrales
lkux-vrqg-jbsg-lydq	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	29925352	2020-1	21	semestrales
lhdy-hbbb-yyxs-angc	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor investigación (representante cife)	4377483	2020-1	4	semanales
kwaa-libu-birk-yisg	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	eljk-wywl-ibeg-sgyq	escuela pedagógica	4377483	2020-1	4	semanales
fhyy-pifi-wtla-sotl	gjer-sgrz-gecn-gxvk	qxyf-obgt-tvrt-gwhc	qjwh-fylw-xtap-pwaf	realiza estudios de doctorado	4377483	2020-1	40	semestrales
bucv-qeqr-dycr-noal	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	4377483	2020-1	40	semestrales
lyph-scjr-hujj-nivy	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	4377483	2020-1	134	semestrales
zrck-nuyv-wqpy-tpys	gjer-sgrz-gecn-gxvk	qxyf-obgt-tvrt-gwhc	qjwh-fylw-xtap-pwaf	inicia estudios de doctorado	89000658	2020-1	40	semestrales
sias-odyl-iawe-kbuw	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	dirección de un trabajo de pregrado	89000658	2020-1	2	semanales
lhdl-dewb-cyis-wzxs	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	14241527	2020-1	50	semestrales
ewjx-chla-crrc-qwax	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	41942473	2020-1	177.5	semestrales
feib-lhnw-nwuc-thdy	gjer-sgrz-gecn-gxvk	tndl-wiai-duhz-zade	lzdv-epgh-flqa-eepg	vicerrector de investigaciones resolución de rectoria 7007 del 10 de febrero de 2020	4376943	2021-1	900	semestrales
lpbd-uoxr-vrkc-zxua	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	dirección de 2 trabajos de grado 	10299398	2021-1	4	semanales
inho-yygr-wkhi-konq	gjer-sgrz-gecn-gxvk	qxyf-obgt-tvrt-gwhc	qjwh-fylw-xtap-pwaf	realiza estudios de doctorado propio	89005354	2021-1	20	semanales
hzcd-szwh-jqox-tsnw	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	89000658	2020-1	40	semestrales
yqvy-vbsc-lqix-eexv	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	89000658	2020-1	134	semestrales
dute-adie-zldv-nxix	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	wchd-ftrn-ezkj-wkrg	proyecto sara	41925636	2020-1	3	semanales
buqc-cysz-dkeh-wrlb	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	41925636	2020-1	40	semestrales
elsp-xokp-qldi-eobw	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	41925636	2020-1	89	semestrales
snsz-owog-irvf-fikl	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor procesos académicos	41936057	2020-1	3	semanales
ljdv-gukh-alfa-qtak	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 954	41936057	2020-1	8	semanales
gkqa-dvgn-xfqc-zatg	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	41936057	2020-1	40	semestrales
kdcz-lcij-frgd-zrzf	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	41936057	2020-1	21	semestrales
ktno-gzjg-uakz-vigf	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 955	34322240	2020-1	7	semanales
jdlq-zgfo-gtih-uljg	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 964	34322240	2020-1	7	semanales
czcb-bucz-zqri-viva	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	kjji-otcb-tqhk-uuwq	consejo curricular: asesora extensión desarrollo social	34322240	2020-1	2	semanales
wzzv-affk-eced-sfsc	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	34322240	2020-1	40	semestrales
sriw-uwja-xjpg-kalz	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor de extensión desarrollo social	34322240	2020-1	3	semanales
jkuy-kxkx-vupy-xreb	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	34322240	2020-1	21	semestrales
fxii-qxlu-vyfg-ehcc	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor extensión y desarrollo social: olimpiadas de matemáticas 	10299398	2020-1	3	semanales
aiiu-skkh-kpcg-hsbj	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 984	10299398	2020-1	5	semanales
ozsg-sybj-ytdu-wvok	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 925	10299398	2020-1	8	semanales
xhlk-yjaa-uezk-pokt	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	un trabajo de grado pregrado	10299398	2020-1	2	semanales
xjsy-acja-pfzs-qlki	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	10299398	2020-1	40	semestrales
tghk-okal-rxqj-tabf	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	10299398	2020-1	38	semestrales
enpd-lbay-zonr-yegr	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	un trabajo de grado pregrado 	9734252	2020-1	2	semanales
edlw-lwgk-qprk-rdjf	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor de procesos académicos: siap	9734252	2020-1	3	semanales
szvj-atxr-wszu-dlvk	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	9734252	2020-1	40	semestrales
exqx-bopf-ulzt-svxf	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	9734252	2020-1	55	semestrales
rqne-fota-vqpo-wlzg	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 954	89005354	2020-1	10	semanales
yewr-stte-vjoi-zujf	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	kjji-otcb-tqhk-uuwq	consejo curricular  licencitura en matemáticas y consejo de facultad de ciencias de la educación	89005354	2020-1	4	semanales
yeih-udvi-bsxc-soex	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	un trabajo de grado maestria	89005354	2020-1	4	semanales
opla-xhtc-glcw-ynbi	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor de procesos académicos 	89005354	2020-1	3	semanales
jeox-hwtt-xrtp-sdnl	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	89005354	2020-1	160.5	semestrales
skdi-ntyv-zqgo-ufpr	opab-twsv-tohj-dipx	rrzz-jrhg-pfbr-rsny	ehrl-cfbv-fhhg-ehwv	plan padrino y club de matemáticas	14241527	2020-1	10	semanales
iqty-wbqs-kcia-spue	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 925	33215449	2020-1	10	semanales
tlhg-qnxr-batb-viah	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	wchd-ftrn-ezkj-wkrg	proyecto de deserción 	33215449	2020-1	7	semanales
vyxa-glrb-lwpg-zciu	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	kjji-otcb-tqhk-uuwq	consejo curricular licenciatura en matemáticas 	33215449	2020-1	2	semanales
lioa-tywq-tows-slpr	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor docentes y estudiantes	33215449	2020-1	3	semanales
qdvz-dnun-lfwd-crah	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	33215449	2020-1	101	semestrales
pgbw-fwou-itfq-bkxu	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	tres trabajos de grado pregrado	7520464	2020-1	6	semanales
okfd-etbe-cvoi-fite	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	kjji-otcb-tqhk-uuwq	consejo curricular licenciatura en matemáticas 	7520464	2020-1	2	semanales
abbf-bcxj-gwdf-jfng	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	wchd-ftrn-ezkj-wkrg	semillero competencias genéricas	7520464	2020-1	7	semanales
yayl-bugq-harp-idnu	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	7520464	2020-1	177.5	semestrales
adpx-ikow-tptx-puew	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	un trabajo de grado maestría 	10076903	2020-1	4	semanales
vgdo-qqqx-iujb-fudi	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	cinco trabajos de grado pregrado	10076903	2020-1	10	semanales
trvb-eaec-wgcb-vcpq	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	eljk-wywl-ibeg-sgyq	lider grupo gedes y representante de la erm 	10076903	2020-1	6	semanales
ducj-qtsx-ueux-ykoa	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	sznl-koef-vskc-drqs	factor extensión revista programa	10076903	2020-1	3	semanales
buni-qyfs-aiso-goxh	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	10076903	2020-1	169	semestrales
atsq-xhyw-rltv-fgtn	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 947	18390797	2020-1	10	semanales
litk-vqqi-dzty-hefg	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	18390797	2020-1	177.5	semestrales
lgvk-ciqn-pldg-sdlw	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	sznl-koef-vskc-drqs	factor de procesos académicos: siap	14231147	2020-1	4	semanales
lqzi-cihj-rrvd-lfsz	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	sznl-koef-vskc-drqs	representante del consejo superior 	14231147	2020-1	8	semanales
lxaw-cxec-anpk-fqie	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	14231147	2020-1	138	semestrales
iojw-oivi-crjo-fvvi	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor de procesos académicos 	41939761	2020-1	3	semanales
gcxo-ybcn-qede-dduy	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	eljk-wywl-ibeg-sgyq	lider grupo gedima	41939761	2020-1	3	semanales
toez-hpzu-blip-ohyd	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	sznl-koef-vskc-drqs	coordinadora escuela pedagógica	41939761	2020-1	20	semanales
pdez-gfig-qpuv-ksxg	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	41939761	2020-1	118	semestrales
ssvg-xosw-dkvq-tnkc	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	eljk-wywl-ibeg-sgyq	lider grupo de investigación y asesoría en estadística	25153622	2020-1	4	semanales
nlhs-yjkc-dbrj-fbbq	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	kjji-otcb-tqhk-uuwq	consejo curricular licenciatura en matemáticas  y consejo curricular de biomatemáticas 	25153622	2020-1	5	semanales
tkyf-ojae-tqqn-bvcv	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	wchd-ftrn-ezkj-wkrg	proyecto de deserción	25153622	2020-1	10	semanales
jlee-oddi-otay-ulib	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	25153622	2020-1	169	semestrales
aifv-vuvy-cekj-osbd	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	dos trabajos de grado de maestría	24988906	2020-1	7	semanales
uwjt-qyge-gqza-vstq	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	wchd-ftrn-ezkj-wkrg	proyecto de deserción	24988906	2020-1	10	semanales
dcqc-yhjp-oebp-aoxk	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 870	24988906	2020-1	10	semanales
rbhk-vrzy-xnui-cdqo	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	24988906	2020-1	101	semestrales
uatj-dqvy-sgiu-guih	gjer-sgrz-gecn-gxvk	tndl-wiai-duhz-zade	lzdv-epgh-flqa-eepg	vicerrector de investigaciones	4376943	2020-1	900	semestrales
dqyo-tcyo-ojwr-envt	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	eljk-wywl-ibeg-sgyq	líder grupo eib	42874352	2020-1	4	semanales
etey-tzip-lkvn-aeoe	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 1001	42874352	2020-1	10	semanales
ygwg-pqhr-vwju-poyp	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	un trabajo de grado de maestría 	42874352	2020-1	4	semanales
evhd-vdav-xwfq-atgg	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	42874352	2020-1	101	semestrales
tkqa-exet-jvjf-crhb	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	cuatro trabajos de grado de maestría	7527404	2020-1	8	semanales
kffb-ttib-apac-vupb	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 947	7527404	2020-1	10	semanales
kjub-dsdn-eitw-iwpu	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	un trabajo de grado de doctorado	7527404	2020-1	8	semanales
ulal-gyuj-tkvu-sxsp	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	eljk-wywl-ibeg-sgyq	lider grupo gmme	7527404	2020-1	4	semanales
afsp-iltk-ppba-wxco	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	tres trabajos de grado de pregrado	4374317	2020-1	6	semanales
ndeu-auga-zuuc-wqyh	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	4374317	2020-1	160.5	semestrales
vpws-dnjv-lkfl-tlpk	gjer-sgrz-gecn-gxvk	tndl-wiai-duhz-zade	lzdv-epgh-flqa-eepg	dirección maestría en biomatemáticas 	4573818	2020-1	20	semanales
fsnp-jnbw-hbbk-cjbs	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	wchd-ftrn-ezkj-wkrg	proyecto de deserción	4573818	2020-1	3	semanales
rruz-czvf-hohl-icra	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	4573818	2020-1	169	semestrales
poyx-fdul-swzo-rjhw	gjer-sgrz-gecn-gxvk	tndl-wiai-duhz-zade	lzdv-epgh-flqa-eepg	dirección licenciatura en matemáticas	18492637	2020-1	19	semanales
kcos-dosi-aych-cjit	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 922	18492637	2020-1	10	semanales
syzi-hppf-rowk-cnvi	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	tres  trabajos de grado maestría 	18492637	2020-1	12	semanales
vkkz-bsvp-rwtf-avgz	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	18492637	2020-1	33	semestrales
ahnp-faxz-vhwl-lbeg	gjer-sgrz-gecn-gxvk	qxyf-obgt-tvrt-gwhc	uwvg-vyqq-tbgp-xtuo	doctorado en ingeniería	18397252	2020-1	900	semestrales
jugj-owkw-pasw-wgqt	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	7527404	2020-1	54	semestrales
koak-fika-hixt-gtng	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	7555071	2020-1	40	semestrales
bzwe-woir-ebbh-atje	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 954	14241527	2021-1	10	semanales
enlp-fhlu-gfxf-ajps	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	14241527	2021-1	50	semestrales
wjsj-rsno-ywpv-rqyd	opab-twsv-tohj-dipx	rrzz-jrhg-pfbr-rsny	afoq-qbib-jtdx-kqwb	proyecto de extensión: olimpiadas	10299398	2021-1	7	semanales
vpej-xnlu-ybrb-pxbl	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor extensión y desarrollo social	10299398	2021-1	3	semanales
siqe-naql-nanr-deyo	srpe-ooho-opgu-couw	yegs-ysif-vlkf-vupc	clzo-xxxa-nzoq-idhn	proyecto 984	10299398	2021-1	5	semanales
zehw-ccon-cgru-xrgd	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	kjji-otcb-tqhk-uuwq	consejo curricular licenciatura en matemáticas 	33215449	2021-1	3	semanales
lxir-aysp-nebq-hars	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor docentes y estudiantes	33215449	2021-1	3	semanales
uidr-arab-ivft-ybog	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	sznl-koef-vskc-drqs	coordinación de asesorías programa de apoyo para el Éxito escolar - praex	33215449	2021-1	10	semanales
qsvq-upuu-pekc-yfoy	opab-twsv-tohj-dipx	rrzz-jrhg-pfbr-rsny	afoq-qbib-jtdx-kqwb	proyecto de extensión: olimpiadas de matemáticas	9734313	2021-1	10	semanales
tnvj-nkjv-qasj-ersn	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	33215449	2021-1	160.5	semestrales
pltc-fsga-rvdt-avet	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	tytf-eerz-wvzu-tnwr	factor docentes y estudiantes	9734313	2021-1	3	semanales
wuck-dbjp-jbhx-abpu	opab-twsv-tohj-dipx	rrzz-jrhg-pfbr-rsny	afoq-qbib-jtdx-kqwb	plan padrino y club de matemáticas	14241527	2021-1	10	semanales
ssyv-xkzb-fovc-tetk	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	un estudiante de pregrado y un estudiante de maestría	9734313	2021-1	6	semanales
vlpt-ijfz-vkkb-xrtt	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	9734313	2021-1	101	semestrales
hzwu-tjhs-czjd-flsa	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	yjpz-ufhq-vgcr-rvar	semana intersemestral	9734313	2021-1	40	semestrales
ilgt-rzev-irbw-hyin	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	kjji-otcb-tqhk-uuwq	representante del consejo superior 	14231147	2021-1	10	semanales
wkyd-ekds-cyzd-axtw	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	14231147	2021-1	172	semestrales
suik-woag-bycd-fnvv	opab-twsv-tohj-dipx	rrzz-jrhg-pfbr-rsny	afoq-qbib-jtdx-kqwb	olimipadas de matemáticas	18390797	2021-1	10	semanales
rryj-iirb-aewf-xkjo	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	18390797	2021-1	180	semestrales
gapw-xlba-korr-dlny	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	kjji-otcb-tqhk-uuwq	consejo curricular licenciatura en matemáticas	41942473	2021-1	3	semanales
flsh-ypsf-npxj-gbrz	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	kjji-otcb-tqhk-uuwq	consejo curricular licenciatura en matemáticas y maestría en biomatemáticas	25153622	2021-1	8	semanales
tppf-jjke-swdv-psyf	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	eljk-wywl-ibeg-sgyq	lider grupo de investigación y asesoría en estadística	25153622	2021-1	4	semanales
xirv-fyfu-pcdh-zygw	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	wchd-ftrn-ezkj-wkrg	programa de apoyo a la permanencia de los estudiantes	25153622	2021-1	4	semanales
axyp-izju-zqal-sdgq	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	un trabajo de grado de pregrado y tres estudiantes de posgrado	7527404	2021-1	14	semanales
jjeb-gkra-vpcl-oxwd	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	eljk-wywl-ibeg-sgyq	lider grupo gmme	7527404	2021-1	5	semanales
svqq-wrhv-zdpb-banw	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	7527404	2021-1	171	semestrales
zaue-txzt-fcgs-ebpt	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	25153622	2021-1	152	semestrales
paxl-gunr-uudr-ifuw	gjer-sgrz-gecn-gxvk	dzns-phqg-tqbf-dyhw	voeb-ojkp-zesn-vkzk	dos trabajo de grado de maestría	41942473	2021-1	8	semanales
ygrd-whtz-oyjk-reol	gjer-sgrz-gecn-gxvk	uiwh-ttec-pail-yndb	sznl-koef-vskc-drqs	programa de acompañamiento hacia el éxito escolar - praex	41942473	2021-1	8	semanales
zbio-fwyy-ysia-rfvq	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	41942473	2021-1	169	semestrales
yker-izdu-wzbb-kers	gjer-sgrz-gecn-gxvk	kbkk-licc-laul-dwec	fpcp-hbka-ryrs-oxrv	fundamentación	89005354	2021-1	180	semestrales
\.


--
-- TOC entry 3096 (class 0 OID 17935)
-- Dependencies: 222
-- Data for Name: siap_agendas_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_agendas_servicios (idagendaservicio, iddocente, idservicioprograma, periodo, numerocontrato, actafacultad, actaprograma, concertada) FROM stdin;
uiws-jklg-qtao-wyyh	41923401	awcd-kswv-otnk-dijv	2021-1	\N	\N	\N	\N
splx-soza-utch-wohi	41923401	ofbj-jcfy-qaqh-haae	2021-1	\N	\N	\N	\N
suqi-dbup-tuph-qxsc	41923401	rhpu-qtpa-gojd-dkra	2021-1	\N	\N	\N	\N
csru-irww-ejnc-srws	89000658	znte-brqb-qlwi-lnkj	2021-1	\N	\N	\N	\N
rwgl-qzfk-kpbe-uoee	1094883945	bjuh-zaxq-cxvz-eibs	2020-1	\N	\N	\N	\N
ctng-lqis-tyrj-oozp	1094883945	otvp-yeqv-ouan-gbss	2020-1	\N	\N	\N	\N
hrrn-ghgk-jutb-psen	1094883945	wwnp-rdaj-ecrj-vscu	2020-1	\N	\N	\N	\N
vovn-oydx-fbqu-qdpa	1094883945	qaqc-ldaf-youp-xdyh	2020-1	\N	\N	\N	\N
aczq-jlbn-sxon-iqrh	1097388835	odjz-wccq-hqzu-rfvo	2020-1	\N	\N	\N	\N
dlhy-fyvh-hgbu-wwxj	1097388835	beqj-gwlx-kvuo-jzhy	2020-1	\N	\N	\N	\N
ijfs-drpf-hejv-rygb	1097388835	iufw-qdlq-zptd-dzzb	2020-1	\N	\N	\N	\N
rftk-jeqp-dbdp-fkqh	1097388835	rxka-zhuz-vvyv-ynue	2020-1	\N	\N	\N	\N
bspq-ektv-xybd-yyrp	41940483	eijz-dbee-ujge-hxec	2020-1	\N	\N	\N	\N
tlib-vfvg-vukt-pize	41940483	kcbl-nkdc-hbpe-euhd	2020-1	\N	\N	\N	\N
irwb-aijd-gsqv-plyc	1094939160	ijri-ajfi-eyin-awdb	2020-1	\N	\N	\N	\N
yulk-julb-wovo-iuvx	1094939160	xblr-vnkp-yliz-bqkc	2020-1	\N	\N	\N	\N
sfrc-plje-hohl-fusb	1094939160	xkdy-xtys-eigj-jaql	2020-1	\N	\N	\N	\N
lbbp-uuud-pptu-cvof	1094939160	yral-ossi-zqho-nuku	2020-1	\N	\N	\N	\N
ayst-pgay-ejaw-qwcg	1094939160	lhjy-wtzx-nbhe-wefy	2020-1	\N	\N	\N	\N
nvqb-nerh-vjzp-uucp	41941948	ylcn-nrcv-fxze-valq	2020-1	\N	\N	\N	\N
lwkl-zzci-olbr-jzsj	41941948	issk-lgbq-cbns-ycfe	2020-1	\N	\N	\N	\N
unhg-tpow-hfdn-sfxf	41941948	ckuj-hkxa-igpx-cuhn	2020-1	\N	\N	\N	\N
bavr-neqt-jbnc-gqtw	1094917238	zywd-zusv-xhjr-vqez	2020-1	\N	\N	\N	\N
vvfb-xxyr-jbga-gxgp	1094917238	dffe-qdhe-lifx-eslg	2020-1	\N	\N	\N	\N
cykk-znwi-ykpx-oxvh	1094917238	oqgj-spzt-adyd-ljsr	2020-1	\N	\N	\N	\N
jihp-tfty-vszx-kwsk	1094917238	nxbx-rfcv-xjck-gkxr	2020-1	\N	\N	\N	\N
okzr-bhho-doxj-tieb	1094917238	hslz-ldro-whjc-hlhw	2020-1	\N	\N	\N	\N
rudw-vcpt-jyxy-khfd	1094917238	inli-zdig-ngbq-lnle	2020-1	\N	\N	\N	\N
esjj-wggd-ajat-eegs	18419628	ajvr-utut-flnx-zluh	2020-1	\N	\N	\N	\N
xqdz-vuen-gfzj-fxgv	18419628	rcbb-obaf-rvdp-vrbt	2020-1	\N	\N	\N	\N
ksur-tqog-scvq-briz	18419628	wtuv-exhe-tsup-jxkf	2020-1	\N	\N	\N	\N
jevo-otji-pcca-kxhq	18419628	ptel-nreb-uily-husp	2020-1	\N	\N	\N	\N
jyoe-ahcx-kvrz-qxwi	18419628	qpwo-chpe-pdso-zbrb	2020-1	\N	\N	\N	\N
dwws-cpdb-gdkf-julu	18419628	houf-pkgo-fogk-fqbe	2020-1	\N	\N	\N	\N
wbxb-neru-opbq-gnfi	9736231	nhpd-cind-hywx-carb	2020-1	\N	\N	\N	\N
wleu-bzdf-shzl-qdci	9736231	qbki-fwjz-jzki-nnyx	2020-1	\N	\N	\N	\N
hbay-ncvo-azgc-yope	7527404	dnhk-wnxb-xkut-rqwo	2020-1	\N	\N	\N	\N
ixde-kgxx-izsc-teca	7527404	qaht-ndpr-yifg-suiu	2020-1	\N	\N	\N	\N
nfag-pflw-hiqs-hpwx	89005354	ucjo-tbhf-thla-yhea	2020-1	\N	\N	\N	\N
zyla-lcpc-qjvf-befr	89005354	izvu-hfal-yhap-dfyx	2020-1	\N	\N	\N	\N
xids-fehq-wrhl-rppa	14241527	ihca-jzes-xkpy-nurh	2020-1	\N	\N	\N	\N
xgaq-pcgg-rsoh-nyjg	14241527	crfb-zbzt-hbbo-agpe	2020-1	\N	\N	\N	\N
dbxo-grbp-cbej-lsac	14231147	lyjo-kkhu-ozah-owfn	2021-1		\N	\N	\N
ehxy-osyn-drrz-elbv	1098308059	kuzl-expi-foxo-frhr	2021-1	890820			no
crro-trly-lhhi-hfgl	1098308059	aqeb-hthj-vdwt-hcbj	2021-1	890820			no
hecl-qxio-zghc-yxzh	14241527	ezvu-wwlk-gzdu-qtdz	2020-1	\N	\N	\N	\N
ksqr-irrx-bjgh-esno	41942473	dzwq-zjaf-xuxr-nhkb	2020-1	\N	\N	\N	\N
sofz-qlnc-hwhw-ytef	41942473	pzgs-ojtu-haxp-qioj	2020-1	\N	\N	\N	\N
tnro-bdtn-ciez-okpy	1097393766	ktwl-hybe-wcpg-kdje	2020-1	\N	\N	\N	\N
okxr-ykbj-irlk-kjej	1097393766	orib-npox-fasu-wzya	2020-1	\N	\N	\N	\N
ilrr-lsct-yyzb-efxg	18390797	ajww-ecvx-yywl-dxuk	2021-1		\N	\N	\N
kvya-lhii-fthn-pnsx	18390797	rfrb-grau-opbn-fzev	2021-1		\N	\N	\N
ykup-lljv-gwsw-djid	41942473	kwlh-ahzn-gfrw-kvrc	2021-1		\N	\N	\N
jicw-sgwh-tzwq-vniu	14231147	nnxh-pqeu-nujf-jgrh	2021-1		\N	\N	\N
hrfd-erkg-rvsb-ojoe	14231147	dfep-ngaj-nait-lett	2021-1		\N	\N	\N
iwcu-twbq-hwgh-hvdi	10076903	aqqy-grso-atza-bnyr	2021-1	\N	\N	\N	\N
fklg-wxbt-thjn-cgpl	10076903	xtwt-zucb-enyz-dxbw	2021-1	\N	\N	\N	\N
vozh-fbap-dpzo-onik	24988906	uada-lhoo-uwnb-puja	2021-1		\N	\N	\N
zjnp-uqxh-wsot-njsl	24988906	xkrk-xriq-cfrp-fuwc	2021-1		\N	\N	\N
ygif-yudg-thry-nxiz	89005354	winj-woxv-kkvh-xrfy	2021-1		\N	\N	\N
jxzp-txcw-kfhr-cfsn	89005354	zrpq-sxri-ufnl-ycsi	2021-1		\N	\N	\N
sxvo-etsj-qfag-ynro	7520464	ckjz-gdug-jedp-rryt	2021-1		\N	\N	\N
gzjq-obbn-cufq-wdgk	7520464	bruw-uttv-rgyv-ywft	2021-1		\N	\N	\N
nhxr-xwby-wuqi-szrq	18397252	fsuy-lqng-ajsr-nlzd	2021-1		\N	\N	\N
gasd-wexn-dxaa-vsjy	41939761	oihj-fnly-bvfz-wbsj	2021-1		\N	\N	\N
nenh-fqnt-iyxv-clvq	41939761	yhxk-lqvs-qpod-fvla	2021-1		\N	\N	\N
idan-kwgw-xylc-asqa	33215449	ezzh-qlwz-awhf-wtke	2021-1		\N	\N	\N
geeh-ylgk-sqhq-onti	4377483	atku-efcp-tuaa-ywuu	2021-1	\N	\N	\N	\N
otbx-fbqf-qlxl-dtnk	4377483	xrjn-pnxi-iexx-wtei	2021-1	\N	\N	\N	\N
tyyr-ytqb-vbxs-bykj	4377483	hwtp-gkzo-pfuy-qaby	2021-1	\N	\N	\N	\N
jucv-hbcu-cqrq-pwgh	9734313	cyht-qfwg-qqqt-gyry	2021-1	\N	\N	\N	\N
okbl-jcxb-qbtj-gujc	29925352	lkfe-iqqn-grnl-kpoz	2021-1		\N	\N	\N
koni-obyq-zwvq-osfk	29925352	yidu-kaft-khpb-gpsh	2021-1		\N	\N	\N
xxxa-zkja-pjrh-utnh	29925352	ftzd-flks-opcr-lwva	2021-1		\N	\N	\N
ccua-yufg-winv-dppf	41936057	chir-nbnu-awlg-vxur	2021-1		\N	\N	\N
akrx-jhdn-pgjq-nrjv	34322240	gieg-hokz-xyhv-iwcw	2021-1	\N	\N	\N	\N
vluj-buvu-baav-nnio	34322240	dril-jdkz-dtvi-zklp	2021-1	\N	\N	\N	\N
uutg-kirx-cphx-lryo	10299398	tovc-lsou-npyv-excr	2021-1		\N	\N	\N
ornk-fjlt-pqzn-enrp	10299398	vqgk-eujf-ravj-awnj	2021-1		\N	\N	\N
uzxp-pkzi-noif-jron	1097388835	yuuf-xzqe-xter-pipy	2021-1	\N	\N	\N	\N
aaye-bhbe-awxh-rjgg	41940483	cbcs-whsx-vkpl-slop	2021-1		\N	\N	\N
htah-kuvc-vzyk-wkaf	1094939160	nuhe-qdbc-dhby-slio	2021-1	\N	\N	\N	\N
opnw-hxcc-wavv-ofqg	18419628	uoar-geuv-cqss-boxl	2021-1	\N	\N	\N	\N
wawj-ohsa-syyf-kpzb	18419628	yluh-ecyj-bcgf-diqd	2021-1	\N	\N	\N	\N
jdnu-ulrq-iaso-qdvv	9736231	lbhx-agvz-qoog-urvz	2021-1		\N	\N	\N
jetn-ohhr-fwxg-oydo	9736231	ktyx-huia-tpgo-pcba	2021-1		\N	\N	\N
epyk-naie-zspw-dajp	1097393766	lvpi-pkeu-rriw-lnok	2020-1	\N	\N	\N	\N
hskh-wbyd-ksgr-bxgc	1097393766	orkb-jlat-utwb-xtkr	2020-1	\N	\N	\N	\N
guzz-zrrt-ypix-jniy	1097393766	vitk-chng-xyjb-giqd	2020-1	\N	\N	\N	\N
aqqv-vqyz-urbp-azpq	1098308059	kekl-rukt-xabe-yheb	2020-1	890820	\N	\N	\N
ltcb-qchu-yusn-ioio	1098308059	czvl-wftx-xguc-lfwh	2020-1	890820	\N	\N	\N
lsqi-bufv-obzg-uwtn	1098308059	zalc-fjjg-bytg-pgzj	2020-1	890820	\N	\N	\N
sdcg-iieg-tfdr-fhbi	1098308059	ilop-jpiy-wwds-ddip	2020-1	890820	\N	\N	\N
vjvo-ivhe-cnil-dtsa	1098308059	hjyh-oiph-icww-tdpw	2020-1	890820	\N	\N	\N
auhr-wlxd-nopk-hpny	41955806	sxoo-qvro-jzyt-rlzf	2020-1	\N	\N	\N	\N
yfuh-pevs-uzvs-qdjc	41955806	eerh-fjgh-yfoy-wuis	2020-1	\N	\N	\N	\N
pagj-hvsg-zaqv-nyon	1094885810	ugqd-vepf-hkxy-hqnv	2020-1	\N	\N	\N	\N
ohpc-aeey-odzk-zaee	1094885810	tesu-iycj-geew-ztye	2020-1	\N	\N	\N	\N
nepr-ysjs-uxhl-bzst	9728300	ruqa-ppnb-ckat-lskc	2020-1	\N	\N	\N	\N
uozo-ouwe-pbej-lhhu	9728300	nrqj-luxz-hkrb-kdgt	2020-1	\N	\N	\N	\N
kqki-pkcu-pkds-elje	9728300	qpur-xoog-staq-dapj	2020-1	\N	\N	\N	\N
aqqh-vaaw-afvt-toqs	1094943016	hydf-yzdp-froz-fgfj	2020-1	\N	\N	\N	\N
izhh-qkdc-bbwd-wzbg	1094943016	oewx-kkhi-ipvx-djcu	2020-1	\N	\N	\N	\N
otrl-xctl-swou-vbfs	1094943016	janr-tndi-urcf-rvwz	2020-1	\N	\N	\N	\N
ozfu-vyap-fdce-rspd	41960506	gftg-hbsr-yfvn-ldzd	2020-1	\N	\N	\N	\N
uosf-eocw-sckj-xhwn	41960506	zvll-qfur-fdle-xjae	2020-1	\N	\N	\N	\N
xdlb-kjvz-cokq-ucfv	41960506	atql-evyo-inga-khjv	2020-1	\N	\N	\N	\N
alhs-hpez-tvus-whiu	41960506	ovve-dhsz-ufyv-qsqk	2020-1	\N	\N	\N	\N
qbrc-zxli-zneb-ztys	1094943829	fxps-xkyo-lfbd-iahw	2020-1	\N	\N	\N	\N
xrjd-xitj-pprg-weso	1094943829	jtfg-skwf-jeie-voen	2020-1	\N	\N	\N	\N
jihq-iisd-bdup-wldy	1094943829	wdlw-htrw-hqed-hknp	2020-1	\N	\N	\N	\N
lkfi-cujh-jjps-bsfx	1094937951	cnxi-xhye-gpeo-jzjj	2020-1	\N	\N	\N	\N
pdbj-jyzi-fcfi-zgaq	1094937951	tnur-ljrb-wodw-yfox	2020-1	\N	\N	\N	\N
ftdf-vbkb-aync-zjxt	1094937951	lnlk-vkil-dxcy-vnuy	2020-1	\N	\N	\N	\N
vchx-cpeh-ifxy-iptp	1085314192	abac-rpki-ahzq-vucr	2020-1	\N	\N	\N	\N
fcgq-upuk-jlsa-jnva	1085314192	ceqh-sifz-wukj-vfyg	2020-1	\N	\N	\N	\N
nfyf-jxvp-ncwc-fesl	1094929034	ezpl-yozv-axey-azqi	2020-1	\N	\N	\N	\N
geff-ewut-kdxv-eutd	1094929034	yihj-ysvt-erhi-yspb	2020-1	\N	\N	\N	\N
jnde-stoq-giaf-padk	1094929034	nxsf-buxf-fifw-bkyi	2020-1	\N	\N	\N	\N
bbwx-waab-vgvf-hxrr	1115084944	ynre-uojd-zxiy-weau	2020-1	\N	\N	\N	\N
awsq-zhaz-dnfz-jpgs	1115084944	ircl-prra-oiwi-budt	2020-1	\N	\N	\N	\N
trai-bwpd-vpjz-luci	1094915874	hpnw-ebuc-uwts-vrig	2020-1	\N	\N	\N	\N
obrx-lzdc-rzfy-ishh	7555071	ufap-uzde-pjpw-zisu	2020-1	\N	\N	\N	\N
ypar-vyay-ednp-lzlh	7555071	uqje-prpv-rcbf-bglh	2020-1	\N	\N	\N	\N
rlbz-bsvu-bent-hlvu	7555071	qspi-durx-bvhx-nhpr	2020-1	\N	\N	\N	\N
vkgx-sdub-snri-awqa	24575565	tlzc-dwyw-flxa-lzbv	2020-1	\N	\N	\N	\N
spqk-dggt-lifj-fdcw	24575565	grep-inwu-cbhi-iyro	2020-1	\N	\N	\N	\N
affx-zjrn-vtey-yhul	24575565	gtdo-nvdo-xqgx-dlll	2020-1	\N	\N	\N	\N
xked-jyuk-oacd-heir	24575565	vjuz-ehal-sneg-ljsx	2020-1	\N	\N	\N	\N
wqvk-iacz-pstq-nlfu	41942993	xigz-ipbo-jypd-qlfz	2020-1	\N	\N	\N	\N
xdbr-xcha-dvor-nicv	41942993	rubd-blbg-tglv-ogxu	2020-1	\N	\N	\N	\N
wwty-nbdp-uqpi-yztn	41942993	cxwr-lsry-khgk-ndvg	2020-1	\N	\N	\N	\N
sleg-hupj-hkqi-czfy	41942993	cgsi-obwi-pxhq-rolq	2020-1	\N	\N	\N	\N
lbzw-neil-ywdd-yysx	9734313	enqk-rjuc-wbea-nqqf	2020-1	\N	\N	\N	\N
dhwk-qqfx-wbox-tlcn	9734313	hydk-ipkv-cvfa-jabh	2020-1	\N	\N	\N	\N
eybx-bfkr-vrhd-dvtg	9734313	jgjn-rujg-xlpn-ragq	2020-1	\N	\N	\N	\N
ywfj-dast-kjgg-newo	41923401	kcnv-qkwn-ixig-ddks	2020-1	\N	\N	\N	\N
qtls-ynkn-tfeu-nuiw	41923401	hpao-bjow-vzor-nhew	2020-1	\N	\N	\N	\N
dgjs-ktrt-xnyz-rtfq	41923401	ppqq-xryy-rziv-akcj	2020-1	\N	\N	\N	\N
cjbw-kcij-dtrp-pzry	41923401	rbja-ynoi-jvok-pyko	2020-1	\N	\N	\N	\N
zble-nyvn-bxhz-txzr	29925352	ityc-inpi-cdnl-fhlw	2020-1	\N	\N	\N	\N
whtn-hkcx-anvw-qelj	29925352	jlkx-cnpv-phje-wynt	2020-1	\N	\N	\N	\N
kyxk-byln-bnzk-jtgr	29925352	tqbu-yqtl-eggk-ksiw	2020-1	\N	\N	\N	\N
bjkl-cqzk-rwyw-zcts	4377483	zrgd-dlpq-xerh-btgc	2020-1	\N	\N	\N	\N
asio-gbnb-fkux-kksn	4377483	ecgy-vbqs-dxfh-owtl	2020-1	\N	\N	\N	\N
dasf-egpt-ctyi-snuj	4377483	bgnk-zyzn-qjqu-cezx	2020-1	\N	\N	\N	\N
kafw-vxuy-tygz-uvkk	4377483	thib-prct-nfcu-uevs	2020-1	\N	\N	\N	\N
wojv-pgde-xkwt-lgng	89000658	ivnl-qiix-aasq-ayai	2020-1	\N	\N	\N	\N
oirx-hvcg-faid-dtzu	89000658	hhdh-dcsw-jqyg-updj	2020-1	\N	\N	\N	\N
btdt-ysuv-wnuu-jhzi	89000658	ywpx-gsgz-dyhf-lkln	2020-1	\N	\N	\N	\N
stqc-xecb-lixd-qcyx	89000658	qwwk-ezzj-sjeg-hgke	2020-1	\N	\N	\N	\N
wruv-qqlo-xfuf-plkp	41925636	ukki-guyt-iaua-hvqi	2020-1	\N	\N	\N	\N
xfyd-anil-vnks-cyzu	41925636	ofjk-satj-zped-yfqe	2020-1	\N	\N	\N	\N
okra-ewdu-sstp-gipr	41925636	rpph-ejbu-axxv-jxrw	2020-1	\N	\N	\N	\N
ouyv-zdra-into-ingx	41925636	eqsi-fwnx-riwb-jcib	2020-1	\N	\N	\N	\N
ejay-lbsx-yzxc-poxy	41925636	ytrs-fuaj-xkhn-bguq	2020-1	\N	\N	\N	\N
uhks-qzit-akti-nbcj	41936057	tycg-hgcu-xwpr-vayx	2020-1	\N	\N	\N	\N
gsfg-npqx-qnik-pxab	41936057	qeaf-oggy-rpso-ckuh	2020-1	\N	\N	\N	\N
fjva-srnz-hzhc-zaag	41936057	sjtl-uiic-fuwg-ysnk	2020-1	\N	\N	\N	\N
uxdr-ulgy-nyjs-nerx	41936057	cnjy-idgx-ajcl-rxii	2020-1	\N	\N	\N	\N
rfis-yvyd-gvwz-sxfb	34322240	zykj-udch-pfen-tgft	2020-1	\N	\N	\N	\N
fbgs-ykjk-ybey-ogrs	34322240	erxw-dakb-sxty-bsjw	2020-1	\N	\N	\N	\N
nzrb-uphd-gsko-npah	34322240	uywz-jtbf-rqdk-nfxz	2020-1	\N	\N	\N	\N
xelg-vkdf-iafz-qhqb	10299398	iwyg-ifzv-jolu-rsje	2020-1	\N	\N	\N	\N
swxs-opqf-fxax-xaxp	10299398	hrjk-qncb-rtib-bvts	2020-1	\N	\N	\N	\N
joqk-dwxi-fzsr-yayc	10299398	rvrl-rxfg-aseq-kfbj	2020-1	\N	\N	\N	\N
siyi-gflg-fjtz-eogk	9734252	bqlv-seyf-creb-fxyn	2020-1	\N	\N	\N	\N
cwah-ccjq-kyiv-uxls	9734252	cdzc-wano-wdhf-eqyp	2020-1	\N	\N	\N	\N
qvvt-szzj-ncjv-suuk	9734252	dskh-lowy-jlaj-kfva	2020-1	\N	\N	\N	\N
iojk-klhg-vnrw-bnxx	9734252	rxsd-lkgu-vrge-aatx	2020-1	\N	\N	\N	\N
kcco-lori-xlgu-uihy	9734252	rkrz-ddrq-krdq-ipao	2020-1	\N	\N	\N	\N
pfde-yksb-lxnh-yxcx	33215449	qsil-altg-xjkx-dvaw	2020-1	\N	\N	\N	\N
kadj-lcxc-jroq-dais	33215449	onri-tjag-axhj-hvii	2020-1	\N	\N	\N	\N
zxsu-cjcg-gtpb-ouwq	7520464	lcrs-unsg-qgqq-jtwx	2020-1	\N	\N	\N	\N
vqxv-qocq-uwii-ltuo	7520464	ugar-ctwb-hcdo-rczn	2020-1	\N	\N	\N	\N
aonu-gtpe-ituf-nkaz	7520464	xcto-hvkz-tlfg-zgjo	2020-1	\N	\N	\N	\N
locw-xwup-jjno-dvhq	10076903	fdjz-gtij-zcvf-dnrw	2020-1	\N	\N	\N	\N
pgqb-xush-phur-ibsa	10076903	xshg-lavi-pzzs-dtkp	2020-1	\N	\N	\N	\N
gidx-algn-rsgj-ypfk	18390797	oadu-ffoc-ixic-zgoy	2020-1	\N	\N	\N	\N
pddu-fctx-jyyq-yeyb	18390797	pwdq-asiu-nwol-nyrp	2020-1	\N	\N	\N	\N
pade-arib-fsvx-zpaz	18390797	kjsv-zjxf-ypgz-rgdq	2020-1	\N	\N	\N	\N
yxnt-waju-thzt-nzss	14231147	oiai-jjbr-xbwb-yzlg	2020-1	\N	\N	\N	\N
pytz-vcwl-wecj-wzdw	14231147	kayh-ikbf-bord-ovjd	2020-1	\N	\N	\N	\N
woze-tzzj-ufcu-ncpp	14231147	hhii-rkxs-jjzr-ljkb	2020-1	\N	\N	\N	\N
fdhg-wsly-jwxw-snin	14231147	zqnb-leky-kszf-juyq	2020-1	\N	\N	\N	\N
etok-ickr-budi-xrxj	41939761	pubp-rruu-fnjx-iwdu	2020-1	\N	\N	\N	\N
sbhc-iucd-prtl-otvq	41939761	jozx-pfhg-nspb-xeji	2020-1	\N	\N	\N	\N
zruj-fsee-xsls-qssh	25153622	zvwn-gjwv-uxkp-dcld	2020-1	\N	\N	\N	\N
ckid-nuvu-czvv-ydvz	25153622	nwco-eqqa-ujyx-qwgy	2020-1	\N	\N	\N	\N
lryy-bnfz-fphv-sjdy	24988906	lhfb-uvpr-pkwn-lqjw	2020-1	\N	\N	\N	\N
eqwk-fcvn-qerl-rpab	24988906	dcnk-ziqj-jugu-nvvu	2020-1	\N	\N	\N	\N
svrh-ivzz-fbev-eydf	42874352	qclf-reww-gjil-nanw	2020-1	\N	\N	\N	\N
otsu-cwad-qlpc-nnhp	42874352	kqfs-uwfx-gojp-axhw	2020-1	\N	\N	\N	\N
uzlk-veht-goqw-uiqh	4374317	fjxs-bvvl-ufce-nqwq	2020-1	\N	\N	\N	\N
pprb-rbao-ibki-ydnh	4374317	frsn-vjio-ljeq-jhdp	2020-1	\N	\N	\N	\N
vnwq-vajh-gjcx-tgvg	4374317	yztx-dwrj-kadd-jtkj	2020-1	\N	\N	\N	\N
uqrz-bbzs-jgns-scgw	4374317	xgxg-lesb-wvwb-vzin	2020-1	\N	\N	\N	\N
xefq-hkna-qnrh-rbcb	4573818	fsbo-ugnp-ibjy-ilyq	2020-1	\N	\N	\N	\N
wujp-cqjg-fhsi-xhif	18492637	kqit-znli-ecuw-lzux	2020-1	\N	\N	\N	\N
bryj-ydrv-dqjn-gzto	14241527	ouxj-aytj-sibc-vldk	2021-1		\N	\N	\N
oubv-dczy-htzq-swnx	14241527	issk-cvbc-oyzv-vucc	2021-1		\N	\N	\N
hahu-ondf-qtot-dlvq	14241527	dcyv-dohg-iutn-jgpt	2021-1		\N	\N	\N
llds-hgxu-ferq-egdr	33215449	vlrg-iwzw-uvxy-quuv	2021-1	\N	\N	\N	\N
akoo-hglr-yknw-qvtg	9734313	ufxr-afvt-lvqv-rhkg	2021-1	\N	\N	\N	\N
bkpi-wsjp-vruz-uogn	9734313	hzss-jitf-dafx-onwk	2021-1	\N	\N	\N	\N
wplr-vxys-kxyq-yush	14231147	twwr-ixoi-etqo-cxjc	2021-1	\N	\N	\N	\N
vxbh-hhxl-hpuh-xgrc	41942473	wdke-dxuo-gepe-jxtc	2021-1	\N	\N	\N	\N
wtji-lpkj-zzeb-ifrx	33215449	gcuk-lyto-xttl-toey	2021-1	\N	\N	\N	\N
jjnn-ihyw-btzr-soqx	25153622	swoz-hxxz-epzs-phvj	2021-1	\N	\N	\N	\N
ltcn-yjil-ykgc-revf	25153622	hvyb-bxll-scue-ysvd	2021-1	\N	\N	\N	\N
qwpg-jwvn-vldb-vyfk	18390797	dzst-nujc-tdbq-vgcq	2021-1	\N	\N	\N	\N
zauz-ydbu-cfqg-jakx	7527404	tqce-wkiw-wqhi-yrdc	2021-1	890820	1098059	1098308	no
hwxa-hfiw-udni-knnd	7527404	wegt-hxap-fwqz-gctc	2021-1	890820	1098059	1098308	no
\.


--
-- TOC entry 3106 (class 0 OID 18119)
-- Dependencies: 232
-- Data for Name: siap_areasprofundizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_areasprofundizacion (idareaprofundizacion, nombre) FROM stdin;
jgnp-flwv-gsfh-hxqr	educación matemática
eqnt-qtsi-rxub-nyhj	matemática
ajxq-uznk-xccv-hxhj	matemática aplicada
fenw-ezox-hbcb-iwxc	estadística
obyv-crxv-ttpq-jkpd	no definido
\.


--
-- TOC entry 3089 (class 0 OID 17854)
-- Dependencies: 215
-- Data for Name: siap_categoria_docentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_categoria_docentes (idcategoriadocente, categoria) FROM stdin;
udcx-ueux-jszz-zpqd	auxiliar
noox-jrse-zdpt-zwst	asistente
jssq-sqdy-zpek-ruvh	asociado
ezfb-nqva-ecuh-wfef	titular
\.


--
-- TOC entry 3097 (class 0 OID 17953)
-- Dependencies: 223
-- Data for Name: siap_configuraciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_configuraciones (idconfiguracion, nombredirector, nombredecano, semanassemestre) FROM stdin;
config-1	hernán darío toro zapata	johan cardona patiño	17
\.


--
-- TOC entry 3090 (class 0 OID 17862)
-- Dependencies: 216
-- Data for Name: siap_docentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_docentes (iddocente, nombre, correo, telefono, idcategoriadocente, idtipocontrato, activo, documento) FROM stdin;
7520464	humberto colorado	hcoloradot@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	7520464
89005354	heiller gutierrez zuluaga	hgutierrez@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	89005354
24988906	gladys salcedo echeverry 	gsalcedo@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	24988906
10076903	efrain alberto hoyos salcedo	eahoyos@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	10076903
14231147	edgar javier carmona suarez	ecarmona@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	14231147
41939761	liliana patricia ospina	lpospina@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	41939761
18397252	jorge mario garcia usuga 	jmgarcia@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	18397252
42874352	irene duarte gandica 	iduarte@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	42874352
4374317	dario alvarez mejia	dariome@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	4374317
4376943	cesar augusto acosta minoli	cminoli@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	4376943
4573818	luis hernando hurtado	lhhurtado@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	4573818
18492637	hernÁn dario zapata toro	hdtoro@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	18492637
29925352	graciela wagner de garcia	gwagner@uniquindio.edu.co	-pendiente-	ezfb-nqva-ecuh-wfef	bdxy-uyay-wanj-ddhc	si	29925352
41923401	diana julie hincapie 	djhincapie@uniquindio.edu.co	-pendiente-	udcx-ueux-jszz-zpqd	bdxy-uyay-wanj-ddhc	si	41923401
9734252	paulo a garcia ureÑa	paulo@uniquindio.edu.co	-pendiente-	noox-jrse-zdpt-zwst	bdxy-uyay-wanj-ddhc	si	9734252
24575565	alba marina giraldo vasquez	almgiraldo@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	bdxy-uyay-wanj-ddhc	si	24575565
89000658	julian marin gonzalez	jmarin@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	bdxy-uyay-wanj-ddhc	si	89000658
34322240	monica johana mesa mazo	mjmesa@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	bdxy-uyay-wanj-ddhc	si	34322240
7555071	adrian alonso arboleda 	aalonso@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	bdxy-uyay-wanj-ddhc	si	7555071
41942993	alejandra maria pulgarin	ampulgarin@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	bdxy-uyay-wanj-ddhc	si	41942993
4377483	jorge hernan aristizabal zapata	jhaz@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	bdxy-uyay-wanj-ddhc	si	4377483
41936057	lina maria gallego berrio	linag@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	bdxy-uyay-wanj-ddhc	si	41936057
10299398	oscar emilio molina dÍaz	omolina@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	bdxy-uyay-wanj-ddhc	si	10299398
41925636	liliana maria guzman leal	lmguzman@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	bdxy-uyay-wanj-ddhc	si	41925636
1094885810	omar alejandro arce serna	oaarce@uniquindio.edu.co	-pendiente-	noox-jrse-zdpt-zwst	isyk-vfre-etau-qyur	si	1094885810
1094939160	claudia marcela vanegas	cmforero@uniquindio.edu.co	-pendiente-	noox-jrse-zdpt-zwst	isyk-vfre-etau-qyur	si	1094939160
9728300	paulo cesar tintinago ruiz	pctintinago@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	isyk-vfre-etau-qyur	si	9728300
1097388835	andrey mauricio montoya	ammontoya@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	isyk-vfre-etau-qyur	si	1097388835
18419628	jhon darwin erazo hurtado	jderazo@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	isyk-vfre-etau-qyur	si	18419628
1097393766	juan carlos castillo paz	jccastillo@uniquindio.edu.co		jssq-sqdy-zpek-ruvh	isyk-vfre-etau-qyur	si	1097393766
41940483	angelica maria ramÍrez	amramirezb@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	isyk-vfre-etau-qyur	si	41940483
9736231	jhon faber arredondo montoya	jfarredondo@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	isyk-vfre-etau-qyur	si	9736231
41955806	lina marcela ocampo	lmocampo@uniquindio.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	isyk-vfre-etau-qyur	si	41955806
1094943829	steven raigosa osorio	sraigosao@uqvirtual.edu.co	-pendiente-	jssq-sqdy-zpek-ruvh	isyk-vfre-etau-qyur	si	1094943829
1094937951	oscar andres manrique arias	oamanrique@uniquindio.edu.co	-pendiente-	udcx-ueux-jszz-zpqd	isyk-vfre-etau-qyur	si	1094937951
1085314192	elisa carolina gonzÁlez santacruz	ecgonzalez@uniquindio.edu.co	-pendiente-	udcx-ueux-jszz-zpqd	isyk-vfre-etau-qyur	si	1085314192
41960506	luz andrea giraldo henao	lagiraldoh@uniquindio.edu.co	-pendiente-	udcx-ueux-jszz-zpqd	isyk-vfre-etau-qyur	si	41960506
1094929034	juliÁn alejandro olarte garcÍa	jaolarteg@uniquindio.edu.co	-pendiente-	udcx-ueux-jszz-zpqd	isyk-vfre-etau-qyur	si	1094929034
1115084944	nicolas arango plaza	 narangop@uniquindio.edu.co	-pendiente-	udcx-ueux-jszz-zpqd	isyk-vfre-etau-qyur	no	1115084944
1094883945	adolfo andres mosquera	aamosquera@uniquindio.edu.co	-pendiente-	noox-jrse-zdpt-zwst	isyk-vfre-etau-qyur	si	1094883945
41941948	diana lucia villamil	dlvillamil@uniquindio.edu.co	-pendiente-	udcx-ueux-jszz-zpqd	isyk-vfre-etau-qyur	si	41941948
1094917238	diego alejandro quintero	daquintero@uniquindio.edu.co	-pendiente-	noox-jrse-zdpt-zwst	isyk-vfre-etau-qyur	si	1094917238
1094943016	linda poleth montiel buritica	lpmontiel@uniquindio.edu.co		udcx-ueux-jszz-zpqd	isyk-vfre-etau-qyur	no	1094943016
1098308059	julián andrés rincón penagos  	jarincon@uniquindio.edu.co	3103645012	noox-jrse-zdpt-zwst	isyk-vfre-etau-qyur	si	1098308059
33215449	rosa maria mendez parra	rosamendez@uniquindio.edu.co	3007848595	jssq-sqdy-zpek-ruvh	iwve-xjvc-dehx-woad	si	33215449
1094915874	jessica johanna quintero barbosa	jjquinterob@uniquindio.edu.co	-pendiente-	udcx-ueux-jszz-zpqd	isyk-vfre-etau-qyur	no	1094915874
9734313	carlos andres trujillo salazar	catrujillo@uniquindio.edu.co	3194728873	ezfb-nqva-ecuh-wfef	bdxy-uyay-wanj-ddhc	si	9734313
18390797	carlos alberto abello muÑoz	caabello@uniquindio.edu.co	3154139464	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	18390797
41942473	diana milena galvis soto	dianagalvis@uniquindio.edu.co	3006266023	jssq-sqdy-zpek-ruvh	iwve-xjvc-dehx-woad	si	41942473
25153622	maría dolly garcía gonzález	mdgarcia@uniquindio.edu.co	3148260237	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	25153622
14241527	eliecer aldana bermÚdez	eliecerab@uniquindio.edu.co	3178039086	ezfb-nqva-ecuh-wfef	iwve-xjvc-dehx-woad	si	14241527
7527404	aníbal muÑoz loaiza 	amunoz@uniquindio.edu.co	3234708043	jssq-sqdy-zpek-ruvh	iwve-xjvc-dehx-woad	si	7527404
\.


--
-- TOC entry 3103 (class 0 OID 18082)
-- Dependencies: 229
-- Data for Name: siap_egresados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_egresados (idegresado, nombre, celular, correo, esegresado, fecha, gradoescolaridad, secretaria, institucion, municipio, cargo, nivellabora) FROM stdin;
25015995	olga lucía ramirez arcila	-pendiente-	olralucia25@yahoo.com.ar	si	1974	espelización	departamental	general santander	montenegro	docente	básica secundaria
4374120	ovidio cardona	-pendiente-	ovidiodorada@yahoo.es	si	1977	postgrado-especialización	municipal	champagnat	armenia	docente	básica secundaria
7518621	jose alirio luna	3113642087	josealirio1831@hotmail.com	si	1978	pregrado	municipal	enrique olaya herrera	armenia	docente	media
5420434	helman camargo	3154438724	helmancamargo@hotmail.com	si	1978	postgrado-maestría	departamental	hojas anchas	circasia	docente	básica secundaria
7509441	olmedo mejía 	3016625729	-pendiente-	si	1978	pregrado	municipal	casd	armenia	docente	básica secundaria
7516733	hector vega patiño	3147924710	hevepa@hotmail.com	si	1978	espelización	departamental	inem jose celestino mutis 	armenia	profesor	básica secundaria
41889977	bernarda castaño g.	3154176636	bernacamatematic1@hotmail.com	si	1981	pregrado	municipal	rufino jose cuervo centro	armenia	docente	básica secundaria
24573164	olivia ruiz daza	3103894198	oliviaruizdaza@hotmail.com	si	1981	espelización	departamental	general santander	calarcá	docente	básica secundaria
41894724	amanda lucero lópez h.	3217518641	amanlu1960@hotmail.com	si	1982	postgrado-especialización	municipal	rufino jose cuervo centro	armenia	docente	básica secundaria
7533581	jairo emilio aguirre perez	3117625885	jeap17@hotmail.com	si	1983	postgrado-especialización	municipal	inem	armenia	docente	básica secundaria
7532016	carlos alberto osuna	3012420382	osuna_k@hotmail.com	si	1983	postgrado-maestría	departamental	santa maria goretti-sede jesús maesto	montenegro	docente	básica secundaria
32453594	leonor pino benítez	3104559618	leopino1@hotmail.com	si	1985	postgrado-especialización	municipal	república de francia	armenia	docente	básica secundaria
7517545	iván giraldo giraldo	-pendiente-	igivo@hotmail.com	si	1985	postgrado-especialización	municipal	escuela normal superior del quindio	armenia	docente	básica secundaria
7537824	gustavo rendón ríos	3137687101	tavodeportes@hotmail.com	si	1986	pregrado	municipal	cuyabra	armenia	docente	básica secundaria
14984901	josé leobardo castro l.	3103892361	j.lecal7@gmail.com	si	1986	postgrado-especialización	municipal	gustavo matamoros d'costa	armenia	docente	básica secundaria
7533370	carlos quintero serna	3127438588	carlos-q-560@hotmail.com	si	1986	espelización	departamental	santa maria goretti	montenegro	docente	básica secundaria
25018963	martha cecilia ramirez	3116296363	marthace87@gmail.com	si	1987	postgrado-especialización	departamental	libre	circasia	docente	básica secundaria
41901507	luz marina devia s.	3136506905	lmdevia@uniquindio.edu.co	si	1987	postgrado-especialización	municipal	escuela normal superior del quindio	armenia	docente	básica secundaria
4407871	rosenberg restrepo salazar 	3162966404	rosemberg2005@hotmail.es	si	1988	espelización	departamental	san josé	circasia	docente	básica secundaria
24988698	maria del socorro salcedo e.	3136151501	soco913@hotmail.com	si	1988	espelización	departamental	colegio libre	circasia	docente	básica secundaria
7252822	gustavo rojas a.	3184102540	gurojasa@yahoo.com	si	1989	pregrado	departamental	jesús maria morales	calarcá	docente	media
79381901	ramón laverde motta	3154076816	ramonlaverde@yahoo.com.co	si	1990	postgrado-especialización	municipal	bosques de pinares sede pinares	armenia	docente	básica primaria
41917741	sandra liliana zapata henao	3044034847	salizahe@gmail.com	si	1990	postgrado-especialización	municipal	los quindos	armenia	docente	básica secundaria
41917085	diana cristina cardenas morales	3216383855	dicricarmo@hotmail.com	si	1990	espelización	municipal	casd	armenia	docente	básica primaria
18389003	luis fernando suarez a.	3113148451	lfsamat@hotmail.com	si	1991	espelización	departamental	baudilio montoya	calarcá	docente	básica secundaria
7545765	carlos ferney sanabria	3148939625	cafesana.1425@hotmail.com	si	1991	espelización	departamental	instituto tebaida	la tebaida	docente	básica secundaria
41924017	beryenith marcela muñoz	3148398677	beryenith@hotmail.com	si	1992	postgrado-especialización	municipal	normal superior del quindio	armenia	docente	media
7588177	alejandro rincón g.	3012425638	alejandrorincon@casdquindio.edu.co	si	1992	postgrado-especialización	municipal	casd prinicipal	armenia	docente	media
41904796	francy patiño jimenez	3154676388	panchy6501@gmail.com	si	1992	espelización	departamental	liceo quindio	salento	docente	media
41909821	luz marina osorio cortés	3156314719	luzmarinaosorio669@hotmail.es	si	1992	pregrado	municipal	inem	armenia	docente	básica secundaria
41912524	ana cecilia cagua c.	3207622308	anac730@hotmail.com	si	1993	postgrado-especialización	departamental	santa teresita	la tebaida	docente	básica secundaria
7515620	luis humberto blach	-pendiente-	humbertoblach@hotmail.com	si	1994	postgrado-especialización	municipal	rufino jose cuervo sur	armenia	docente	básica secundaria
41930247	liliana castaño niño	3137445579	lilicani@yahoo.com	si	1995	espelización	departamental	los fundadores	montenegro	docente	básica secundaria
9519725	rafael salgado henao	3166192452	rasahe51@hotmail.com	si	1995	postgrado-especialización	municipal	institución educativa empresarial cuyabra	armenia	docente	media
33816778	sandra lucía romero	3162978849	sandra33816@hotmail.com	si	1996	postgrado-maestría	municipal	casd	armenia	docente	media
41930402	gloria milena garcés g.	3113896256	glomiga@hotmail.es	si	1996	pregrado	municipal	los quindos	armenia	docente	media
18496142	mauricio díaz r.	3103865260	maodiaz@uniquindio.edu.co	si	1996	postgrado-maestría	municipal	casd	armenia	docente	básica secundaria
41922663	alba janette maya q.	3167474965	albajanettemq@yahoo.es	no	1996	pregrado	municipal	la adiela	armenia	docente	básica secundaria
89000658	julián marin gonzález	3006747176	jmarin@uniquindio.edu.co	si	1996	pregrado	municipal	universidad del quindio	armenia	docente	universitario
89004424	edison romero vallejo	3206354427	ediromero16@hotmail.com	si	1997	pregrado	departamental	hojas anchas	circasia	docente	básica secundaria
7559104	josé javier sepúlveda peñaloza	3116401964	jojasep@gmail.com	si	1997	pregrado	municipal	ciudadela de occidente	armenia	docente	básica secundaria
41934717	amanda lucía taborda	3206623985	aman186da@yahoo.es	si	1998	postgrado-especialización	departamental	general santander	montenegro	docente	básica secundaria
7556398	josé arcesio russi t.	3128687732	jose_russi@hotmail.com	si	1998	pregrado	municipal	cristobal colón	armenia	docente	básica secundaria
18497912	gregorio agustín ruiz t.	3103836856	ruizgrego12@hotmail.com	si	1998	pregrado	departamental	san vicente de paul	génova	docente	básica secundaria
24582923	martha y. valencia t.	3137337060	mayito-val@yahoo.com	si	1998	postgrado-especialización	departamental	san bernardo	calarcá	docente	básica secundaria
18393866	andrés díaz gutierrez	3212579486	diazgu071@yahoo.es	si	1999	postgrado-especialización	departamental	boquia	salento	docente	básica secundaria
41926317	nieves de los rios herrera	3127410449	majar04nieves@hotmail.com	si	1999	pregrado	municipal	los quindos	armenia	docente	básica secundaria
89007582	wiliam rojas orjuela	3156157550	wrojasor@gmail.com	si	1999	pregrado	departamental	hojas anchas	circasia	docente	básica secundaria
41372943	cesar augusto acosta minoli	3146422054	cminoli@uniquindio.edu.co	si	1999	postgrado-maestría	municipal	universidad del quindio	armenia	profesor	universitario
18397252	jorge mario garcia usuga	3013890634	jmgarcia@uniquindio.edu.co	si	1999	postgrado-maestría	municipal	universidad del quindio	armenia	docente	universitario
41926712	clarena maria marín 	3148962859	claremaro73@hotmail.com	si	2000	postgrado-especialización	municipal	normal superior del quindio	armenia	docente	media
18497907	hugo ferney echavarría	3127373543	huguinis73@hotmail.com	si	2000	postgrado-especialización	municipal	escuela normal superior del quindio	armenia	docente	básica secundaria
25022256	claudia lorena restrepo	3016206609	claudialrestrepo@hotmail.com	si	2000	pregrado	departamental	policarpa salavarrieta	quimbaya	docente	básica secundaria
89008364	albeiro ríos franco	3146292143	alberios@hotmail.com	si	2000	pregrado	departamental	san josé	filandia	docente	básica secundaria
24577628	luz eneida valderrama c.	3122705282	luzeva15@gmail.com	si	2000	espelización	municipal	rufino jose cuervo sur	armenia	docente	básica secundaria
41944493	ana lucía garcía v.	3108468280	analugava@hotmail.com	si	2000	pregrado	municipal	casd	armenia	docente	básica secundaria
4377167	will heiler becerra s.	3116103834	whbs1078@hotmail.com	si	2001	pregrado	municipal	rufino jose centro sede antonia santos	armenia	docente	básica secundaria
41946022	paola andrea valencia	3136586633	xandreita@gmail.com	si	2001	postgrado-especialización	municipal	cristobal colón	armenia	docente	básica secundaria
41944943	anghela maría maya e.	3116305020	anghelamariamaya@hotmail.com	si	2001	postgrado-maestría	municipal	casd	armenia	docente	media
66962576	sandra milena buitrago m.	3117208533	samibumos@hotmail.com	si	2001	postgrado-maestría	municipal	escuela normal superior del quindio	armenia	docente	básica secundaria
41938312	damaris sulay tabares m.	3116043925	regy134@hotmail.com	si	2001	postgrado-especialización	municipal	rufino jose cuervo sur	armenia	docente	básica secundaria
18393657	Álvaro florez cardona	3186801520	alvaroflorez70@hotmail.com	si	2001	pregrado	departamental	instituto tecnológico	calarcá	docente	media
41940691	sandra p. mosquera arango	3103917303	sapa1805@hotmail.es	si	2001	pregrado	municipal	casd	armenia	docente	básica secundaria
54478557	katherine santiago nieto	3166807893	yksanti@yahoo.com	si	2002	postgrado-especialización	municipal	laura vicuña	armenia	docente	básica secundaria
41919012	alba marien lopez j.	3184008640	alba_marien_lopez@hotmail.com	si	2002	postgrado-maestría	municipal	gustavo matamoros d'costa	armenia	docente	básica secundaria
9730081	dairo andrés vallejo p.	3104879099	-pendiente-	si	2002	sin definir	departamental	instituto genova	génova	docente	básica secundaria
41944684	angelica maría moreno muñoz	3122956286	angiemorem@gmail.com	si	2002	sin definir	departamental	gustavo matamoros d'costa	armenia	docente	básica secundaria
29819694	carolina restrepo colorado	3105235607	caresco2@gmail.com	si	2002	espelización	municipal	los quindos sede policarpa salavarrieta	armenia	docente	básica secundaria
41943462	liliana patricia barrero	3127400024	l_patricia_2@hotmail.com	si	2002	pregrado	departamental	general santander	montenegro	docente	básica secundaria
4377483	jorge hernan aristizabal z	3006872315	jhaz@uniquindio.edu.co	no	2002	postgrado-maestría	municipal	universidad del quindio	armenia	docente	universitario
41943308	alba lorena galeano r.	3122286972	lorena792001@hotmail.com	si	2003	pregrado	municipal	rufino jose cuervo centro	armenia	docente	básica secundaria
41950135	maria elena gutuierrez	3158317798	misticalsand@hotmail.com	si	2003	pregrado	municipal	instituto técnico industrial	armenia	docente	básica secundaria
41945722	sonia yamile roa v.	3117186598	sonyaroa@hotmail.com	si	2003	postgrado-maestría	municipal	cristobal colón	armenia	docente	básica secundaria
18492170	robinson patiño 	3206508251	rpatiño@hotmail.com	si	2003	espelización	departamental	institución educativa libre	circasia	docente	básica secundaria
7563043	elkin leonardo marulanda m.	3003599576	profelkin@hotmail.com	si	2003	postgrado-especialización	departamental	henry marin granada	circasia	docente	básica secundaria
18399570	jovan hernando botero quiceno	3103830718	jovan.botero.robledo@gmail.com	si	2004	pregrado	departamental	institución educativa robledo	calarcá	docente	media
41955125	mónica liliana usma m.	3117764234	monilili2006@yahoo.com	si	2004	pregrado	municipal	institución educativa zuldemayda	armenia	docente	básica secundaria
31308797	alejandra maria gómez p.	3044357490	arejandera@gmail.com	si	2004	pregrado	departamental	fco miranda la india	filandia	docente	básica secundaria
18398450	juan carlos amador o.	3137321534	matejuank@gmail.com	si	2004	pregrado	departamental	liceo andino santa trinidad	filandia	docente	básica primaria
9729339	josé alejandro moreno	3004277121	majamb21@hotmail.com	si	2004	pregrado	departamental	mercadotecnía	quimbaya	docente	básica secundaria
9732792	jorge roosevelt hernandez s.	3113288654	matejoroo@yahoo.es	si	2004	espelización	municipal	rufino jose cuervo sur	armenia	docente	media
9735812	francisco antonio gutierrez	3206304631	frankgutierrez87209@hotmail.com	si	2004	pregrado	departamental	institución educativa simón bolívar	quimbaya	docente	básica secundaria
4372846	leonardo duvan restrepo alape	3136089446	ldrestrepo@uniquindio.edu.co	si	2004	postgrado-maestría	municipal	universidad del quindio	armenia	docente	universitario
9728251	edwin heider valencia r.	3122104168	edwincomfe@hotmail.com	si	2005	pregrado	departamental	instituto montenegro	montenegro	docente	básica secundaria
41954988	luz dennys tovar cuellar	3168721602	luz_dennyz@hotmail.com	si	2005	pregrado	departamental	san rafael	calarcá	docente	básica primaria
41947333	magda lorena lopez osorio	3103956223	magdalo_@hotmail.com	si	2008	postgrado-maestría	departamental	simón bolivar 	quimbaya	docente	básica secundaria
41943551	paula andrea berrío m	3128762740	paula_berrio@hotmail.com	si	2008	postgrado-maestría	departamental	antonio nariño	calarcá	docente	básica secundaria
41955806	lina marcela ocampo	3143295605	lmocampo@uniquindio.edu.co	si	2009	postgrado-maestría	municipal	ciudadela del sur	armenia	docente	básica secundaria
9736830	andrés mauricio ramirez	-pendiente-	mauro71324@gmail.com	si	2009	pregrado	municipal	colegio francisco san luis rey	armenia	docente	media
41952288	shirley herazo sosa 	-pendiente-	shirlysaenz@hotmail.com	si	2010	postgrado-maestría	departamental	ciudadela henry marin granada	circasia	docente	básica secundaria
41910858	vionedt leandra castellanos	3165336801	vionedtleandra@hotmail.com	no	-pendiente-	postgrado-especialización	departamental	hojas anchas	circasia	-pendiente-	básica secundaria
30384620	claudia cecilia vargas a.	3113647079	valdanie1975@hotmail.com	si	2010	postgrado-maestría	departamental	general santander	montenegro	docente	básica secundaria
1094897276	diana marcela gaitan v.	3206647436	dianamarcelagaitanv@hotmail.com	si	2011	pregrado	municipal	colegio francisco san luis rey	armenia	docente	básica secundaria
1115182194	cristian alberto mendez	3137431543	karpov78786@hotmail.com	si	2012	pregrado	municipal	gimnasio de lo llanos	yopal	docente	básica primaria
1094917238	diego alejandro quintero jiménez	3217414404	diego372km@hotmail.com	si	2013	pregrado	municipal	-pendiente-	armenia	-pendiente-	preescolar
18491266	fredy alexander betancourt	3116159232	fredy-abb@hotmail.com	no	-pendiente-	pregrado	departamental	libre	circasia	docente	básica primaria
24580110	sandra milena martinez	3207848405	mile8124@hotmail.es	no	-pendiente-	pregrado	departamental	antonio nariño	calarcá	docente	básica primaria
17700585	camilo montoya h.	3007737220	camoh61@hotmail.com	no	-pendiente-	postgrado-especialización	departamental	simón bolivar 	quimbaya	docente	básica primaria
9807374	jorge hernando londoño l.	3164781845	jorgelondono4@hotmail.com	no	-pendiente-	pregrado	departamental	santa teresita	la tebaida	docente	básica primaria
7528218	fernando sanchez osorio	3108468165	buscamu@yahoo.com	no	-pendiente-	pregrado	departamental	sagrado corazón de jesús	filandia	docente	básica primaria
41943566	martha cecilia vargas g.	3146283453	marthacecilia.vargas@gmail.com	no	-pendiente-	pregrado	municipal	gustavo matamoros d'costa	armenia	docente	básica primaria
41898903	isabel cristina perdomo	3136121239	isabelcristinaperdomo@hotmail.com	no	-pendiente-	pregrado	municipal	bosques de pinares	armenia	docente	básica primaria
41901365	inés lucía yusti delgado	3152299206	inluyude@yahoo.com	no	-pendiente-	pregrado	municipal	rufino jose cuervo centro	armenia	docente	básica secundaria
29155549	maria nora lópez	3154336033	-pendiente-	no	-pendiente-	pregrado	departamental	instituto quimbaya	quimbaya	docente	básica secundaria
24484548	martha ida puerta v.	3216391040	maripuva772010@hotmail.com	no	-pendiente-	postgrado-especialización	municipal	bosques de pinares	armenia	docente	básica primaria
7544561	jaime arturo quintero g.	3155157764	jarquigon@hotmail.com	no	-pendiente-	postgrado-especialización	municipal	enrique olaya herrera	armenia	docente	básica primaria
41916225	liliana castaño	3163511659	lilcast13@yahoo.es	no	-pendiente-	postgrado-maestría	municipal	la adiela	armenia	docente	básica secundaria
41929569	alba lucía arias s.	3178412176	albalu9@hotmail.com	no	-pendiente-	postgrado-maestría	municipal	enrique olaya herrera	armenia	docente	básica secundaria
16533459	antonio ramos murillo	3188276519	aramosm2003@yahoo.com.ar	no	-pendiente-	postgrado-maestría	municipal	laura vicuña	armenia	docente	media
7537490	adalberto arias gonzalez	3218008815	profeadala3@hotmail.com	no	-pendiente-	postgrado-especialización	municipal	instituto técnico industrial	armenia	educador	básica secundaria
10126538	jhon henry echeverry v.	3136918792	echeverryjhonhenry@gmail.com	no	-pendiente-	pregrado	municipal	gustavo matamoros d'costa	armenia	docente	media
41892110	luz dely arévalo p.	3108271461	luzare24@gmail.com	no	-pendiente-	pregrado	municipal	gustavo matamoros d'costa	armenia	docente	básica primaria
89008172	jaime alberto reyes a.	3207747783	jalbereyes@gmail.com	no	-pendiente-	postgrado-maestría	municipal	cristobal colón	armenia	docente	básica secundaria
24496030	rosalba valencia  l.	3206919442	-pendiente-	no	-pendiente-	pregrado	departamental	instituto tebaida	la tebaida	docente	básica primaria
7527428	luis carlos panesso	3122555284	luiscarlospanesso@gmail.com	no	-pendiente-	postgrado-especialización	municipal	cristobal colón	armenia	docente	básica secundaria
41907011	natacha idaly del socorro pimienta v.	3137721311	natypimienta@hotmail.com	no	-pendiente-	postgrado-especialización	municipal	laura vicuña	armenia	docente	básica primaria
41934796	shirley milena puerto	3148569770	smiposanti@gmail.com	no	-pendiente-	pregrado	departamental	san vicente de paul	génova	docente	básica primaria
65758780	nohora consuelo duque r.	3113397970	nohoraduquerincon@gmail.com	no	-pendiente-	sin definir	departamental	institución educativa la mariela	pijao	docente	básica primaria
9930061	miguel angel ramirez w.	3108415196	miguelwillis18@gmail.com	no	-pendiente-	pregrado	departamental	institución educativa la mariela	pijao	docente	básica primaria
18386435	carlos ignacio reyes	3113175432	carlosreyes13@gmail.com	no	-pendiente-	pregrado	departamental	san bernardo	calarcá	docente	básica secundaria
7553123	jesús albeiro calderón	3173730551	albeiro-c-29@hotmail.com	no	-pendiente-	pregrado	departamental	antonio nariño	la tebaida	docente	básica secundaria
41925602	marleny palacios a.	3146918186	profe122009@hotmail.com	no	-pendiente-	pregrado	departamental	jose maria cordoba	cordoba	profesora	básica primaria
7553607	edilberto garzón c.	3176504530	edilga32@yahoo.es	no	-pendiente-	sin definir	departamental	antonio nariño	la tebaida	docente	básica secundaria
51905316	maryori valenciano p.	-pendiente-	mayitovape@hotmail.com	no	-pendiente-	postgrado-especialización	departamental	hojas anchas	circasia	docente	básica primaria
9731410	rafael eduardo campos parra	3164974621	rafa410@hotmail.com	no	-pendiente-	pregrado	departamental	la popa	la tebaida	docente	básica secundaria
93406415	josé david durán lopez	3124493674	davidduran2000@yahoo.com	no	-pendiente-	espelización	departamental	instituto tecnológico de calarcá	calarcá	docente	básica secundaria
1094907493	andréa lopez dominguez	3128509713	andolo89@hotmail.com	no	-pendiente-	pregrado	departamental	la mariela- hogar las palmeras	pijao	docente	preescolar
41958171	mónica viviana ortíz g.	3172128097	viru102010@hotmail.com	no	-pendiente-	pregrado	departamental	institución educativa la mariela	pijao	docente	preescolar
41956258	luisa fernanda torres b.	3186008326	ludlo627@hotmail.com	no	-pendiente-	pregrado	departamental	la mariela	pijao	docente	básica primaria
1364513	benigno quitián ariza	3155258900	benignoq@gmail.com	no	-pendiente-	espelización	departamental	instituto pijao	pijao	docente	básica secundaria
89006119	andrey fernando serrano s.	3163285728	serrano846@gmail.com	no	-pendiente-	postgrado-maestría	municipal	ciudadela de occidente	armenia	docente	básica secundaria
7547184	luis eduardo barrios silva	3155491959	eduardobarriosilva@yahoo.es	no	-pendiente-	espelización	departamental	ciudadela henry marin granada	circasia	docente	básica primaria
7549497	jhon alvaro bedoya seran	-pendiente-	jhonalvaro@casdquindio.edu.co	no	-pendiente-	espelización	municipal	casd sede francisco 	armenia	docente	básica secundaria
41899619	stella gonzalez trujillo	3113594292	stellagontru@hotmail.com	no	-pendiente-	espelización	departamental	san bernardo	barcelona	docente	básica primaria
41910899	sonia amparo poveda f	3167275848	povedaamparo@gmail.com	no	-pendiente-	espelización	departamental	inem	armenia	docente	básica secundaria
24571757	luz esperanza guerrero	3005599533	luzes02@hotmail.com	no	-pendiente-	espelización	departamental	san rafael	calarcá	docente	básica secundaria
7543852	hipólito barrios 	3155063723	hipolo1964@hotmail.com	no	-pendiente-	espelización	departamental	los fundadores	montenegro	docente	básica secundaria
24577476	elizabeth gonzalez	3103944530	elgobe65@hotmail.com	no	-pendiente-	espelización	departamental	jhon f kennedy	calarcá	docente	básica primaria
41933774	blanca iris lozada p.	3146160314	blanquitairis11@hotmail.com	no	-pendiente-	postgrado-maestría	municipal	bosques de pinares	armenia	docente	básica primaria
24484358	luz valvaneda parra z.	3207495795	luz-pz@hotmail.com	no	-pendiente-	espelización	departamental	institución montenegro sede uribe	montenegro	docente	básica primaria
24497906	gloria elena murillo	3103900176	gemaleo1@hotmail.com	no	-pendiente-	espelización	departamental	antonio nariño	la tebaida	docente	básica primaria
41930294	sandar briyitte murcia	3172181548	sbmurcia@hotmail.com	no	-pendiente-	pregrado	municipal	rufino jose cuervo centro	armenia	docente	básica secundaria
19404423	fernando antonio bilbao	3183639437	ferchito1854@hotmail.com	no	-pendiente-	postgrado-maestría	departamental	institución educativa la mariela	pijao	docente	preescolar
41952430	ana milena carmona f.	3188868125	anamilena.carmona@hotmail.com	no	-pendiente-	pregrado	departamental	institución educativa la mariela	pijao	docente	básica primaria
7537831	jorge luis merlano m.	7409694	jolmerlano@gmail.com	no	-pendiente-	pregrado	municipal	ciudadela de occidente	armenia	docente	básica secundaria
6241081	edward marín garcía	3173725482	ing_edward@yahoo.com.ar	no	-pendiente-	postgrado-maestría	municipal	rufino jose cuervo centro	armenia	docente	media
24433940	yolanda echeverry garcía	3113548667	yolita420@hotmail.com	no	-pendiente-	espelización	departamental	jesús maria morales sede puerto rico	calarcá	docente	básica primaria
18397654	daniel londoño zapata	3103965686	danielonza@hotmail.com	no	-pendiente-	pregrado	departamental	jose maria cordoba	córdoba	docente	básica secundaria
41923918	liliana maría hoyos g.	3157069113	limaho37@hotmail.com	no	-pendiente-	espelización	municipal	bosques de pinares	armenia	docente	básica primaria
4464952	fernando zambrano perez	3115865278	ferzampe51@yahoo.es	no	-pendiente-	espelización	departamental	ramón messa londoño	quimbaya	docente	básica secundaria
18392961	miguel angel caicedo h.	3127561809	trabajo2.425@gmail.com	no	-pendiente-	pregrado	departamental	rio verde alto	córdoba	docente	básica secundaria
24989832	diana maría perez t.	3105039591	dianapereztrejos@hotmail.com	no	-pendiente-	pregrado	departamental	institución educativa la mariela	pijao	docente	básica secundaria
19337969	tobías gerardo parra	3207356308	gepacru@yahoo.com	no	-pendiente-	espelización	departamental	liceo andino santa trinidad	filandia	docente	básica secundaria
7540261	carlos alberto elejalde a.	3127133101	ele.jalde48@hotmail.com	no	-pendiente-	pregrado	municipal	institución e. las colinas	armenia	docente	básica secundaria
24575738	gloria inés quintana zea	3113573474	gloriaquintanaz@hotmail.com	no	-pendiente-	espelización	departamental	institución e. rural hojas anchas	circasia	docente	básica primaria
41956586	angélica maría arcila gallego	3103747228	angelicaag_4@hotmai.com	no	-pendiente-	pregrado	departamental	i.e la mariela sede escuela hogar e.	pijao	docente	preescolar
7518463	carlos yesid gutiérrez angulo	3103931038	yesid54@gmail.com	no	-pendiente-	espelización	municipal	marcelino champagnat	armenia	docente	media
41903945	rosalba arbeláez o.	-pendiente-	rosarosorio@gmail.com	no	-pendiente-	espelización	departamental	institución educativa jesús maestro	montenegro	docente	básica primaria
41921919	claudia del pilar duque gonzález	3167207936	claudiaduque68@hotmail.com	no	-pendiente-	espelización	departamental	general santander	montenegro	docente	básica secundaria
41893560	lucelly castañeda alzate	-pendiente-	lucellycastaneda@hotmail.com	no	-pendiente-	espelización	departamental	robledo	calarcá	docente	básica primaria
7557582	luis carlos marín c.	3216458897	luiscarlosm60@gmail.com	no	-pendiente-	espelización	departamental	general santander	calarcá	docente	básica primaria
4376721	alexander cubides c.	3206145602	cubidesalexander@yahoo.com	no	-pendiente-	espelización	departamental	mercadotecnía	quimbaya	docente	básica primaria
29136965	maria del rosario moncada m.	3162944538	rocymon29@gmail.com	no	-pendiente-	espelización	departamental	sagrado corazón de jesús	filandia	docente	básica primaria
41935255	lucrecia giraldo p.	3103890023	lucregiraldo@hotmail.com	no	-pendiente-	espelización	departamental	santa maria goretti	montenegro	docente	básica primaria
7546908	juan david echeverría l.	3116290042	ingdavidel@gmail.com	no	-pendiente-	pregrado	departamental	san bernardo	barcelona	docente	básica secundaria
41961828	laura melissa morales a.	3117506833	boreanaz42@hotmail.com	no	-pendiente-	pregrado	departamental	la mariela sede patio bonito	pijao	docente	básica primaria
24604701	marlly esmeralda Álvarez o.	3204786528	me8a@hotmail.com	no	-pendiente-	pregrado	departamental	la mariela sede francisco de paula santander	pijao	docente	preescolar
33817526	diana milena caballero r.	3122302047	dimicaro76@hotmail.com	no	-pendiente-	pregrado	departamental	san bernardo	calarcá	docente	básica secundaria
\.


--
-- TOC entry 3091 (class 0 OID 17880)
-- Dependencies: 217
-- Data for Name: siap_errores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_errores (iderror, hora, fecha, procedimiento, mensaje) FROM stdin;
fgcq-bycc-hvtr-pjxk	11:03:51 p.m.	11/11/2020	acceptagendaservicio	access violation at address 00adae1a in module 'datasnap_mads.exe'. read of address 00000000{"numerocontrato":"890820","actafacultad":"1098059","actaprograma":"1098308","iddocente":"7527404","periodo":"2021-1"}
shqq-bawo-vaxa-iels	11:07:14 p.m.	11/11/2020	acceptagendaservicio	access violation at address 00adae72 in module 'datasnap_mads.exe'. read of address 00000000{"numerocontrato":"890820","actafacultad":"1098059","actaprograma":"1098308","iddocente":"7527404","periodo":"2021-1"}
olcn-copv-vwro-jill	11:08:20 p.m.	11/11/2020	acceptagendaservicio	access violation at address 00adae72 in module 'datasnap_mads.exe'. read of address 00000000{"numerocontrato":"890820","actafacultad":"1098059","actaprograma":"1098308","iddocente":"7527404","periodo":"2021-1"}
xmbo-nips-iwan-lriq	11:08:25 p.m.	11/11/2020	acceptagendaservicio	access violation at address 00adae72 in module 'datasnap_mads.exe'. read of address 00000000{"numerocontrato":"890820","actafacultad":"1098059","actaprograma":"1098308","iddocente":"7527404","periodo":"2021-1"}
sddf-oweg-mpgw-jgki	11:09:21 p.m.	11/11/2020	acceptagendaservicio	access violation at address 00adae72 in module 'datasnap_mads.exe'. read of address 00000000{"numerocontrato":"890820","actafacultad":"1098059","actaprograma":"1098308","iddocente":"7527404","periodo":"2021-1"}
lfdw-uwwg-uwln-hqwf	11:10:09 p.m.	11/11/2020	estadoagendas	access violation at address 00ad9d10 in module 'datasnap_mads.exe'. read of address 00000000=> 2021-1
kots-pfic-lqcr-jmyn	11:31:00 p.m.	11/11/2020	estadoagendas	[firedac][phys][pg][libpq] error: no existe la columna d.idcategoria.\r\nprobablemente quiera hacer referencia a la columna «cd.categoria».=> 2021-1
nudr-wchv-jhad-cude	12:41:16 a.m.	12/11/2020	acceptagendaservicio	access violation at address 00adb0aa in module 'datasnap_mads.exe'. read of address 00000000{"numerocontrato":"","actafacultad":"","actaprograma":"","iddocente":"7527404","periodo":"2021-1"}
bfxq-tisd-wecb-ishp	12:41:31 a.m.	12/11/2020	acceptagendaservicio	access violation at address 00adb0aa in module 'datasnap_mads.exe'. read of address 00000000{"numerocontrato":"","actafacultad":"","actaprograma":"","iddocente":"1098308059","periodo":"2021-1"}
\.


--
-- TOC entry 3092 (class 0 OID 17888)
-- Dependencies: 218
-- Data for Name: siap_facultades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_facultades (idfacultad, facultad) FROM stdin;
ucxc-dvug-nyux-gvec	facultad de ciencias económicas y administrativas
hkqg-slac-gpha-awiz	facultad de ciencias de la educación
tjeo-xcie-ztke-kbug	facultad de ingeniería
pjlb-nrfn-nxzl-bkhe	facultad de ciencias agroindustriales
bazq-fjap-ufhd-ppzv	facultad de ciencias básicas y tecnologías
xypd-btlr-ybic-sugr	facultad de ciencias de la salud
qdhb-uqxw-nkwc-xjvf	facultad de ciencias humanas
\.


--
-- TOC entry 3110 (class 0 OID 18244)
-- Dependencies: 236
-- Data for Name: siap_favoritos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_favoritos (idfavorito, titulo, icono, ruta, frecuencia) FROM stdin;
doc-facultades	facultades	facultades.png	factor-docentes,facultades	1
egg-egresados	graduados	graduados.png	graduados	1
doc-periodos	periodos	periodos.png	factor-docentes,periodos	6
doc-func-docencia	funciones de docencia	funcionesdocencia.png	factor-docentes,funciones-docente	1
doc-programas	programas	programas.png	factor-docentes,programas	3
doc-ser-program	Servicios de Programa	servicios.png	factor-docentes,servicios-programa	94
doc-agendas	Agendas	agendas.png	factor-docentes,agendas	332
doc-docentes	Docentes	docentes.svg	factor-docentes,docentes	19
\.


--
-- TOC entry 3098 (class 0 OID 17961)
-- Dependencies: 224
-- Data for Name: siap_funciones_docentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_funciones_docentes (idfunciondocente, funcion) FROM stdin;
srpe-ooho-opgu-couw	investigación
gjer-sgrz-gecn-gxvk	docencia
opab-twsv-tohj-dipx	proyección social 
\.


--
-- TOC entry 3104 (class 0 OID 18098)
-- Dependencies: 230
-- Data for Name: siap_gruposinvestigacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_gruposinvestigacion (idgrupoinvestigacion, nombre, sigla, iddirector, mision, vision) FROM stdin;
axji-dhbr-xlgn-relx	grupo de estudio y desarrollo de software	gedes	1098308059	-pendiente-	-pendiente-
yyer-kupq-ijxg-izsd	escuela de investigación en biomatemáticas	eib	42874352	-pendiente-	-pendiente-
fekz-qukq-nqku-roas	grupo en didáctica de la matemática	gedima	41939761	-pendiente-	-pendiente-
eqbu-tajz-djrp-zvny	grupo en modelación matemática en epidemología	gmme	7527404	-pendiente-	-pendiente-
tnjb-ggga-iixq-xnku	grupo de educación matemática	gemauq	14241527	-pendiente-	-pendiente-
wevc-slvy-vvtu-cxqb	grupo de investigación y asesoría en estadística	grupo de investigación y asesoría en estadística	25153622	-pendiente-	-pendiente-
kkij-lyxj-ehub-vvla	seminario interdisciplinario y grupo en matemática aplicada	sigma	41942993	-pendiente-	-pendiente-
\.


--
-- TOC entry 3095 (class 0 OID 17922)
-- Dependencies: 221
-- Data for Name: siap_horarios_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_horarios_servicios (idhorarioservicio, dia, inicio, fin, idservicioprograma, salon) FROM stdin;
ycyw-ojyq-qhkp-ueqb	miércoles	8:00 p.m.	10:00 p.m.	bjuh-zaxq-cxvz-eibs	d4-405
qxof-chcj-vleb-qtbe	viernes	6:00 p.m.	8:00 p.m.	bjuh-zaxq-cxvz-eibs	d4-405
ubpc-vcfw-zynh-fdpe	martes	6:00 p.m.	7:00 p.m.	otvp-yeqv-ouan-gbss	b1-309
wlao-jyvk-cufo-xgkt	jueves	6:00 p.m.	8:00 p.m.	otvp-yeqv-ouan-gbss	b1-309
kuds-vpyr-jahz-kuie	lunes	7:00 a.m.	9:00 a.m.	wwnp-rdaj-ecrj-vscu	aula ambiental
erwa-usqz-bdgu-hcee	jueves	7:00 a.m.	9:00 a.m.	wwnp-rdaj-ecrj-vscu	b6-204
wvag-vnno-sdld-watu	martes	4:00 p.m.	6:00 p.m.	qaqc-ldaf-youp-xdyh	pendiente
nroi-wnkl-pgrt-vyef	miércoles	2:00 p.m.	4:00 p.m.	qaqc-ldaf-youp-xdyh	b6-104
qigc-erwe-jtxt-arxa	lunes	6:00 p.m.	8:00 p.m.	beqj-gwlx-kvuo-jzhy	d4-405
ciza-dqvd-itps-nalk	miércoles	4:00 p.m.	6:00 p.m.	iufw-qdlq-zptd-dzzb	d4-204
ekjx-nlob-fabv-iobp	viernes	4:00 p.m.	6:00 p.m.	iufw-qdlq-zptd-dzzb	d4-112
eiez-xjzs-egcg-chsb	lunes	4:00 p.m.	6:00 p.m.	odjz-wccq-hqzu-rfvo	b1-304
jnyk-oapb-vqee-uhxw	jueves	4:00 p.m.	6:00 p.m.	odjz-wccq-hqzu-rfvo	b1-304
wlfs-ezzp-gsei-kdbg	sábado	8:00 a.m.	12:00 p.m.	rxka-zhuz-vvyv-ynue	pendiente
oqyg-xpbv-tpvs-ocoj	miércoles	8:00 p.m.	10:00 p.m.	eijz-dbee-ujge-hxec	d4-406
lxcs-xzvf-tubp-lyqw	viernes	6:00 p.m.	8:00 p.m.	eijz-dbee-ujge-hxec	d4-406
tywe-szcc-apwl-ngoh	lunes	6:00 p.m.	8:00 p.m.	kcbl-nkdc-hbpe-euhd	pendiente
oujq-pgqt-wjri-orpj	virtual	8:00 a.m.	12:00 p.m.	xkdy-xtys-eigj-jaql	virtual
fagn-oqyu-gjqe-jhbu	lunes	4:00 p.m.	6:00 p.m.	lhjy-wtzx-nbhe-wefy	d4-403
tvul-kuwi-afao-awot	miércoles	2:00 p.m.	4:00 p.m.	lhjy-wtzx-nbhe-wefy	d4-403
ajbt-vzsk-zefl-shyd	lunes	8:00 p.m.	10:00 p.m.	ezvu-wwlk-gzdu-qtdz	b1-204
fuwx-hhhe-gzpj-vlkj	lunes	6:00 p.m.	9:00 p.m.	yral-ossi-zqho-nuku	b6-101
welo-tbka-nuwi-kwfp	miércoles	8:00 p.m.	10:00 p.m.	kcbl-nkdc-hbpe-euhd	pendiente
qdwx-rfjw-giix-sepx	miércoles	6:00 p.m.	8:00 p.m.	ezvu-wwlk-gzdu-qtdz	f1-307
zdny-bnah-tbtd-nddq	viernes	8:00 p.m.	10:00 p.m.	beqj-gwlx-kvuo-jzhy	d4-405
bnub-woxf-qfrs-qoih	virtual	8:00 a.m.	12:00 p.m.	ijri-ajfi-eyin-awdb	virtual
wwln-uddv-jpxq-yygi	virtual	8:00 a.m.	12:00 p.m.	xblr-vnkp-yliz-bqkc	virtual
fook-zoad-zucl-yjyt	martes	7:00 a.m.	10:00 a.m.	ckuj-hkxa-igpx-cuhn	f1-306
wxjz-vonb-uvkn-fdto	miércoles	7:00 a.m.	10:00 a.m.	issk-lgbq-cbns-ycfe	f1-306
hwup-pabw-gfsr-rybg	lunes	6:00 p.m.	8:00 p.m.	ylcn-nrcv-fxze-valq	d4-409
avsv-hxfa-drbk-ofar	miércoles	6:00 p.m.	8:00 p.m.	ylcn-nrcv-fxze-valq	d4-409
wygu-nwrb-arwo-qgja	viernes	6:00 p.m.	8:00 p.m.	ylcn-nrcv-fxze-valq	d4-409
pxhk-gtff-zrcf-xrip	lunes	6:00 p.m.	8:00 p.m.	zywd-zusv-xhjr-vqez	d4-411
bpbt-uywv-tgcw-xzwp	viernes	8:00 p.m.	10:00 p.m.	zywd-zusv-xhjr-vqez	d4-411
hzvs-wuxr-bsab-ygst	sábado	2:00 p.m.	3:00 p.m.	zywd-zusv-xhjr-vqez	pendiente
iupt-iqpt-cpcu-trbn	sábado	7:00 a.m.	11:00 a.m.	hslz-ldro-whjc-hlhw	buenaventura bloque b - (7 am 11 am) - marzo 21 y 29 abril 18 y 25
syou-fpth-okjh-qbba	distancia	7:00 a.m.	11:00 a.m.	inli-zdig-ngbq-lnle	armenia bloque c   8 am 12m mayo 2,16,31 junio 6
tysl-blwh-nssp-ajaa	virtual	8:00 a.m.	12:00 p.m.	oqgj-spzt-adyd-ljsr	virtual
tqhx-svaj-puph-vjpd	virtual	8:00 a.m.	12:00 p.m.	nxbx-rfcv-xjck-gkxr	virtual
hlbi-wfun-rqih-gsrj	virtual	8:00 a.m.	12:00 p.m.	dffe-qdhe-lifx-eslg	virtual
tzvj-qjal-itlu-nihn	miércoles	8:00 p.m.	10:00 p.m.	wtuv-exhe-tsup-jxkf	f1-307
sfbf-tzkt-hvjj-ufgk	viernes	6:00 p.m.	8:00 p.m.	wtuv-exhe-tsup-jxkf	b1-204
kbxd-npkk-stsn-xzcu	lunes	6:00 p.m.	8:00 p.m.	ptel-nreb-uily-husp	f1-110
sksj-cyuy-tvty-vnwq	miércoles	6:00 p.m.	8:00 p.m.	ptel-nreb-uily-husp	b1-204
hqpg-ckcg-siup-gjeq	distancia	8:00 a.m.	12:00 p.m.	houf-pkgo-fogk-fqbe	pereira bloque b 8 am 12 m marzo 15 y 28 abril 4 y 19
gnco-uayl-vgdr-scyl	distancia	8:00 a.m.	12:00 p.m.	qpwo-chpe-pdso-zbrb	buga bloque b 8 am 12 m marzo 21 y 29 abril 18 y 25
vzjn-gouc-fkrn-jxlb	virtual	8:00 a.m.	12:00 p.m.	ajvr-utut-flnx-zluh	virtual
gqzg-luzx-xajw-alhv	virtual	8:00 a.m.	12:00 p.m.	rcbb-obaf-rvdp-vrbt	virtual
iwih-gnqb-jtbh-uzuv	martes	8:00 p.m.	10:00 p.m.	qbki-fwjz-jzki-nnyx	b6-102
hucb-brhz-urrg-veaa	jueves	6:00 p.m.	8:00 p.m.	qbki-fwjz-jzki-nnyx	b6-102
xqxv-irak-nwrb-hocw	martes	6:00 p.m.	8:00 p.m.	nhpd-cind-hywx-carb	f1-110
tura-ghbj-ibob-sgdf	miércoles	8:00 p.m.	10:00 p.m.	nhpd-cind-hywx-carb	f1-110
dtgc-qjhl-bdxv-ajeq	viernes	6:00 p.m.	8:00 p.m.	nhpd-cind-hywx-carb	f1-110
sxqt-yrzj-csft-bppz	sábado	9:00 a.m.	12:00 p.m.	dnhk-wnxb-xkut-rqwo	pendiente
jpxh-afnn-qhve-tqjc	sábado	2:00 p.m.	5:00 p.m.	qaht-ndpr-yifg-suiu	pendiente
ywvb-otys-rczv-gcoj	viernes	9:00 a.m.	11:00 a.m.	ucjo-tbhf-thla-yhea	f3-404
uxaw-zucq-qxcd-kexi	miércoles	9:00 a.m.	11:00 a.m.	ucjo-tbhf-thla-yhea	f3-404
blrw-hfei-ztwx-vywl	lunes	9:00 a.m.	12:00 p.m.	izvu-hfal-yhap-dfyx	d4-401
oszj-dstc-tobg-cjac	jueves	7:00 a.m.	9:00 a.m.	izvu-hfal-yhap-dfyx	d4-401
ucuc-tkrf-zckn-qxez	domingo	8:00 a.m.	12:00 p.m.	ihca-jzes-xkpy-nurh	aula externa
ztil-oznb-whgh-kgps	domingo	2:00 p.m.	6:00 p.m.	crfb-zbzt-hbbo-agpe	aula externa
pysr-npfk-quoo-tvzo	martes	2:00 p.m.	4:00 p.m.	dzwq-zjaf-xuxr-nhkb	d2-309
ctfj-qltx-qffi-iisr	miércoles	4:00 p.m.	6:00 p.m.	dzwq-zjaf-xuxr-nhkb	d2-309
srqd-hkjl-qpub-eknr	jueves	7:00 a.m.	9:00 a.m.	pzgs-ojtu-haxp-qioj	b1-204
jvdf-pfol-zyfq-jdrp	viernes	7:00 a.m.	10:00 a.m.	pzgs-ojtu-haxp-qioj	b1-204
hcwe-qlfc-wspv-cnwi	virtual	8:00 a.m.	12:00 p.m.	orib-npox-fasu-wzya	virtual
atcb-cbye-nfik-pzgt	virtual	8:00 a.m.	12:00 p.m.	ktwl-hybe-wcpg-kdje	virtual
sfgd-igqf-wpgg-kvzu	lunes	4:00 p.m.	6:00 p.m.	lvpi-pkeu-rriw-lnok	b6-104
ibia-gstn-ireh-nopp	viernes	1:00 p.m.	3:00 p.m.	lvpi-pkeu-rriw-lnok	b6-204
htry-gguf-xioy-qgyy	lunes	8:00 p.m.	10:00 p.m.	tovc-lsou-npyv-excr	f1-306
thwx-pggk-fvhq-yvfk	miércoles	6:00 p.m.	8:00 p.m.	tovc-lsou-npyv-excr	f1-308
rnco-elew-zqtd-fqec	martes	4:00 p.m.	6:00 p.m.	lyjo-kkhu-ozah-owfn	por definir
gdgl-prck-xcee-rtzl	jueves	4:00 p.m.	6:00 p.m.	lyjo-kkhu-ozah-owfn	por definir
fotd-etju-ving-jgei	jueves	7:00 a.m.	10:00 a.m.	kuzl-expi-foxo-frhr	por definir
pwvg-fgfl-uhkr-ghwg	martes	10:00 a.m.	12:00 p.m.	aqeb-hthj-vdwt-hcbj	por definir
tsug-hyod-drii-ovou	miércoles	10:00 a.m.	12:00 p.m.	aqeb-hthj-vdwt-hcbj	por definir
yofz-jljx-xohr-ecxs	viernes	7:00 a.m.	9:00 a.m.	aqeb-hthj-vdwt-hcbj	por definir
cbsh-sgwj-djdx-ifsp	jueves	7:00 a.m.	10:00 a.m.	awcd-kswv-otnk-dijv	por definir
enkx-bfoh-pbqg-hexs	martes	10:00 a.m.	12:00 p.m.	ofbj-jcfy-qaqh-haae	por definir
tlwd-wdcf-odbx-tjxz	miércoles	10:00 a.m.	12:00 p.m.	ofbj-jcfy-qaqh-haae	por definir
tkho-vgjl-yxyt-tdis	viernes	7:00 a.m.	9:00 a.m.	ofbj-jcfy-qaqh-haae	por definir
nxkk-tenl-gnvy-orcc	miércoles	7:00 a.m.	10:00 a.m.	rhpu-qtpa-gojd-dkra	por definir
cnfq-ayza-wcft-prgb	viernes	11:00 a.m.	1:00 p.m.	rhpu-qtpa-gojd-dkra	por definir
gsaw-ttjp-nvgh-gdev	miércoles	7:00 a.m.	10:00 a.m.	znte-brqb-qlwi-lnkj	por definir
dybh-exyg-joby-rwug	viernes	11:00 a.m.	1:00 p.m.	znte-brqb-qlwi-lnkj	por definir
alcf-hppl-uowh-zvnk	martes	4:00 p.m.	6:00 p.m.	axdd-ihlx-icgs-lbif	por definir
hikq-zjwk-iszc-cptc	miércoles	3:00 p.m.	6:00 p.m.	axdd-ihlx-icgs-lbif	por definir
hvrr-lecr-sghw-ugsn	viernes	3:00 p.m.	6:00 p.m.	orkb-jlat-utwb-xtkr	b6-204
lisy-dgfs-wsyd-rzut	martes	6:00 p.m.	7:00 p.m.	vitk-chng-xyjb-giqd	b1-309
eeae-ikcs-axyh-jgte	miércoles	8:00 p.m.	10:00 p.m.	vitk-chng-xyjb-giqd	b1-309
ppjz-zrgf-qgyq-gpas	lunes	7:00 a.m.	9:00 a.m.	cpxu-kpiy-ikoo-csaq	b6-204 bloque 50 años
apql-rlql-djsr-uank	jueves	7:00 a.m.	9:00 a.m.	cpxu-kpiy-ikoo-csaq	b6-204 bloque 50 años
lpxl-sfvk-ysdv-lraz	lunes	7:00 a.m.	9:00 a.m.	hjbw-udwf-kwtk-uvnr	b6-105 bloque 50 años
lapi-xgbt-esbz-cdln	jueves	7:00 a.m.	9:00 a.m.	hjbw-udwf-kwtk-uvnr	b6-105 bloque 50 años
cqcs-pepv-pljo-wspj	lunes	12:00 p.m.	2:00 p.m.	hzss-jitf-dafx-onwk	b6-105 bloque 50 años
envy-wotq-hpsa-qhgp	viernes	7:00 a.m.	9:00 a.m.	hzss-jitf-dafx-onwk	b6-204 bloque 50 años
uaqb-asab-dxga-qslg	jueves	12:00 p.m.	3:00 p.m.	jwfs-zont-sqys-bjfz	b6-204 bloque 50 años
ogcs-zjnv-oghw-vxwi	jueves	9:00 a.m.	12:00 p.m.	ltnf-twbk-fawf-abff	b6-105 bloque 50 años
bnwv-vuft-sjiv-duod	viernes	3:00 p.m.	6:00 p.m.	urea-vrat-cgdo-uapj	b6-204 bloque 50 años
fwqp-rkzq-npvf-five	martes	10:00 a.m.	1:00 p.m.	vlrg-iwzw-uvxy-quuv	b6-204 bloque 50 años
ponf-qqfo-cvon-ogzx	miércoles	3:00 p.m.	6:00 p.m.	wweb-ojiu-uzle-tjcr	f3-205 bloque de ciencias económicas
casj-zuuz-bgza-hlvt	lunes	1:00 p.m.	3:00 p.m.	gshd-gywb-ulzk-jphs	b6-204 bloque 50 años
fkdn-kuzf-tcgg-dvng	jueves	4:00 p.m.	6:00 p.m.	gshd-gywb-ulzk-jphs	b6-204 bloque 50 años
wvoc-nete-qbpk-hoer	martes	6:00 p.m.	8:00 p.m.	tlvo-plcz-yrxd-gwsj	b1-205 bloque ciencias básicas
vnjh-koso-derx-nrzv	miércoles	8:00 p.m.	10:00 p.m.	tlvo-plcz-yrxd-gwsj	b1-205 bloque ciencias básicas
tyxc-jzab-khzw-nhip	martes	8:00 p.m.	10:00 p.m.	ztwd-yepo-kwin-dhgz	b1-205 bloque ciencias básicas
iels-krzt-tctz-rkxa	miércoles	6:00 p.m.	8:00 p.m.	ztwd-yepo-kwin-dhgz	b1-205 bloque ciencias básicas
dkdi-jqqx-yrxz-bial	miércoles	8:00 p.m.	10:00 p.m.	oxsq-epyz-yrhj-negj	b6-103 bloque 50 años
soeh-edak-ybit-gddw	lunes	6:00 p.m.	7:00 p.m.	oxsq-epyz-yrhj-negj	b6-101 bloque 50 años
ztbs-srjd-dcob-hdrr	martes	6:00 p.m.	7:00 p.m.	jydo-evrg-rguc-ysnk	b1-309 bloque ciencias básicas
evdl-owww-krig-qhlj	jueves	6:00 p.m.	8:00 p.m.	jydo-evrg-rguc-ysnk	f7 aula ambiental
ykll-hvzu-lzcq-soov	miércoles	6:00 p.m.	7:00 p.m.	pvuq-joij-ethp-fwdo	b1-309 bloque ciencias básicas
kajj-vtbr-fghv-jhcz	jueves	8:00 p.m.	10:00 p.m.	pvuq-joij-ethp-fwdo	b1-309 bloque ciencias básicas
taqr-jysb-egkz-epfg	sábado	7:00 a.m.	10:00 a.m.	utce-jsyw-ghsr-xcec	b6-103 bloque 50 años
lnyy-qprd-njby-tpoz	lunes	8:00 p.m.	10:00 p.m.	cita-pahy-ltgi-acyb	f7 aula ambiental
kryu-zgnp-tlef-gurg	jueves	8:00 p.m.	10:00 p.m.	cita-pahy-ltgi-acyb	f7 aula ambiental
fzbc-ihcc-ntjk-rszt	lunes	6:00 p.m.	8:00 p.m.	rlyd-qzdh-zzra-rtwg	pendiente
rutq-rnql-odpw-qgpr	miércoles	6:00 p.m.	8:00 p.m.	rlyd-qzdh-zzra-rtwg	pendiente
vaby-wzxg-pfgb-tlyh	martes	6:00 p.m.	8:00 p.m.	lbhx-agvz-qoog-urvz	pendiente
vzgi-ugyz-ykxj-hqfl	miércoles	8:00 p.m.	10:00 p.m.	lbhx-agvz-qoog-urvz	pendiente
hqbn-jhjw-jagt-jlqx	viernes	6:00 p.m.	8:00 p.m.	lbhx-agvz-qoog-urvz	pendiente
atex-yuvs-kbww-dxqe	martes	8:00 p.m.	10:00 p.m.	lkfe-iqqn-grnl-kpoz	pendiente
ezhp-foul-wfdb-kuqy	jueves	6:00 p.m.	8:00 p.m.	cyht-qfwg-qqqt-gyry	pendiente
plaj-zixt-bdle-dwzy	jueves	6:00 p.m.	8:00 p.m.	lkfe-iqqn-grnl-kpoz	pendiente
lejx-rfql-dpbs-uexy	lunes	8:00 p.m.	9:00 p.m.	xrjn-pnxi-iexx-wtei	pendiente
ruax-zuah-asdt-vdxy	miércoles	8:00 p.m.	10:00 p.m.	xrjn-pnxi-iexx-wtei	pendiente
iesq-pfon-yydb-fkpn	martes	6:00 p.m.	8:00 p.m.	bruw-uttv-rgyv-ywft	pendiente
pgfb-lcrd-wdyo-tqht	jueves	8:00 p.m.	10:00 p.m.	bruw-uttv-rgyv-ywft	pendiente
glke-qoqk-cfkk-svbb	martes	8:00 p.m.	10:00 p.m.	cyht-qfwg-qqqt-gyry	pendiente
osys-zrzh-kuzc-sauo	lunes	6:00 p.m.	8:00 p.m.	vqgk-eujf-ravj-awnj	pendiente
sldx-lzax-ktfw-jyge	miércoles	8:00 p.m.	10:00 p.m.	vqgk-eujf-ravj-awnj	pendiente
efqs-piyw-jrat-kwds	martes	6:00 p.m.	8:00 p.m.	knnj-pqlc-ipfl-pfoh	pendiente
waqw-povn-eggd-bllq	jueves	8:00 p.m.	10:00 p.m.	knnj-pqlc-ipfl-pfoh	pendiente
khla-xhbw-lwnq-dews	martes	8:00 p.m.	10:00 p.m.	gcuk-lyto-xttl-toey	pendiente
gbhk-agje-dqqd-jwxv	jueves	6:00 p.m.	8:00 p.m.	gcuk-lyto-xttl-toey	pendiente
uovl-vvty-ktrk-gfzq	miércoles	6:00 p.m.	8:00 p.m.	hwtp-gkzo-pfuy-qaby	pendiente
rqsa-iuwh-gfjx-dznq	viernes	6:00 p.m.	8:00 p.m.	hwtp-gkzo-pfuy-qaby	pendiente
ohlj-bcni-thrc-aedi	lunes	6:00 p.m.	8:00 p.m.	jhxq-rrio-ntvt-yjvs	pendiente
ashu-xojo-grrv-qhcx	viernes	8:00 p.m.	10:00 p.m.	jhxq-rrio-ntvt-yjvs	pendiente
xnrh-xeeq-klkr-xvqp	martes	6:00 p.m.	8:00 p.m.	rfrb-grau-opbn-fzev	pendiente
ohcu-lnee-troc-jspo	jueves	8:00 p.m.	10:00 p.m.	rfrb-grau-opbn-fzev	pendiente
yvrd-lgbu-zyee-pvsy	martes	8:00 p.m.	10:00 p.m.	clzu-lury-zjqy-whpa	pendiente
tklp-sorb-nhzd-tayk	jueves	6:00 p.m.	8:00 p.m.	clzu-lury-zjqy-whpa	pendiente
nrtx-bvpd-zuxn-asjr	miércoles	8:00 p.m.	10:00 p.m.	yuuf-xzqe-xter-pipy	pendiente
tbth-qven-flxe-xqgj	viernes	6:00 p.m.	8:00 p.m.	yuuf-xzqe-xter-pipy	pendiente
anco-gxbh-xxoa-daay	lunes	6:00 p.m.	8:00 p.m.	atku-efcp-tuaa-ywuu	pendiente
gsgv-scvx-tpdn-hwea	viernes	8:00 p.m.	10:00 p.m.	atku-efcp-tuaa-ywuu	pendiente
hzhz-dooj-siyc-swut	lunes	8:00 p.m.	10:00 p.m.	uaih-tvdx-bjeb-gltn	pendiente
zuxn-wnni-awvv-cwou	miércoles	6:00 p.m.	8:00 p.m.	uaih-tvdx-bjeb-gltn	pendiente
vayv-ofuu-gibx-udyy	martes	6:00 p.m.	8:00 p.m.	gieg-hokz-xyhv-iwcw	pendiente
adzd-hqqh-vwfh-lxby	jueves	8:00 p.m.	10:00 p.m.	gieg-hokz-xyhv-iwcw	pendiente
nffq-enok-dpta-edpb	martes	8:00 p.m.	10:00 p.m.	uoar-geuv-cqss-boxl	pendiente
nteq-zaqv-hzyo-ejsj	viernes	6:00 p.m.	8:00 p.m.	uoar-geuv-cqss-boxl	pendiente
lxsg-ykqx-ozpi-gvyy	lunes	6:00 p.m.	8:00 p.m.	ktyx-huia-tpgo-pcba	pendiente
bapp-yzhw-luas-terz	martes	8:00 p.m.	10:00 p.m.	ktyx-huia-tpgo-pcba	pendiente
rnjb-oapn-uscx-uojs	jueves	6:00 p.m.	8:00 p.m.	ktyx-huia-tpgo-pcba	pendiente
pxzk-fvzy-svfx-kutv	lunes	8:00 p.m.	10:00 p.m.	winj-woxv-kkvh-xrfy	pendiente
yzpv-kezx-rddg-lgcy	miércoles	6:00 p.m.	8:00 p.m.	winj-woxv-kkvh-xrfy	pendiente
iuej-lskz-lqjf-tfal	martes	6:00 p.m.	8:00 p.m.	ezzh-qlwz-awhf-wtke	pendiente
qtad-urrv-hkvx-ltac	jueves	8:00 p.m.	10:00 p.m.	ezzh-qlwz-awhf-wtke	pendiente
ivqf-lxfs-hdyi-oxgn	miércoles	8:00 p.m.	10:00 p.m.	zrav-stdv-lsgd-dpri	pendiente
bjfv-tbts-pswp-puqu	viernes	8:00 p.m.	10:00 p.m.	zrav-stdv-lsgd-dpri	pendiente
qxhu-dbes-akwd-khuv	lunes	6:00 p.m.	8:00 p.m.	ouxj-aytj-sibc-vldk	pendiente
psgc-snry-sayi-lwxp	miércoles	8:00 p.m.	10:00 p.m.	ouxj-aytj-sibc-vldk	pendiente
zycz-pnvn-ungs-uozw	lunes	8:00 p.m.	10:00 p.m.	xaud-ddic-tprq-ftvl	pendiente
gjgb-ribi-bzcb-qwdk	viernes	6:00 p.m.	8:00 p.m.	xaud-ddic-tprq-ftvl	pendiente
btcw-jxna-woxs-qlcn	martes	6:00 p.m.	8:00 p.m.	chir-nbnu-awlg-vxur	pendiente
qciq-ysvf-ncai-ypkf	jueves	8:00 p.m.	10:00 p.m.	chir-nbnu-awlg-vxur	pendiente
pgfh-kvds-gywf-sbbs	martes	8:00 p.m.	10:00 p.m.	uada-lhoo-uwnb-puja	pendiente
ernw-kegx-lydf-vtig	jueves	6:00 p.m.	8:00 p.m.	uada-lhoo-uwnb-puja	pendiente
lrzl-ugho-enpx-nohn	miércoles	6:00 p.m.	8:00 p.m.	thgp-eqkz-zfob-vtzs	pendiente
pszu-bhka-ujza-ohjl	viernes	8:00 p.m.	10:00 p.m.	thgp-eqkz-zfob-vtzs	pendiente
agro-fxrq-truw-utjx	miércoles	6:00 p.m.	8:00 p.m.	koqs-ypwg-qzpv-tdlf	pendiente
fotc-flxk-lyah-jcds	viernes	8:00 p.m.	10:00 p.m.	koqs-ypwg-qzpv-tdlf	pendiente
lfot-odxn-lgeu-ffbv	lunes	8:00 p.m.	10:00 p.m.	xtwt-zucb-enyz-dxbw	pendiente
zxcd-zeup-beja-uwgg	miércoles	6:00 p.m.	8:00 p.m.	xtwt-zucb-enyz-dxbw	pendiente
sybj-bpyb-vwfi-qnqx	martes	8:00 p.m.	10:00 p.m.	cbcs-whsx-vkpl-slop	pendiente
gref-xkoc-czng-ofkn	jueves	6:00 p.m.	8:00 p.m.	cbcs-whsx-vkpl-slop	pendiente
kugb-lavn-xbyx-wpws	sábado	8:00 a.m.	12:00 p.m.	issk-cvbc-oyzv-vucc	pendiente
woyq-dbpa-ktfl-hbxa	sábado	2:00 p.m.	6:00 p.m.	dcyv-dohg-iutn-jgpt	pendiente
jplc-dpgn-pldi-xhpc	lunes	6:00 p.m.	8:00 p.m.	cbss-groa-csyk-wpyw	pendiente
roip-ycjx-fzxr-goji	miércoles	8:00 p.m.	10:00 p.m.	cbss-groa-csyk-wpyw	pendiente
kaol-eptz-fhsg-rwoi	lunes	8:00 p.m.	10:00 p.m.	xkrk-xriq-cfrp-fuwc	pendiente
hyfr-eooe-enit-dqsy	miércoles	6:00 p.m.	8:00 p.m.	xkrk-xriq-cfrp-fuwc	pendiente
tqzt-yjdz-dlqj-lcpy	martes	8:00 p.m.	10:00 p.m.	dfep-ngaj-nait-lett	pendiente
iafb-cwqp-okwa-zfwy	viernes	6:00 p.m.	8:00 p.m.	dfep-ngaj-nait-lett	pendiente
hoka-uvrh-ndzq-ptks	jueves	6:00 p.m.	8:00 p.m.	yluh-ecyj-bcgf-diqd	pendiente
obfl-ngjz-fbio-oytd	viernes	8:00 p.m.	10:00 p.m.	yluh-ecyj-bcgf-diqd	pendiente
uiii-ysdh-vlce-henc	lunes	6:00 p.m.	8:00 p.m.	ckjz-gdug-jedp-rryt	pendiente
cavx-xvea-htdi-atnl	miércoles	8:00 p.m.	10:00 p.m.	ckjz-gdug-jedp-rryt	pendiente
olqy-fbaj-deby-csuu	lunes	8:00 p.m.	10:00 p.m.	fsuy-lqng-ajsr-nlzd	pendiente
vlwd-ulcg-rnux-ddpl	miércoles	6:00 p.m.	8:00 p.m.	fsuy-lqng-ajsr-nlzd	pendiente
gstw-grqg-ward-zuzt	martes	8:00 p.m.	10:00 p.m.	kwlh-ahzn-gfrw-kvrc	pendiente
vbpv-zvox-lqyp-ceua	jueves	6:00 p.m.	8:00 p.m.	kwlh-ahzn-gfrw-kvrc	pendiente
bhai-ivaw-yyet-rycn	lunes	6:00 p.m.	8:00 p.m.	aqqy-grso-atza-bnyr	pendiente
izuq-fewh-qnqe-sjwe	miércoles	8:00 p.m.	10:00 p.m.	aqqy-grso-atza-bnyr	pendiente
whvi-fzqy-vras-xszy	martes	8:00 p.m.	10:00 p.m.	ajww-ecvx-yywl-dxuk	pendiente
ivos-rzdg-ktgo-kjad	jueves	6:00 p.m.	8:00 p.m.	ajww-ecvx-yywl-dxuk	pendiente
ablw-knzv-oguo-gtqu	lunes	6:00 p.m.	8:00 p.m.	nnxh-pqeu-nujf-jgrh	pendiente
hzrz-rtgv-nfgf-uqhy	miércoles	6:00 p.m.	8:00 p.m.	nnxh-pqeu-nujf-jgrh	pendiente
yvuv-crny-rwuc-nlcb	martes	6:00 p.m.	8:00 p.m.	cvjl-zgew-qbop-llge	pendiente
ywgk-ainn-onjq-dhrp	jueves	8:00 p.m.	10:00 p.m.	cvjl-zgew-qbop-llge	pendiente
xgxn-fksd-jflj-kweg	sábado	8:00 a.m.	12:00 p.m.	yhxk-lqvs-qpod-fvla	pendiente
qdxl-ooss-jakp-cncq	sábado	2:00 p.m.	6:00 p.m.	oihj-fnly-bvfz-wbsj	pendiente
zxyr-dusr-dlpv-qzoq	martes	8:00 p.m.	10:00 p.m.	dril-jdkz-dtvi-zklp	pendiente
rlwu-fyvk-ppjj-htfv	jueves	6:00 p.m.	8:00 p.m.	dril-jdkz-dtvi-zklp	pendiente
pcyu-rydp-hbcx-xwoe	domingo	8:00 a.m.	12:00 p.m.	yidu-kaft-khpb-gpsh	pendiente
gsrz-ggxp-youz-pwxk	domingo	2:00 p.m.	6:00 p.m.	ftzd-flks-opcr-lwva	pendiente
gakv-gohj-ylzh-vywi	lunes	6:00 p.m.	8:00 p.m.	zrpq-sxri-ufnl-ycsi	pendiente
hezf-hxiu-xxrd-tics	miércoles	8:00 p.m.	10:00 p.m.	zrpq-sxri-ufnl-ycsi	pendiente
clrp-blvy-agjk-uvoc	miércoles	9:00 a.m.	11:00 a.m.	hjyh-oiph-icww-tdpw	d4-408
duxj-jkzl-cqqb-uwyu	jueves	2:00 p.m.	4:00 p.m.	hjyh-oiph-icww-tdpw	d4-406
wubr-fwoj-ajfo-gcyz	viernes	4:00 p.m.	6:00 p.m.	hjyh-oiph-icww-tdpw	d4-406
lwrj-ujru-jhvh-ngxd	lunes	9:00 a.m.	11:00 a.m.	ilop-jpiy-wwds-ddip	d4-409
gfaf-wljg-xtok-zftv	jueves	9:00 a.m.	11:00 a.m.	ilop-jpiy-wwds-ddip	d4-409
plwk-teus-lnvp-ksyj	lunes	4:00 p.m.	5:00 p.m.	zalc-fjjg-bytg-pgzj	d4-409
oray-bnps-qjgk-tvrb	miércoles	2:00 p.m.	4:00 p.m.	zalc-fjjg-bytg-pgzj	d4-409
elks-ujuc-goxj-lzrq	distancia	8:00 a.m.	12:00 p.m.	kekl-rukt-xabe-yheb	candelaria bloque b 8  am 12  am marzo 15 y 28 abril 4 y 19
vbzq-enux-blfc-xxcj	distancia	8:00 a.m.	12:00 p.m.	czvl-wftx-xguc-lfwh	mayo 9, mayo 23, mayo 30, junio 13 (habilitación junio 20
jjvc-usti-ozos-oebo	lunes	9:00 a.m.	11:00 a.m.	sxoo-qvro-jzyt-rlzf	d4-403
kqid-oifu-kyuz-zpus	miércoles	4:00 p.m.	6:00 p.m.	sxoo-qvro-jzyt-rlzf	d4-401
kwnb-rbzp-ychn-skxu	viernes	2:00 p.m.	4:00 p.m.	sxoo-qvro-jzyt-rlzf	d4-403
cckg-fqrz-gofz-ogui	miércoles	8:00 p.m.	10:00 p.m.	eerh-fjgh-yfoy-wuis	d4-406
grlt-upsh-auht-tfpv	viernes	6:00 p.m.	8:00 p.m.	eerh-fjgh-yfoy-wuis	d4-406
jysc-lujx-edfe-grkc	lunes	6:00 p.m.	8:00 p.m.	tesu-iycj-geew-ztye	d4-410
dtli-hrod-ggti-cavf	viernes	8:00 p.m.	10:00 p.m.	tesu-iycj-geew-ztye	d4-302
whwb-eeej-keis-rhnh	sábado	2:00 p.m.	3:00 p.m.	tesu-iycj-geew-ztye	pendiente
ulut-ddin-dvgr-bnab	martes	8:00 p.m.	10:00 p.m.	ugqd-vepf-hkxy-hqnv	b1-205
lpcd-ollq-trnn-iroh	miércoles	6:00 p.m.	8:00 p.m.	ugqd-vepf-hkxy-hqnv	b1-205
tgup-kqgy-qggu-htrv	lunes	6:00 p.m.	8:00 p.m.	qpur-xoog-staq-dapj	d4-403
kuwv-dcnk-xftk-kjzv	miércoles	8:00 p.m.	10:00 p.m.	qpur-xoog-staq-dapj	d4-403
tkwa-jnrd-qlge-sgka	viernes	8:00 p.m.	10:00 p.m.	qpur-xoog-staq-dapj	d4-403
zied-pali-osel-cxsj	lunes	8:00 p.m.	10:00 p.m.	nrqj-luxz-hkrb-kdgt	d4-410
ppqs-zhli-oaji-nghz	martes	9:00 a.m.	11:00 a.m.	uqje-prpv-rcbf-bglh	pendiente
wlir-ryjz-jqto-oogd	miércoles	6:00 p.m.	8:00 p.m.	nrqj-luxz-hkrb-kdgt	d4-410
uoxv-whuq-hont-eqjz	lunes	7:00 a.m.	9:00 a.m.	ruqa-ppnb-ckat-lskc	f7-aula ambiental
ezza-xscj-cqnr-vtgb	jueves	7:00 a.m.	9:00 a.m.	ruqa-ppnb-ckat-lskc	f7-aula ambiental
suip-swjh-glar-coft	lunes	2:00 p.m.	4:00 p.m.	oewx-kkhi-ipvx-djcu	b1-306
lqtt-zrws-dtgo-nidb	miércoles	2:00 p.m.	4:00 p.m.	oewx-kkhi-ipvx-djcu	b1-306
eltz-axoy-xdrt-taep	viernes	2:00 p.m.	4:00 p.m.	oewx-kkhi-ipvx-djcu	b1-304
pspp-dlnx-bsqr-rcqd	martes	7:00 a.m.	9:00 a.m.	janr-tndi-urcf-rvwz	b1-306
gpte-xuvg-jvqk-qkse	miércoles	7:00 a.m.	9:00 a.m.	janr-tndi-urcf-rvwz	b1-306
dkur-whbz-oovs-botf	viernes	7:00 a.m.	9:00 a.m.	janr-tndi-urcf-rvwz	b1-306
pgou-llgk-qvkd-fqay	martes	6:00 p.m.	8:00 p.m.	hydf-yzdp-froz-fgfj	f1-308
qyrc-lvzg-vuwq-rayv	jueves	8:00 p.m.	10:00 p.m.	hydf-yzdp-froz-fgfj	f1-308
hwzy-hrrp-xvjc-ycvf	lunes	8:00 p.m.	10:00 p.m.	zvll-qfur-fdle-xjae	pendiente
zqhp-ehhb-iwib-evcl	miércoles	6:00 p.m.	8:00 p.m.	zvll-qfur-fdle-xjae	pendiente
rytg-fqkb-nnev-bxyt	martes	6:00 p.m.	8:00 p.m.	gftg-hbsr-yfvn-ldzd	pendiente
oxpt-rzfl-ekid-cgfg	miércoles	8:00 p.m.	10:00 p.m.	gftg-hbsr-yfvn-ldzd	pendiente
dpba-eqft-krxy-npll	jueves	7:00 a.m.	10:00 a.m.	fxps-xkyo-lfbd-iahw	pendiente
dyfk-vtrn-tvpd-aved	martes	10:00 a.m.	12:00 p.m.	jtfg-skwf-jeie-voen	pendiente
poir-bnax-bhbq-oqdl	miércoles	10:00 a.m.	12:00 p.m.	jtfg-skwf-jeie-voen	pendiente
rtxx-bvbo-kuou-dwfa	viernes	7:00 a.m.	9:00 a.m.	jtfg-skwf-jeie-voen	pendiente
yplp-hpht-dqpj-ojza	martes	8:00 p.m.	10:00 p.m.	wdlw-htrw-hqed-hknp	pendiente
gyip-vkkh-gzuz-vqyh	jueves	6:00 p.m.	8:00 p.m.	wdlw-htrw-hqed-hknp	pendiente
kncq-uqju-paan-rknq	martes	4:00 p.m.	6:00 p.m.	tnur-ljrb-wodw-yfox	pendiente
syyl-rivn-daoh-dgzn	miércoles	3:00 p.m.	6:00 p.m.	tnur-ljrb-wodw-yfox	pendiente
devv-lppx-wydg-phkn	lunes	9:00 a.m.	11:00 a.m.	cnxi-xhye-gpeo-jzjj	pendiente
zfur-orrt-nyuh-rskf	martes	7:00 a.m.	9:00 a.m.	cnxi-xhye-gpeo-jzjj	pendiente
bflz-sogp-gxdr-zedk	viernes	7:00 a.m.	9:00 a.m.	cnxi-xhye-gpeo-jzjj	pendiente
rwzp-tluv-baai-ozsz	lunes	4:00 p.m.	6:00 p.m.	lnlk-vkil-dxcy-vnuy	d4-113
njgl-lqbd-sciw-vglr	jueves	2:00 p.m.	4:00 p.m.	lnlk-vkil-dxcy-vnuy	d4-113
pprn-zdhq-hoir-cqhy	martes	10:00 a.m.	1:00 p.m.	ceqh-sifz-wukj-vfyg	pendiente
snpb-uqjt-kcjl-nqia	martes	4:00 p.m.	6:00 p.m.	abac-rpki-ahzq-vucr	pendiente
jctb-kslw-cbwq-ijjw	miércoles	4:00 p.m.	6:00 p.m.	abac-rpki-ahzq-vucr	pendiente
ihve-uirz-dyiv-jnra	viernes	4:00 p.m.	6:00 p.m.	abac-rpki-ahzq-vucr	pendiente
ohus-sfyo-ckql-ngri	miércoles	9:00 a.m.	11:00 a.m.	yihj-ysvt-erhi-yspb	f1-208
raoo-zuvy-jycn-fejf	viernes	7:00 a.m.	9:00 a.m.	yihj-ysvt-erhi-yspb	d4-113
lceg-zewr-tpzx-ueqd	lunes	8:00 p.m.	10:00 p.m.	nxsf-buxf-fifw-bkyi	pendiente
qwhu-bywq-wftc-yqab	miércoles	6:00 p.m.	8:00 p.m.	nxsf-buxf-fifw-bkyi	pendiente
fnzv-xrwq-balg-twib	lunes	7:00 a.m.	9:00 a.m.	ezpl-yozv-axey-azqi	pendiente
ttcd-czli-xqjr-slll	miércoles	4:00 p.m.	6:00 p.m.	ezpl-yozv-axey-azqi	pendiente
xxpd-rghe-nzph-toiw	viernes	2:00 p.m.	4:00 p.m.	ezpl-yozv-axey-azqi	pendiente
njfe-aavx-rtae-nwyp	miércoles	4:00 p.m.	6:00 p.m.	ynre-uojd-zxiy-weau	b6-104
qzxv-hoyh-luwx-dxkx	viernes	1:00 p.m.	3:00 p.m.	ynre-uojd-zxiy-weau	b1-205
rjel-wykg-ykrw-apvn	miércoles	11:00 a.m.	1:00 p.m.	ircl-prra-oiwi-budt	d4-410
ptkx-beoh-kqaa-iznx	jueves	7:00 a.m.	10:00 a.m.	ircl-prra-oiwi-budt	d4-410
ssub-zhfn-upvo-vksb	miércoles	8:00 p.m.	10:00 p.m.	hpnw-ebuc-uwts-vrig	f1-306
nusw-lzkx-sneh-gtaq	viernes	6:00 p.m.	8:00 p.m.	hpnw-ebuc-uwts-vrig	f1-306
uxeo-fjor-wiwv-bdnk	miércoles	9:00 a.m.	11:00 a.m.	uqje-prpv-rcbf-bglh	pendiente
xrba-opqq-jbxx-szdg	jueves	9:00 a.m.	11:00 a.m.	uqje-prpv-rcbf-bglh	pendiente
pglu-uxrz-ryxn-gppt	martes	7:00 a.m.	9:00 a.m.	ufap-uzde-pjpw-zisu	pendiente
ouhx-ognp-tsdx-zrgo	miércoles	11:00 a.m.	1:00 p.m.	ufap-uzde-pjpw-zisu	pendiente
elnx-anta-oidp-cenv	jueves	9:00 a.m.	11:00 a.m.	ufap-uzde-pjpw-zisu	pendiente
licr-ordy-yljo-kljl	miércoles	7:00 a.m.	9:00 a.m.	qspi-durx-bvhx-nhpr	b6-104
kwch-eiaq-rgpi-ctvg	viernes	7:00 a.m.	9:00 a.m.	qspi-durx-bvhx-nhpr	b1-304
wnqt-tqsc-fnqw-werr	lunes	7:00 a.m.	9:00 a.m.	vjuz-ehal-sneg-ljsx	b1-307
qxvs-wakp-vohn-iwcq	jueves	2:00 p.m.	4:00 p.m.	vjuz-ehal-sneg-ljsx	b6-104
fshg-dxfl-zlll-crbt	lunes	4:00 p.m.	6:00 p.m.	grep-inwu-cbhi-iyro	b1-306
jojo-tfok-ebff-eeqv	miércoles	4:00 p.m.	6:00 p.m.	grep-inwu-cbhi-iyro	b1-304
wpnv-uohp-hwuu-desh	viernes	4:00 p.m.	6:00 p.m.	grep-inwu-cbhi-iyro	b1-304
hpif-lkqn-tdcg-herd	miércoles	2:00 p.m.	4:00 p.m.	tlzc-dwyw-flxa-lzbv	b6-103
nluz-rdfc-wpbp-iuwx	viernes	1:00 p.m.	3:00 p.m.	tlzc-dwyw-flxa-lzbv	b6-103
qxgx-tgvi-csoa-xcle	miércoles	9:00 a.m.	11:00 a.m.	gtdo-nvdo-xqgx-dlll	d4-112
dpdz-auwo-bnlq-bkjq	viernes	10:00 a.m.	11:00 a.m.	gtdo-nvdo-xqgx-dlll	d4-112
qsyj-wece-evsc-nsub	miércoles	9:00 a.m.	11:00 a.m.	xigz-ipbo-jypd-qlfz	d4-302
yqqt-idnf-nlzr-aczx	viernes	7:00 a.m.	9:00 a.m.	xigz-ipbo-jypd-qlfz	d4-302
ugnp-tkdn-dxzl-lege	miércoles	7:00 a.m.	9:00 a.m.	rubd-blbg-tglv-ogxu	sala a
hosx-sshs-jsfo-ahyu	viernes	9:00 a.m.	11:00 a.m.	rubd-blbg-tglv-ogxu	pendiente
foix-pliy-ptfv-esjt	lunes	8:00 a.m.	10:00 a.m.	cgsi-obwi-pxhq-rolq	d4-411
qseq-ybpp-rtdn-lfgf	miércoles	6:00 p.m.	8:00 p.m.	cgsi-obwi-pxhq-rolq	d4-411
gkrh-pzpa-nppl-edww	lunes	6:00 p.m.	8:00 p.m.	cxwr-lsry-khgk-ndvg	d4-409
qexy-wxkw-oxch-iptp	viernes	8:00 p.m.	10:00 p.m.	cxwr-lsry-khgk-ndvg	d4-410
apyl-cdut-qgjo-darw	martes	6:00 p.m.	8:00 p.m.	jgjn-rujg-xlpn-ragq	f1-306
dues-nsgf-fybe-ezsy	jueves	8:00 p.m.	10:00 p.m.	jgjn-rujg-xlpn-ragq	f1-306
jrul-utzi-onfb-bhpc	martes	8:00 p.m.	10:00 p.m.	hydk-ipkv-cvfa-jabh	pendiente
wiwt-hnzt-cnws-igsh	jueves	6:00 p.m.	8:00 p.m.	hydk-ipkv-cvfa-jabh	pendiente
zwee-waxg-dutw-kqad	lunes	7:00 a.m.	9:00 a.m.	enqk-rjuc-wbea-nqqf	pendiente
iila-vxpt-yhys-vjec	miércoles	11:00 a.m.	1:00 p.m.	enqk-rjuc-wbea-nqqf	pendiente
zwut-gkgc-tkln-rwfw	jueves	9:00 a.m.	11:00 a.m.	enqk-rjuc-wbea-nqqf	pendiente
snkh-rppn-nxjr-tcvs	viernes	11:00 a.m.	1:00 p.m.	ppqq-xryy-rziv-akcj	pendiente
ijli-txvz-lttx-itln	miércoles	7:00 a.m.	10:00 a.m.	ppqq-xryy-rziv-akcj	pendiente
egfn-lxqa-ikxa-avoa	jueves	7:00 a.m.	10:00 a.m.	kcnv-qkwn-ixig-ddks	pendiente
hqqo-asfg-cuts-gxer	martes	10:00 a.m.	12:00 p.m.	hpao-bjow-vzor-nhew	pendiente
wagc-cbtr-xodr-wpwh	miércoles	10:00 a.m.	12:00 p.m.	hpao-bjow-vzor-nhew	pendiente
svcy-jucw-ptyk-pfxu	viernes	7:00 a.m.	9:00 a.m.	hpao-bjow-vzor-nhew	pendiente
sspy-uvvq-glnz-bzsk	lunes	1:00 p.m.	3:00 p.m.	rbja-ynoi-jvok-pyko	d4-407
bsdg-qlhh-hkbs-bdug	miércoles	1:00 p.m.	3:00 p.m.	rbja-ynoi-jvok-pyko	d4-407
cccy-qkcd-rrqn-fnhr	martes	8:00 p.m.	10:00 p.m.	tqbu-yqtl-eggk-ksiw	f1-110
woar-zfhy-xtwa-owrg	jueves	6:00 p.m.	8:00 p.m.	tqbu-yqtl-eggk-ksiw	f1-110
hbfe-vbgf-cgns-hjbc	lunes	7:00 a.m.	9:00 a.m.	jlkx-cnpv-phje-wynt	d4-401
srqb-zwtd-ollc-fkfg	miércoles	4:00 p.m.	6:00 p.m.	jlkx-cnpv-phje-wynt	d4-403
acbo-dulg-tits-htvo	viernes	2:00 p.m.	4:00 p.m.	jlkx-cnpv-phje-wynt	d4-401
zvyo-sjoy-cccp-xaek	lunes	9:00 a.m.	12:00 p.m.	ityc-inpi-cdnl-fhlw	d4-302
jnbp-lrqk-iicd-qodq	jueves	7:00 a.m.	9:00 a.m.	ityc-inpi-cdnl-fhlw	d4-205
spbh-wixx-txxt-ktzd	miércoles	8:00 p.m.	10:00 p.m.	zrgd-dlpq-xerh-btgc	b1-204
bobn-oerv-yfzg-oxtz	viernes	6:00 p.m.	8:00 p.m.	zrgd-dlpq-xerh-btgc	b6-102
ewzh-jguu-ztss-khnh	lunes	6:00 p.m.	7:00 p.m.	ecgy-vbqs-dxfh-owtl	pendiente
wdvi-fsaz-ybnf-bair	viernes	8:00 p.m.	10:00 p.m.	ecgy-vbqs-dxfh-owtl	f1-307
zspp-nnrg-tjpx-jurq	lunes	8:00 p.m.	10:00 p.m.	bgnk-zyzn-qjqu-cezx	f1-308
lwuj-jsas-ggdk-zteb	miércoles	6:00 p.m.	8:00 p.m.	bgnk-zyzn-qjqu-cezx	f1-308
anjl-wgxz-dwfy-fczb	martes	8:00 p.m.	10:00 p.m.	thib-prct-nfcu-uevs	pendiente
woao-hdot-uodq-bfki	jueves	6:00 p.m.	8:00 p.m.	thib-prct-nfcu-uevs	pendiente
xlly-kcgg-qfsg-nxpu	lunes	9:00 a.m.	11:00 a.m.	ywpx-gsgz-dyhf-lkln	pendiente
sane-fgoz-syvk-cvzo	martes	11:00 a.m.	12:00 p.m.	ywpx-gsgz-dyhf-lkln	pendiente
xqtl-kouz-rfzl-noro	viernes	4:00 p.m.	6:00 p.m.	ywpx-gsgz-dyhf-lkln	pendiente
erky-bcqz-xuhg-xzvd	miércoles	7:00 a.m.	10:00 a.m.	ivnl-qiix-aasq-ayai	pendiente
ophu-xifg-flgx-gvku	viernes	11:00 a.m.	1:00 p.m.	ivnl-qiix-aasq-ayai	pendiente
rwnq-twfj-fwyf-fppt	lunes	12:00 p.m.	2:00 p.m.	hhdh-dcsw-jqyg-updj	b6-204
endf-uznt-buyi-dbkb	viernes	7:00 a.m.	9:00 a.m.	hhdh-dcsw-jqyg-updj	b6-204
joqc-lvry-pfid-adey	lunes	7:00 a.m.	9:00 a.m.	qwwk-ezzj-sjeg-hgke	pendiente
xqwt-lrxk-tyko-rzhg	viernes	2:00 p.m.	4:00 p.m.	qwwk-ezzj-sjeg-hgke	pendiente
nbbu-nntp-vjzk-xeol	miércoles	7:00 a.m.	9:00 a.m.	ukki-guyt-iaua-hvqi	d4-403
joti-odyu-sohs-vrwe	viernes	9:00 a.m.	11:00 a.m.	ukki-guyt-iaua-hvqi	d4-401
gygd-oute-lafj-gves	miércoles	9:00 a.m.	11:00 a.m.	ofjk-satj-zped-yfqe	d4-401
pgxc-cktd-trdn-tlhv	viernes	7:00 a.m.	9:00 a.m.	ofjk-satj-zped-yfqe	d4-403
qkch-zguk-ocna-gqtw	lunes	4:00 p.m.	6:00 p.m.	rpph-ejbu-axxv-jxrw	d4-401
knjn-qlza-vduy-fseq	miércoles	2:00 p.m.	4:00 p.m.	rpph-ejbu-axxv-jxrw	d4-403
gsbx-vzsu-erwg-ephj	lunes	6:00 p.m.	8:00 p.m.	ytrs-fuaj-xkhn-bguq	d4-402
ddrk-xpkd-yete-uzod	miércoles	8:00 p.m.	10:00 p.m.	ytrs-fuaj-xkhn-bguq	d4-402
sssh-ygfj-cpcd-gswh	lunes	8:00 p.m.	10:00 p.m.	eqsi-fwnx-riwb-jcib	d4-403
rije-vrgv-vxwv-gnug	miércoles	6:00 p.m.	8:00 p.m.	eqsi-fwnx-riwb-jcib	d4-403
gfdg-okoi-robd-vdyd	lunes	8:00 p.m.	10:00 p.m.	cnjy-idgx-ajcl-rxii	f1-307
xwdl-hgvr-cdln-bprz	miércoles	6:00 p.m.	8:00 p.m.	cnjy-idgx-ajcl-rxii	pendiente
awsf-yrxj-pvqf-hilx	lunes	9:00 a.m.	11:00 a.m.	qeaf-oggy-rpso-ckuh	d4-112
itir-vokl-zqoz-jhlo	martes	7:00 a.m.	9:00 a.m.	qeaf-oggy-rpso-ckuh	d4-112
afkl-ezlh-gisi-llsj	jueves	7:00 a.m.	9:00 a.m.	qeaf-oggy-rpso-ckuh	d4-112
odqb-pndx-fide-kqov	jueves	9:00 a.m.	12:00 p.m.	tycg-hgcu-xwpr-vayx	pendiente
yznc-xlxo-nxgw-sohp	miércoles	7:00 a.m.	9:00 a.m.	sjtl-uiic-fuwg-ysnk	d4-409
xgon-jrru-jsaf-vljy	jueves	4:00 p.m.	6:00 p.m.	sjtl-uiic-fuwg-ysnk	d4-409
lzta-qitn-jpqc-ozvt	viernes	5:00 p.m.	6:00 p.m.	sjtl-uiic-fuwg-ysnk	d4-409
kwzo-vpxd-trww-xltq	martes	6:00 p.m.	8:00 p.m.	zykj-udch-pfen-tgft	b6-102
ycqb-yytt-aldt-uufn	jueves	8:00 p.m.	10:00 p.m.	zykj-udch-pfen-tgft	b6-102
vsgt-dldv-axrb-irig	martes	8:00 p.m.	10:00 p.m.	erxw-dakb-sxty-bsjw	pendiente
sjdo-tfcu-gyot-qjax	jueves	6:00 p.m.	8:00 p.m.	erxw-dakb-sxty-bsjw	pendiente
czgp-quth-sjop-nexq	lunes	7:00 a.m.	9:00 a.m.	uywz-jtbf-rqdk-nfxz	b1-304
ptrq-eghp-wold-jvfe	miércoles	7:00 a.m.	9:00 a.m.	uywz-jtbf-rqdk-nfxz	b6-106
cwbr-wtxj-gqjy-yopj	jueves	2:00 p.m.	4:00 p.m.	uywz-jtbf-rqdk-nfxz	b1-304
kxqu-heqr-oqxu-uwhj	lunes	6:00 p.m.	8:00 p.m.	hrjk-qncb-rtib-bvts	f1-308
scqr-leji-owje-exih	miércoles	8:00 p.m.	10:00 p.m.	hrjk-qncb-rtib-bvts	f1-308
gxse-qvev-ashl-xjlk	lunes	8:00 p.m.	10:00 p.m.	rvrl-rxfg-aseq-kfbj	f1-306
urdd-jipg-haei-kjld	miércoles	6:00 p.m.	8:00 p.m.	rvrl-rxfg-aseq-kfbj	f1-306
wcyf-evbu-uqpy-pgal	lunes	9:00 a.m.	11:00 a.m.	iwyg-ifzv-jolu-rsje	pendiente
pcnc-kwdt-rwgr-rqzf	martes	4:00 p.m.	6:00 p.m.	iwyg-ifzv-jolu-rsje	pendiente
gvpc-pfjc-ahqe-bitw	miércoles	4:00 p.m.	6:00 p.m.	iwyg-ifzv-jolu-rsje	pendiente
guiy-wxzk-gvst-idgx	lunes	10:00 a.m.	12:00 p.m.	rkrz-ddrq-krdq-ipao	d4-410
tpyo-neyj-yjxy-rfht	jueves	11:00 a.m.	1:00 p.m.	rkrz-ddrq-krdq-ipao	d4-410
zdei-bfdt-zbax-aaxx	viernes	9:00 a.m.	11:00 a.m.	rkrz-ddrq-krdq-ipao	d4-410
xqwn-zcfw-rhyd-hihc	lunes	7:00 a.m.	10:00 a.m.	rxsd-lkgu-vrge-aatx	f1-306
udpz-ukjz-fgba-pzvs	martes	3:00 p.m.	5:00 p.m.	cdzc-wano-wdhf-eqyp	d4-407
szvs-blqt-ncyq-zndb	miércoles	7:00 a.m.	9:00 a.m.	cdzc-wano-wdhf-eqyp	d4-410
vurd-effs-kgnq-tvar	lunes	4:00 p.m.	6:00 p.m.	dskh-lowy-jlaj-kfva	d4-407
hyhx-audj-rtjk-pcuv	viernes	7:00 a.m.	9:00 a.m.	dskh-lowy-jlaj-kfva	d4-407
bdvl-uvfd-vrzr-jakx	sábado	7:00 a.m.	10:00 a.m.	bqlv-seyf-creb-fxyn	b1-201
oiar-jwhw-pkvt-ftfo	martes	7:00 a.m.	9:00 a.m.	qsil-altg-xjkx-dvaw	b6-104
wqvo-vynh-uuky-sedh	miércoles	7:00 a.m.	9:00 a.m.	qsil-altg-xjkx-dvaw	b1-307
rqvl-jyji-alrx-aney	jueves	7:00 a.m.	9:00 a.m.	qsil-altg-xjkx-dvaw	b6-104
vdil-qzeo-blpu-uyhy	lunes	7:00 a.m.	9:00 a.m.	onri-tjag-axhj-hvii	b6-104
cfii-atgf-ystl-hnsn	viernes	7:00 a.m.	9:00 a.m.	onri-tjag-axhj-hvii	b1-307
dklj-fwqg-znjp-fcdr	jueves	12:00 p.m.	3:00 p.m.	lcrs-unsg-qgqq-jtwx	pendiente
aoog-klio-vkuc-wjnn	martes	6:00 p.m.	8:00 p.m.	xcto-hvkz-tlfg-zgjo	b6-102
tfrf-nzzx-rjoc-twti	jueves	8:00 p.m.	10:00 p.m.	xcto-hvkz-tlfg-zgjo	b6-102
nwou-htkg-fjzr-xugc	lunes	6:00 p.m.	8:00 p.m.	ugar-ctwb-hcdo-rczn	pendiente
rtxn-elpc-dviv-fnkn	viernes	8:00 p.m.	10:00 p.m.	ugar-ctwb-hcdo-rczn	pendiente
txrr-olcu-tnst-cknk	lunes	6:00 p.m.	8:00 p.m.	xshg-lavi-pzzs-dtkp	pendiente
yovt-byff-gsqg-awlf	miércoles	8:00 p.m.	10:00 p.m.	xshg-lavi-pzzs-dtkp	f1-307
szzx-nwyc-pbfl-tpcz	lunes	8:00 p.m.	10:00 p.m.	fdjz-gtij-zcvf-dnrw	b6-102
lksx-ixwi-siqn-nbco	miércoles	6:00 p.m.	8:00 p.m.	fdjz-gtij-zcvf-dnrw	b6-102
slrr-zpsr-xwal-fsdz	martes	8:00 p.m.	10:00 p.m.	pwdq-asiu-nwol-nyrp	b6-102
yogl-fyba-rhtd-quax	jueves	6:00 p.m.	8:00 p.m.	pwdq-asiu-nwol-nyrp	b6-102
cuju-lglf-odac-tywy	martes	6:00 p.m.	8:00 p.m.	kjsv-zjxf-ypgz-rgdq	b1-204
tueu-kyoc-gffw-ydyj	jueves	8:00 p.m.	10:00 p.m.	kjsv-zjxf-ypgz-rgdq	b1-204
kjxy-ofqs-jvsy-hjjw	martes	9:00 a.m.	10:00 a.m.	oadu-ffoc-ixic-zgoy	b1-204
yeqf-naho-qxya-kgyx	miércoles	2:00 p.m.	4:00 p.m.	oadu-ffoc-ixic-zgoy	b1-204
srke-rdtq-svwl-kokw	viernes	2:00 p.m.	4:00 p.m.	oadu-ffoc-ixic-zgoy	b1-204
coot-ljxs-ksgu-akow	lunes	6:00 p.m.	8:00 p.m.	kayh-ikbf-bord-ovjd	pendiente
olcu-fdfw-bjvu-avzs	miércoles	8:00 p.m.	10:00 p.m.	kayh-ikbf-bord-ovjd	pendiente
ufat-ljgr-edxb-bcql	martes	4:00 p.m.	6:00 p.m.	oiai-jjbr-xbwb-yzlg	pendiente
gioh-ntqk-jzav-kszp	jueves	4:00 p.m.	6:00 p.m.	oiai-jjbr-xbwb-yzlg	pendiente
lttw-neqo-znxk-rfsf	lunes	8:00 p.m.	10:00 p.m.	hhii-rkxs-jjzr-ljkb	b1-204
qbtb-wnxl-jjlo-iyuh	miércoles	6:00 p.m.	8:00 p.m.	hhii-rkxs-jjzr-ljkb	b1-204
kdbb-ittc-navk-llby	sábado	8:00 a.m.	12:00 p.m.	jozx-pfhg-nspb-xeji	aula externa
huys-waxc-urnh-dunj	sábado	2:00 p.m.	6:00 p.m.	pubp-rruu-fnjx-iwdu	aula externa
rlsh-ojgx-npya-lbtj	lunes	3:00 p.m.	7:00 p.m.	nwco-eqqa-ujyx-qwgy	pendiente
qzio-xwrv-zekh-qleu	martes	8:00 p.m.	10:00 p.m.	zvwn-gjwv-uxkp-dcld	b1-204
nyzq-ldjr-rdzr-ysqu	jueves	6:00 p.m.	8:00 p.m.	zvwn-gjwv-uxkp-dcld	b1-204
qhxi-ropo-fnic-tkcz	martes	8:00 p.m.	10:00 p.m.	dcnk-ziqj-jugu-nvvu	b1-204
zpci-okav-fnyk-avej	jueves	6:00 p.m.	8:00 p.m.	dcnk-ziqj-jugu-nvvu	b1-204
wzqe-bwvb-lurl-cong	lunes	2:00 p.m.	4:00 p.m.	lhfb-uvpr-pkwn-lqjw	b1-204
rdda-vywj-aljj-qrcq	miércoles	9:00 a.m.	11:00 a.m.	lhfb-uvpr-pkwn-lqjw	b1-204
kygn-lpcc-fyqx-lwqa	lunes	8:00 a.m.	10:00 a.m.	kqfs-uwfx-gojp-axhw	pendiente
dtej-iazi-lnag-zrvf	viernes	8:00 a.m.	10:00 a.m.	kqfs-uwfx-gojp-axhw	pendiente
klfq-tvpv-ohdt-qvgk	martes	7:00 a.m.	9:00 a.m.	qclf-reww-gjil-nanw	pendiente
dbdr-ncic-eckw-uoze	miércoles	7:00 a.m.	9:00 a.m.	qclf-reww-gjil-nanw	pendiente
yshp-rhuo-vdcb-zyye	jueves	7:00 a.m.	9:00 a.m.	qclf-reww-gjil-nanw	pendiente
yttl-hcwc-efsy-kcbr	lunes	1:00 p.m.	3:00 p.m.	frsn-vjio-ljeq-jhdp	b6-204
duhb-tdzr-dpai-zajl	jueves	4:00 p.m.	6:00 p.m.	frsn-vjio-ljeq-jhdp	b6-204
skpp-ikxv-scvs-rxtq	miércoles	2:00 p.m.	5:00 p.m.	fjxs-bvvl-ufce-nqwq	f3-205
txru-szjv-khdf-kzyu	martes	11:00 a.m.	1:00 p.m.	xgxg-lesb-wvwb-vzin	f1-206
isbl-zkke-olpb-ycgb	jueves	11:00 a.m.	1:00 p.m.	xgxg-lesb-wvwb-vzin	f1-206
ojfi-pcto-apts-phjx	lunes	8:00 p.m.	10:00 p.m.	yztx-dwrj-kadd-jtkj	f7-aula ambiental
tavs-iqcs-bvwq-dqqv	jueves	8:00 p.m.	10:00 p.m.	yztx-dwrj-kadd-jtkj	f7-aula ambiental
uksx-ckag-qypz-pjod	lunes	8:00 a.m.	4:00 p.m.	fsbo-ugnp-ibjy-ilyq	lunes  a jueves de 11 am a 12 m y 4 pm a 5 pm
nfqg-cadf-tkxy-uzcz	martes	6:00 p.m.	8:00 p.m.	kqit-znli-ecuw-lzux	pendiente
dqzx-fayu-vkto-zvhk	jueves	8:00 p.m.	10:00 p.m.	kqit-znli-ecuw-lzux	pendiente
ibvo-uczz-ukxh-ysfh	martes	7:00 a.m.	10:00 a.m.	nkgg-uqag-vsyt-ssvq	por definir
fgyf-qfvr-nker-yblk	lunes	7:00 a.m.	10:00 a.m.	llyf-vqnp-wczk-pjfa	por definir
luyv-gzsr-jjdx-quoc	lunes	1:00 p.m.	4:00 p.m.	lvht-vejr-qyus-fboz	por definir
yuor-hztq-kwac-ifcv	miércoles	9:00 a.m.	11:00 a.m.	lvht-vejr-qyus-fboz	por definir
lfog-uxxb-vwnq-gohx	miércoles	2:00 p.m.	4:00 p.m.	jklp-ycdh-gvxv-qvsk	por definir
czwj-sqdr-ptaw-kxzi	jueves	7:00 a.m.	10:00 a.m.	jklp-ycdh-gvxv-qvsk	por definir
udnd-vzlh-ygwl-iyqc	lunes	10:00 a.m.	12:00 p.m.	plsq-keld-rvpz-rbic	por definir
qlfk-xepc-eean-ohph	jueves	11:00 a.m.	1:00 p.m.	plsq-keld-rvpz-rbic	por definir
foze-zanl-toar-nfnz	viernes	9:00 a.m.	11:00 a.m.	plsq-keld-rvpz-rbic	por definir
pnpl-axet-jcig-vgwp	lunes	1:00 p.m.	3:00 p.m.	hweq-tgik-ewvn-auqn	por definir
rygg-bfak-eauc-cnok	miércoles	1:00 p.m.	3:00 p.m.	hweq-tgik-ewvn-auqn	por definir
ybcs-cefg-nyrw-zkhw	martes	3:00 p.m.	5:00 p.m.	vzdj-uzzw-azqy-cszq	por definir
wbgu-pgpe-vsnf-awcw	miércoles	7:00 a.m.	9:00 a.m.	vzdj-uzzw-azqy-cszq	por definir
ryvk-vzjr-qvko-birj	martes	2:00 p.m.	4:00 p.m.	sxye-enwj-vsax-iniu	por definir
sapq-oudn-cyte-svth	viernes	1:00 p.m.	3:00 p.m.	sxye-enwj-vsax-iniu	por definir
zgnt-slyu-runt-hvyd	lunes	3:00 p.m.	5:00 p.m.	ipro-xrig-hshr-odsy	por definir
rtod-ecfu-uqzc-snhn	viernes	7:00 a.m.	9:00 a.m.	ipro-xrig-hshr-odsy	por definir
fkwz-yszv-iqhn-klod	lunes	9:00 a.m.	11:00 a.m.	ozkx-rxse-iwxk-jyhn	d4-112 bloque de ingeniería
nwvq-sgtc-yoxw-fxsf	martes	7:00 a.m.	9:00 a.m.	ozkx-rxse-iwxk-jyhn	d4-112 bloque de ingeniería
rujr-idvj-lkvu-uoeg	jueves	7:00 a.m.	9:00 a.m.	ozkx-rxse-iwxk-jyhn	d4-112 bloque de ingeniería
lzfe-oysn-vziy-pddl	miércoles	9:00 a.m.	11:00 a.m.	ypor-sznz-ajni-hrcq	d4-112 bloque de ingeniería
ushx-uuar-cayi-ohbs	jueves	1:00 p.m.	3:00 p.m.	ypor-sznz-ajni-hrcq	d4-408 bloque de ingeniería
vnrk-ubrw-owhn-rwnk	viernes	4:00 p.m.	6:00 p.m.	ypor-sznz-ajni-hrcq	d4-406 bloque de ingeniería
bafy-ghxf-xfku-cnjn	miércoles	9:00 a.m.	11:00 a.m.	dklz-prgv-erey-botu	d4-112 bloque de ingeniería
svwh-ppvt-gqbu-bcyh	viernes	10:00 a.m.	11:00 a.m.	dklz-prgv-erey-botu	d4-112 bloque de ingeniería
houn-tfnr-wfxw-fljy	martes	2:00 p.m.	4:00 p.m.	wdke-dxuo-gepe-jxtc	por definir
qygn-vlqh-ghhu-joip	miércoles	4:00 p.m.	6:00 p.m.	wdke-dxuo-gepe-jxtc	por definir
nskq-qdrg-akgx-sqsy	lunes	8:00 p.m.	10:00 p.m.	kqoq-oaef-atjz-exxg	por definir
qqdk-wfle-satn-fhhs	jueves	8:00 p.m.	10:00 p.m.	kqoq-oaef-atjz-exxg	por definir
kflv-zqfz-yqcz-tees	martes	8:00 p.m.	10:00 p.m.	kqoq-oaef-atjz-exxg	por definir
hdal-kbqz-lihv-zzcd	miércoles	2:00 p.m.	4:00 p.m.	wlix-slni-douv-twqd	d4-112 bloque de ingeniería
jtxy-luot-yzjr-zxjv	viernes	3:00 p.m.	4:00 p.m.	wlix-slni-douv-twqd	d4-406 bloque de ingeniería
sopb-cwcc-dhvt-ggac	miércoles	7:00 a.m.	9:00 a.m.	rggz-plzv-zyki-yzxa	d4-409 bloque de ingeniería
pjvy-olss-lvzz-zitk	jueves	4:00 p.m.	6:00 p.m.	rggz-plzv-zyki-yzxa	d4-409 bloque de ingeniería
jywt-ysry-rziq-vlyd	viernes	3:00 p.m.	4:00 p.m.	rggz-plzv-zyki-yzxa	d4-409 bloque de ingeniería
hnws-rcsi-rpln-pfyf	lunes	9:00 a.m.	11:00 a.m.	ftea-zvwi-kfka-qblv	d4-406 bloque de ingeniería
pidi-woel-qzfe-jsey	martes	11:00 a.m.	12:00 p.m.	ftea-zvwi-kfka-qblv	d4-408 bloque de ingeniería
esch-pwcv-czkh-ipob	viernes	4:00 p.m.	6:00 p.m.	ftea-zvwi-kfka-qblv	d4-409 bloque de ingeniería
jrfq-udwu-cawn-esls	martes	9:00 a.m.	11:00 a.m.	zvji-dkwo-hnfz-fqev	d4-408 bloque de ingeniería
uptf-kjfd-kglo-gloa	jueves	9:00 a.m.	11:00 a.m.	zvji-dkwo-hnfz-fqev	d4-408 bloque de ingeniería
ktgh-ttlc-qdxr-xoeq	lunes	2:00 p.m.	4:00 p.m.	kwfb-wpqs-cwkx-xqxu	b1-306 bloque ciencias bÁsicas
rbgp-bcxz-hpct-evdk	miércoles	2:00 p.m.	4:00 p.m.	kwfb-wpqs-cwkx-xqxu	b1-306 bloque ciencias bÁsicas
sifx-lzqz-bsob-tbnh	viernes	2:00 p.m.	4:00 p.m.	kwfb-wpqs-cwkx-xqxu	b1-307 bloque ciencias bÁsicas
llwf-fnku-wqar-rkot	lunes	4:00 p.m.	6:00 p.m.	sxpw-inuq-yfkd-cxfx	b1-307 bloque ciencias bÁsicas
vuke-yltf-rwjh-gich	miércoles	4:00 p.m.	6:00 p.m.	sxpw-inuq-yfkd-cxfx	b1-304 bloque ciencias bÁsicas
euxe-unwz-fkdg-uzod	viernes	4:00 p.m.	6:00 p.m.	sxpw-inuq-yfkd-cxfx	b1-304 bloque ciencias bÁsicas
qgxu-ugxb-bbcj-gzfp	lunes	4:00 p.m.	6:00 p.m.	aelt-ydit-fiav-ezur	por definir
sffd-pdlh-zvje-nzax	miércoles	4:00 p.m.	6:00 p.m.	aelt-ydit-fiav-ezur	por definir
bawb-vegg-hisa-vjis	viernes	4:00 p.m.	6:00 p.m.	aelt-ydit-fiav-ezur	por definir
rxqh-veyg-bafa-exdg	jueves	2:00 p.m.	4:00 p.m.	dknj-ehic-lrgq-tiea	b1-306 bloque ciencias bÁsicas
jxyo-irra-dkoe-jgky	jueves	4:00 p.m.	6:00 p.m.	voas-tjtu-xgxl-yxvv	b1-304 bloque ciencias bÁsicas
pdnw-isca-fvxp-ilvr	lunes	2:00 p.m.	4:00 p.m.	dknj-ehic-lrgq-tiea	b1-307 bloque ciencias bÁsicas
wtcx-aozb-dhlr-djzy	miércoles	4:00 p.m.	6:00 p.m.	itsa-tjqd-vfqc-dkvd	por definir
ziil-dvaz-rdjg-rlph	viernes	4:00 p.m.	6:00 p.m.	itsa-tjqd-vfqc-dkvd	por definir
pbzf-jwfh-aboi-wxbd	lunes	4:00 p.m.	6:00 p.m.	jbga-wpex-dhjc-cvoc	b1-304 bloque ciencias bÁsicas
gsqg-urxh-roce-jllv	martes	4:00 p.m.	6:00 p.m.	jbga-wpex-dhjc-cvoc	b1-304 bloque ciencias bÁsicas
uqqq-drrq-pekc-aehf	jueves	4:00 p.m.	6:00 p.m.	jbga-wpex-dhjc-cvoc	b1-307 bloque ciencias bÁsicas
fzkd-cbqk-vieq-dpux	miércoles	7:00 a.m.	9:00 a.m.	iedw-bdgo-ryjg-clgo	b1-307 bloque ciencias bÁsicas
ybbs-sskx-zsep-lnfr	jueves	7:00 a.m.	9:00 a.m.	iedw-bdgo-ryjg-clgo	b6-104 bloque ciencias básicas
pspc-wltl-wtqt-vcwu	lunes	4:00 p.m.	6:00 p.m.	voas-tjtu-xgxl-yxvv	b1-304 bloque ciencias bÁsicas
yboq-oaxr-angj-ryti	lunes	7:00 a.m.	9:00 a.m.	kqjc-dnco-sxnx-ridb	por definir
xowy-pvwh-zrng-vucr	miércoles	2:00 p.m.	4:00 p.m.	kqjc-dnco-sxnx-ridb	por definir
wqgp-ulcn-shxb-hbrf	viernes	1:00 p.m.	3:00 p.m.	kqjc-dnco-sxnx-ridb	por definir
xzzw-kdgc-ljfg-qnvu	martes	2:00 p.m.	4:00 p.m.	wcgs-xsnq-sekq-ssno	por definir
vsup-qtld-pcgi-dwqo	miércoles	2:00 p.m.	4:00 p.m.	wcgs-xsnq-sekq-ssno	por definir
tnvp-uwxo-cawj-goaq	viernes	1:00 p.m.	3:00 p.m.	wcgs-xsnq-sekq-ssno	por definir
zqdu-bqgp-dxnh-trch	lunes	2:00 p.m.	4:00 p.m.	fqxq-gnnn-qtfa-vqqg	por definir
qipr-gsje-flkk-lfeq	miércoles	9:00 a.m.	11:00 a.m.	fqxq-gnnn-qtfa-vqqg	por definir
ichz-zsxi-stwy-obax	miércoles	9:00 a.m.	11:00 a.m.	vgoy-zann-aubk-vrvq	b1-206 bloque ciencias básicas
nvks-ctdt-qocx-afns	jueves	7:00 a.m.	9:00 a.m.	vgoy-zann-aubk-vrvq	b1-206 bloque ciencias básicas
zdpy-hwzj-kwwa-tfpg	viernes	9:00 a.m.	11:00 a.m.	vgoy-zann-aubk-vrvq	b1-206 bloque ciencias bÁsicas
eetv-qpce-lahn-xfis	miércoles	7:00 a.m.	9:00 a.m.	keub-xwot-tfoo-bbxk	b1-209 bloque ciencias básicas
fxpy-opin-knkc-nqbf	jueves	9:00 a.m.	11:00 a.m.	keub-xwot-tfoo-bbxk	b1-209 bloque ciencias básicas
huvl-sewb-fuek-skvg	viernes	11:00 a.m.	1:00 p.m.	keub-xwot-tfoo-bbxk	b1-209 bloque ciencias bÁsicas
klqw-kqrq-viud-ayab	martes	9:00 a.m.	11:00 a.m.	agfh-nlnl-qrpt-uxlw	b1-210 bloque ciencias básicas
luwk-kfux-toxd-xnrf	miércoles	9:00 a.m.	11:00 a.m.	agfh-nlnl-qrpt-uxlw	b1-210 bloque ciencias bÁsicas
gcyg-bszw-bcqn-yxco	viernes	9:00 a.m.	11:00 a.m.	agfh-nlnl-qrpt-uxlw	b1-210 bloque ciencias bÁsicas
dfoa-elyu-ojcv-rxsy	lunes	7:00 a.m.	9:00 a.m.	ogof-kepc-zulz-fhin	b1-210 bloque ciencias bÁsicas
tito-zqev-dpjf-islj	miércoles	7:00 a.m.	9:00 a.m.	ogof-kepc-zulz-fhin	b1-210 bloque ciencias bÁsicas
enqe-ahyu-lusd-pkhd	jueves	7:00 a.m.	9:00 a.m.	ogof-kepc-zulz-fhin	b1-210 bloque ciencias bÁsicas
wfxg-eyqz-egib-oywa	martes	9:00 a.m.	11:00 a.m.	ufxr-afvt-lvqv-rhkg	b4-302 bloque ciencias básicas
nrbh-hdgn-afeu-ztvi	miércoles	11:00 a.m.	1:00 p.m.	ufxr-afvt-lvqv-rhkg	b4-302 bloque ciencias básicas
hlag-xkbi-beux-xioo	viernes	9:00 a.m.	11:00 a.m.	ufxr-afvt-lvqv-rhkg	b4-302 bloque ciencias básicas
nxcu-lxze-kxtt-xurp	lunes	9:00 a.m.	11:00 a.m.	atws-zloa-tnow-invp	b1-208 bloque ciencias básicas
wwwf-osvn-ldki-furd	martes	4:00 p.m.	6:00 p.m.	atws-zloa-tnow-invp	b1-208 bloque ciencias bÁsicas
pifu-thtn-inro-qkfq	miércoles	4:00 p.m.	6:00 p.m.	atws-zloa-tnow-invp	b1-208 bloque ciencias bÁsicas
such-toxj-dxiq-cbvb	lunes	4:00 p.m.	6:00 p.m.	rdnr-rnpa-fshf-wcqw	por definir
sjwv-ngvc-dcxe-ebtw	miércoles	2:00 p.m.	4:00 p.m.	rdnr-rnpa-fshf-wcqw	por definir
ftno-ipwb-rofe-plku	lunes	4:00 p.m.	6:00 p.m.	ktdl-lnjy-rrra-stha	por definir
pkdl-dwof-laup-lrdc	miércoles	2:00 p.m.	4:00 p.m.	ktdl-lnjy-rrra-stha	por definir
xbce-kxdc-ojbr-akzn	lunes	8:00 p.m.	10:00 p.m.	owxo-xkok-ugwj-lfpj	por definir
ysxi-dfzq-artz-enpi	miércoles	6:00 p.m.	8:00 p.m.	owxo-xkok-ugwj-lfpj	por definir
sncp-iyen-gooi-gbpo	lunes	6:00 p.m.	8:00 p.m.	eahn-peak-qkwk-wzcc	por definir
kqqv-pjag-wtji-turb	miércoles	8:00 p.m.	10:00 p.m.	eahn-peak-qkwk-wzcc	por definir
ojeb-aiyf-awqk-nyhq	martes	8:00 p.m.	10:00 p.m.	bhhu-gbyp-beic-jyoj	por definir
pjay-llzr-zrjg-jnca	sábado	2:00 p.m.	4:00 p.m.	bhhu-gbyp-beic-jyoj	por definir
babp-nzeh-ktzs-zpzp	lunes	7:00 a.m.	9:00 a.m.	kpfl-xnga-jwaw-asec	por definir
zqnh-qqqi-sonk-qywk	miércoles	4:00 p.m.	6:00 p.m.	kpfl-xnga-jwaw-asec	por definir
egso-lsad-wchy-eoqh	viernes	2:00 p.m.	4:00 p.m.	kpfl-xnga-jwaw-asec	por definir
xjjp-ptjp-xety-inal	lunes	9:00 a.m.	11:00 a.m.	shpf-hczl-pnfr-dvry	por definir
axwn-biau-yozx-fpej	miércoles	4:00 p.m.	6:00 p.m.	shpf-hczl-pnfr-dvry	por definir
nawc-kcli-owor-qpus	viernes	2:00 p.m.	4:00 p.m.	shpf-hczl-pnfr-dvry	por definir
asnh-rbgc-nbkt-qnox	lunes	7:00 a.m.	9:00 a.m.	bzza-gioi-glll-juuo	por definir
fsig-gnyb-skac-puvv	miércoles	4:00 p.m.	6:00 p.m.	bzza-gioi-glll-juuo	por definir
hlor-lyck-nark-vwtv	viernes	2:00 p.m.	4:00 p.m.	bzza-gioi-glll-juuo	por definir
udrt-seev-isut-jfsf	lunes	6:00 p.m.	8:00 p.m.	pvyd-jttx-jyxj-aagk	por definir
atie-jbpr-szrd-bdvt	miércoles	8:00 p.m.	10:00 p.m.	pvyd-jttx-jyxj-aagk	por definir
yahc-kjpp-ogss-puca	viernes	8:00 p.m.	10:00 p.m.	pvyd-jttx-jyxj-aagk	por definir
ktyc-payt-sjfo-jaqa	lunes	8:00 p.m.	10:00 p.m.	eepu-xqoj-wyxv-ogyl	por definir
zpag-uhyh-zhgk-geou	miércoles	6:00 p.m.	8:00 p.m.	eepu-xqoj-wyxv-ogyl	por definir
jwbr-ubhi-htwz-zpgb	viernes	6:00 p.m.	8:00 p.m.	eepu-xqoj-wyxv-ogyl	por definir
hrrt-yrtf-ggig-ofsb	lunes	9:00 a.m.	12:00 p.m.	eeoy-pwuo-woyv-sqne	por definir
znkt-zatz-lswb-gnpp	jueves	7:00 a.m.	9:00 a.m.	eeoy-pwuo-woyv-sqne	por definir
vtcu-lkvp-frji-wbil	lunes	9:00 a.m.	12:00 p.m.	hgqs-pjpd-eyaj-ydix	por definir
ufoo-berp-spol-fiue	jueves	7:00 a.m.	9:00 a.m.	hgqs-pjpd-eyaj-ydix	por definir
xqfj-srza-yojb-jiab	lunes	9:00 a.m.	12:00 p.m.	sifw-lxbk-ygid-hfjd	por definir
qrly-dfsk-lhvf-covx	jueves	7:00 a.m.	9:00 a.m.	sifw-lxbk-ygid-hfjd	por definir
lbxz-ifne-obve-epiq	lunes	6:00 p.m.	8:00 p.m.	lldo-zbsv-jfje-nfzx	por definir
xxnj-qeoa-uvyi-jych	viernes	8:00 p.m.	10:00 p.m.	lldo-zbsv-jfje-nfzx	por definir
dadq-lvck-kzgo-nxcu	sábado	1:00 p.m.	2:00 p.m.	lldo-zbsv-jfje-nfzx	por definir
gzwb-ghuo-ianv-snaq	lunes	9:00 a.m.	12:00 p.m.	auiq-eyyt-yvks-anfd	por definir
aegw-swcd-bcev-voqd	jueves	7:00 a.m.	9:00 a.m.	auiq-eyyt-yvks-anfd	por definir
lvtr-fgwo-olnn-vrhs	lunes	9:00 a.m.	12:00 p.m.	qovf-qghj-csfv-vrdo	por definir
pswn-xxgt-lbir-aeon	jueves	7:00 a.m.	9:00 a.m.	qovf-qghj-csfv-vrdo	por definir
ngog-nfoa-abvl-afbs	lunes	6:00 p.m.	8:00 p.m.	pkri-cooa-ovak-dwss	por definir
ovxn-invp-hjuk-vwax	viernes	8:00 p.m.	10:00 p.m.	pkri-cooa-ovak-dwss	por definir
tilu-vstl-jyos-iwwc	sábado	2:00 p.m.	3:00 p.m.	pkri-cooa-ovak-dwss	por definir
djxy-wxrt-iokc-npfp	lunes	4:00 p.m.	6:00 p.m.	vlzd-tapc-cngu-xsle	por definir
ybrd-lsqu-jwkq-kzkd	jueves	2:00 p.m.	4:00 p.m.	vlzd-tapc-cngu-xsle	por definir
fepv-txjy-rrkh-iyxq	lunes	8:00 p.m.	10:00 p.m.	ppsa-sdtq-dqog-kxcx	por definir
ffls-hswe-jkga-rjpw	miércoles	6:00 p.m.	8:00 p.m.	ppsa-sdtq-dqog-kxcx	por definir
abaz-jbxv-uqqw-ulto	lunes	8:00 p.m.	10:00 p.m.	pige-jikc-qdxn-zbat	por definir
tzji-uige-gwas-tkfp	miércoles	6:00 p.m.	8:00 p.m.	pige-jikc-qdxn-zbat	por definir
qcwc-odcj-syxr-ryrq	lunes	6:00 p.m.	8:00 p.m.	prht-djbf-fllp-wadl	por definir
llwv-vgye-avng-bxiw	jueves	8:00 p.m.	10:00 p.m.	prht-djbf-fllp-wadl	por definir
adte-ocel-pjiu-bwqw	miércoles	9:00 a.m.	11:00 a.m.	cgea-lrab-ydtn-kgnc	por definir
dowl-auhu-sfjd-gpci	viernes	7:00 a.m.	9:00 a.m.	cgea-lrab-ydtn-kgnc	por definir
cnqk-ztkx-qero-upjp	miércoles	9:00 a.m.	11:00 a.m.	dipt-buzr-ihxp-fvxl	por definir
ucwc-ways-sywb-xgpn	viernes	7:00 a.m.	9:00 a.m.	dipt-buzr-ihxp-fvxl	por definir
ywud-ktvv-cjbr-fesp	lunes	8:00 p.m.	10:00 p.m.	ezjp-sqbw-ejci-waqf	por definir
uyre-dopp-hrec-nffp	miércoles	6:00 p.m.	8:00 p.m.	ezjp-sqbw-ejci-waqf	por definir
supu-wwcs-rlhg-ille	lunes	8:00 p.m.	10:00 p.m.	zynf-lckw-zjvx-qxvw	por definir
kjgk-geqb-eopn-ozrq	miércoles	6:00 p.m.	8:00 p.m.	zynf-lckw-zjvx-qxvw	por definir
sxzd-jocj-wblb-bnfo	miércoles	7:00 a.m.	9:00 a.m.	yrxj-cfsh-gkrv-sddi	por definir
xblb-irku-uaxy-kuop	viernes	9:00 a.m.	11:00 a.m.	yrxj-cfsh-gkrv-sddi	por definir
beih-uvsy-bjhf-qyba	viernes	7:00 a.m.	9:00 a.m.	vvvc-isey-yjzc-wefv	por definir
qwhc-kcya-bcdn-dczf	miércoles	9:00 a.m.	11:00 a.m.	vvvc-isey-yjzc-wefv	por definir
rkdz-dsht-secb-uxbi	martes	11:00 a.m.	1:00 p.m.	paxz-hcay-xqgv-tiwd	por definir
iutf-stir-wxhx-uxar	viernes	11:00 a.m.	1:00 p.m.	paxz-hcay-xqgv-tiwd	por definir
ecgi-dazg-ewcw-sgqs	lunes	6:00 p.m.	8:00 p.m.	knwn-lkvy-kjsr-bylw	por definir
etcu-bkes-xecu-fdlt	miércoles	8:00 p.m.	10:00 p.m.	knwn-lkvy-kjsr-bylw	por definir
bpdq-aizn-cezv-yyyk	lunes	8:00 p.m.	10:00 p.m.	ifza-zdad-tipx-jzvx	por definir
dwcl-yfzs-fgth-sxky	miércoles	6:00 p.m.	8:00 p.m.	ifza-zdad-tipx-jzvx	por definir
ukqt-kevz-ozas-qpjl	martes	11:00 a.m.	1:00 p.m.	torw-nhaw-rwao-vcaa	por definir
fxvj-uskg-hyjw-ochq	jueves	11:00 a.m.	1:00 p.m.	torw-nhaw-rwao-vcaa	por definir
exfj-acey-vcqj-rzey	lunes	6:00 p.m.	8:00 p.m.	alqt-yraa-cwhh-ldpt	por definir
lgyt-bfen-dsxf-zypc	viernes	8:00 a.m.	10:00 a.m.	alqt-yraa-cwhh-ldpt	por definir
wpxz-know-nnyy-oppu	viernes	6:00 p.m.	8:00 p.m.	qhlv-rfkr-ybtk-zhfp	por definir
gzzg-ugqr-bgwc-quxl	sábado	10:00 a.m.	11:00 a.m.	qhlv-rfkr-ybtk-zhfp	por definir
azci-taub-gyig-civc	miércoles	9:00 a.m.	11:00 a.m.	sloj-bojn-bdyd-sikf	por definir
sake-nbqy-wyah-uszo	viernes	9:00 a.m.	11:00 a.m.	sloj-bojn-bdyd-sikf	por definir
zkfw-irjx-japy-xvnr	martes	8:00 a.m.	10:00 a.m.	httq-blsh-gvdy-nhpd	por definir
rusi-kekl-gnku-cfxb	jueves	8:00 a.m.	10:00 a.m.	httq-blsh-gvdy-nhpd	por definir
qdjw-nyua-tvbl-xaxi	martes	10:00 a.m.	12:00 p.m.	wegt-hxap-fwqz-gctc	por definir
sktb-vzsb-hqxu-dbjc	jueves	10:00 a.m.	12:00 p.m.	wegt-hxap-fwqz-gctc	por definir
orcl-yxah-wvlq-fqpk	miércoles	8:00 a.m.	12:00 p.m.	swoz-hxxz-epzs-phvj	por definir
reue-ncge-tief-kjkt	lunes	3:00 p.m.	7:00 p.m.	bwtk-aqep-opkf-byvl	por definir
jqek-ipyg-izwf-fwqi	lunes	3:00 p.m.	7:00 p.m.	hvyb-bxll-scue-ysvd	pendiente
aktv-dvss-xrdj-tovj	jueves	10:00 a.m.	12:00 p.m.	dzst-nujc-tdbq-vgcq	por definir
rcvp-cddo-klir-rhul	viernes	7:00 a.m.	9:00 a.m.	dzst-nujc-tdbq-vgcq	por definir
rcjw-pcej-trdx-teox	sábado	8:00 a.m.	12:00 p.m.	tqce-wkiw-wqhi-yrdc	pendiente
\.


--
-- TOC entry 3105 (class 0 OID 18111)
-- Dependencies: 231
-- Data for Name: siap_modalidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_modalidades (idmodalidad, nombre) FROM stdin;
cdoa-fasp-xvup-woxk	trabajo de investigación
wfpe-bdgn-jcna-tbyg	trabajo monográfico
dtor-jihr-gfgk-qadn	trabajo de práctica profesional
nrik-fvqd-rhin-gfqf	trabajo de desarrollo
sxkx-bxlq-drpp-tvwx	no definido
\.


--
-- TOC entry 3108 (class 0 OID 18208)
-- Dependencies: 234
-- Data for Name: siap_periodos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_periodos (idperiodo, periodo, hormaxcarrera, hormaxcontrato, hormaxcatedratico) FROM stdin;
atiw-asha-pcvj-wuns	2020-1	900	860	272
ifbg-kyih-lkxc-kuio	2020-2	900	900	272
nisl-eptz-nfwj-drjv	2021-1	900	940	272
\.


--
-- TOC entry 3093 (class 0 OID 17896)
-- Dependencies: 219
-- Data for Name: siap_programas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_programas (idprograma, programa, idfacultad) FROM stdin;
uqjv-kpta-vayk-jgxz	química	bazq-fjap-ufhd-ppzv
wijo-hhwl-kcya-rtkv	física	bazq-fjap-ufhd-ppzv
jths-wyeo-zxhh-yoqn	biología	bazq-fjap-ufhd-ppzv
oagw-qyst-joxl-vwdi	licenciatura en matemáticas	hkqg-slac-gpha-awiz
tvrn-hufu-tyeo-fgrc	ingeniería electrónica	tjeo-xcie-ztke-kbug
dvsh-kgie-dxob-qqpy	ingeniería de sistemas diurno	tjeo-xcie-ztke-kbug
wvcv-ofyz-feit-nagq	ingeniería de sistemas nocturno	tjeo-xcie-ztke-kbug
tvgu-vjfb-uosa-aspe	topografía	tjeo-xcie-ztke-kbug
dzap-xrzb-lwbz-niye	licenciatura en pedagogía infantil	hkqg-slac-gpha-awiz
cxrd-hoct-gqdk-vveo	licenciatura en lenguas modernas	hkqg-slac-gpha-awiz
ehuo-jvdh-ajev-pawt	ingeniería de alimentos	pjlb-nrfn-nxzl-bkhe
hfwp-jfzc-sadh-hxuc	licenciatura en literatura y lengua castellana	hkqg-slac-gpha-awiz
ibpi-qtwa-rvaf-jdhi	doctorado en ciencias	bazq-fjap-ufhd-ppzv
bwtu-vzfn-idyj-qdoi	economía	ucxc-dvug-nyux-gvec
iios-oowv-hnhg-wbph	doctorado en ciencias biomédicas	pjlb-nrfn-nxzl-bkhe
yaxk-kqhj-hwvc-zsle	licenciatura en ciencias naturales y educación ambietal	hkqg-slac-gpha-awiz
kekf-jdbu-ogve-sfpe	gerontología	xypd-btlr-ybic-sugr
zunl-pybo-oeso-wxso	ingeniería topográfica y geomática	tjeo-xcie-ztke-kbug
qnvo-xxro-ypgp-vpto	zootecnia	pjlb-nrfn-nxzl-bkhe
tldv-gaew-wsyi-ftel	ingeniería civil	tjeo-xcie-ztke-kbug
dolf-vybi-ozoa-lfla	ingeniería de alimentos nocturna	pjlb-nrfn-nxzl-bkhe
ihnb-hgwg-ybff-qjkt	maestría en biomatemáticas	bazq-fjap-ufhd-ppzv
geqj-gghh-yfwp-swao	licenciatura en educación física	hkqg-slac-gpha-awiz
hzop-bunr-cpxg-prsa	ingeniería topográfica y geomática	tjeo-xcie-ztke-kbug
ydet-sagu-waoh-nvhl	licenciatura en ciencias naturales y educación ambiental	hkqg-slac-gpha-awiz
rbgy-eqql-ixul-kgzf	doctorado en ciencias biomédicas	xypd-btlr-ybic-sugr
wxfc-eyda-uura-csdu	contaduría 	ucxc-dvug-nyux-gvec
iohz-asnh-qzkt-xbwa	licenciatura en educación infantil	hkqg-slac-gpha-awiz
qtun-qxsb-ezrw-bdon	ingeniería de sistemas y computación	tjeo-xcie-ztke-kbug
\.


--
-- TOC entry 3094 (class 0 OID 17909)
-- Dependencies: 220
-- Data for Name: siap_servicios_programas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_servicios_programas (idservicioprograma, asignatura, idprograma, horas, aulas, periodo, jornada, grupo, semanas, tipo) FROM stdin;
thgp-eqkz-zfob-vtzs	inglés iii	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
tlvo-plcz-yrxd-gwsj	cálculo diferencial	ehuo-jvdh-ajev-pawt	4		2021-1	nocturna	01	17	pregrado
clzu-lury-zjqy-whpa	procesos socio cognitivos del aprendizaje 1 28215	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
oxsq-epyz-yrhj-negj	Álgebra lineal	ehuo-jvdh-ajev-pawt	3		2021-1	nocturna	01	17	pregrado
rxka-zhuz-vvyv-ynue	proyecto procedimientos de construcción del pensamiento matemático	dzap-xrzb-lwbz-niye	20		2020-1	distancia	01	5	pregrado
pvuq-joij-ethp-fwdo	ecuaciones diferenciales	ehuo-jvdh-ajev-pawt	3		2021-1	nocturna	01	17	pregrado
atku-efcp-tuaa-ywuu	esc. inclusiva y contexto socio-cultural ii 28219	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
cita-pahy-ltgi-acyb	diseño experimental	ehuo-jvdh-ajev-pawt	4		2021-1	nocturna	01	17	pregrado
xkdy-xtys-eigj-jaql	uniquindianidad 	oagw-qyst-joxl-vwdi	48		2020-1	virtual	01	12	pregrado
xtwt-zucb-enyz-dxbw	didáctica contemporánea 28162	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
gieg-hokz-xyhv-iwcw	cálculo iii 28216	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
lbhx-agvz-qoog-urvz	aritmética y Álgebra 28198	oagw-qyst-joxl-vwdi	6		2021-1	nocturna	01n	17	pregrado
ajww-ecvx-yywl-dxuk	ecuaciones diferenciales 28180	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
issk-cvbc-oyzv-vucc	práctica pedagógica i	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
xrjn-pnxi-iexx-wtei	esc. inclusiva y contexto socio-cultural i 28206	oagw-qyst-joxl-vwdi	3		2021-1	nocturna	01n	17	pregrado
ktyx-huia-tpgo-pcba	estadística y probabilidad 28222	oagw-qyst-joxl-vwdi	6		2021-1	nocturna	01n	17	pregrado
cyht-qfwg-qqqt-gyry	geometría analítica 28203	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
vqgk-eujf-ravj-awnj	lógica y tr. de conjuntos 28213	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
ezzh-qlwz-awhf-wtke	cálculo iv 28221	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
gcuk-lyto-xttl-toey	Álgebra lineal 28208	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
houf-pkgo-fogk-fqbe	proyecto procedimientos de construcción del pensamiento matemático	dzap-xrzb-lwbz-niye	20		2020-1	distancia	01	5	pregrado
cbss-groa-csyk-wpyw	didáctica de las matem. 28179	oagw-qyst-joxl-vwdi	4			nocturna	01n	17	pregrado
jhxq-rrio-ntvt-yjvs	inglés i  28214	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
ouxj-aytj-sibc-vldk	didáctica de la matem. en básica primaria	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
chir-nbnu-awlg-vxur	resolución de problemas 28181	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
cvjl-zgew-qbop-llge	variable compleja 28182	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
dfep-ngaj-nait-lett	seminario de investigación 28197	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
czvl-wftx-xguc-lfwh	comunicacion, razonamiento y contexto	dzap-xrzb-lwbz-niye	20		2020-1	distancia	01	17	pregrado
oihj-fnly-bvfz-wbsj	práctica docente i 28183	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	02n	17	pregrado
ckjz-gdug-jedp-rryt	tópicos en investigación i 28191	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
kwlh-ahzn-gfrw-kvrc	inferencia estadística 28169	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
yidu-kaft-khpb-gpsh	práctica docente ii 28185	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
gftg-hbsr-yfvn-ldzd	cálculo diferencial	dolf-vybi-ozoa-lfla	4		2020-1	nocturna	01	17	pregrado
hjyh-oiph-icww-tdpw	cálculo diferencial 	tvrn-hufu-tyeo-fgrc	6		2020-1	diurna	01	17	pregrado
zrpq-sxri-ufnl-ycsi	didáctica de las matemáticas 28179	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
qaqc-ldaf-youp-xdyh	ecuaciones diferenciales	uqjv-kpta-vayk-jgxz	4	b6-104	2020-1	diurna	01	15	pregrado
nrqj-luxz-hkrb-kdgt	matemáticas generales grupo  03n	wvcv-ofyz-feit-nagq	4		2020-1	nocturna	03n	17	pregrado
eerh-fjgh-yfoy-wuis	ecuaciones diferenciales grupo 01n	wvcv-ofyz-feit-nagq	4		2020-1	nocturna	01n	17	pregrado
zalc-fjjg-bytg-pgzj	matemáticas generales 	tvrn-hufu-tyeo-fgrc	3		2020-1	diurna	01	17	pregrado
hydf-yzdp-froz-fgfj	cálculo i - 01n 	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
ugqd-vepf-hkxy-hqnv	cálculo integral 	dolf-vybi-ozoa-lfla	4		2020-1	nocturna	01	17	pregrado
ovve-dhsz-ufyv-qsqk	pensamiento lógico matemático	qnvo-xxro-ypgp-vpto	48		2020-1	virtual	02	17	pregrado
oewx-kkhi-ipvx-djcu	calculo diferencial 02qc	uqjv-kpta-vayk-jgxz	6		2020-1	diurna	02qc	17	pregrado
tnur-ljrb-wodw-yfox	cálculo integral grupo 03-c	tldv-gaew-wsyi-ftel	5		2020-1	diurna	03-c	17	pregrado
jtfg-skwf-jeie-voen	cálculo diferencial 01c	tldv-gaew-wsyi-ftel	6		2020-1	diurna	01c	17	pregrado
lnlk-vkil-dxcy-vnuy	ecuaciones diferenciales 01d 	dvsh-kgie-dxob-qqpy	4		2020-1	diurna	01d	15	pregrado
wwnp-rdaj-ecrj-vscu	cálculo diferencial	ehuo-jvdh-ajev-pawt	4	aula ambiental  b6-204	2020-1	diurna	01d	17	\N
abac-rpki-ahzq-vucr	matemáticas fundamentales grupo 03 q	wijo-hhwl-kcya-rtkv	6		2020-1	diurna	03q	17	pregrado
nxsf-buxf-fifw-bkyi	matemáticas discretas 02n	wvcv-ofyz-feit-nagq	4		2020-1	nocturna	02n	17	pregrado
iufw-qdlq-zptd-dzzb	probabilidad y estadistica grupo 01d	tvrn-hufu-tyeo-fgrc	4		2020-1	diurna	01d	17	\N
odjz-wccq-hqzu-rfvo	diseño experimental grupo  química	wijo-hhwl-kcya-rtkv	4		2020-1	diurna	01	17	\N
ynre-uojd-zxiy-weau	bioestadística g-2	jths-wyeo-zxhh-yoqn	4		2020-1	diurna	g-2	17	pregrado
hpnw-ebuc-uwts-vrig	procesos sociocognitivos del aprendizaje  i 01n	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
ufap-uzde-pjpw-zisu	Álgebra lineal	wijo-hhwl-kcya-rtkv	6		2020-1	diurna	01	17	pregrado
qspi-durx-bvhx-nhpr	estadística grupo q	wijo-hhwl-kcya-rtkv	4		2020-1	diurna	q	17	pregrado
lhjy-wtzx-nbhe-wefy	Álgebra lineal grupo 02d 	dvsh-kgie-dxob-qqpy	4		2020-1	diurna	02d	17	\N
yral-ossi-zqho-nuku	Álgebra lineal	ehuo-jvdh-ajev-pawt	3		2020-1	diurna	01	17	\N
ckuj-hkxa-igpx-cuhn	matemáticas generales grupo g1t	tvgu-vjfb-uosa-aspe	3		2020-1	diurna	g1t	17	\N
issk-lgbq-cbns-ycfe	geometría plana grupo g1	tvgu-vjfb-uosa-aspe	3		2020-1	diurna	g1	17	\N
bjuh-zaxq-cxvz-eibs	análisis númerico grupo 01n	wvcv-ofyz-feit-nagq	4	d4-405	2020-1	nocturna	01n	17	\N
otvp-yeqv-ouan-gbss	cálculo vectorial	wvcv-ofyz-feit-nagq	3	b1-309	2020-1	nocturna	01n	17	\N
eijz-dbee-ujge-hxec	ecuaciones diferenciales grupo 02n	wvcv-ofyz-feit-nagq	4		2020-1	nocturna	02n	17	\N
zywd-zusv-xhjr-vqez	cálculo integral   grupo 01n	wvcv-ofyz-feit-nagq	5		2020-1	nocturna	01n	17	\N
kcbl-nkdc-hbpe-euhd	métodos estadísticos	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	\N
beqj-gwlx-kvuo-jzhy	probabilidad y estadística grupo 01n	wvcv-ofyz-feit-nagq	4	no se	2020-1	nocturna	01n	17	\N
ylcn-nrcv-fxze-valq	cálculo diferencial grupo 02n 	wvcv-ofyz-feit-nagq	6		2020-1	nocturna	02n	17	\N
qbki-fwjz-jzki-nnyx	probabilidad 	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	\N
wtuv-exhe-tsup-jxkf	historia de las matemáticas 	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	\N
ucjo-tbhf-thla-yhea	Álgebra lineal	bwtu-vzfn-idyj-qdoi	4		2020-1	diurna	01	17	\N
nhpd-cind-hywx-carb	aritmética y Álgebra 	oagw-qyst-joxl-vwdi	6		2020-1	nocturna	01n	17	\N
izvu-hfal-yhap-dfyx	cálculo integral grupo 01d	dvsh-kgie-dxob-qqpy	5		2020-1	diurna	01	17	\N
lvpi-pkeu-rriw-lnok	cálculo ii	uqjv-kpta-vayk-jgxz	4		2020-1	diurna	01	17	pregrado
ihca-jzes-xkpy-nurh	práctica docente ii grupo 01n	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	\N
crfb-zbzt-hbbo-agpe	práctica docente ii grupo 02n	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	02n	17	\N
pzgs-ojtu-haxp-qioj	diseño y análisis de experimentos 	uqjv-kpta-vayk-jgxz	5		2020-1	diurna	01	17	\N
ezvu-wwlk-gzdu-qtdz	didáctica de las matemáticas	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	\N
ptel-nreb-uily-husp	historia y  epistemología de las matemáticas 	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
ofbj-jcfy-qaqh-haae	cálculo diferencial	tldv-gaew-wsyi-ftel	6		2021-1	diurna	g2	17	pregrado
pvdv-cqwq-kyun-pcgk	pensamiento lógico matemático	hfwp-jfzc-sadh-hxuc	48		2021-1	virtual	01n	17	pregrado
lyjo-kkhu-ozah-owfn	estadística	kekf-jdbu-ogve-sfpe	4		2021-1	diurna	01	17	pregrado
awcd-kswv-otnk-dijv	matemáticas generales	tldv-gaew-wsyi-ftel	3		2021-1	diurna	g2	17	pregrado
axdd-ihlx-icgs-lbif	cálculo integral	tldv-gaew-wsyi-ftel	5		2021-1	diurna	g1	17	pregrado
aqeb-hthj-vdwt-hcbj	cálculo diferencial	tldv-gaew-wsyi-ftel	6		2021-1	diurna	g1	17	pregrado
znte-brqb-qlwi-lnkj	geometría	tldv-gaew-wsyi-ftel	5		2021-1	diurna	g2	17	pregrado
kuzl-expi-foxo-frhr	matemáticas generales	tldv-gaew-wsyi-ftel	3		2021-1	diurna	(g1)	17	pregrado
rhpu-qtpa-gojd-dkra	geometría	tldv-gaew-wsyi-ftel	5		2021-1	diurna	g1	17	pregrado
vitk-chng-xyjb-giqd	ecuaciones diferenciales 	dolf-vybi-ozoa-lfla	3		2020-1	nocturna	01n	17	pregrado
orkb-jlat-utwb-xtkr	cálculo vectorial 	ehuo-jvdh-ajev-pawt	3		2020-1	diurna	01d	17	pregrado
fush-qtpw-chse-bgpl	pensamiento lógico matemático	cxrd-hoct-gqdk-vveo	48		2021-1	virtual	len1d	17	pregrado
dbeu-rzud-nwfh-pitb	pensamiento lógico matemático	qnvo-xxro-ypgp-vpto	48		2021-1	virtual	02d	17	pregrado
grpa-cadq-hpyk-ibwk	pensamiento lógico matemático	cxrd-hoct-gqdk-vveo	48		2021-1	virtual	len2d	17	pregrado
hghs-oixe-pfdq-rsce	pensamiento lógico matemático	cxrd-hoct-gqdk-vveo	48		2021-1	virtual	len3d	17	pregrado
xilt-plkx-eqsw-teav	pensamiento lógico matemático	cxrd-hoct-gqdk-vveo	48		2021-1	virtual	02len	17	pregrado
twwr-ixoi-etqo-cxjc	pensamiento lógico matemático	cxrd-hoct-gqdk-vveo	48		2021-1	virtual	01len	17	pregrado
tovc-lsou-npyv-excr	estructuras algebraicas 28217	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
ijri-ajfi-eyin-awdb	pensamiento lógico matemático grupo 01	jths-wyeo-zxhh-yoqn	48		2020-1	virtual	01	12	pregrado
inli-zdig-ngbq-lnle	comunicación, razonamiento y contexto en matemáticas 	dzap-xrzb-lwbz-niye	20		2020-1	distancia	01	5	pregrado
oqgj-spzt-adyd-ljsr	pensamiento lógico matemático grupo len01	cxrd-hoct-gqdk-vveo	48		2020-1	virtual	 len01	12	pregrado
nxbx-rfcv-xjck-gkxr	pensamiento lógico matemático grupo len02	cxrd-hoct-gqdk-vveo	48		2020-1	virtual	len02	12	pregrado
dffe-qdhe-lifx-eslg	pensamiento lógico matemático grupo  03len	cxrd-hoct-gqdk-vveo	48		2020-1	virtual	len03	12	pregrado
hslz-ldro-whjc-hlhw	proyecto procedimientos de construcción del pensamiento matemático	dzap-xrzb-lwbz-niye	20		2020-1	distancia	01	5	pregrado
orib-npox-fasu-wzya	pensamiento lÓgico-matemÁtico-crÍtico	yaxk-kqhj-hwvc-zsle	48		2020-1	virtual	01	12	pregrado
rcbb-obaf-rvdp-vrbt	pensamiento lógico matemático	hfwp-jfzc-sadh-hxuc	48		2020-1	virtual	01	12	pregrado
qpwo-chpe-pdso-zbrb	proyecto procedimientos de construcción del pensamiento matemático	dzap-xrzb-lwbz-niye	20		2020-1	distancia	01	5	pregrado
ajvr-utut-flnx-zluh	pensamiento lógico matemático grupo len 03	cxrd-hoct-gqdk-vveo	48		2020-1	virtual	len03	12	pregrado
ktwl-hybe-wcpg-kdje	pensamiento lógico matemático grupo 02	jths-wyeo-zxhh-yoqn	48		2020-1	virtual	01	12	pregrado
dzwq-zjaf-xuxr-nhkb	bioestadística	iios-oowv-hnhg-wbph	68		2020-1	posgrado	01	17	posgrado
dnhk-wnxb-xkut-rqwo	investigación iii	ibpi-qtwa-rvaf-jdhi	48		2020-1	posgrado	01	16	posgrado
huhk-yukz-ujue-einj	pensamiento lógico matemático	qnvo-xxro-ypgp-vpto	48		2021-1	virtual	01d	17	pregrado
ynhp-ywjq-rpfs-rqqz	pensamiento lógico matemático	cxrd-hoct-gqdk-vveo	48		2021-1	virtual	03len	17	pregrado
ztwd-yepo-kwin-dhgz	cálculo integral	ehuo-jvdh-ajev-pawt	4		2021-1	nocturna	01	17	pregrado
hjbw-udwf-kwtk-uvnr	cálculo diferencial	ehuo-jvdh-ajev-pawt	4		2021-1	diurna	02	17	pregrado
jydo-evrg-rguc-ysnk	cálculo vectorial	ehuo-jvdh-ajev-pawt	3		2021-1	nocturna	01	17	pregrado
hzss-jitf-dafx-onwk	cálculo integral	ehuo-jvdh-ajev-pawt	4		2021-1	diurna	01	17	pregrado
cpxu-kpiy-ikoo-csaq	cálculo diferencial	ehuo-jvdh-ajev-pawt	4		2021-1	diurna	01	17	pregrado
jwfs-zont-sqys-bjfz	Álgebra lineal 	ehuo-jvdh-ajev-pawt	3		2021-1	diurna	01	17	pregrado
utce-jsyw-ghsr-xcec	estadística	ehuo-jvdh-ajev-pawt	3		2021-1	nocturna	01	17	pregrado
ltnf-twbk-fawf-abff	Álgebra lineal	ehuo-jvdh-ajev-pawt	3		2021-1	diurna	02	17	pregrado
urea-vrat-cgdo-uapj	cálculo vectorial	ehuo-jvdh-ajev-pawt	3		2021-1	diurna	01	17	pregrado
ftzd-flks-opcr-lwva	práctica docente ii 28185	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	02n	17	pregrado
vlrg-iwzw-uvxy-quuv	ecuaciones diferenciales	ehuo-jvdh-ajev-pawt	3		2021-1	diurna	01	17	pregrado
zrav-stdv-lsgd-dpri	perspectivas ped. y curriculares ii 28225	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
wweb-ojiu-uzle-tjcr	estadística	ehuo-jvdh-ajev-pawt	3		2021-1	diurna	01	17	pregrado
rlyd-qzdh-zzra-rtwg	lect. y escrit. de cast. en la disciplina 28201	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
gshd-gywb-ulzk-jphs	diseño experimental	ehuo-jvdh-ajev-pawt	4		2021-1	diurna	01	17	pregrado
lkfe-iqqn-grnl-kpoz	geometría euclidiana 28199	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	o1n	17	pregrado
xblr-vnkp-yliz-bqkc	pensamiento lógico matemático 	cxrd-hoct-gqdk-vveo	48		2020-1	virtual	01	12	pregrado
bruw-uttv-rgyv-ywft	trigonometría 28204	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	o1n	17	pregrado
nuhe-qdbc-dhby-slio	uniquindianidad	oagw-qyst-joxl-vwdi	48		2021-1	virtual	01n	17	pregrado
fsuy-lqng-ajsr-nlzd	epistemología de las mat. 28168	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
knnj-pqlc-ipfl-pfoh	cálculo i 28207	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
xaud-ddic-tprq-ftvl	procesos socio cognitivos del aprendizaje 2	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
hwtp-gkzo-pfuy-qaby	perspectivas ped. y curriculares i 28210	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
rfrb-grau-opbn-fzev	cálculo ii 28211	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
yuuf-xzqe-xter-pipy	matemáticas discretas 28212	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
uada-lhoo-uwnb-puja	modelos estadísticos	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
uaih-tvdx-bjeb-gltn	inglés ii 28220	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
uoar-geuv-cqss-boxl	hist.  y epist. de las matemáticas 28218	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
koqs-ypwg-qzpv-tdlf	inglés iv	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
sxoo-qvro-jzyt-rlzf	cálculo diferencial grupo 02d	dvsh-kgie-dxob-qqpy	6		2020-1	diurna	02d	17	pregrado
aqqy-grso-atza-bnyr	tópicos en investigación ii 28192	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
cbcs-whsx-vkpl-slop	métodos estadísticos 28161	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
dcyv-dohg-iutn-jgpt	práctica pedagógica i	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	02n	17	pregrado
ilop-jpiy-wwds-ddip	ecuaciones diferenciales 	tvrn-hufu-tyeo-fgrc	4		2020-1	diurna	01	17	pregrado
xkrk-xriq-cfrp-fuwc	probabilidad 28167	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
nnxh-pqeu-nujf-jgrh	tópicos en investigación iii 28193	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
yluh-ecyj-bcgf-diqd	historia de las mat. 28165	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
yhxk-lqvs-qpod-fvla	práctica docente i 28183	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
qpur-xoog-staq-dapj	cálculo diferencial grupo 01n	wvcv-ofyz-feit-nagq	6		2020-1	nocturna	01n	17	pregrado
dril-jdkz-dtvi-zklp	análisis real 28184	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
fxps-xkyo-lfbd-iahw	matemáticas generales 01c	tldv-gaew-wsyi-ftel	3		2020-1	diurna	01c	17	pregrado
kekl-rukt-xabe-yheb	proyecto procedimientos de construcción del pensamiento matemático	dzap-xrzb-lwbz-niye	20		2020-1	distancia	01	17	pregrado
tesu-iycj-geew-ztye	cálculo multivariado y vectorial grupo 01 n	wvcv-ofyz-feit-nagq	5		2020-1	nocturna	01n	17	pregrado
janr-tndi-urcf-rvwz	matemáticas fundamentales 02qc	uqjv-kpta-vayk-jgxz	6		2020-1	diurna	02qc	17	pregrado
ruqa-ppnb-ckat-lskc	cálculo diferencial grupo 2	ehuo-jvdh-ajev-pawt	4		2020-1	diurna	2	17	pregrado
atql-evyo-inga-khjv	pensamiento lógico matemático	qnvo-xxro-ypgp-vpto	48		2020-1	virtual	01	17	pregrado
zvll-qfur-fdle-xjae	algebra lineal	wvcv-ofyz-feit-nagq	4		2020-1	nocturna	01	17	pregrado
wdlw-htrw-hqed-hknp	matemáticas discretas  01n 	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
cnxi-xhye-gpeo-jzjj	cálculo diferencial b1	jths-wyeo-zxhh-yoqn	6		2020-1	diurna	b1	17	pregrado
ceqh-sifz-wukj-vfyg	ecuaciones diferenciales 	ehuo-jvdh-ajev-pawt	3		2020-1	diurna	01	17	pregrado
yihj-ysvt-erhi-yspb	matemáticas discretas 02d	dvsh-kgie-dxob-qqpy	4		2020-1	diurna	02d	17	pregrado
ezpl-yozv-axey-azqi	cálculo diferencial 03-d	dvsh-kgie-dxob-qqpy	6		2020-1	diurna	03d	17	pregrado
ircl-prra-oiwi-budt	geometría 03c	tvgu-vjfb-uosa-aspe	5		2020-1	diurna	03c	17	pregrado
uqje-prpv-rcbf-bglh	geometría y trigonometría 	wijo-hhwl-kcya-rtkv	6		2020-1	diurna	01	17	pregrado
winj-woxv-kkvh-xrfy	didáctica de la matemáticas en la educación infantil  28223	oagw-qyst-joxl-vwdi	4		2021-1	nocturna	01n	17	pregrado
ywpx-gsgz-dyhf-lkln	cálculo integral  02d	tvrn-hufu-tyeo-fgrc	5		2020-1	diurna	02d	17	pregrado
vjuz-ehal-sneg-ljsx	cálculo multivariado	uqjv-kpta-vayk-jgxz	4		2020-1	diurna	01	17	pregrado
hpao-bjow-vzor-nhew	cálculo diferencial grupo 02c	tldv-gaew-wsyi-ftel	6		2020-1	diurna	02c	17	pregrado
grep-inwu-cbhi-iyro	cálculo diferencial  grupo q2	wijo-hhwl-kcya-rtkv	6		2020-1	diurna	q2	17	pregrado
rbja-ynoi-jvok-pyko	Álgebra lineal grupo g1	tvgu-vjfb-uosa-aspe	4		2020-1	diurna	g1	17	pregrado
tlzc-dwyw-flxa-lzbv	bioestadística	jths-wyeo-zxhh-yoqn	4		2020-1	diurna	01	17	pregrado
eqsi-fwnx-riwb-jcib	Álgebra lineal grupo 01n	wvcv-ofyz-feit-nagq	4		2020-1	nocturna	01n	17	pregrado
ivnl-qiix-aasq-ayai	geometría 02c	tldv-gaew-wsyi-ftel	5		2020-1	diurna	02c	17	pregrado
gtdo-nvdo-xqgx-dlll	mátematicas generales grupo 01d	tvrn-hufu-tyeo-fgrc	3		2020-1	diurna	01d	17	pregrado
tqbu-yqtl-eggk-ksiw	geometría euclidiana	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
xigz-ipbo-jypd-qlfz	matemáticas discretas	dvsh-kgie-dxob-qqpy	4		2020-1	diurna	01	17	pregrado
rubd-blbg-tglv-ogxu	lógica formal	dvsh-kgie-dxob-qqpy	4		2020-1	diurna	01d	17	pregrado
jlkx-cnpv-phje-wynt	cálculo diferencial grupo 01d  	dvsh-kgie-dxob-qqpy	6		2020-1	diurna	01d	17	pregrado
cgsi-obwi-pxhq-rolq	matemáticas discretas	wvcv-ofyz-feit-nagq	4		2020-1	nocturna	01n	17	pregrado
hhdh-dcsw-jqyg-updj	cálculo integral 	ehuo-jvdh-ajev-pawt	4		2020-1	diurna	01	17	pregrado
cxwr-lsry-khgk-ndvg	lógica formal	wvcv-ofyz-feit-nagq	4		2020-1	nocturna	01n	17	pregrado
ityc-inpi-cdnl-fhlw	cálculo integral grupo 02d	dvsh-kgie-dxob-qqpy	5		2020-1	diurna	02d	17	pregrado
jgjn-rujg-xlpn-ragq	cálculo ii	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
hydk-ipkv-cvfa-jabh	ecuaciones diferenciales	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
cnjy-idgx-ajcl-rxii	resolución de problemas 	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
zrgd-dlpq-xerh-btgc	epistemología de las matemáticas 	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
enqk-rjuc-wbea-nqqf	ecuaciones diferenciales	wijo-hhwl-kcya-rtkv	6		2020-1	diurna	01	17	pregrado
qwwk-ezzj-sjeg-hgke	geometría analítica 	tvgu-vjfb-uosa-aspe	4		2020-1	diurna	01	17	pregrado
ppqq-xryy-rziv-akcj	geometría grupo 01-c	tldv-gaew-wsyi-ftel	5		2020-1	diurna	01c	17	pregrado
ecgy-vbqs-dxfh-owtl	escuela inclusiva y contexto sociocultural i	oagw-qyst-joxl-vwdi	3		2020-1	nocturna	01n	17	pregrado
kcnv-qkwn-ixig-ddks	matemáticas generales 02c	tldv-gaew-wsyi-ftel	3		2020-1	diurna	02c	17	pregrado
erxw-dakb-sxty-bsjw	análisis real	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
ukki-guyt-iaua-hvqi	matemáticas generales grupo 01d	dvsh-kgie-dxob-qqpy	4		2020-1	diurna	01d	17	pregrado
bgnk-zyzn-qjqu-cezx	perspectivas pedagógicas y curriculares i	oagw-qyst-joxl-vwdi	4		2020-1	diurna	01n	17	pregrado
thib-prct-nfcu-uevs	escuela inclusiva y contexto sociocultural i	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	02n	17	pregrado
cdzc-wano-wdhf-eqyp	Álgebra lineal 	tvgu-vjfb-uosa-aspe	4		2020-1	diurna	01	17	pregrado
ofjk-satj-zped-yfqe	matemáticas generales grupo 02d	dvsh-kgie-dxob-qqpy	4		2020-1	diurna	02d	17	pregrado
qeaf-oggy-rpso-ckuh	cálculo diferencial grupo 01d	tvrn-hufu-tyeo-fgrc	6		2020-1	diurna	01d	17	pregrado
iwyg-ifzv-jolu-rsje	métodos númericos	wijo-hhwl-kcya-rtkv	6		2020-1	diurna	01	17	pregrado
rpph-ejbu-axxv-jxrw	Álgebra lineal grupo 01d	dvsh-kgie-dxob-qqpy	4		2020-1	diurna	01d	17	pregrado
tycg-hgcu-xwpr-vayx	Álgebra lineal grupo 2	ehuo-jvdh-ajev-pawt	3		2020-1	diurna	02	17	pregrado
ytrs-fuaj-xkhn-bguq	matemáticas generales grupo 01n	wvcv-ofyz-feit-nagq	4		2020-1	nocturna	01n	17	pregrado
uywz-jtbf-rqdk-nfxz	Álgebra lineal grupo 02	uqjv-kpta-vayk-jgxz	6		2020-1	diurna	02	17	pregrado
sjtl-uiic-fuwg-ysnk	cálculo integral 	tvrn-hufu-tyeo-fgrc	5		2020-1	diurna	01	17	pregrado
hrjk-qncb-rtib-bvts	lógica y teoría de conjuntos	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
zykj-udch-pfen-tgft	cálculo iii	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
onri-tjag-axhj-hvii	cálculo vectorial 01	uqjv-kpta-vayk-jgxz	4		2020-1	diurna	01	17	pregrado
rkrz-ddrq-krdq-ipao	cálculo diferencial grupo g1t	tvgu-vjfb-uosa-aspe	6		2020-1	diurna	g1t	17	pregrado
rvrl-rxfg-aseq-kfbj	estructuras algebráicas 	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
dskh-lowy-jlaj-kfva	estadística y probabilidad 	tvgu-vjfb-uosa-aspe	4		2020-1	diurna	01	17	pregrado
rxsd-lkgu-vrge-aatx	matematicas generales g2t	tvgu-vjfb-uosa-aspe	3		2020-1	diurna	g2t	17	pregrado
bqlv-seyf-creb-fxyn	estadística 	dolf-vybi-ozoa-lfla	3		2020-1	nocturna	01n	17	pregrado
qsil-altg-xjkx-dvaw	cálculo integral 01	uqjv-kpta-vayk-jgxz	6		2020-1	diurna	01	17	pregrado
ugar-ctwb-hcdo-rczn	tópicos de investigación i	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
lcrs-unsg-qgqq-jtwx	Álgebra lineal grupo 01	ehuo-jvdh-ajev-pawt	3		2020-1	diurna	01	17	pregrado
xcto-hvkz-tlfg-zgjo	trigonometría 	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
xshg-lavi-pzzs-dtkp	tópicos de investigación ii	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
fdjz-gtij-zcvf-dnrw	didáctica contemporánea	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
pwdq-asiu-nwol-nyrp	geometría analítica	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
kjsv-zjxf-ypgz-rgdq	cálculo iv	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
oadu-ffoc-ixic-zgoy	cálculo multivariado y vectorial grupo 01d	dvsh-kgie-dxob-qqpy	5		2020-1	diurna	01d	17	pregrado
qaht-ndpr-yifg-suiu	curso electivo ii- modelos biomatemáticos	ibpi-qtwa-rvaf-jdhi	48		2020-1	posgrado	01	16	posgrado
kayh-ikbf-bord-ovjd	tópicos de investigación iii	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
oiai-jjbr-xbwb-yzlg	estadística 	kekf-jdbu-ogve-sfpe	4		2020-1	diurna	01	17	pregrado
xgxg-lesb-wvwb-vzin	estadística 	geqj-gghh-yfwp-swao	4		2020-1	diurna	01d	17	pregrado
hhii-rkxs-jjzr-ljkb	seminario de investigación	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
zqnb-leky-kszf-juyq	pensamiento lógico matemático grupo 01 len 	cxrd-hoct-gqdk-vveo	48		2020-1	virtual	01len	17	pregrado
jozx-pfhg-nspb-xeji	práctica docente i grupo 01n	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
pubp-rruu-fnjx-iwdu	práctica docente i grupo 02n	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	02n	17	pregrado
yztx-dwrj-kadd-jtkj	diseño experimental 	wvcv-ofyz-feit-nagq	4		2020-1	nocturna	01n	17	pregrado
vzdj-uzzw-azqy-cszq	Álgebra lineal	hzop-bunr-cpxg-prsa	4		2021-1	diurna	02	17	pregrado
itsa-tjqd-vfqc-dkvd	cálculo vectorial	uqjv-kpta-vayk-jgxz	4		2021-1	diurna	01	17	pregrado
sxye-enwj-vsax-iniu	cálculo integral	hzop-bunr-cpxg-prsa	4		2021-1	diurna	01	17	pregrado
zvwn-gjwv-uxkp-dcld	Álgebra lineal 	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
nwco-eqqa-ujyx-qwgy	seminario de investigación i	ihnb-hgwg-ybff-qjkt	68		2020-1	posgrado	01	17	posgrado
fsbo-ugnp-ibjy-ilyq	diseño y análisis de datos de   trabajo de grado i y ii	jths-wyeo-zxhh-yoqn	8		2020-1	diurna	01d	17	pregrado
dcnk-ziqj-jugu-nvvu	inferencia estadística	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
lhfb-uvpr-pkwn-lqjw	diseño experimental	jths-wyeo-zxhh-yoqn	4		2020-1	diurna	01	17	pregrado
kqit-znli-ecuw-lzux	variable compleja	oagw-qyst-joxl-vwdi	4		2020-1	nocturna	01n	17	pregrado
rggz-plzv-zyki-yzxa	cálculo integral	tvrn-hufu-tyeo-fgrc	5		2021-1	diurna	1elec	17	pregrado
nkgg-uqag-vsyt-ssvq	matemáticas generales	hzop-bunr-cpxg-prsa	3		2021-1	diurna	01	17	pregrado
qclf-reww-gjil-nanw	cálculo vectorial 	wijo-hhwl-kcya-rtkv	6		2020-1	diurna	01	17	pregrado
kqfs-uwfx-gojp-axhw	modelos biomatemáticos con edp	ihnb-hgwg-ybff-qjkt	68		2020-1	posgrado	01	17	posgrado
llyf-vqnp-wczk-pjfa	matemáticas generales	hzop-bunr-cpxg-prsa	3		2021-1	diurna	02	17	pregrado
frsn-vjio-ljeq-jhdp	diseño experimental 	ehuo-jvdh-ajev-pawt	4		2020-1	diurna	01d	17	pregrado
wdke-dxuo-gepe-jxtc	electiva ii (bioestadística)	rbgy-eqql-ixul-kgzf	4		2021-1	posgrado	01	17	posgrado
fjxs-bvvl-ufce-nqwq	estadística 	ehuo-jvdh-ajev-pawt	3		2020-1	diurna	01d	17	pregrado
lvht-vejr-qyus-fboz	geometría	hzop-bunr-cpxg-prsa	5		2021-1	diurna	01	17	pregrado
ozkx-rxse-iwxk-jyhn	cálculo diferencial	tvrn-hufu-tyeo-fgrc	6		2021-1	diurna	1elec	17	pregrado
jklp-ycdh-gvxv-qvsk	geometría	hzop-bunr-cpxg-prsa	5		2021-1	diurna	02	17	pregrado
ipro-xrig-hshr-odsy	estadística	hzop-bunr-cpxg-prsa	4		2021-1	diurna	01	17	pregrado
plsq-keld-rvpz-rbic	cálculo diferencial	hzop-bunr-cpxg-prsa	6		2021-1	diurna	01	17	pregrado
sxpw-inuq-yfkd-cxfx	cálculo integral	uqjv-kpta-vayk-jgxz	6		2021-1	diurna	01	17	pregrado
hweq-tgik-ewvn-auqn	Álgebra lineal	hzop-bunr-cpxg-prsa	4		2021-1	diurna	01	17	pregrado
kqoq-oaef-atjz-exxg	matemáticas especiales	hzop-bunr-cpxg-prsa	6		2021-1	diurna	01	17	pregrado
ypor-sznz-ajni-hrcq	cálculo diferencial	tvrn-hufu-tyeo-fgrc	6		2021-1	diurna	2elec	17	pregrado
tqce-wkiw-wqhi-yrdc	investigación v	ibpi-qtwa-rvaf-jdhi	48		2021-1	virtual	01	17	posgrado
ftea-zvwi-kfka-qblv	cálculo integral	tvrn-hufu-tyeo-fgrc	5		2021-1	diurna	2elec	17	pregrado
dklz-prgv-erey-botu	matemáticas generales	tvrn-hufu-tyeo-fgrc	3		2021-1	diurna	1elec	17	pregrado
zvji-dkwo-hnfz-fqev	ecuaciones diferenciales	tvrn-hufu-tyeo-fgrc	4		2021-1	diurna	1elec	17	pregrado
wlix-slni-douv-twqd	matemáticas generales	tvrn-hufu-tyeo-fgrc	11		2021-1	diurna	2elec	17	pregrado
voas-tjtu-xgxl-yxvv	diseño experimental	uqjv-kpta-vayk-jgxz	4		2021-1	diurna	01	17	pregrado
aelt-ydit-fiav-ezur	cálculo integral	uqjv-kpta-vayk-jgxz	6		2021-1	diurna	02	17	pregrado
jbga-wpex-dhjc-cvoc	ecuaciones diferenciales	uqjv-kpta-vayk-jgxz	6		2021-1	diurna	01	17	pregrado
kwfb-wpqs-cwkx-xqxu	Álgebra lineal	uqjv-kpta-vayk-jgxz	6		2021-1	diurna	01	17	pregrado
dknj-ehic-lrgq-tiea	cálculo multivariado 	uqjv-kpta-vayk-jgxz	4		2021-1	diurna	01	17	pregrado
fqxq-gnnn-qtfa-vqqg	diseño experimental	jths-wyeo-zxhh-yoqn	4		2021-1	diurna	01	17	pregrado
kxif-rrqs-ntpt-olxf	pensamiento lógico matemático	yaxk-kqhj-hwvc-zsle	48		2021-1	virtual	01d	17	pregrado
iedw-bdgo-ryjg-clgo	estadística para químicos	uqjv-kpta-vayk-jgxz	4		2021-1	diurna	01	17	pregrado
hlft-psoz-wkyg-xgwv	pensamiento lógico matemático	jths-wyeo-zxhh-yoqn	48		2021-1	virtual	01d	17	pregrado
kqjc-dnco-sxnx-ridb	bioestadística	jths-wyeo-zxhh-yoqn	6		2021-1	diurna	01	17	pregrado
wcgs-xsnq-sekq-ssno	bioestadística	jths-wyeo-zxhh-yoqn	6		2021-1	diurna	02	17	pregrado
vgoy-zann-aubk-vrvq	geometría y trigonometría	wijo-hhwl-kcya-rtkv	6		2021-1	diurna	01	17	pregrado
keub-xwot-tfoo-bbxk	Álgebra lineal	wijo-hhwl-kcya-rtkv	6		2021-1	diurna	01	17	pregrado
agfh-nlnl-qrpt-uxlw	cálculo vectorial	wijo-hhwl-kcya-rtkv	6		2021-1	diurna	01	17	pregrado
ogof-kepc-zulz-fhin	ecuaciones diferenciales	wijo-hhwl-kcya-rtkv	6		2021-1	diurna	01	17	pregrado
ufxr-afvt-lvqv-rhkg	matemáticas especiales 	wijo-hhwl-kcya-rtkv	6		2021-1	diurna	01	17	pregrado
atws-zloa-tnow-invp	métodos numéricos	wijo-hhwl-kcya-rtkv	6		2021-1	diurna	01	17	pregrado
rexv-buvj-wwfy-kslq	pensamiento lógico matemático	wxfc-eyda-uura-csdu	48		2021-1	virtual	04n	17	pregrado
qetn-bwue-gbls-yobv	pensamiento lógico matemático	jths-wyeo-zxhh-yoqn	48		2021-1	virtual	02d	17	pregrado
qqvh-cjyc-scnc-svxv	pensamiento lógico matemático	wxfc-eyda-uura-csdu	48		2021-1	virtual	05n	17	pregrado
aauw-adte-lysx-gyrk	pensamiento lógico matemático	iohz-asnh-qzkt-xbwa	48		2021-1	virtual	01d	17	pregrado
acpr-wjqy-hzpr-ewsx	pensamiento lógico matemático	iohz-asnh-qzkt-xbwa	0		2021-1	virtual	01n	17	pregrado
hgqs-pjpd-eyaj-ydix	cálculo integral	qtun-qxsb-ezrw-bdon	5		2021-1	diurna	02d	17	pregrado
rdnr-rnpa-fshf-wcqw	Álgebra lineal	qtun-qxsb-ezrw-bdon	4		2021-1	diurna	01d	17	pregrado
knwn-lkvy-kjsr-bylw	matemáticas generales	qtun-qxsb-ezrw-bdon	4		2021-1	nocturna	01n	17	pregrado
ktdl-lnjy-rrra-stha	Álgebra lineal	qtun-qxsb-ezrw-bdon	4		2021-1	diurna	02d	17	pregrado
sifw-lxbk-ygid-hfjd	cálculo integral	qtun-qxsb-ezrw-bdon	5		2021-1	diurna	03d	17	pregrado
owxo-xkok-ugwj-lfpj	Álgebra lineal	qtun-qxsb-ezrw-bdon	4		2021-1	nocturna	01n	17	pregrado
cgea-lrab-ydtn-kgnc	matemáticas discretas	qtun-qxsb-ezrw-bdon	4		2021-1	diurna	01d	17	pregrado
eahn-peak-qkwk-wzcc	Álgebra lineal	qtun-qxsb-ezrw-bdon	4		2021-1	nocturna	02n	17	pregrado
lldo-zbsv-jfje-nfzx	cálculo integral	qtun-qxsb-ezrw-bdon	5		2021-1	nocturna	01n	17	pregrado
bhhu-gbyp-beic-jyoj	análisis númerico	qtun-qxsb-ezrw-bdon	4		2021-1	nocturna	01n	17	pregrado
httq-blsh-gvdy-nhpd	probabilidad y procesos estocásticos	ihnb-hgwg-ybff-qjkt	68		2021-1	diurna	01	16	posgrado
dipt-buzr-ihxp-fvxl	matemáticas discretas	qtun-qxsb-ezrw-bdon	4		2021-1	diurna	02d	17	pregrado
kpfl-xnga-jwaw-asec	cálculo diferencial	qtun-qxsb-ezrw-bdon	6		2021-1	diurna	01d	17	pregrado
auiq-eyyt-yvks-anfd	cálculo multivariado y vectorial	qtun-qxsb-ezrw-bdon	5		2021-1	diurna	01d	17	pregrado
shpf-hczl-pnfr-dvry	cálculo diferencial	qtun-qxsb-ezrw-bdon	6		2021-1	diurna	02d	17	pregrado
ifza-zdad-tipx-jzvx	matemáticas generales	qtun-qxsb-ezrw-bdon	4		2021-1	nocturna	03n	17	pregrado
qovf-qghj-csfv-vrdo	cálculo multivariado y vectorial	qtun-qxsb-ezrw-bdon	5		2021-1	diurna	02d	17	pregrado
bzza-gioi-glll-juuo	cálculo diferencial	qtun-qxsb-ezrw-bdon	6		2021-1	diurna	03d	17	pregrado
ezjp-sqbw-ejci-waqf	matemáticas discretas	qtun-qxsb-ezrw-bdon	4		2021-1	nocturna	01n	17	pregrado
pvyd-jttx-jyxj-aagk	cálculo diferencial	qtun-qxsb-ezrw-bdon	6		2021-1	diurna	01n	17	pregrado
pkri-cooa-ovak-dwss	cálculo multivariado y vectorial	qtun-qxsb-ezrw-bdon	5		2021-1	nocturna	01n	17	pregrado
eepu-xqoj-wyxv-ogyl	cálculo diferencial	qtun-qxsb-ezrw-bdon	6		2021-1	nocturna	02n	17	pregrado
vlzd-tapc-cngu-xsle	ecuaciones diferenciales	qtun-qxsb-ezrw-bdon	4		2021-1	diurna	02d	17	pregrado
zynf-lckw-zjvx-qxvw	matemáticas discretas	qtun-qxsb-ezrw-bdon	4		2021-1	nocturna	02n	17	pregrado
torw-nhaw-rwao-vcaa	teoría de grafos	qtun-qxsb-ezrw-bdon	4		2021-1	diurna	01d	17	pregrado
ppsa-sdtq-dqog-kxcx	ecuaciones diferenciales	qtun-qxsb-ezrw-bdon	4		2021-1	nocturna	01n	17	pregrado
yrxj-cfsh-gkrv-sddi	matemáticas generales	qtun-qxsb-ezrw-bdon	4		2021-1	diurna	01d	17	pregrado
pige-jikc-qdxn-zbat	estadística y probabilidad	qtun-qxsb-ezrw-bdon	4		2021-1	nocturna	01n	17	pregrado
prht-djbf-fllp-wadl	lógica formal	qtun-qxsb-ezrw-bdon	4		2021-1	nocturna	01n	17	pregrado
wegt-hxap-fwqz-gctc	modelos biomatemáticos	ihnb-hgwg-ybff-qjkt	4		2021-1	posgrado	01	17	posgrado
vvvc-isey-yjzc-wefv	matemáticas generales	qtun-qxsb-ezrw-bdon	4		2021-1	diurna	02d	17	pregrado
alqt-yraa-cwhh-ldpt	teoría de grafos	qtun-qxsb-ezrw-bdon	4		2021-1	nocturna	01n	17	pregrado
eeoy-pwuo-woyv-sqne	cálculo integral	qtun-qxsb-ezrw-bdon	5		2021-1	diurna	01d	17	pregrado
paxz-hcay-xqgv-tiwd	matemáticas generales	qtun-qxsb-ezrw-bdon	4		2021-1	diurna	03d	17	pregrado
qhlv-rfkr-ybtk-zhfp	diseño experimental	qnvo-xxro-ypgp-vpto	6		2021-1	diurna	01d	17	pregrado
sloj-bojn-bdyd-sikf	Álgebra lineal aplicada	bwtu-vzfn-idyj-qdoi	4		2021-1	diurna	01d	17	pregrado
dzst-nujc-tdbq-vgcq	cálculo integral	zunl-pybo-oeso-wxso	4		2021-1	diurna	02	17	pregrado
bwtk-aqep-opkf-byvl	seminario de investigación i	ihnb-hgwg-ybff-qjkt	16		2021-1	diurna	01	17	posgrado
swoz-hxxz-epzs-phvj	seminario de investigación ii	ihnb-hgwg-ybff-qjkt	4		2021-1	posgrado	01	17	posgrado
hvyb-bxll-scue-ysvd	seminario de investigación i	ihnb-hgwg-ybff-qjkt	4		2021-1	posgrado	01d	17	posgrado
\.


--
-- TOC entry 3100 (class 0 OID 17982)
-- Dependencies: 226
-- Data for Name: siap_subactividades_docentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_subactividades_docentes (idsubactividaddocente, subactividad, idactividaddocente) FROM stdin;
clzo-xxxa-nzoq-idhn	ejecución proyectos de investigación, desarrollo tecnológico o de innovación 	yegs-ysif-vlkf-vupc
voeb-ojkp-zesn-vkzk	dirección trabajos de grado	dzns-phqg-tqbf-dyhw
wchd-ftrn-ezkj-wkrg	asesorias especiales	dzns-phqg-tqbf-dyhw
fpcp-hbka-ryrs-oxrv	fundamentación epistemológica y pedagógica 	kbkk-licc-laul-dwec
tytf-eerz-wvzu-tnwr	autoevaluación para renovación de registro calificado	uiwh-ttec-pail-yndb
eljk-wywl-ibeg-sgyq	representaciones institucionales e interinstitucionales	uiwh-ttec-pail-yndb
sznl-koef-vskc-drqs	cómites ampliados de profesores (programa o facultad)	uiwh-ttec-pail-yndb
kjji-otcb-tqhk-uuwq	consejos ampliados de profesores (programa o facultad)	uiwh-ttec-pail-yndb
lzdv-epgh-flqa-eepg	cargos de dirección 	tndl-wiai-duhz-zade
qjwh-fylw-xtap-pwaf	capacitaciones que no implique comisión de estudio	qxyf-obgt-tvrt-gwhc
uwvg-vyqq-tbgp-xtuo	comisión de estudios	qxyf-obgt-tvrt-gwhc
ehrl-cfbv-fhhg-ehwv	ejecución de proyectos sociales de extensión 	rrzz-jrhg-pfbr-rsny
afoq-qbib-jtdx-kqwb	ejecución de proyectos solidarios	rrzz-jrhg-pfbr-rsny
eqsh-tcnp-zcnd-kevq	autoevaluación con fines de acreditación institucional	uiwh-ttec-pail-yndb
yjpz-ufhq-vgcr-rvar	semana intersemestral	uiwh-ttec-pail-yndb
\.


--
-- TOC entry 3088 (class 0 OID 17846)
-- Dependencies: 214
-- Data for Name: siap_tipo_contrato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_tipo_contrato (idtipocontrato, contrato, horas) FROM stdin;
isyk-vfre-etau-qyur	catedrático	272
iwve-xjvc-dehx-woad	carrera	900
bdxy-uyay-wanj-ddhc	contrato	900
\.


--
-- TOC entry 3107 (class 0 OID 18127)
-- Dependencies: 233
-- Data for Name: siap_trabajosgrado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siap_trabajosgrado (idtrabajogrado, titulo, estudiante1, estudiante2, estudiante3, idjurado1, idjurado2, idjurado3, iddirector, idmodalidad, idareaprofundizacion, idgrupoinvestigacion, actapropuesta, fechasustentacion, calificacion) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 210
-- Name: math_resumenes_autor_id_resumen_autor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.math_resumenes_autor_id_resumen_autor_seq', 1, false);


--
-- TOC entry 2903 (class 2606 OID 18043)
-- Name: emem_afiliaciones emem_afiliaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emem_afiliaciones
    ADD CONSTRAINT emem_afiliaciones_pkey PRIMARY KEY (idafiliacion);


--
-- TOC entry 2905 (class 2606 OID 18051)
-- Name: emem_participantes emem_participantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emem_participantes
    ADD CONSTRAINT emem_participantes_pkey PRIMARY KEY (idparticipante);


--
-- TOC entry 2869 (class 2606 OID 17798)
-- Name: math_autor_resumen math_autor_resumen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_autor_resumen
    ADD CONSTRAINT math_autor_resumen_pkey PRIMARY KEY (cedula);


--
-- TOC entry 2861 (class 2606 OID 17756)
-- Name: math_bd_articulos math_bd_articulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_bd_articulos
    ADD CONSTRAINT math_bd_articulos_pkey PRIMARY KEY (id_articulo);


--
-- TOC entry 2873 (class 2606 OID 17827)
-- Name: math_bibliografia_resumen math_bibliografia_resumen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_bibliografia_resumen
    ADD CONSTRAINT math_bibliografia_resumen_pkey PRIMARY KEY (id_bibliografia);


--
-- TOC entry 2867 (class 2606 OID 17785)
-- Name: math_palabras_clave math_palabras_clave_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_palabras_clave
    ADD CONSTRAINT math_palabras_clave_pkey PRIMARY KEY (id_palabra_clave);


--
-- TOC entry 2863 (class 2606 OID 17764)
-- Name: math_participante_emem math_participante_emem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_participante_emem
    ADD CONSTRAINT math_participante_emem_pkey PRIMARY KEY (cedula);


--
-- TOC entry 2875 (class 2606 OID 17840)
-- Name: math_resumen_participante math_resumen_participante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_resumen_participante
    ADD CONSTRAINT math_resumen_participante_pkey PRIMARY KEY (id_participante);


--
-- TOC entry 2865 (class 2606 OID 17772)
-- Name: math_resumen math_resumen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_resumen
    ADD CONSTRAINT math_resumen_pkey PRIMARY KEY (id_resumen);


--
-- TOC entry 2871 (class 2606 OID 17809)
-- Name: math_resumenes_autor math_resumenes_autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_resumenes_autor
    ADD CONSTRAINT math_resumenes_autor_pkey PRIMARY KEY (id_resumen_autor);


--
-- TOC entry 2859 (class 2606 OID 17748)
-- Name: math_rol math_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_rol
    ADD CONSTRAINT math_rol_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 2857 (class 2606 OID 17740)
-- Name: math_usuario math_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_usuario
    ADD CONSTRAINT math_usuario_pkey PRIMARY KEY (cedula);


--
-- TOC entry 2855 (class 2606 OID 17732)
-- Name: math_visitas math_visitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_visitas
    ADD CONSTRAINT math_visitas_pkey PRIMARY KEY (id_visita);


--
-- TOC entry 2899 (class 2606 OID 17976)
-- Name: siap_actividades_docentes siap_actividades_docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_actividades_docentes
    ADD CONSTRAINT siap_actividades_docentes_pkey PRIMARY KEY (idactividaddocente);


--
-- TOC entry 2919 (class 2606 OID 18223)
-- Name: siap_actividades_funciones_docente siap_actividades_funciones_docente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_pkey PRIMARY KEY (idactividadprograma);


--
-- TOC entry 2893 (class 2606 OID 17942)
-- Name: siap_agendas_servicios siap_agendas_servicios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_agendas_servicios
    ADD CONSTRAINT siap_agendas_servicios_pkey PRIMARY KEY (idagendaservicio);


--
-- TOC entry 2913 (class 2606 OID 18126)
-- Name: siap_areasprofundizacion siap_areasprofundizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_areasprofundizacion
    ADD CONSTRAINT siap_areasprofundizacion_pkey PRIMARY KEY (idareaprofundizacion);


--
-- TOC entry 2879 (class 2606 OID 17861)
-- Name: siap_categoria_docentes siap_categoria_docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_categoria_docentes
    ADD CONSTRAINT siap_categoria_docentes_pkey PRIMARY KEY (idcategoriadocente);


--
-- TOC entry 2895 (class 2606 OID 17960)
-- Name: siap_configuraciones siap_configuraciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_configuraciones
    ADD CONSTRAINT siap_configuraciones_pkey PRIMARY KEY (idconfiguracion);


--
-- TOC entry 2881 (class 2606 OID 17869)
-- Name: siap_docentes siap_docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_docentes
    ADD CONSTRAINT siap_docentes_pkey PRIMARY KEY (iddocente);


--
-- TOC entry 2907 (class 2606 OID 18089)
-- Name: siap_egresados siap_egresados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_egresados
    ADD CONSTRAINT siap_egresados_pkey PRIMARY KEY (idegresado);


--
-- TOC entry 2883 (class 2606 OID 17887)
-- Name: siap_errores siap_errores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_errores
    ADD CONSTRAINT siap_errores_pkey PRIMARY KEY (iderror);


--
-- TOC entry 2885 (class 2606 OID 17895)
-- Name: siap_facultades siap_facultades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_facultades
    ADD CONSTRAINT siap_facultades_pkey PRIMARY KEY (idfacultad);


--
-- TOC entry 2921 (class 2606 OID 18251)
-- Name: siap_favoritos siap_favoritos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_favoritos
    ADD CONSTRAINT siap_favoritos_pkey PRIMARY KEY (idfavorito);


--
-- TOC entry 2897 (class 2606 OID 17968)
-- Name: siap_funciones_docentes siap_funciones_docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_funciones_docentes
    ADD CONSTRAINT siap_funciones_docentes_pkey PRIMARY KEY (idfunciondocente);


--
-- TOC entry 2909 (class 2606 OID 18105)
-- Name: siap_gruposinvestigacion siap_gruposinvestigacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_gruposinvestigacion
    ADD CONSTRAINT siap_gruposinvestigacion_pkey PRIMARY KEY (idgrupoinvestigacion);


--
-- TOC entry 2891 (class 2606 OID 17929)
-- Name: siap_horarios_servicios siap_horarios_servicios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_horarios_servicios
    ADD CONSTRAINT siap_horarios_servicios_pkey PRIMARY KEY (idhorarioservicio);


--
-- TOC entry 2911 (class 2606 OID 18118)
-- Name: siap_modalidades siap_modalidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_modalidades
    ADD CONSTRAINT siap_modalidades_pkey PRIMARY KEY (idmodalidad);


--
-- TOC entry 2917 (class 2606 OID 18215)
-- Name: siap_periodos siap_periodos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_periodos
    ADD CONSTRAINT siap_periodos_pkey PRIMARY KEY (idperiodo);


--
-- TOC entry 2887 (class 2606 OID 17903)
-- Name: siap_programas siap_programas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_programas
    ADD CONSTRAINT siap_programas_pkey PRIMARY KEY (idprograma);


--
-- TOC entry 2889 (class 2606 OID 17916)
-- Name: siap_servicios_programas siap_servicios_programas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_servicios_programas
    ADD CONSTRAINT siap_servicios_programas_pkey PRIMARY KEY (idservicioprograma);


--
-- TOC entry 2901 (class 2606 OID 17989)
-- Name: siap_subactividades_docentes siap_subactividades_docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_subactividades_docentes
    ADD CONSTRAINT siap_subactividades_docentes_pkey PRIMARY KEY (idsubactividaddocente);


--
-- TOC entry 2877 (class 2606 OID 17853)
-- Name: siap_tipo_contrato siap_tipo_contrato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_tipo_contrato
    ADD CONSTRAINT siap_tipo_contrato_pkey PRIMARY KEY (idtipocontrato);


--
-- TOC entry 2915 (class 2606 OID 18134)
-- Name: siap_trabajosgrado siap_trabajosgrado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_pkey PRIMARY KEY (idtrabajogrado);


--
-- TOC entry 2937 (class 2606 OID 18052)
-- Name: emem_participantes emem_participantes_idafiliacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emem_participantes
    ADD CONSTRAINT emem_participantes_idafiliacion_fkey FOREIGN KEY (idafiliacion) REFERENCES public.emem_afiliaciones(idafiliacion);


--
-- TOC entry 2926 (class 2606 OID 17828)
-- Name: math_bibliografia_resumen math_bibliografia_resumen_id_resumen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_bibliografia_resumen
    ADD CONSTRAINT math_bibliografia_resumen_id_resumen_fkey FOREIGN KEY (id_resumen) REFERENCES public.math_resumen(id_resumen);


--
-- TOC entry 2923 (class 2606 OID 17786)
-- Name: math_palabras_clave math_palabras_clave_id_resumen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_palabras_clave
    ADD CONSTRAINT math_palabras_clave_id_resumen_fkey FOREIGN KEY (id_resumen) REFERENCES public.math_resumen(id_resumen);


--
-- TOC entry 2922 (class 2606 OID 17773)
-- Name: math_resumen math_resumen_id_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_resumen
    ADD CONSTRAINT math_resumen_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES public.math_usuario(cedula);


--
-- TOC entry 2927 (class 2606 OID 17841)
-- Name: math_resumen_participante math_resumen_participante_id_resumen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_resumen_participante
    ADD CONSTRAINT math_resumen_participante_id_resumen_fkey FOREIGN KEY (id_resumen) REFERENCES public.math_resumen(id_resumen);


--
-- TOC entry 2924 (class 2606 OID 17810)
-- Name: math_resumenes_autor math_resumenes_autor_cedula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_resumenes_autor
    ADD CONSTRAINT math_resumenes_autor_cedula_fkey FOREIGN KEY (cedula) REFERENCES public.math_autor_resumen(cedula);


--
-- TOC entry 2925 (class 2606 OID 17815)
-- Name: math_resumenes_autor math_resumenes_autor_id_resumen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.math_resumenes_autor
    ADD CONSTRAINT math_resumenes_autor_id_resumen_fkey FOREIGN KEY (id_resumen) REFERENCES public.math_resumen(id_resumen);


--
-- TOC entry 2935 (class 2606 OID 17977)
-- Name: siap_actividades_docentes siap_actividades_docentes_idfunciondocente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_actividades_docentes
    ADD CONSTRAINT siap_actividades_docentes_idfunciondocente_fkey FOREIGN KEY (idfunciondocente) REFERENCES public.siap_funciones_docentes(idfunciondocente);


--
-- TOC entry 2947 (class 2606 OID 18229)
-- Name: siap_actividades_funciones_docente siap_actividades_funciones_docente_idactividad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_idactividad_fkey FOREIGN KEY (idactividad) REFERENCES public.siap_actividades_docentes(idactividaddocente);


--
-- TOC entry 2949 (class 2606 OID 18239)
-- Name: siap_actividades_funciones_docente siap_actividades_funciones_docente_iddocente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_iddocente_fkey FOREIGN KEY (iddocente) REFERENCES public.siap_docentes(iddocente);


--
-- TOC entry 2946 (class 2606 OID 18224)
-- Name: siap_actividades_funciones_docente siap_actividades_funciones_docente_idfuncion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_idfuncion_fkey FOREIGN KEY (idfuncion) REFERENCES public.siap_funciones_docentes(idfunciondocente);


--
-- TOC entry 2948 (class 2606 OID 18234)
-- Name: siap_actividades_funciones_docente siap_actividades_funciones_docente_idsubactividad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_idsubactividad_fkey FOREIGN KEY (idsubactividad) REFERENCES public.siap_subactividades_docentes(idsubactividaddocente);


--
-- TOC entry 2933 (class 2606 OID 17943)
-- Name: siap_agendas_servicios siap_agendas_servicios_iddocente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_agendas_servicios
    ADD CONSTRAINT siap_agendas_servicios_iddocente_fkey FOREIGN KEY (iddocente) REFERENCES public.siap_docentes(iddocente);


--
-- TOC entry 2934 (class 2606 OID 17948)
-- Name: siap_agendas_servicios siap_agendas_servicios_idservicioprograma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_agendas_servicios
    ADD CONSTRAINT siap_agendas_servicios_idservicioprograma_fkey FOREIGN KEY (idservicioprograma) REFERENCES public.siap_servicios_programas(idservicioprograma);


--
-- TOC entry 2928 (class 2606 OID 17870)
-- Name: siap_docentes siap_docentes_idcategoriadocente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_docentes
    ADD CONSTRAINT siap_docentes_idcategoriadocente_fkey FOREIGN KEY (idcategoriadocente) REFERENCES public.siap_categoria_docentes(idcategoriadocente);


--
-- TOC entry 2929 (class 2606 OID 17875)
-- Name: siap_docentes siap_docentes_idtipocontrato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_docentes
    ADD CONSTRAINT siap_docentes_idtipocontrato_fkey FOREIGN KEY (idtipocontrato) REFERENCES public.siap_tipo_contrato(idtipocontrato);


--
-- TOC entry 2938 (class 2606 OID 18106)
-- Name: siap_gruposinvestigacion siap_gruposinvestigacion_iddirector_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_gruposinvestigacion
    ADD CONSTRAINT siap_gruposinvestigacion_iddirector_fkey FOREIGN KEY (iddirector) REFERENCES public.siap_docentes(iddocente);


--
-- TOC entry 2932 (class 2606 OID 17930)
-- Name: siap_horarios_servicios siap_horarios_servicios_idservicioprograma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_horarios_servicios
    ADD CONSTRAINT siap_horarios_servicios_idservicioprograma_fkey FOREIGN KEY (idservicioprograma) REFERENCES public.siap_servicios_programas(idservicioprograma);


--
-- TOC entry 2930 (class 2606 OID 17904)
-- Name: siap_programas siap_programas_idfacultad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_programas
    ADD CONSTRAINT siap_programas_idfacultad_fkey FOREIGN KEY (idfacultad) REFERENCES public.siap_facultades(idfacultad);


--
-- TOC entry 2931 (class 2606 OID 17917)
-- Name: siap_servicios_programas siap_servicios_programas_idprograma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_servicios_programas
    ADD CONSTRAINT siap_servicios_programas_idprograma_fkey FOREIGN KEY (idprograma) REFERENCES public.siap_programas(idprograma);


--
-- TOC entry 2936 (class 2606 OID 17990)
-- Name: siap_subactividades_docentes siap_subactividades_docentes_idactividaddocente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_subactividades_docentes
    ADD CONSTRAINT siap_subactividades_docentes_idactividaddocente_fkey FOREIGN KEY (idactividaddocente) REFERENCES public.siap_actividades_docentes(idactividaddocente);


--
-- TOC entry 2944 (class 2606 OID 18160)
-- Name: siap_trabajosgrado siap_trabajosgrado_idareaprofundizacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idareaprofundizacion_fkey FOREIGN KEY (idareaprofundizacion) REFERENCES public.siap_areasprofundizacion(idareaprofundizacion);


--
-- TOC entry 2942 (class 2606 OID 18150)
-- Name: siap_trabajosgrado siap_trabajosgrado_iddirector_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_iddirector_fkey FOREIGN KEY (iddirector) REFERENCES public.siap_docentes(iddocente);


--
-- TOC entry 2945 (class 2606 OID 18165)
-- Name: siap_trabajosgrado siap_trabajosgrado_idgrupoinvestigacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idgrupoinvestigacion_fkey FOREIGN KEY (idgrupoinvestigacion) REFERENCES public.siap_gruposinvestigacion(idgrupoinvestigacion);


--
-- TOC entry 2939 (class 2606 OID 18135)
-- Name: siap_trabajosgrado siap_trabajosgrado_idjurado1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idjurado1_fkey FOREIGN KEY (idjurado1) REFERENCES public.siap_docentes(iddocente);


--
-- TOC entry 2940 (class 2606 OID 18140)
-- Name: siap_trabajosgrado siap_trabajosgrado_idjurado2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idjurado2_fkey FOREIGN KEY (idjurado2) REFERENCES public.siap_docentes(iddocente);


--
-- TOC entry 2941 (class 2606 OID 18145)
-- Name: siap_trabajosgrado siap_trabajosgrado_idjurado3_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idjurado3_fkey FOREIGN KEY (idjurado3) REFERENCES public.siap_docentes(iddocente);


--
-- TOC entry 2943 (class 2606 OID 18155)
-- Name: siap_trabajosgrado siap_trabajosgrado_idmodalidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idmodalidad_fkey FOREIGN KEY (idmodalidad) REFERENCES public.siap_modalidades(idmodalidad);


-- Completed on 2020-11-12 00:45:11

--
-- PostgreSQL database dump complete
--

