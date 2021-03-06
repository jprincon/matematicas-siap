PGDMP                         y            siap    12.4    12.4 �    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    17724    siap    DATABASE     �   CREATE DATABASE siap WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
    DROP DATABASE siap;
                postgres    false            �            1259    18036    emem_afiliaciones    TABLE     _   CREATE TABLE public.emem_afiliaciones (
    idafiliacion text NOT NULL,
    afiliacion text
);
 %   DROP TABLE public.emem_afiliaciones;
       public         heap    postgres    false            �            1259    18044    emem_participantes    TABLE     �   CREATE TABLE public.emem_participantes (
    idparticipante text NOT NULL,
    primernombre text,
    segundonombre text,
    primerapellido text,
    segundoapellido text,
    correo text,
    contra text,
    idafiliacion text
);
 &   DROP TABLE public.emem_participantes;
       public         heap    postgres    false            �            1259    17791    math_autor_resumen    TABLE     }   CREATE TABLE public.math_autor_resumen (
    cedula text NOT NULL,
    nombre text,
    correo text,
    institucion text
);
 &   DROP TABLE public.math_autor_resumen;
       public         heap    postgres    false            �            1259    17749    math_bd_articulos    TABLE       CREATE TABLE public.math_bd_articulos (
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
 %   DROP TABLE public.math_bd_articulos;
       public         heap    postgres    false            �            1259    17820    math_bibliografia_resumen    TABLE     �   CREATE TABLE public.math_bibliografia_resumen (
    id_bibliografia text NOT NULL,
    bibliografia text,
    id_resumen text
);
 -   DROP TABLE public.math_bibliografia_resumen;
       public         heap    postgres    false            �            1259    17778    math_palabras_clave    TABLE     w   CREATE TABLE public.math_palabras_clave (
    id_palabra_clave text NOT NULL,
    palabra text,
    id_resumen text
);
 '   DROP TABLE public.math_palabras_clave;
       public         heap    postgres    false            �            1259    17757    math_participante_emem    TABLE     �   CREATE TABLE public.math_participante_emem (
    cedula text NOT NULL,
    correo text,
    nombre text,
    tipo_participacion text,
    contra text
);
 *   DROP TABLE public.math_participante_emem;
       public         heap    postgres    false            �            1259    17765    math_resumen    TABLE     a  CREATE TABLE public.math_resumen (
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
     DROP TABLE public.math_resumen;
       public         heap    postgres    false            �            1259    17833    math_resumen_participante    TABLE     j   CREATE TABLE public.math_resumen_participante (
    id_participante text NOT NULL,
    id_resumen text
);
 -   DROP TABLE public.math_resumen_participante;
       public         heap    postgres    false            �            1259    17801    math_resumenes_autor    TABLE     z   CREATE TABLE public.math_resumenes_autor (
    id_resumen_autor integer NOT NULL,
    cedula text,
    id_resumen text
);
 (   DROP TABLE public.math_resumenes_autor;
       public         heap    postgres    false            �            1259    17799 )   math_resumenes_autor_id_resumen_autor_seq    SEQUENCE     �   CREATE SEQUENCE public.math_resumenes_autor_id_resumen_autor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.math_resumenes_autor_id_resumen_autor_seq;
       public          postgres    false    211            .           0    0 )   math_resumenes_autor_id_resumen_autor_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.math_resumenes_autor_id_resumen_autor_seq OWNED BY public.math_resumenes_autor.id_resumen_autor;
          public          postgres    false    210            �            1259    17741    math_rol    TABLE     L   CREATE TABLE public.math_rol (
    id_rol text NOT NULL,
    nombre text
);
    DROP TABLE public.math_rol;
       public         heap    postgres    false            �            1259    17733    math_usuario    TABLE     r   CREATE TABLE public.math_usuario (
    cedula text NOT NULL,
    correo text,
    nombre text,
    contra text
);
     DROP TABLE public.math_usuario;
       public         heap    postgres    false            �            1259    17725    math_visitas    TABLE     U   CREATE TABLE public.math_visitas (
    id_visita text NOT NULL,
    contador text
);
     DROP TABLE public.math_visitas;
       public         heap    postgres    false            �            1259    17969    siap_actividades_docentes    TABLE     �   CREATE TABLE public.siap_actividades_docentes (
    idactividaddocente text NOT NULL,
    actividad text,
    idfunciondocente text
);
 -   DROP TABLE public.siap_actividades_docentes;
       public         heap    postgres    false            �            1259    18216 "   siap_actividades_funciones_docente    TABLE       CREATE TABLE public.siap_actividades_funciones_docente (
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
 6   DROP TABLE public.siap_actividades_funciones_docente;
       public         heap    postgres    false            �            1259    17935    siap_agendas_servicios    TABLE     
  CREATE TABLE public.siap_agendas_servicios (
    idagendaservicio text NOT NULL,
    iddocente integer,
    idservicioprograma text,
    periodo text,
    numerocontrato text,
    actafacultad text,
    actaprograma text,
    concertada text,
    completada text
);
 *   DROP TABLE public.siap_agendas_servicios;
       public         heap    postgres    false            �            1259    18119    siap_areasprofundizacion    TABLE     j   CREATE TABLE public.siap_areasprofundizacion (
    idareaprofundizacion text NOT NULL,
    nombre text
);
 ,   DROP TABLE public.siap_areasprofundizacion;
       public         heap    postgres    false            �            1259    17854    siap_categoria_docentes    TABLE     j   CREATE TABLE public.siap_categoria_docentes (
    idcategoriadocente text NOT NULL,
    categoria text
);
 +   DROP TABLE public.siap_categoria_docentes;
       public         heap    postgres    false            �            1259    17953    siap_configuraciones    TABLE     �   CREATE TABLE public.siap_configuraciones (
    idconfiguracion text NOT NULL,
    nombredirector text,
    nombredecano text,
    semanassemestre text
);
 (   DROP TABLE public.siap_configuraciones;
       public         heap    postgres    false            �            1259    17862    siap_docentes    TABLE     �   CREATE TABLE public.siap_docentes (
    iddocente integer NOT NULL,
    nombre text,
    correo text,
    telefono text,
    idcategoriadocente text,
    idtipocontrato text,
    activo text,
    documento text
);
 !   DROP TABLE public.siap_docentes;
       public         heap    postgres    false            �            1259    18082    siap_egresados    TABLE       CREATE TABLE public.siap_egresados (
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
 "   DROP TABLE public.siap_egresados;
       public         heap    postgres    false            �            1259    17880    siap_errores    TABLE     �   CREATE TABLE public.siap_errores (
    iderror text NOT NULL,
    hora text,
    fecha text,
    procedimiento text,
    mensaje text
);
     DROP TABLE public.siap_errores;
       public         heap    postgres    false            �            1259    17888    siap_facultades    TABLE     Y   CREATE TABLE public.siap_facultades (
    idfacultad text NOT NULL,
    facultad text
);
 #   DROP TABLE public.siap_facultades;
       public         heap    postgres    false            �            1259    18244    siap_favoritos    TABLE     �   CREATE TABLE public.siap_favoritos (
    idfavorito text NOT NULL,
    titulo text,
    icono text,
    ruta text,
    frecuencia integer
);
 "   DROP TABLE public.siap_favoritos;
       public         heap    postgres    false            �            1259    17961    siap_funciones_docentes    TABLE     f   CREATE TABLE public.siap_funciones_docentes (
    idfunciondocente text NOT NULL,
    funcion text
);
 +   DROP TABLE public.siap_funciones_docentes;
       public         heap    postgres    false            �            1259    18098    siap_gruposinvestigacion    TABLE     �   CREATE TABLE public.siap_gruposinvestigacion (
    idgrupoinvestigacion text NOT NULL,
    nombre text,
    sigla text,
    iddirector integer,
    mision text,
    vision text
);
 ,   DROP TABLE public.siap_gruposinvestigacion;
       public         heap    postgres    false            �            1259    17922    siap_horarios_servicios    TABLE     �   CREATE TABLE public.siap_horarios_servicios (
    idhorarioservicio text NOT NULL,
    dia text,
    inicio text,
    fin text,
    idservicioprograma text,
    salon text
);
 +   DROP TABLE public.siap_horarios_servicios;
       public         heap    postgres    false            �            1259    18111    siap_modalidades    TABLE     Y   CREATE TABLE public.siap_modalidades (
    idmodalidad text NOT NULL,
    nombre text
);
 $   DROP TABLE public.siap_modalidades;
       public         heap    postgres    false            �            1259    18208    siap_periodos    TABLE     �   CREATE TABLE public.siap_periodos (
    idperiodo text NOT NULL,
    periodo text,
    hormaxcarrera integer,
    hormaxcontrato integer,
    hormaxcatedratico integer
);
 !   DROP TABLE public.siap_periodos;
       public         heap    postgres    false            �            1259    17896    siap_programas    TABLE     m   CREATE TABLE public.siap_programas (
    idprograma text NOT NULL,
    programa text,
    idfacultad text
);
 "   DROP TABLE public.siap_programas;
       public         heap    postgres    false            �            1259    17909    siap_servicios_programas    TABLE     �   CREATE TABLE public.siap_servicios_programas (
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
 ,   DROP TABLE public.siap_servicios_programas;
       public         heap    postgres    false            �            1259    17982    siap_subactividades_docentes    TABLE     �   CREATE TABLE public.siap_subactividades_docentes (
    idsubactividaddocente text NOT NULL,
    subactividad text,
    idactividaddocente text
);
 0   DROP TABLE public.siap_subactividades_docentes;
       public         heap    postgres    false            �            1259    17846    siap_tipo_contrato    TABLE     p   CREATE TABLE public.siap_tipo_contrato (
    idtipocontrato text NOT NULL,
    contrato text,
    horas text
);
 &   DROP TABLE public.siap_tipo_contrato;
       public         heap    postgres    false            �            1259    18359    siap_trabajosgrado    TABLE     �  CREATE TABLE public.siap_trabajosgrado (
    idtrabajogrado text NOT NULL,
    titulo text,
    estudiante1 text,
    estudiante2 text,
    estudiante3 text,
    idjurado1 integer,
    idjurado2 integer,
    idjurado3 integer,
    iddirector integer,
    idcodirector integer,
    idmodalidad text,
    idareaprofundizacion text,
    idgrupoinvestigacion text,
    actanombramientojurados text,
    actapropuesta text,
    evaluacionpropuesta text,
    evaluaciontrabajoescrito text,
    evaluacionsustentacion text,
    fechasustentacion text,
    calificacionfinal text,
    estudiantecedederechos text,
    fechainicioejecucion text,
    cantidadsemestresejecucion integer,
    estadoavance integer
);
 &   DROP TABLE public.siap_trabajosgrado;
       public         heap    postgres    false            %           2604    17804 %   math_resumenes_autor id_resumen_autor    DEFAULT     �   ALTER TABLE ONLY public.math_resumenes_autor ALTER COLUMN id_resumen_autor SET DEFAULT nextval('public.math_resumenes_autor_id_resumen_autor_seq'::regclass);
 T   ALTER TABLE public.math_resumenes_autor ALTER COLUMN id_resumen_autor DROP DEFAULT;
       public          postgres    false    210    211    211                      0    18036    emem_afiliaciones 
   TABLE DATA           E   COPY public.emem_afiliaciones (idafiliacion, afiliacion) FROM stdin;
    public          postgres    false    227   i�                 0    18044    emem_participantes 
   TABLE DATA           �   COPY public.emem_participantes (idparticipante, primernombre, segundonombre, primerapellido, segundoapellido, correo, contra, idafiliacion) FROM stdin;
    public          postgres    false    228   ��                 0    17791    math_autor_resumen 
   TABLE DATA           Q   COPY public.math_autor_resumen (cedula, nombre, correo, institucion) FROM stdin;
    public          postgres    false    209   c�                 0    17749    math_bd_articulos 
   TABLE DATA           �   COPY public.math_bd_articulos (id_articulo, titulo, resumen, autores, nombre_revista, volumen, paginas, fecha, objetivos, metodologia, conclusiones) FROM stdin;
    public          postgres    false    205   ��                 0    17820    math_bibliografia_resumen 
   TABLE DATA           ^   COPY public.math_bibliografia_resumen (id_bibliografia, bibliografia, id_resumen) FROM stdin;
    public          postgres    false    212   ��                 0    17778    math_palabras_clave 
   TABLE DATA           T   COPY public.math_palabras_clave (id_palabra_clave, palabra, id_resumen) FROM stdin;
    public          postgres    false    208   ��       	          0    17757    math_participante_emem 
   TABLE DATA           d   COPY public.math_participante_emem (cedula, correo, nombre, tipo_participacion, contra) FROM stdin;
    public          postgres    false    206   ��       
          0    17765    math_resumen 
   TABLE DATA           �   COPY public.math_resumen (id_resumen, titulo, resumen, linea, tipo, objetivo, capacidad, materiales, prerequisito, requiere_sala, evaluado, nombre_autor, subtitulo, salon, fecha, id_autor) FROM stdin;
    public          postgres    false    207   ��                 0    17833    math_resumen_participante 
   TABLE DATA           P   COPY public.math_resumen_participante (id_participante, id_resumen) FROM stdin;
    public          postgres    false    213   �                 0    17801    math_resumenes_autor 
   TABLE DATA           T   COPY public.math_resumenes_autor (id_resumen_autor, cedula, id_resumen) FROM stdin;
    public          postgres    false    211   .�                 0    17741    math_rol 
   TABLE DATA           2   COPY public.math_rol (id_rol, nombre) FROM stdin;
    public          postgres    false    204   K�                 0    17733    math_usuario 
   TABLE DATA           F   COPY public.math_usuario (cedula, correo, nombre, contra) FROM stdin;
    public          postgres    false    203   h�                 0    17725    math_visitas 
   TABLE DATA           ;   COPY public.math_visitas (id_visita, contador) FROM stdin;
    public          postgres    false    202   g�                 0    17969    siap_actividades_docentes 
   TABLE DATA           d   COPY public.siap_actividades_docentes (idactividaddocente, actividad, idfunciondocente) FROM stdin;
    public          postgres    false    225   ��       %          0    18216 "   siap_actividades_funciones_docente 
   TABLE DATA           �   COPY public.siap_actividades_funciones_docente (idactividadprograma, idfuncion, idactividad, idsubactividad, actividad, iddocente, periodo, horas, calculada) FROM stdin;
    public          postgres    false    234   ��                 0    17935    siap_agendas_servicios 
   TABLE DATA           �   COPY public.siap_agendas_servicios (idagendaservicio, iddocente, idservicioprograma, periodo, numerocontrato, actafacultad, actaprograma, concertada, completada) FROM stdin;
    public          postgres    false    222   ��       #          0    18119    siap_areasprofundizacion 
   TABLE DATA           P   COPY public.siap_areasprofundizacion (idareaprofundizacion, nombre) FROM stdin;
    public          postgres    false    232   �                0    17854    siap_categoria_docentes 
   TABLE DATA           P   COPY public.siap_categoria_docentes (idcategoriadocente, categoria) FROM stdin;
    public          postgres    false    215   �                0    17953    siap_configuraciones 
   TABLE DATA           n   COPY public.siap_configuraciones (idconfiguracion, nombredirector, nombredecano, semanassemestre) FROM stdin;
    public          postgres    false    223                   0    17862    siap_docentes 
   TABLE DATA           �   COPY public.siap_docentes (iddocente, nombre, correo, telefono, idcategoriadocente, idtipocontrato, activo, documento) FROM stdin;
    public          postgres    false    216   j                 0    18082    siap_egresados 
   TABLE DATA           �   COPY public.siap_egresados (idegresado, nombre, celular, correo, esegresado, fecha, gradoescolaridad, secretaria, institucion, municipio, cargo, nivellabora) FROM stdin;
    public          postgres    false    229   D                0    17880    siap_errores 
   TABLE DATA           T   COPY public.siap_errores (iderror, hora, fecha, procedimiento, mensaje) FROM stdin;
    public          postgres    false    217   �6                0    17888    siap_facultades 
   TABLE DATA           ?   COPY public.siap_facultades (idfacultad, facultad) FROM stdin;
    public          postgres    false    218   4Y      &          0    18244    siap_favoritos 
   TABLE DATA           U   COPY public.siap_favoritos (idfavorito, titulo, icono, ruta, frecuencia) FROM stdin;
    public          postgres    false    235   (Z                0    17961    siap_funciones_docentes 
   TABLE DATA           L   COPY public.siap_funciones_docentes (idfunciondocente, funcion) FROM stdin;
    public          postgres    false    224   �[      !          0    18098    siap_gruposinvestigacion 
   TABLE DATA           s   COPY public.siap_gruposinvestigacion (idgrupoinvestigacion, nombre, sigla, iddirector, mision, vision) FROM stdin;
    public          postgres    false    230   �[                0    17922    siap_horarios_servicios 
   TABLE DATA           q   COPY public.siap_horarios_servicios (idhorarioservicio, dia, inicio, fin, idservicioprograma, salon) FROM stdin;
    public          postgres    false    221   �]      "          0    18111    siap_modalidades 
   TABLE DATA           ?   COPY public.siap_modalidades (idmodalidad, nombre) FROM stdin;
    public          postgres    false    231   ��      $          0    18208    siap_periodos 
   TABLE DATA           m   COPY public.siap_periodos (idperiodo, periodo, hormaxcarrera, hormaxcontrato, hormaxcatedratico) FROM stdin;
    public          postgres    false    233   b�                0    17896    siap_programas 
   TABLE DATA           J   COPY public.siap_programas (idprograma, programa, idfacultad) FROM stdin;
    public          postgres    false    219   ۜ                0    17909    siap_servicios_programas 
   TABLE DATA           �   COPY public.siap_servicios_programas (idservicioprograma, asignatura, idprograma, horas, aulas, periodo, jornada, grupo, semanas, tipo) FROM stdin;
    public          postgres    false    220   L�                0    17982    siap_subactividades_docentes 
   TABLE DATA           o   COPY public.siap_subactividades_docentes (idsubactividaddocente, subactividad, idactividaddocente) FROM stdin;
    public          postgres    false    226   �                0    17846    siap_tipo_contrato 
   TABLE DATA           M   COPY public.siap_tipo_contrato (idtipocontrato, contrato, horas) FROM stdin;
    public          postgres    false    214   ��      '          0    18359    siap_trabajosgrado 
   TABLE DATA           �  COPY public.siap_trabajosgrado (idtrabajogrado, titulo, estudiante1, estudiante2, estudiante3, idjurado1, idjurado2, idjurado3, iddirector, idcodirector, idmodalidad, idareaprofundizacion, idgrupoinvestigacion, actanombramientojurados, actapropuesta, evaluacionpropuesta, evaluaciontrabajoescrito, evaluacionsustentacion, fechasustentacion, calificacionfinal, estudiantecedederechos, fechainicioejecucion, cantidadsemestresejecucion, estadoavance) FROM stdin;
    public          postgres    false    236   
�      /           0    0 )   math_resumenes_autor_id_resumen_autor_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.math_resumenes_autor_id_resumen_autor_seq', 1, false);
          public          postgres    false    210            W           2606    18043 (   emem_afiliaciones emem_afiliaciones_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.emem_afiliaciones
    ADD CONSTRAINT emem_afiliaciones_pkey PRIMARY KEY (idafiliacion);
 R   ALTER TABLE ONLY public.emem_afiliaciones DROP CONSTRAINT emem_afiliaciones_pkey;
       public            postgres    false    227            Y           2606    18051 *   emem_participantes emem_participantes_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.emem_participantes
    ADD CONSTRAINT emem_participantes_pkey PRIMARY KEY (idparticipante);
 T   ALTER TABLE ONLY public.emem_participantes DROP CONSTRAINT emem_participantes_pkey;
       public            postgres    false    228            5           2606    17798 *   math_autor_resumen math_autor_resumen_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.math_autor_resumen
    ADD CONSTRAINT math_autor_resumen_pkey PRIMARY KEY (cedula);
 T   ALTER TABLE ONLY public.math_autor_resumen DROP CONSTRAINT math_autor_resumen_pkey;
       public            postgres    false    209            -           2606    17756 (   math_bd_articulos math_bd_articulos_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.math_bd_articulos
    ADD CONSTRAINT math_bd_articulos_pkey PRIMARY KEY (id_articulo);
 R   ALTER TABLE ONLY public.math_bd_articulos DROP CONSTRAINT math_bd_articulos_pkey;
       public            postgres    false    205            9           2606    17827 8   math_bibliografia_resumen math_bibliografia_resumen_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.math_bibliografia_resumen
    ADD CONSTRAINT math_bibliografia_resumen_pkey PRIMARY KEY (id_bibliografia);
 b   ALTER TABLE ONLY public.math_bibliografia_resumen DROP CONSTRAINT math_bibliografia_resumen_pkey;
       public            postgres    false    212            3           2606    17785 ,   math_palabras_clave math_palabras_clave_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.math_palabras_clave
    ADD CONSTRAINT math_palabras_clave_pkey PRIMARY KEY (id_palabra_clave);
 V   ALTER TABLE ONLY public.math_palabras_clave DROP CONSTRAINT math_palabras_clave_pkey;
       public            postgres    false    208            /           2606    17764 2   math_participante_emem math_participante_emem_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.math_participante_emem
    ADD CONSTRAINT math_participante_emem_pkey PRIMARY KEY (cedula);
 \   ALTER TABLE ONLY public.math_participante_emem DROP CONSTRAINT math_participante_emem_pkey;
       public            postgres    false    206            ;           2606    17840 8   math_resumen_participante math_resumen_participante_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.math_resumen_participante
    ADD CONSTRAINT math_resumen_participante_pkey PRIMARY KEY (id_participante);
 b   ALTER TABLE ONLY public.math_resumen_participante DROP CONSTRAINT math_resumen_participante_pkey;
       public            postgres    false    213            1           2606    17772    math_resumen math_resumen_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.math_resumen
    ADD CONSTRAINT math_resumen_pkey PRIMARY KEY (id_resumen);
 H   ALTER TABLE ONLY public.math_resumen DROP CONSTRAINT math_resumen_pkey;
       public            postgres    false    207            7           2606    17809 .   math_resumenes_autor math_resumenes_autor_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.math_resumenes_autor
    ADD CONSTRAINT math_resumenes_autor_pkey PRIMARY KEY (id_resumen_autor);
 X   ALTER TABLE ONLY public.math_resumenes_autor DROP CONSTRAINT math_resumenes_autor_pkey;
       public            postgres    false    211            +           2606    17748    math_rol math_rol_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.math_rol
    ADD CONSTRAINT math_rol_pkey PRIMARY KEY (id_rol);
 @   ALTER TABLE ONLY public.math_rol DROP CONSTRAINT math_rol_pkey;
       public            postgres    false    204            )           2606    17740    math_usuario math_usuario_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.math_usuario
    ADD CONSTRAINT math_usuario_pkey PRIMARY KEY (cedula);
 H   ALTER TABLE ONLY public.math_usuario DROP CONSTRAINT math_usuario_pkey;
       public            postgres    false    203            '           2606    17732    math_visitas math_visitas_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.math_visitas
    ADD CONSTRAINT math_visitas_pkey PRIMARY KEY (id_visita);
 H   ALTER TABLE ONLY public.math_visitas DROP CONSTRAINT math_visitas_pkey;
       public            postgres    false    202            S           2606    17976 8   siap_actividades_docentes siap_actividades_docentes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_docentes
    ADD CONSTRAINT siap_actividades_docentes_pkey PRIMARY KEY (idactividaddocente);
 b   ALTER TABLE ONLY public.siap_actividades_docentes DROP CONSTRAINT siap_actividades_docentes_pkey;
       public            postgres    false    225            e           2606    18223 J   siap_actividades_funciones_docente siap_actividades_funciones_docente_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_pkey PRIMARY KEY (idactividadprograma);
 t   ALTER TABLE ONLY public.siap_actividades_funciones_docente DROP CONSTRAINT siap_actividades_funciones_docente_pkey;
       public            postgres    false    234            M           2606    17942 2   siap_agendas_servicios siap_agendas_servicios_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.siap_agendas_servicios
    ADD CONSTRAINT siap_agendas_servicios_pkey PRIMARY KEY (idagendaservicio);
 \   ALTER TABLE ONLY public.siap_agendas_servicios DROP CONSTRAINT siap_agendas_servicios_pkey;
       public            postgres    false    222            a           2606    18126 6   siap_areasprofundizacion siap_areasprofundizacion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.siap_areasprofundizacion
    ADD CONSTRAINT siap_areasprofundizacion_pkey PRIMARY KEY (idareaprofundizacion);
 `   ALTER TABLE ONLY public.siap_areasprofundizacion DROP CONSTRAINT siap_areasprofundizacion_pkey;
       public            postgres    false    232            ?           2606    17861 4   siap_categoria_docentes siap_categoria_docentes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.siap_categoria_docentes
    ADD CONSTRAINT siap_categoria_docentes_pkey PRIMARY KEY (idcategoriadocente);
 ^   ALTER TABLE ONLY public.siap_categoria_docentes DROP CONSTRAINT siap_categoria_docentes_pkey;
       public            postgres    false    215            O           2606    17960 .   siap_configuraciones siap_configuraciones_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.siap_configuraciones
    ADD CONSTRAINT siap_configuraciones_pkey PRIMARY KEY (idconfiguracion);
 X   ALTER TABLE ONLY public.siap_configuraciones DROP CONSTRAINT siap_configuraciones_pkey;
       public            postgres    false    223            A           2606    17869     siap_docentes siap_docentes_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.siap_docentes
    ADD CONSTRAINT siap_docentes_pkey PRIMARY KEY (iddocente);
 J   ALTER TABLE ONLY public.siap_docentes DROP CONSTRAINT siap_docentes_pkey;
       public            postgres    false    216            [           2606    18089 "   siap_egresados siap_egresados_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.siap_egresados
    ADD CONSTRAINT siap_egresados_pkey PRIMARY KEY (idegresado);
 L   ALTER TABLE ONLY public.siap_egresados DROP CONSTRAINT siap_egresados_pkey;
       public            postgres    false    229            C           2606    17887    siap_errores siap_errores_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.siap_errores
    ADD CONSTRAINT siap_errores_pkey PRIMARY KEY (iderror);
 H   ALTER TABLE ONLY public.siap_errores DROP CONSTRAINT siap_errores_pkey;
       public            postgres    false    217            E           2606    17895 $   siap_facultades siap_facultades_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.siap_facultades
    ADD CONSTRAINT siap_facultades_pkey PRIMARY KEY (idfacultad);
 N   ALTER TABLE ONLY public.siap_facultades DROP CONSTRAINT siap_facultades_pkey;
       public            postgres    false    218            g           2606    18251 "   siap_favoritos siap_favoritos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.siap_favoritos
    ADD CONSTRAINT siap_favoritos_pkey PRIMARY KEY (idfavorito);
 L   ALTER TABLE ONLY public.siap_favoritos DROP CONSTRAINT siap_favoritos_pkey;
       public            postgres    false    235            Q           2606    17968 4   siap_funciones_docentes siap_funciones_docentes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.siap_funciones_docentes
    ADD CONSTRAINT siap_funciones_docentes_pkey PRIMARY KEY (idfunciondocente);
 ^   ALTER TABLE ONLY public.siap_funciones_docentes DROP CONSTRAINT siap_funciones_docentes_pkey;
       public            postgres    false    224            ]           2606    18105 6   siap_gruposinvestigacion siap_gruposinvestigacion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.siap_gruposinvestigacion
    ADD CONSTRAINT siap_gruposinvestigacion_pkey PRIMARY KEY (idgrupoinvestigacion);
 `   ALTER TABLE ONLY public.siap_gruposinvestigacion DROP CONSTRAINT siap_gruposinvestigacion_pkey;
       public            postgres    false    230            K           2606    17929 4   siap_horarios_servicios siap_horarios_servicios_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.siap_horarios_servicios
    ADD CONSTRAINT siap_horarios_servicios_pkey PRIMARY KEY (idhorarioservicio);
 ^   ALTER TABLE ONLY public.siap_horarios_servicios DROP CONSTRAINT siap_horarios_servicios_pkey;
       public            postgres    false    221            _           2606    18118 &   siap_modalidades siap_modalidades_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.siap_modalidades
    ADD CONSTRAINT siap_modalidades_pkey PRIMARY KEY (idmodalidad);
 P   ALTER TABLE ONLY public.siap_modalidades DROP CONSTRAINT siap_modalidades_pkey;
       public            postgres    false    231            c           2606    18215     siap_periodos siap_periodos_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.siap_periodos
    ADD CONSTRAINT siap_periodos_pkey PRIMARY KEY (idperiodo);
 J   ALTER TABLE ONLY public.siap_periodos DROP CONSTRAINT siap_periodos_pkey;
       public            postgres    false    233            G           2606    17903 "   siap_programas siap_programas_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.siap_programas
    ADD CONSTRAINT siap_programas_pkey PRIMARY KEY (idprograma);
 L   ALTER TABLE ONLY public.siap_programas DROP CONSTRAINT siap_programas_pkey;
       public            postgres    false    219            I           2606    17916 6   siap_servicios_programas siap_servicios_programas_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.siap_servicios_programas
    ADD CONSTRAINT siap_servicios_programas_pkey PRIMARY KEY (idservicioprograma);
 `   ALTER TABLE ONLY public.siap_servicios_programas DROP CONSTRAINT siap_servicios_programas_pkey;
       public            postgres    false    220            U           2606    17989 >   siap_subactividades_docentes siap_subactividades_docentes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.siap_subactividades_docentes
    ADD CONSTRAINT siap_subactividades_docentes_pkey PRIMARY KEY (idsubactividaddocente);
 h   ALTER TABLE ONLY public.siap_subactividades_docentes DROP CONSTRAINT siap_subactividades_docentes_pkey;
       public            postgres    false    226            =           2606    17853 *   siap_tipo_contrato siap_tipo_contrato_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.siap_tipo_contrato
    ADD CONSTRAINT siap_tipo_contrato_pkey PRIMARY KEY (idtipocontrato);
 T   ALTER TABLE ONLY public.siap_tipo_contrato DROP CONSTRAINT siap_tipo_contrato_pkey;
       public            postgres    false    214            i           2606    18366 *   siap_trabajosgrado siap_trabajosgrado_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_pkey PRIMARY KEY (idtrabajogrado);
 T   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_pkey;
       public            postgres    false    236            y           2606    18052 7   emem_participantes emem_participantes_idafiliacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.emem_participantes
    ADD CONSTRAINT emem_participantes_idafiliacion_fkey FOREIGN KEY (idafiliacion) REFERENCES public.emem_afiliaciones(idafiliacion);
 a   ALTER TABLE ONLY public.emem_participantes DROP CONSTRAINT emem_participantes_idafiliacion_fkey;
       public          postgres    false    227    228    2903            n           2606    17828 C   math_bibliografia_resumen math_bibliografia_resumen_id_resumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.math_bibliografia_resumen
    ADD CONSTRAINT math_bibliografia_resumen_id_resumen_fkey FOREIGN KEY (id_resumen) REFERENCES public.math_resumen(id_resumen);
 m   ALTER TABLE ONLY public.math_bibliografia_resumen DROP CONSTRAINT math_bibliografia_resumen_id_resumen_fkey;
       public          postgres    false    212    207    2865            k           2606    17786 7   math_palabras_clave math_palabras_clave_id_resumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.math_palabras_clave
    ADD CONSTRAINT math_palabras_clave_id_resumen_fkey FOREIGN KEY (id_resumen) REFERENCES public.math_resumen(id_resumen);
 a   ALTER TABLE ONLY public.math_palabras_clave DROP CONSTRAINT math_palabras_clave_id_resumen_fkey;
       public          postgres    false    2865    207    208            j           2606    17773 '   math_resumen math_resumen_id_autor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.math_resumen
    ADD CONSTRAINT math_resumen_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES public.math_usuario(cedula);
 Q   ALTER TABLE ONLY public.math_resumen DROP CONSTRAINT math_resumen_id_autor_fkey;
       public          postgres    false    203    207    2857            o           2606    17841 C   math_resumen_participante math_resumen_participante_id_resumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.math_resumen_participante
    ADD CONSTRAINT math_resumen_participante_id_resumen_fkey FOREIGN KEY (id_resumen) REFERENCES public.math_resumen(id_resumen);
 m   ALTER TABLE ONLY public.math_resumen_participante DROP CONSTRAINT math_resumen_participante_id_resumen_fkey;
       public          postgres    false    207    2865    213            l           2606    17810 5   math_resumenes_autor math_resumenes_autor_cedula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.math_resumenes_autor
    ADD CONSTRAINT math_resumenes_autor_cedula_fkey FOREIGN KEY (cedula) REFERENCES public.math_autor_resumen(cedula);
 _   ALTER TABLE ONLY public.math_resumenes_autor DROP CONSTRAINT math_resumenes_autor_cedula_fkey;
       public          postgres    false    211    2869    209            m           2606    17815 9   math_resumenes_autor math_resumenes_autor_id_resumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.math_resumenes_autor
    ADD CONSTRAINT math_resumenes_autor_id_resumen_fkey FOREIGN KEY (id_resumen) REFERENCES public.math_resumen(id_resumen);
 c   ALTER TABLE ONLY public.math_resumenes_autor DROP CONSTRAINT math_resumenes_autor_id_resumen_fkey;
       public          postgres    false    207    211    2865            w           2606    17977 I   siap_actividades_docentes siap_actividades_docentes_idfunciondocente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_docentes
    ADD CONSTRAINT siap_actividades_docentes_idfunciondocente_fkey FOREIGN KEY (idfunciondocente) REFERENCES public.siap_funciones_docentes(idfunciondocente);
 s   ALTER TABLE ONLY public.siap_actividades_docentes DROP CONSTRAINT siap_actividades_docentes_idfunciondocente_fkey;
       public          postgres    false    224    2897    225            |           2606    18229 V   siap_actividades_funciones_docente siap_actividades_funciones_docente_idactividad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_idactividad_fkey FOREIGN KEY (idactividad) REFERENCES public.siap_actividades_docentes(idactividaddocente);
 �   ALTER TABLE ONLY public.siap_actividades_funciones_docente DROP CONSTRAINT siap_actividades_funciones_docente_idactividad_fkey;
       public          postgres    false    2899    234    225            ~           2606    18239 T   siap_actividades_funciones_docente siap_actividades_funciones_docente_iddocente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_iddocente_fkey FOREIGN KEY (iddocente) REFERENCES public.siap_docentes(iddocente);
 ~   ALTER TABLE ONLY public.siap_actividades_funciones_docente DROP CONSTRAINT siap_actividades_funciones_docente_iddocente_fkey;
       public          postgres    false    216    2881    234            {           2606    18224 T   siap_actividades_funciones_docente siap_actividades_funciones_docente_idfuncion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_idfuncion_fkey FOREIGN KEY (idfuncion) REFERENCES public.siap_funciones_docentes(idfunciondocente);
 ~   ALTER TABLE ONLY public.siap_actividades_funciones_docente DROP CONSTRAINT siap_actividades_funciones_docente_idfuncion_fkey;
       public          postgres    false    234    224    2897            }           2606    18234 Y   siap_actividades_funciones_docente siap_actividades_funciones_docente_idsubactividad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_idsubactividad_fkey FOREIGN KEY (idsubactividad) REFERENCES public.siap_subactividades_docentes(idsubactividaddocente);
 �   ALTER TABLE ONLY public.siap_actividades_funciones_docente DROP CONSTRAINT siap_actividades_funciones_docente_idsubactividad_fkey;
       public          postgres    false    2901    234    226            u           2606    17943 <   siap_agendas_servicios siap_agendas_servicios_iddocente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_agendas_servicios
    ADD CONSTRAINT siap_agendas_servicios_iddocente_fkey FOREIGN KEY (iddocente) REFERENCES public.siap_docentes(iddocente);
 f   ALTER TABLE ONLY public.siap_agendas_servicios DROP CONSTRAINT siap_agendas_servicios_iddocente_fkey;
       public          postgres    false    2881    222    216            v           2606    17948 E   siap_agendas_servicios siap_agendas_servicios_idservicioprograma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_agendas_servicios
    ADD CONSTRAINT siap_agendas_servicios_idservicioprograma_fkey FOREIGN KEY (idservicioprograma) REFERENCES public.siap_servicios_programas(idservicioprograma);
 o   ALTER TABLE ONLY public.siap_agendas_servicios DROP CONSTRAINT siap_agendas_servicios_idservicioprograma_fkey;
       public          postgres    false    2889    220    222            p           2606    17870 3   siap_docentes siap_docentes_idcategoriadocente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_docentes
    ADD CONSTRAINT siap_docentes_idcategoriadocente_fkey FOREIGN KEY (idcategoriadocente) REFERENCES public.siap_categoria_docentes(idcategoriadocente);
 ]   ALTER TABLE ONLY public.siap_docentes DROP CONSTRAINT siap_docentes_idcategoriadocente_fkey;
       public          postgres    false    216    2879    215            q           2606    17875 /   siap_docentes siap_docentes_idtipocontrato_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_docentes
    ADD CONSTRAINT siap_docentes_idtipocontrato_fkey FOREIGN KEY (idtipocontrato) REFERENCES public.siap_tipo_contrato(idtipocontrato);
 Y   ALTER TABLE ONLY public.siap_docentes DROP CONSTRAINT siap_docentes_idtipocontrato_fkey;
       public          postgres    false    2877    216    214            z           2606    18106 A   siap_gruposinvestigacion siap_gruposinvestigacion_iddirector_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_gruposinvestigacion
    ADD CONSTRAINT siap_gruposinvestigacion_iddirector_fkey FOREIGN KEY (iddirector) REFERENCES public.siap_docentes(iddocente);
 k   ALTER TABLE ONLY public.siap_gruposinvestigacion DROP CONSTRAINT siap_gruposinvestigacion_iddirector_fkey;
       public          postgres    false    2881    216    230            t           2606    17930 G   siap_horarios_servicios siap_horarios_servicios_idservicioprograma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_horarios_servicios
    ADD CONSTRAINT siap_horarios_servicios_idservicioprograma_fkey FOREIGN KEY (idservicioprograma) REFERENCES public.siap_servicios_programas(idservicioprograma);
 q   ALTER TABLE ONLY public.siap_horarios_servicios DROP CONSTRAINT siap_horarios_servicios_idservicioprograma_fkey;
       public          postgres    false    221    220    2889            r           2606    17904 -   siap_programas siap_programas_idfacultad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_programas
    ADD CONSTRAINT siap_programas_idfacultad_fkey FOREIGN KEY (idfacultad) REFERENCES public.siap_facultades(idfacultad);
 W   ALTER TABLE ONLY public.siap_programas DROP CONSTRAINT siap_programas_idfacultad_fkey;
       public          postgres    false    2885    218    219            s           2606    17917 A   siap_servicios_programas siap_servicios_programas_idprograma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_servicios_programas
    ADD CONSTRAINT siap_servicios_programas_idprograma_fkey FOREIGN KEY (idprograma) REFERENCES public.siap_programas(idprograma);
 k   ALTER TABLE ONLY public.siap_servicios_programas DROP CONSTRAINT siap_servicios_programas_idprograma_fkey;
       public          postgres    false    220    2887    219            x           2606    17990 Q   siap_subactividades_docentes siap_subactividades_docentes_idactividaddocente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_subactividades_docentes
    ADD CONSTRAINT siap_subactividades_docentes_idactividaddocente_fkey FOREIGN KEY (idactividaddocente) REFERENCES public.siap_actividades_docentes(idactividaddocente);
 {   ALTER TABLE ONLY public.siap_subactividades_docentes DROP CONSTRAINT siap_subactividades_docentes_idactividaddocente_fkey;
       public          postgres    false    2899    225    226            �           2606    18397 ?   siap_trabajosgrado siap_trabajosgrado_idareaprofundizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idareaprofundizacion_fkey FOREIGN KEY (idareaprofundizacion) REFERENCES public.siap_areasprofundizacion(idareaprofundizacion);
 i   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idareaprofundizacion_fkey;
       public          postgres    false    236    232    2913            �           2606    18387 7   siap_trabajosgrado siap_trabajosgrado_idcodirector_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idcodirector_fkey FOREIGN KEY (idcodirector) REFERENCES public.siap_docentes(iddocente);
 a   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idcodirector_fkey;
       public          postgres    false    236    2881    216            �           2606    18382 5   siap_trabajosgrado siap_trabajosgrado_iddirector_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_iddirector_fkey FOREIGN KEY (iddirector) REFERENCES public.siap_docentes(iddocente);
 _   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_iddirector_fkey;
       public          postgres    false    236    216    2881            �           2606    18402 ?   siap_trabajosgrado siap_trabajosgrado_idgrupoinvestigacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idgrupoinvestigacion_fkey FOREIGN KEY (idgrupoinvestigacion) REFERENCES public.siap_gruposinvestigacion(idgrupoinvestigacion);
 i   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idgrupoinvestigacion_fkey;
       public          postgres    false    230    236    2909                       2606    18367 4   siap_trabajosgrado siap_trabajosgrado_idjurado1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idjurado1_fkey FOREIGN KEY (idjurado1) REFERENCES public.siap_docentes(iddocente);
 ^   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idjurado1_fkey;
       public          postgres    false    216    236    2881            �           2606    18372 4   siap_trabajosgrado siap_trabajosgrado_idjurado2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idjurado2_fkey FOREIGN KEY (idjurado2) REFERENCES public.siap_docentes(iddocente);
 ^   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idjurado2_fkey;
       public          postgres    false    2881    216    236            �           2606    18377 4   siap_trabajosgrado siap_trabajosgrado_idjurado3_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idjurado3_fkey FOREIGN KEY (idjurado3) REFERENCES public.siap_docentes(iddocente);
 ^   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idjurado3_fkey;
       public          postgres    false    2881    216    236            �           2606    18392 6   siap_trabajosgrado siap_trabajosgrado_idmodalidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idmodalidad_fkey FOREIGN KEY (idmodalidad) REFERENCES public.siap_modalidades(idmodalidad);
 `   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idmodalidad_fkey;
       public          postgres    false    2911    236    231               k   x��KB! б�V�#����Nwz�
.�O��5��>�����l]0v��ÿA�/V��XU<�2��26
�-:}�����%Ե�cвՉ+�o �*.�         o   x��1�0�ٹK� T��8���Q�)f�6��!���C��c�0Q�U�Đ����?�-��ڨ�*N��B��,R%���=�h�F�����ů���2?�98��'�            x������ � �            x������ � �            x������ � �            x������ � �      	      x������ � �      
      x������ � �            x������ � �            x������ � �            x������ � �         �   x�m�1R!Dc8'��ȴ4�����2�|`k���́�<�\�1ߠ;zկZ������6�Y�~��RmCN뀍=�SݾH�R���,�vp�%q��63K(��TB�զ�c@�t�ʛp�c紴ޮ(r��=��������0�(؇Cʱ�T&&�!��YG����Ԩ�T1VX��.��=a���܀@�M ���&�_+ɍ��hЁD�+�K��R�s��<j            x������ � �           x�uбm�0�Z��0Y(M�ϲ��d��mR���XtI� ��aC����;_`/<��v�L���Je���=�����T����������D��d� ɲu�Hr�z��a���X!����dYU썿8��� �H�u�a� 2D\"�͑�dqv�~�y�[xP[5���d�Tye��{/�����$s��S��T��F��8�GCB{~��̉KUl���mA_��Z�o����z����\4x�㠠%�����j$� u++T	��o��K�u����$      %      x��]Kr�8�]G�"��f�e
)��C�	z 	@|H�7�cԲ��#���JI$H)C
�{#������{� _Ci"���fWT܂+� �}[�jZ� E��$A�x��Mf��5���v���W�d������������vw}u}����f��w���omP�9�����j�:~]	���bt�ρs�];𪳻�d^�=�{�{�F�t�Z-��;�	"��gZ[&aڒ��O����x��x�"�IN���d"@MT&Bf��Y�A�R�6E�L�ny� :�C+k�L��䠡�{j�V���:rt�xw\�8X��Ai��̘�/׷�ʁ)�|Cs`��v��tU�S��.����SR�q�
���1���_�r��Rɖ�Q�@�eU���[�eUC;	���"6;)�(C0�+�x"�ѯ'�EĮ�)��g�hn�����x�������_����m]:YFhm���k��e%��[|�+�j[��+������f}���>p�aȻ��xp1�W��*�g*k�kv�V��g�Z�I�͙+����?ϟ~��EF�B��Q�5��%��q0.ߡ�Od�?�&)���@OՔh�e-0��K��4�2��l�-2�%�����ܾ���2�f��3ـ�@��(W�E����)q{G(Z�
���!�d;���W�����YG��H���� �g[��ч�'���'�}���;ܵ'2�ZF:����4*z��_�?*U:����0�P e!����4-\�a��$V���!�t����|	C/��8T`��?��o�7��HS)҂�5C�4�F�;ٯ�C����eP
�̡fFA-��N��ːb��:���A�d#������F��e�^X�f���h~3�
x���$���� o:�Nh!��	�2h�=k������TK�����)��Ű�`\�)z�U��VE�����/z"@��F�� �1$��S�oj��詣*bbh+p��+u~���BO+��s�ÛӼ�9^�:lfx6g
W� �m�L��t&���ZoPkDi5��"Oa9����5yv��D�"a��o�P���zDM�ϖ�}&�3�}W��W��Pok1@]�����%�k������܉����:�ΆOԗהAmz���l�F��8e��ǨGU��s�0�����z5�H���i�4�[96d��w���Bw�:V!��8�ʳ�JB�9����m������M�W�f���_�B�z��c\nr�0a���� �-09�F�Tܑ���B�Yu��rF�G��d���"n�$jo�B���6с���&�ż9�	|"'$�%��#KDWWQW����6����ܶ�5%E�c"�&4�8�(~����c&r��������p�����,�w*,�kq!��.}��?��y���%�G#r����ru���9hZx��Pte�k*)��zO���N��'��'z����A��AC֢si,FAT4�ɺ,�e�є��B�
0��m��|���qN0lV�
���1��l/��:�wv��������ᝥp��$XD�"���u�w.�a¾�c�g^�L*��ˢ�J�B�f�Я/�W�&�r�&���!+�J2k�Vtd[`��s���>��9�(!KՁ���fU�p�:A�P0�wr`-pS��H�B�ݵ��/�'�
�(�1-��=�GԦ����ST:\���9�ܞ�q�|T���i�1]{�X�A�p0`4�����V�/Z��`��p5�6^D�*�P\b,,tu)&��������Z����*�,W5dp���=x�����n���6BK*q#zT�~[��:B<��A��^�ۧsˎ�gr{ws�qih2t0n V�:+�#q�J�fO�3H�Q��pM�u�2��q��N_w� a�rQ��?�J�	��'a?�z�>%�o�n���BV��E�K 2'�xRoG7ҁ����F��BA��:ğ��>�3	%��
��
r[0�o����\{����hE�o���������5N������X:�G��� �b���GgCFQ(���
�q{>K:���Ǟ8���_�Q�E�u!�4`u����x�1P��|s�j���ЊBW�+S@M�aY��u�U����~T����~��ֲؓ�����2@�x�m�.g���2����[�f�']-"D W�g�MV@�h���=�NӑRiѳ��[������S�ޗ�u�l; , �k�}	�T�����@2��|���T��2R���h�`��O趱e�{s|�II�A+����6c*\�g�8s�ca�1�˪�u��#[;�T�T��]��tA<����g2�cO���<��69����k�mu#=���Fqȵ'�6FC'���?b�)�Z4	D��qQ����!|B�l)y�1������/FVM�/������)/�~V[8لFM�s�MgO�@]�����.���NA>D�8��2�p��&5�wll��e�8R���7��Zg6��ڙ��]%IW#�S>�2��j�ٵ^Z	YN[��r]��� FZ���oM2 �����A�J΄�:�0"��\n���Ց��I4
�%�"�&�E����!����(|!-�(`Ƣ�8�ko�>��p����|�ԋ΁�f=Ln�o�J2����0ȼc��w����z�'sxm
�A�� ��к_ߦs���8�e�����^_�^�xZK�u΀{�!k1L��5�M4&�m�0��i�WPt,�*W�y�s-
?YH9fw3�d���
�~�eO�%fjZ�D�t�h�$֠sؼWk6�2_N��AԺo|��.�`��MF�uu�x�Zgk��iX�PQ���.%*�)p*���ږ'��]���ff=���V傳�gY���i�LS�BdSA�]�$-�k}~f�̿dі��y�ڙ�g�VH�c������^o�Iw�<,�A�;��c�/��(4�w���ǫ��uP ���7؀����#������+���L4
�d�g�-���������p�_3a�B|fm��5w���JD����]�3MhȞt��8Q����q�r�l�C�ᅮ:��Ef+y�~/��Տ�w��vE�k��l�� ca�2�E�&�[���k>@ip&T
��緗�w'M�V;:afD�P�"��Mh�v����~8�ù��^�X�"tU����_mƼL��}N��!�����n�J����������9+Y�Ϭ�%������c�0nB�'2�:�<Kf1M��z,KW��$�*i���i/<���0������DRl�y_�FI�����yhG׭���Ff�n���H���`o�*����P4A���u�$"̶�eM���qj��~�,�����#[���!B��֬����d:��(�+`c��+D�"�uȶM�̴��j�م5Q���K\��E�O�x����x�p��\Ns۞G�$Y�
�%v�#�S�EW�iJmW0:~˹�	��p!Z�����.o��b〸X��N������C�V9¥r�A�M�P�����(���ǫ�t��C��3i���xE2�L/�*P`���љ��8���[�����VBC�n�ޝ�����鉧cO5��΀�ȱ���>[����fG�oPG�k�[1����B]�����˜xk:L����\��f��u�Ӟ���`hu���y8<����)����4�T���s�y.VXȆ6�R��j�]φ|y_�C��
�v9�Otڼ��u��]��h����x}w�/��5rA@�&�Ĭ�]�[�<������`u����ở����fSy��޶���5`;dӤ-��_O�����LAJ4����%�A�~�����!Clc��z��I�A��+�OqlL�O��)ƪB����;���9��Y�X���n�vިZkR��J����;��
�ɱ�����q�@�Ii�������Mt���Ҥ�ؙl�E��>�-i�Q�Ӣ�{&_kx�DD��R0=ݤ��㮬�HS�>��?d�������� �  ��p�G"����T��涙_�SI�`(	�Fm�q���f�QF����k���.i ��ސq���������L��_	���T�qm�d=G����n���^��U[��j5m�̶I,�f����Ѧm�Ǹ�����%��X���ѲB��\�S���X�WCj�ު�{����N��o�;�;YAY�U	��rc�9I���Ǳr�pO��!�?K��T�HbiAL�DRVkk�Iu~%a�{�R�u.����\�x��i�g�[���t���D�@��З����[�a6���zVB4.e��	j�/�m��$u��>$9?ґ��9R4$\���[��Ԓ*���cH�X	C,���x�I'��O2�#���� s��PB�Gb�A�ˊ�s�_�GW���R�ӮH�V'?9��p���Z�It��� �i�CRmBh�@g�f(P������i���<�@?�Øg�d85�2�TC0VΑ�%AY�s��"��D�[����Rۏ�eЕ~ q[-��s�5�<���݋��_��gIN������?��6�hJ(��D��m�O�YkT�fh=2�#C.���j�Z`�:grN=���n+���yvII�z@s��! ���ު��e��*=|���-d��u�d=��E՚A��}YE�!r�����1ں�s��m�q�3��8�]��2-.c�J�K$s�j(�f~�uq�D�6���kW�	��R����J)^L{\d��ӫ�x��-�,[�Ol]�X��a��������<G;����p��4ѿ�n���xw����2�_�]goqR:��/�k��2bQ�}�V���^I����]�zv*
�1�P��2�牢/!���=)�A�M�U�U�9���p�Q���6���o\�y�.�����Ym�z_��qV�X����!,»Yq�m�ɴAu-W�a ]fG/Ѐ�/���=T1��I��g���8�D&��΍���O�:��� �4it�C�6��?�6��k��C0�X=�oj}YlDeb��%�z��c0R��v����v�Ĥ*�1Gi4(Z~K��;�8�4��K�+h:\�N�m�bg���֤ ��m/J��Ixa��R��*I�p�Qtq(�b��69�^t��R!���u~�u��vN���H
-*zН�����, ;��k@�y���s�v�k	Sn�f��6-Z��P؎A��{�W'٧����֞�V������g�M�$��y��4j��,�v���'�u-�˅H+U���
�-ж���b�^��uT)��y�0�h�ȳb����횛_��k�<k�]�&1�d���AK�c2��6�/O��W�Jp�|�q�-�����^�v����k�o��v-ұӵ�ʼ���h"�.�/�������J��g�QRh��B6��_�Ik�|m3ދ޸eIJ�تi,�Gl�c�h���dZ�lYm�;K?o���ihm�5�Ag?�|�&	���jP6��i��W"B�g�7|흒��;5m��Tr�s���&�nnzMo|�F<�����D6A�����X�3�h��zLN��e�`�X��5��DfB�r#f�^�� �"�"�����F~��_�wm͑�݀X�0�����2��RG��u���PW3�4�����n��	����2��8C�Us��|�g?�\8�%�У��T����K$H{45��0R���jŶ�u��'��ܵ~��i(�'z6�v����݆$nF)z�n�rO�
�&?��� ����p,��oy�`��*2����	 r�W��"$�߈��!��,gHt�f7k�.���"���5�fo�wK������2����@ K�t�����wtGT�� �������%���h���P4t�w���:�`܂����F@��❗v6{6`Ŵ��"�*+�,G�=��}�O�-�b��"�T�������_?�s�"��'��xE�.����a�g��c�U�c���43�*�^�l\K�@R֥��F�CU{D�u��09}�l-�����)��+@�؆�����t7��~�5A��@�_����t���\�>t.�e�`S*��a�ă�H�X&R��ɟ�r�-�i����c�@��}�xU���C&��dִ8�&�ۑ������Y#�G{X��l|�ɶ2�>W>��{���z�*�ǀ�O}���߹��������ڬn�1���Y��۱δ>1=�U� Ʈ١�����{^VN�nY6%�٪D��΃[[<8��+�N7ǔ Zf�l�0'�+��Y� kZ�2|m������Ƞ�+�c�4=[W[�O����0�KW�?��pjδ��x\�I��j��P����r�rh�fh�A�HtD����s0X��^{}1=[�C�,��1ޗ��z����O�a������#����Q68�~���$Ƥ��\F�����O)�xVc�2�C�@�����O�3�k��jx���}﵊5D�
h=��Bf�����# {k��1��O�L/Q���d��j���@�[v6��]�4v�12C^@]z��I��^Fxnד����|J��,�M
E���v'�.B gJ�L��O6>ʘ�ٞW(��3V,D/οr��̍m^���k��VX�޹M���v�i&�c{����b ��F��ɛ�<*R�4+<檄ƍ,�/��l~�L�S�k�<�3V�/�&Z������cX�d��{��@(���^���?>�KT,��+�yo�C}یon!R�h�}����:�볭�$\+��s��_����s������
�;�sC�2�+�۞!�~'��}�Y���oB��g��}��?�%w�0�B%���/|���R�{���,a�_�+g3`�OY!��w.*��Q��v�<����5�������H��t9�����;P��g���zk����^����a��/_��,�G��Dq=�0*���2}��v��)����������Z&;            x���[zݸ�4��=�3��ϲ��cO�G� H�����w�.kѽ��I��*��Z�J�ȈD��hZJ-�0V�9u�|y�����O/kT��jNZsUt�_>��J�/?�~����ԋ;�s�ᩍc�\}&n�zy{�����Ǘ�jϕ2���d�����/�7��>����U������wT%��%����?���C_��C���mId�9�m�T�zy��������_~�'=��E�%�!���|����3%��E�M�O������/ooo?^��6�ue���y�����������o��M��x����O��~������>*���duҹ8������Op�%nq�=�B�_m�����q-�%��)dv`�������ۧ��8L�ґ��U�z��/�	G!d�m��l	��${����K�K����z=0?l���|���=rk�����(�=�_����02���&%Y��#T^?}�C!�b�-�s3d�"�B�z��/�.�N��^OjIӝOp���?׿�ó���(���8N5t�% &�0G�����s��%/�pWC�9Oqe��爫�C�����vږP(��]8Ɨm4�⩯��7��H[{�#�����Sx�U��8$�Y�0�qch�r�6�$�/�Z��jhA��l����)Ǎ!�#+���Е�ؗ�!U��絁N�WZ�s�1��q�Ӻ�~��_��at�rR���pE�Z�$L��ǲ��?�X(�кė��E�3٪��Vw��d��3�/��Y9�KH�ލOl1�W�B���/�/?_�}zQ����H刵�n|F�3�B���R��P_l��B�(�`�,m����?�����/Cf��HXb�&͂�1d��S)e%�s!^��j�a�H	�3ȃ\1w˃���� �¥��j�J=�峓[��&��`t5,�D�T�9}�<�;r�W��)����K��v����fTJ�� ��h��.��;e4�ۊ���a�0i:#��N�HwϬF<�X/��r�f�s 9�%!ܥFqޡP��}������w5�n��R�[�u��w ;���5E����Wy5t�M�g&����N�ƐV`#y����5-��!חÌu����:�i���蚲�ՐL��F�m��f�lw(T�F�������ՐrἪ�܌ ���䋤5�}_��Y&!�₹���UcJK.�6�:���~+���Ԉܽ>�D�,t,��2k\��J�������·��K%�1�9!��n���@�#kE�sF���0� &F�PQ\�$gf���3�ēBo�a&�v�@U���/�!��@ɸ_�W�Ml,3�(y��H�[X�f�-�h�b��v����o�����-�ĕ[I��U�n�iV@D�+(�<�cV���hk�<��w΍~�8���;w:�������#뼬NjX�"'�v��U_��wRg�g�V����#�!��Ce����f_*$����??}�����K����ȍ�������9�s�!���-b�3���Ő�����D� �mY+�I��>���^�D4���,�v=�, x��b:$��������˂)����v'��D�Xtc$C&~|����ן/ͪN�:8���-����z Թ�:(k�N^d���d�������|=�d���5��w)��I��@"84qW��ibǐtL���I;��!o��}����Z�
�tO����?���_/���C�wg9}Z��g�����'g�l��j�d.H��@�S���ou��2���;��ׯ?>}{�>1Jk�NT5�����.;7�h�-,m���篟_�j*�� aOg��^?\}���r(�s���|F�z������X���R_����D�[3�T�t|���ۗ�o_^�C�!Z�Er�<^��}�~��5�~˪������g^��3�Ge�*��@�i�W	��/��8�e�>�D�����-I�����݄#���F,#/���K���ȱ��ĎIu,K����O߾�xٲ���`�f����O>x)�r];�XaY@�{{8��z���a/H�ə�:�͊R�KF�hG|�s�>}���ӗ��[��	7 [��.��ÝYj�L���!�9�Gr\9d�z@Ҩ���R����� 8�&ʹ�h(1�c�������ׯoo?_v^ �FFZ��R>�x8����ɴfe�����I��?b�V�+���J���o���C5�F3�R�����g0��XM犥f�,�d[eg>2W�SoГ#Cwץ'Z�����*�l�C��hd�r��o_����ywհK,�~�G��I5[�Б�Z(��N'�*�b� w��+�5�o���l�N��K�.��N�c�����Ɇ1�Ì?w̐�`��{
�w:��:�y[V,9`�I�?L��w ���B�,�� "����3���l���:���G��%��9��.��a���,A.��)g���/�����)w
���!��	�6��`~�F,<��)G��ϧ���L�)�S=��a�\����px��u\(�ǻ�V0E��F}XN,�@Pq���Nb*�e#����dD�¢�^v�q���?��cf�Q�c�"�L���;�6�����\n������d+����������T��R`���?�Gb���b����!�5���x�1�(�����t���X�k/�\��I+'�u)�aa'�L�9@,5�� ��>W��MZ,dxW��q]FGO��!Qjrb�O]Fƃ%��V�ڑ��_�h^Z`�6�8��Tw�,]$ ��.)�}�K��'j2u��[@�qٲ~�n�Y� %u���R��Zx8��BxkOڤr�Ux� OHJ`4�����o��~�R!�.��aA�k/`���ß�0�%���5�E���f�¬Dg�ڏ����V���� 6%0�7L�L�&h��J�u�����?�|<d�ơl��f@�d]�C��%P�'�ō�T��WDD�`�ᗆ���b�]�^�^���c��e��p��2����$�I�S�Dӗ�W, �D}HlEoM���̇�l@ѐcJЙ|��iex�zE������������԰GZ�����f!mY��h$��ۗ��y�#�W��S�ת�!.�����I���EB� �%.���õ�j���>mg@�!�;+���k/CR.p'9R�:���Y-�-�g�nM�o�RP���ұ��������@�6�wH#0 ���1�V}��Ny[# sQWc
xDPBfM����/ƪ�����;����zH:���n�W��c��H�����I�ƣ���UX����=�v��R�EMTN|	+ �݌�;���\ckE�ufx�k`P��d7w�n�=�T�lJ0}��މ"��Ąt�������_���R�#1+"�N]91�T�ƃuii9S~/�F@7��[�,�n����|�&�/B����[q1�OJ?�Pq���ow����푠IXh�?V�/��DƔY F�;�%'�2ֈm5S>B��{޾ �^�X7�lՈr���R��Ԙ��A��e�:D�d���ຈ���#GK�g��P��/�4s��[0��=�v���s��>��
n�_g�r 
��T.	ӹUGv=�@�i#qL��FS��=� D�16���ZA]�����tjd,~�@�o�a��`Iԁ��vFF�PfV�]:qR�e�@$�w3G��3?7H�����%�������2C�}�|���u?w���ݖ��v+�G����Fy��D:��t�ۏ�!+
d�z���$�J+-k� �u\�unQ�/A�X�n�N/�J�)���i������w]aA�w/&�黈��I�S��a��Y���nu��:k�`v���e,�� ���0��!������ �(w�/�˩��|�)�g������lR|a�=`��$�𻌽�!�A���ծ��!. 
Im'�!_�q�$�6(bݫ'�R�H�7 ~~c|{'��8�J�}��m�i�*k%�z%Q�z54 ? �@(d����
rڭ�w��g��r�y)}�Mm�3�<�uj    �-T���c|y}}���b�8��g��Z��Ƨ){Jv��cH��M"C*����t�$c�C�~�<���'���������d�Fb�=IT����c���	���8JR�@p|�����l �rb��<U�{��Y��:H��Þ�X	�������^}�ˉE:����$m-�VB�]ˬ�VD���.���;��ӓ��k�=TT�'TT�6�]��5�`h��<�����af���[!��<6�]k۶�eՌ��؋���*�� �Wk�Z���Uz0�*>�T]N�!M:0I����P ���S��V.�j?$�p �����i_���>7����x}��ib�(�nA��~5���FQfw��=���f�,Ξ�*g�w!�,Z?��@�9��bfO
D��wd�x�7.g#'�������8wܿ�~y�5�S[#��]e3�/��S�ܽ[���{S��P˖�� Ƃ@�U�+F9��V���F�߱��FC�,H������ha7܁�9����0w�;�Y�r�A����=�H�Z�Ѩ�3�����l2�a���1o�a��f�m �R��w��륑�
O��'��0���R���ݺ<p47���.�������FL��Y�2{�PMf��㝘����Ì�9�����n	��z��U��~�&���@b�J0I�y�h�b`!N�;yN�5g�H�c���Z�~�IXR���f�d�ɽ[|-Y�hߠ&[�C,���>��䡀L�O���k����Pq��a�̵�Ay �J5��J�jAb���S 2�f�И����@����4RS��2dg6�8�n��P�S�|��)WI+O�t;�z�K^3hK��\)��fF���g]���{ǒ�s�$(���G�	0$�SS�ws��H9h����j���u�*r/���6���Ʀoc� zVg�q���cӆ�28=������e��uk���^�B�7��$4V� ��ǻ�ph�s�-��/%�fDH�;�W�-���#�B���%u���}<̌m�A����;.#N��kY!�q��xj�� �{��{v���6,�C������a&0�c��>��m��+��I� ��3If�R|v5���0��P}�T,~� v'b����\�i���]��M��KE�����<����\������C-;���Xfmg��a���(DW�`K�wq�Nh���<�a@�<�3e�A��ac@"w[��Gb�]H=�sn<.��O� T����v?�y����:��0##68,����K�w觏�d��v�"�u"�3��9?�,�D �-w��`|��d�����n�;� �� ���P�w���ĹƯH����n�� 獹��
�a�	�P!�҄7�����/�eۣ�Y��x�z�נ��s�"����J�i��lH�6Eq~��Ajt��%�Ê� ��W�������0	hޝ�1�K���X��͠|�b��.�[5Y����>�f����f��.g9�vU�=!-k Ӟ�2�a�z���b9p���S�A�tnw#SP:<@�*E6���J١��M��'��.b���tC��HPΰ��J�@wY�E���_;�v�����y���v�6�����3�6�M,~���H�DR˯�����P��Bk�'R6w�������<� ���m�� �wE ��O�ܡ�F���0�"\��(����f;Ж*Ԫg�Ìѩ�:�/�J�"o�F�hoLφ���L�1v(R��n\0��=l�Х�f�	���k{�1lHRf����Q�]����<!�Lv��3R"�<Ь�9Kw�M]ۊ9m�M�Hr�=̜$�
���y e܍�Ȑ#�C�-eR�������,�bܜ�@�0xA�V���H�G��aFgG���.a�v�o�7�#�Z�y<�$%����_�|����M��n����wC�X�����9�%ֹ��ǌk�E��gp���Nٷ�z��e�Ǔ�ɷ�?@f��X�!#W0#?����[PލC�1s�=z7��8TИ$����v���I��,����������)�����5 �1w�@�D��f�srN��6@h����'ߙ)�,���А\�|ow��쿬�����.�������'���.VbrT5$��  Z�w0Q���fZ��!x�^�w+��-"߲uER0w4���e>��%J|o�V���I�U�D=�]R�b���@�0_q���_�����eK�AewO;i��]��`�yР42ͭ ��v�����@��y�O��Ȟ�.�1s �vv[�F�Z�)[����l��4�}��MaI��� ���r_�{��f�����:Qb\��?�ev��E��ݒ�ER�#4��Ոٖv�.��u��\���nH�_��9@�h]~,!�o����=�<y�U����� a� �6?(g�«���s����/��o�K��HUA��e���9Z,(�^�1+��ř't�+�ꮧ,=����4a�kb�?��S���x�T�2�G2��������%��l��0�g>����Im3ki�e���'ve��^4�+V�{j�:�'��@Y�����?`�=$a^�'�5\������A"Ane0�t���	��d�P��6p��|���2k��� ^M�k|��j#tz;�ukJ��y>��IH �c$����x�X1b��4����/��O��[V��'b���`�:Ͻ�W|���O?^Je�;�[�����J���+��;�N-7��ި�0�W���ԙ��f
�]B>��A�v*��� Rt�ۣ��rKtڃQvG#���㧈�XH��2��[���pY�!V�m�g.+�	'!��fɯ$�͑db��l�
9z)X�JvO[��/?~~`���@���������G���[&��3͌��=�{;�
H_��/��WO^�� o��m�+�-=���7�
��K:V�X�~o�5:M� � ϗ�I�'4�ƒvn�=&^�ąz/�y�aA��?��Յi>��bŰ�}Y�e�Ư���e�����ϊ��!�n�����]/$a�fL��
lF����}n̋VI���C=���i:Ş���C^����R��E:��}X`C� �o/�B{���I�ܶ>F���/�m�@d¼�c,���<T��K	4�S䞝=��V��*O:��,��9���VӠ6��Ou挈M�n M��?�k�^�U2<OBb[�^Q��O2w��A�3����d�~��hl޷��>��J�<���s���|�m����)�f��&�T��k(T����%"k��ڧFe#[&&;2�{�b���WFɹ���R�}W����á�!T�؇�d���	�u�6��K��Pg,�ׄ�ʌ<��,$1>.�^>�R���1k{�윢��C��
�Y:&0�"f��Ty��H���Q�C�<S���s�h;0�Y���k@>��R�}�;x�fGsA?Z���d��C�n1@���2?
s��K̅�����\��`f68j'�OuF�Hq���!RK`���1�V	gӂ�.�<�=��s9A��h���~��Wi�)��>x8"�	�㆐��[Ӽ�e����{�n ngza�dE��6?����82�TXGLo��ߛK�(�vd�t��u������%�vʡ�t��cK�f7/�Y8r:[��2E_�l�
�����j��^c�gk�ο�g)���$���؄yO�ز��V�Mخ��Y��`�n�J��wJl�d���,��JkaH�V"bJs��/��	��4;��<�"�]���p�m^S�������\0����C���(&���2��1�=�@I|�wj<�q���>��l5Б6��j-d���~�ݧ˩�'�]sj��{n$�yb(�G)�V��
)��f�z���'jx�۽�y*��l�32riv���²?ud�;��8	@���?��i�B��#� P{���i[}�"��'R#�!�Ӵ�e��B'4�ڧrS���:ob��{�|\]��<�-��;x E  ��v}�`1�/�l�]��5fY)$�G7g�us*{�d7����r������?�H��.H+�)�!���T����p��x��K��dr9-��m�i��R�yBE����ZJ�}�W�3<��<�Y���AK�G��Gy�N8߆P6��n�LcCvܘ'w���V-�/<ƃr�/�R*��n�XHf8RזI��%�c�M�%�C����坌���yё�4�7X�q�D�.��e!��6��R�f��:�e����q�:�/�ӅW�/ �1�o�|oS�h��S!�>���yv�G��e���9����R����)�����]���^*8}��X��|���O���*xt�|*�/Q��a�u,�s�˻/��+)i;�!�]��T_ļ��"Ò9��'��#���Z��7;�C�)K�Ԝv���6
��	���F�`$~��U�wjY��/OxO�
�yލ�E�G���Gp$�͞	+�uUOMiǘ'�N�֍#�2]/�.j��T���l�[}�3b��t�rh�hJ6,g��]w�"��^�}.�8����6��E��罆ݐ��DV!F�����;p���@�N:K�:}�H�%gh�}���m�m�**BdX<����wH$q�����g6f�!N�C^���1�S�SձC�v�B���	������7�؂�U��G��ݚ�{N��*�0'�!+����4��)�yqw�1l�g9���E"��x�������a�Sb�a"U}���i9 ��|�BR�F�p�W��X	3���!������6o����.�nOx�Q� J������t�{����*k��F��.��{�~@֗y%V��GZ��+ �����Z��i���F��f,P�V`h�دU��$���g[G�׭����W}�A9��eTE���ͳ!{�L��y_�3�l�2��g���fwvug����!a�y��Z�y�;}�L�f�d��׫;r����>���S�Iv��-�<&���}�UW3k�3�"�FY��D��:��0Q�I�=��+4�i��8���{v�@�$[ļ��$uV��I13����i2�����W�ar'ٓ�� �ޏ�m_���[:���z����.D7H�|�$�bǣ�u5�$�J"� .G~/�}t�^��}�mTe���)��(�+а8v�9�_/�4�H��l-鰠�����F9��ұ�`����eg�����kE�bi;������s/�����}����xH��+�4t��6�>}������}�sa�<�h�_�ǏXg%�t^P��y�����n����	;�iҳgy�-�����\�B.��5z�����K��B5�u��VY���z$�v@����s��'����NH%p5yx�'��c�YW����v���[X���٩�B��_���P����A����˵�l��Q?���E$��uh?�����Bڄ<v Q����#6r�5��T9c��oG󆽽Ә�e\��W0y��=�wz���яl*N���.e6)y�����X�<l��Z��=�޶�"�h$l�w67/���/|hk��oh�j%�鿺���Gp6�A�j�
���+���q^,���D��!��+�>f����%��󾬇'ހ ��``�lMO�Y�4. >��:_��߼=��[�y5�YVr2Ы�\��G��<��R����<���� +��Z4X�PN?��!´̉2�}�^�?ԉ�Ы)�M�7�=�}9�Hi`:@����#ǐ1/�?Zwu~���;�1߸2_�o��\��J#�f��,��g�!��f���o��M�X��_����.m�j�Փ��D�:/a��X�����\=	�V���.%7�,O������$���9#��Ɂ�v�g�t�o�hOV�72�<�;�W�Wv�ټ���1�q�H\m};Y�6���)灴�����_>��g���iNy]��o���#=�#��[Kna���6�O���qH@�7�,O�W��b��w%.�x�$�Lum���uRN�gy��X�t옧m���Bp�i������p�<����׷Ti�X!�:q��B������3�4WN���%���#O��������?��a^�6�Q�M�wn������?�,���      #   �   x�U��� @�3Ta��r�ePDb7) ��`cqrJN��f~9���c�\ϫ ��B�yXT��|V�JR�
�k�4����*���t�v��}Pi�b���;�;8���QP�ʜ��=E�h�koPk��d�����M������GN         h   x��A� ���/�텅2�u@h����5��r�hdwqG?{�&��B��T�[4DaQ�J��t���U��]۲-q���k�"R��B%(�k�� ���,P         I   x�K��K�L�5��H-�;�0O!%����|����|��ĂĒDά���<��Ģ���D�P������\1z\\\ ]O�         �	  x��Y;����U`��� �B���ED聤^��,`���:��3�ژ�%A��hl�35�M�-�~�=�J�E!ʔu�5����_{�\;���ޔᳺ�Q���L}�>�}�ڟt=�TY�FQ�f"�c���۱��������O��r?Nwu?~��;���bC�Ċz��8�J!�`}[Y�@����jԬ���5�|�j,u?�#����q�ӗc7��q��׬�?o'��zT���>9�[�	y�#)�2�"c���d��k�~�����bJm��� ���v�>��u<��< ���z�K�<)a\��Z���� �-?OnġXW/�哨(�"-��ax?��7�?�t;�D�����"�Yݪ^�n2��?�}������N;�Y��]:E,�Xp�.�{��R�Q�3��U�j���@?���ɵc[)f�~+p�]�v�Fe�I�ܞ��|�Å��9<�;p�:E{�� Js�Eq�3<�!M�8B2g�/@�-=�rC�_7�X���d����>~�nձ��/��j��0W�YY��a��ygϪGL�H!�����n�z��y��,R��)��3�����M]k��"Rpx�m�!E��e��	H�kDE.#|����;"¼i7"�'�	*���jY����� ��/����R�x��ë7M�L���/�u����A.�؅�a�D"`��.�A�F�[���Ѯ/֍���$ϣ$���!��,͓�!	�+�;�]E������3�Դ׆X�T&t�0!�8�|�q�8K�a��J;x�&K���o���
�@%\��.�{�C�?D$��ߩ�����*�b��e�m�@��D첺G#����c0�Y��z�ZX�����Ľ�C��yey���勵ă�P�⒙	���G�Y���?��s��e�+�= U^�䈑M��p��t�Ϲ�U0ȑae!�h��7H
�4F�d���w��"ΐ�p��㫣0����e�$�ܗ�� pm�%�u�׼��5� ֮/*M��ѽ'�=EwD�t�.+�A�Y��A�l[��琌���#�C�(g�Q�}�za5O�\Wg}�عs���`��eY�+�7�؋F_�6y�$��o������5�!���bnE]r<���T�"1>U�hhmx��y������~��ȵ�H�2etG5�y��dz�Am�sXi�����}���Pٓ$�@�=�I�Em͖]:z~�i"+e�GLl���,��݅[奱��b5etM����q�R���p�Y��OJ_Ee3��s��a沮^�;�R�� ����'Lh(2;L��� �*�~�K�Տ_���
�'I)Ӳ��Pn�$g�%BO��x��'�fv�)�Z"���[�(�HD�S�{�N�dı�S��?TӃ��`)�k�%?k�7�HШk�0��ˈ�`�F I��A�X~{|��v�ˋ���	�!Z�Q�/z�NU����jc��M����S�%Y`��<�,�E����-��� "��+���D��Lw���vTi!���%�����4MW����6��^j�>�#GGS0/l����� �uu5�ˋ���n�t+���d(��q���|b�J�rK���\����Rk���3-�vC���B�6�c8��`����}�!�:�Q���7C�Ɨ9�.�����P]s�w�TI�H���	��A��)Fv��i�Ʊ��H�\�e����g���
��./G�N�0�{��0.����U���iB��^�]`�jr��u�vB{@T֖�	O��;=��s�4��s�^�y�*���]�_��T�5𓥁��>���9L!���<4a��Q��y�l}}wY��O�A����`��D��D�Cpl����njgv��a��&������bIJ�O���v��o{��B�{�]�8A����@4 ��D
��g)8�����GU���;��!C������	Vs�J�����X��=T�_�j�	���
-���)��i^��9�	CP*�>��.�
k����m�\&�#z�T�64d]e�!�~k�8)�p�����rQ bhx5X��Lc���
ϓ�T�ؙ�h���y���W���6X{|������\�kPg�Ǿ7�hD�u3(CcP��#��7���@uj�\Z�n��"(̬FM�D�W�(Qe��{�CA�P@� ��:D��_��Yd�Y?�ˬw~��d/��Hܐ�y�����T\xp�g0�����9*mFs�}F��Sr�(��m}_~�Z���ٚf�f�t�^�$�JthQ�//��>����T_�C����S}e'7rb%2�r��O$�	�� �c�D��"�켨�S�sR,g���B��V�$�HdQ���$�*���x�f?|���&��8��boƮ�,��5cO$�II-FA�z2��9���Ԧ�d��lT�HJ*�%j��r���ӯ�ʜ��PM(�Hdۡ���u8oS���L�A�,
Q(#6XC��U=�����ۛZ�^L���,ws�}��O����qݠA             x��]���8��9_!�Z]A�ЛوHBK�&	)jV��O��16�[�~�HJ*Q*�����#��R�|����p�2��*���.�n���]4�*���ͪ(m�e��u����m�Ů�r���n�Z���6I[$,�2q�Εŋ]������l��~ؖ���?�h-��^�&�<���m����~E�|��-VvѺUW�mS�ߤВ�4�b]���6k_��+,�}c׶̵�P:��v����B�A���UW�b�V[[�즶��6����dҊ����ٷn����`e�c"�<5:��%f�}���-J�X/�Iv��������s_ڣ]l]�@iW"Un)~�2ٺ��54S�f�!��R͇�~aZ�Q9�u����9�����ֶɪhV�}O9i.%��@L���3�U"R�e\i�_��]�7�g�F����]�}�88������2�ι�,��_lR�춨]��r%TT��Nݾh�l��s�o&͗��.]S�v-Ω�[ȶ�<��b:�D����+V&cؔ����E�\s��@tx��q��`��i���/��}!SN��%~k�FK�2)��<eK��׿��=�o'#�J��'���^��!:m�;΂��hKٱ<K'���"��Ԩ�
jx�dtUQ""�MW�;�xJ�A���Qɳ�;�'D�D%��)��A�M���%ll���*eD@?ჯ���V�Ǻ��7.6�q�}�uk�xv���E�9?3��P�LJ�k8��d��׿�A��T*Ϙ�uZ��5������˒������:�N���J���_�bS����^�bS&��\	]C,����:XR��]���+�k��6p�M���n  ~�g�[�T�� @��Vq��ٻvB�l2HwG��HQr0���!m��X����C@$�~�c�<�aB����b��/�Xj+��������<a!�N�!]�)���!%�H�p�~×?���Гݍ��3�K8���3����[�h�,F�F�&�Xw�����]ht)jY,7+�#a T�:)����jr/J--���T��J�*|�;�7�'�� ��~��H�j�@;q5��N��/ k�Hz L�i&S�U�����}���>���/���'�ӘI8�	}�֯|��V��\T,S�;Kh5gb�����}Ԛ+n8?ŕ�I#YʕL�>�'�����ɥc֠�ϵ ]׀!"`�C����)��������6�����WϨ�`my:�ږ�8o)_ �X��"d��_nZڮ)��;��!#X7 5���Jx����)�QH#5��[��w�
<D���-ܥ�2�"=��T�� �k�h�x�^�0���۰��Ht���f��Q_�N&OS�h����/�������K�o-��	)��ӥ���Q��G;� Й2I掄p�2=ir��a�>b��W�8�}ԶwK[�m�`7���Ir��@;���~K��PYu /AD����L�7=$�����	_H`O���E�"/&^������i�׿��Le����ϓ��>-�10�,	��8���s��!�*�i��J����Ʈ���=[@O�G-��񱟐���S�I����'�\�Ӧ�'nɲ�*9���Q�\FAQ��>������-�"5���b�w9�@�rm��k�@�*�i�ۮ��gY����KaeBN�0ml�f�.E��$0�t!���yر�u�6��꾁Qd�_�����a�\��)�%�a�~~HM,�(�(���IM�|&��c[�xW^���ڒ,�����!���̘M�
�� �#^���_�'��&I�;�jtOd����pb�y�?�X�aHaH�����v�Ibu/u�_�*,9�a������/��'R��Y�E��/���c��F���-�v��>$Fe�?H�LKyUX?N����V�]X�m9��^H3e��,�����U���UR��2da:K���=�\�? F��B�Ynطǯ�A*)8qr��{]l���)rfBa��qq�V�-��@�V�\&��g{(\����˃[�����҇J �ayF��[��*����@�AI9 ��jU��,3C#��Y�{o��A�'me\P�60�]��s3?�<ڙ�3�k��Ul��-{2yn2����5,L�t훠�_R�%�<���x������ ,Q�׿�X���qAdш>
�/�5{=A�@�l�����:��9+�'�}G%�(��Tq	��X���^e��)��W��,@�2�e	�
��1�n�}AM��<�X����˦K5{kt�|���^��� O'u��|Rn���c�(�����u�k�ʸy�d�&�1��'t�z��g��@��#M�+��
7���㘄��\�dE�aa;�y�~(�!!׾,��d��T�d?���w��{�l]& �/*� 4��8е�&��fa��+�L��$,M#���/�c�"�m(�DR�q���{}Uh�H���3��j���H���l4@~�H�`؂��h?#�O�.r�rNj��=�A�C�1�F)�����֦�����'���l(Z�N
�I�%p�{�� 	�9�a��@슄.*�4g2�;��Ud�'ש���(_�oI�F�@y��aĔ+��d��3�:��#�q��e�	�ܪ<}��I�X�o�I��?!��nR�P§W��K5=���ր�xKDЍynE��v��/�?�˖��LH�~94>cm���T��?̭"���'莄���c �V���a������b�0)�"%[o�� F��F��E
�M�!��.%�YF�4���=y\vž��oU�E��(誵U��I�{O���%,7p�dT��/*�`y(�Gy�T���nsdB�#�/��,�)���o�(�LA�e�`&e�N8l����\u�+�+����oS�&��X(�i�����Ӣ
���"Ȇ��T�L���zg��j-�rݹ�S�|�{ Ǣv��26��}��ĸ���v	�!��2+���B9����0�P? �r5%{<ǖ2xhX�׿���S��8ħ��9�(5^@�r�=��Ɇ1��_�:�ڢ������M������B8��d7.L3�@�?��9��*1�M�h��
������xnX��&@)g��"��).T|�����|B�[i����M�i443C ��2��{*�!6[�[>�-�r.������HGK������҈�GlCKlaC���R&�.�9xX�,��~��<�"�= r��n��-����f6��E�S`�Н���n�M�f����b���w�g
	Nk귓F�)`ϕ�,'��X�S����7T̞kyJ:�s-a��_2�̥ ��p�)@2=����g:M��w����8��X��N
5������I�D���_4:�p�]
�M ;�,Rt�����)�l]���2r�]�Y�<�)\� ��]��CF�2���ku)�<n|��O8�ҭ�Uh�� ������;�E) G���`ص����$�@�*hRdW�A��2�t�y@��YqL"E�=���i��*�Jũ�Bi�74a��|�}�WE�Ж��!�t�F*�qF�� fE����띜)ҝ�;��}�T�qL2�~�7I���8}[�q��7"��c�=���A29��jɧB�M�*X{��w����8r@����~p�~pdd��D�^c  �����$珖y��#��!=����BN&X��}\A�M�(�'�E�hZ"F��2K����,ຣ 3"-8�����I��L���(�/����2��ς"`�<5z� �2�@��܄Z����V�DX�|4u
PkW��v�Gn�tJK�I8gP�P���Lѐ��QE,6�o7'·Ƥ�z'����"5���;*����J�uB�9�=NvW�7�gw���,������,�:a:#�w|��b
'̑ppF�x���w� �̤��"���$�_�j����Q�J���t��
��=�rn�'C�[Oc?��=g���5���J���a������tL㎷�@:��hJw�Xl_𣾵�KRK��u���t�y�T�(���Aj�I���z� �Ah�&j�c� �  0�)!��3l�w]�]_��ǂ�m��j
� �I�U��D<o3��҅2��<����r}5G8SՏrN��� f묟<hc��@N�!���~G�p��w���1c��1�gTj���q�?�$O@NFM�����6�\[p�EM��)��R�?�a�u=�ݞc�sJn���g�k�\�������f-��A�Y�{5!�$=7�A]�8�� dV�xF3�n}$����{Om���ǆ�ʹ�q��\�u�[��.��Dc0��MI�����Ti$B5-����<af'���i�dnh��v����Tk�y���6c?%��N�'XoR�!/�B�����S�k�Ǯ⮰V{������԰�=MqS���0�>C�N�]evgTr�T�S��/����^Q��ͥ�>�Y>Dk#�:]�	[�△||K��T��5��S��]e�c�;�_�x�3��;����ޭ�YR����雥G|邐�&�{�1�����؝�͘!��.��L)�e�bP{�wK�l7�B
�}.�<<��e�@h.��4��Q�{�ﴏ�?�nA�ziwZ�5��c���V+)U.�Vny��4o5+FM|D#�`e��OK:�f���"u5eM�P(�7��c&.�Q�E�B�P�)�����GϠ�6�9��ༀZ�^v�<�M�}?��sEPYB1C���S�%�%eI�3XP1l+N/������5��""�����:��^[F�d� S��K����ͫ���z�	 $	���y���=G��O�x{/g�j`��7l�EYe�y&焷b��
���8g$�p���s��� �� �9H���@PK��i�p?�%���#EPK��<V�����ϥ�J!3�|��+-���R_p��ڵmhWrd;ndX�������	�T�a���`z�w[wEER�}/�l�D����iϞ7�p�ID�6�Dzr�t�"Du0���
�'�w��ǫG�2�(l�߱%��u��/���&�D�s=�	+����2�;�pձ�7�wų��)��JNMj����0�0>=�g?K&u�-4�V��|X����f`�]�bS�P���/�� ���1��#'���u��Z����U�$K�\B��
����~O�c���*��C���DY������LߎE�J�Gd�?�x��5BQ2�sŶS�R	4A�S��6�2��R��4/�+�M`x�GSL>Źz/�JR�e%�nJ��~a	�NG����g��yT��y�p-!����Tm����#�R��{�1:�$M������5�`C7�B˄�!�fZ&a�������s��� �щg�?�
a��t1��{Q#��Js��_z󈿜ߗ����
��
�}Ϫ�� "c�<�����������������ɡh:��KQN�~#%��p�^�� U 9.�$aF��<Þu�3�?��wӇȤ-�.6u ��p/��rp�"�;���v�g�Q�i�ތ�g�8��g�+�49M�����i���S#��a����_5���ih��I[���G	���o��i�f��� �c}��2	\ZG�猑��T7�.m}!m�{�8�+������2��<�`	�[6R�ž�{���U.��`�9�{O��Xg:E4�}���B�~,��j$���E�o�r1��>���G�h�StM�/>tD!T�BÄ�M���F��J���h�a�KgF�d[�^�)���S�����@�XE�K�������r��Y�ڥ�o�
84� #�*7~�2��l��-���v��A��ɲ�3]o���T��h���b��-lf�g*>Rzeb��hʁF�j�Z�Ĳ�̕����{yT�)�t�1�tM�t��\^����#ā�S��T�ܸ
6��� �g��\�f#pв) ��т��� g��|���}�s����:&��K.�Y�cFd��i�jWgF���;"�I��e�c;��a(��[ ^�d�FJi> �?��� q"?m��Z S;��[�L�}�gz�6|�����X'�I&��!=�o�k���s�$�6_�OT��[h,áL.M�>NV�
�'���2M�(%�K�������],O޹����fG�My�Ǉ�b$�TF����I?���O��;��ӫ�}���³�G�w����2xD�����.i���Jpx��1
��j�������ft��cqG�=��G�*׶v<�Y�S:^��-'�l�G܆qR�2j����Ϟ?�sl-�ѥ��Ġ-�~����9��ir�N6��C��f�↰�o�󛋞�6(^� !��d�dK|�/� a�na��wv�ܙ�x��ΰ_�ܔ��߼m�h����΄��m��S�\���K�>�b�*�`�u���� (�C�fyx����R	�7�?�A榣����B%E�낯?�/��2 ]�*]o��s3^A������>�3K�a~��+U��6����e&�8��X����Mx,��t�Wk��E�ii�
�q����6��~�ۄ�Y���/{���҆&�B}� ����_�?~��n�s�ԙ��̛��t��Q�T�b|�"����/��D0���фމ/��0�A�Ȗ/?u.B�+l"
���7/QMu9���ܭℏT����C[e�c����O�.4��ZE��[���ˎ����:n{,�Ͻ&tb�9Id��M���1��֕�/�ћTB08��+<L��%�+"᫆z.�+���4�".�K��}����d��&^P�m��S�/��W��:q��ŕ��kޮ�]�a@5e�
_�� ��T�Vif� �m�Jy���n�'�t��~�>r��R�,t7o\K�v_���#5�c�7�P��2�J��|�=s�ّ޾Ԋ���;_Ro�{�"%y�����^g��F���~����/��g            x��}K�ܸ��Z�ڌ}cR�g������ �"@ ������Ɖ��K�f��ITU?��R���3]5�gz�H_f" ��vPM�B=���͛��f���,f�}����YΗ�7�R�{"�e$�0(���b��A9Cz���3�X(�s�_����ֱd��Fz-��h	��y�?��N�̉�����ljyp��>�޽�ywu=�Z�����ОB��	�����|s��დ��dc5���1G��9^��,/��5^�<(�Jӈq�w�z��BF�7q˔˛��XL�\�S����cp��1[�\�,�X��r`���Fb���2e�eJdL������lԖ)�7ˣٔ�c�l�4��u7����)<bܞ)�r�-�_ˍ��:�u�m��^(
��t;���
������*pF�����)�_���U���3�73�f<���!3�Lj-����Q�s�"�?[dqE*����Y�dV�<pK������_���k����Gd0�z ]41�f��Y#�/fd�h�mzX��1}�c|�z/ѹJ�z��V�b��X-΅����O��5y5�&Gh%�o���^_�>�l@��C�a�CDO�࿾Y,_%~����paw���E4��� 3i��x���1��� ���=Y[�n�7K�篒_c���b��|�j������@h����S��nB��5r��]�H��G��x������(��v ���m����>H����h
��e��[�3
l��6"�x��c��-�[�_�)�?����ogn��MĨdw�����8.*��-���[���x\�5�|&\��ߖ�G�P���?D�'K�y�ğ�����?�y�����<�a}>ѹ]z��w$*iI�B�<�E�^�7�3XE��3�g�8s�
��$����cy�.���f��D�wI��w��Ė����i,fAx�����o�Fy�W�ψeہ-�Oe���T�
�@C��BD��(z�&21��jI����P��H/�|���:e��;��SIA��X&���,P��={�����CԌ�6B^�,/o֛s�����jqu`V���h�1C��-)B���>�;y,�V����fЙ�C���LR����f}Q��V�΀��zu1���FHCK�zN�g��\l3�չ0����!V�"�]�PSa���f�X$�1�ڻ=�7.�D�[��S)Xa�vr�)	�":J�B��f5?��0��+A!m���B��fu49�C7��T���e��eє�ձH���P	���@,��%�h7�C$P�jP�0�,R�O����v�q������i�!/����ŷO�IVEC� b�Scخ�Cb�d4���`�4&�\�4:<���>������᾿��^N~��mM������!�4j�?##�Zf��z�M�jmn``)�F������1�$U�M·;�{�*L��0�������7˛%:�[��6�Ru�A�Th�ka"I$�{0�ZƠ�1�o��nȖ����G�"Uu�;P�"`������\�����4PI2�d��1���{�I?BKij�HL�J���^GQ��&9<�e5�i:H��`@������?!0��ޠg^�l��l��U��׫mP}�p���AI��:
�	��n����~��b�~��Lřu��`���|K���-�0$�*P��*�q	i25б4��U-�*����Ȅ�FDc�jr#��7��ͦ���PjAr�� �	fG�����W�C('�͝�ڬ�K��H>9d�-��jL�W�Ց	)��5 i #/�.ʌ�Q	�Iw����vZѸ'tyde�*���^aZ$�������Ȉ&]1�}���v�AB��}�w$Bu��S ^����B��:.!���(h������
����A�j� *��]�,V�5�Q	��Y��%�QK`�4�m�,��vp#pn20�����ʫ���:!:N	a�'�PeSB�&.�KȪ�`��&�V-F'�a!����g�%�	|�s0C�[��.�8�,�K({� �y���5T}��5��q	�dh��ܡ���b���>p:!��
��1��^��"�ͲL!a�jVμC���߈Ѻ��i������{��z����ݟU:�v��3޳�$��������=Wt����X^�`H��^/E�i���� ���ʬھ$��Y>V�����ɗ���fs��R�p1����L5�K��t�-W���ɳd��\�O&)�p�����l���%�^^ܬ�υ/5M�	zeQ��ð-7;��-�?y�|��l9������ �� JҴ|��<G^�#��
0�//^�
��p��jY�g~ʑϿP!�ly"�2)�ٟ���?'��Y'���?�é,��+��H��!��}b
���jN��r�FUQ�N]�-��K�,g��.��.�.�1�ޓ���(�g�����I�K`ZM!��f��kV.7����[\]���ʎ����L���^�z|�E~��O���J��L�@�{C:aR`����c�}�(�D%�h�����s^�ۙ�m������_��OY�1�$#O^V=ᠧ�\��"7�����}��&��$��G�v��<�#��B?	�ڴe�1B�(��.�M��4xYa�9>�`D^ظ|qFK�~���7� t��S�be0�ce���N���p��H��Ǆېԡ��`���A�p�BE��!p��ku�%��byFB���@�
\E��0�Q��1��ٍ�4��4->E��)1`	ǪCabn��qjucu�J���ٛC'�wpWg��v�NU�s߂T\��SҴ��>�	F_y�j��ׇ��SDi4�J�	Wh��[����z�(�L0��q54�Vc�<e�4Y�ar��������`}��Q/�x��&	"��x}�0�9-~ng~y��	2'���|ٱR�M����@����K���%j����X��rQ���}i��?B��fT��M�h���_(�׫��)�:��&h�G��G��x}"�����b<H=1hb���H��;�����rä +o���@�����,砵U���)�Ab��9���rM�q�R0�%�`}c�p�)&�3�P�� M�B5v�Q�o��Y@���zr{�g�NYu��d`+���W�ywqN�����P	&�y���Q�S�c'���hkЃ�@�,�SV]3��9z�1G�:2>��c��,	r0
�DyiX&�^/�H4��h���$߫���K�X��t�e���8���[�����4%�AK�� ����P���h(� Mf��b���^ޯ�?��\)�];��N��P��PǦJPQ̔�v����Y�3M?V�����v�)��P��P;8Ș"t�0A�a?R�r�m����OMgA���Q�ӫ|Z�
�2jI)ب���Ь݉m�e"=��0�f���sR���R�q�P94�#o�ʃ��N\��o,P�N�M��Q��ǻ��\ub�Ƽ�P��6�wS�f}�X?��'�Nz1��\]]]��x���&�
C >�ݜ�˧V�a���Jj� ����1d�r�����0�UM:� J���#�oʫ��>�)z��n�ELF�$�!jf
S�o֏W̜(S^����9�����`))������|e1�~�։�=��C�ܭ7?���DӨ����(z���sy3?���t�3T����l�\�|�� 	:	��d)&P�1o��,�/}!y���/��G z��%G]ܧ3��o<�Gd,sx���z4�Љ@�����|�T#�$�6'�0� �/���>�G��a�n��m��%˞$���i%1��t�0�6j�"���ȧ�y��2���7��;ń�Dp�̓@�[Ey��R�u���S�m�֚L�d�[z�G?�p���S�x��G�l�G�\^ۗz~ۡ}!��Os˘�B[5hg11�mY.�g��4���c�U��]�]ԛ]E���0n�~�o����>�So���:������T�}���oT�`�<�#ï���;��;a|ݟ�:{�ݷčX�j���    �ؖ���+�@.�՘[�	���5\��v>��9�T9�ڑ���Ix6���|)jC�P����%��]�� ¨.� M35o.J��|����
�^o��ׯ�-{��
#�Q���p&WJQ.J��ct����>�"�5&��9�P���</G���W��Ŧ�5(���Cki��\;B/���]��5���U�S���ruW=��x��E��(� ��v��RS-J]���^��2�vqq�����&c��|�?1.�k�A����P�$�s�FM�6���'���@rjA��>q�>�TM��(-�s���]��T=|G���j�M#��]}���Lt�ʱ?Q4���b�t<���]X��51��ckޢk��RK�&$��	\R���oe��m���_���_RxP'�����ZC�}�ٯ�;�����+l݀���#8L7���t^-�߾�s�с��Ҫ�O�mJy�2Yz�-Bjr)�5

���ԑ�l�/+f$�1�
���������P���\{huMa �vouWk��J��@75])㉨��i�wU��`~S=����8���!����-dң��}S�V�&m�����=�W}$�뎕wX3����O���!���x�[ T�����l�w��b!]]N�!b�k3TU]ʳ^�mw�:P��r����@��]�Ϡ?�8ry����c��ig@Lz�Dy8��h���3��ȯ��^�}�[0�����k�����@}��c�����t�F��loT�[f����̆(&�/�{Y�������T�=��f��a ���my���E�XPq�0�N-�gu=��h_����y}��f�=��Y�bV���'��Cs���-I%���h#s��0��9P�;���S���Rh(��;���{NPd�����I���]/��D6�:A=uDo�S[�r��f��Ȥ���hp�7��jo�/v,�)K>c�t���)�=����nm~�$��˭�{P�g ��I�*�̡Ed��0��/us�"ks	�Z�2k.3_�{PM�	�l��CSg�2�X�=��
��E�j!1��GTF�
�w��v뜲��XuP��@���-����Eq�X�������<�u�`�+
�X��YNw�V����Ў��myi���hz�	�,����)�~P&>�=�6��±՗�CY�-3ߛ��9�L����ɴ�$���p<��E&�@26AG�l�s�NHd��i�������Ŝ_��Z8A����@���9�iڸu0s9!��J4�ܡ;����e�儕ӛ~�%b�*%�C���a����Ni���ee=�n���:�{������
x�s9���~���4��x|�	�L�P��;ZU�0�=��̺��0���:a����k}�w��Ȉ��PG��uٹ[�x��o,�	̄r�����V�a��'�� ���xӜ��m�Я�3���"	J-��l��_}FV�_��B5����ѳ��9�,����]]���	���q�`d����k����3�	4������ݰGw�w��SΘ.��A�f܃:�\kB!�=3�g����E'OPd��LI�As���y�	�le�C��Qbh����,��gf^��bc�l!6�!�+W
�s��'e��!�A �ݡ{�]���Ɩ�tǁ�d�Cs����W@&1�5�|A?a�XG�W���u8'����-T�Z�����١[=�_��~��>�����[*���,գ;�����׋N��d�����ar�}+;B�VC�Nm� ۞n|b�Ɓ���W=X"��dl5L�(A�@SVj[-�'��O}�1cn$�z4ρ:!c"\Ҡ���;;�Gw��%S^�u/aBbρ:!�MU��Ke�u���n���?�*� �]D�ٽ��b̀��%Rv��P��н~�Y�i�]l�n$
�M�D�����^C�" �cڣ;a_��6j$���v��
����4�����zb�uJz8�b��� F����!�1��h"e����,��Nx�ǈF�j;�<(��v��e���f��tc��u柩�v^\�t�XY&PH�B=���-��a��<aU�&kS*1��`�y"3���F�yj������[[iȊ{�dS����ѝ�(����G���>�D6�n^;
������e��
�&\p�hGA���a�5AIH-��ꀡ��=�^(�뱂��䓡�~wH@u�%���nJ��r�ߢ�8i��n�>A#��Y�=��Y3����-�f�����,�{�"#�� �v�+�!�t�|Y��	d$�z�-i�C��E֫��$�3�1�����!ȏ�+ӥM[jEx�ɭٜp�1
e���r
��݂:����!Y`��v�ؐ���H�Y�b<���A�� r��V�ܠ���a��}p���'�F`Q�����݃:�7�VM&�p�j��+s;���Y�5��oX�d� ���Ad���Q��� Nۍ�Ӯ9����:i!�AC�mm��g�D�~PM�;](�yu5L7�Z���}��AŞ� *ӂ�u�.l {P琎5NT ۔��^��ܡ[��|�WPO)�M`�?}P��2i k�b���	/�� ����Z_b��݃:�ـn��c(��+θPN"�l��ʰ^���
4d�੏��6�P��!���Q�:֦�8����+G��ВZ���`�8�� �[TWg 4RJ��*{�R�@^�[]߼Cwyz2�b��8�������{P��@���궜�0�H7
���-���銬�R� J3̙u��F�@ݞ�s�"sՔA�y:�y7���н~�Ma�@����9bjjq"�ˁ�#	�hu9@����^�՜].OOd4�x�$X=����߃ZuB"ˆ�U��,��1b�nsu�"SMm`���l;�Ɉl����@d��=��b
CQ!���l��銬�����$((��e�A�qJ"��,�
c���Dڣ;���_d|�5K-#�!���I������,h�"AOo���ۭV���w�vG��TD��>�{S� my���^M�<<v���z��r��LD������-�M#S>p�%|��Yl|��`����4���������C�u*M/>�Z/m�۹�|�#��Յ���}z�u��yw{3~
��\�SH���R9o��)��N9�ٺ�B�)���!~t��Oe�\9Po���7���u{v��ݘbϷG��vApZ�Ǘ)B�n�e�����3�?r����%e��娒�ac�/�ڟ�����m�e��@,�x�_o�	�6Q��P�IE	����}V	�q:�NU�����W|FkG> QS�|��u�֖�3r����w�}5j[����r�tdT�4�ߔ�J�@�c���Xf�Z[�E�ӏrPS,Z�+�f��\��ݞ�\���;^�|�"('|n aRVn�p�ȝ�z~��,�(*>i�͈7��`���i�P?��޾��F�D]�OVN�u]���!ar8��LL��u�|(�k�4��-j�ƚ��/��6��R�����R�����Zx䘰��@��N��Qr^��M��WZOY�r����,�?�(���$>�yȱ�����K�Gʃ��Ń���?�mյ���_�ח��]٠�����OG���~8PmP��cjeA��0���~�����룂�Sv�u�O<���'m�X
�E3L0}��
�{��O��nA�� JGmٳle�qS^HΗw��ӄ���)Թ��%�ęw�7>�����΀����M�#�R�l~����¯�/΂��P�ؼt��1\�i6��*�ه�m���o�V|b���PU��7V���r���|d�>�T��Ol�zq�^^_�>�M�������j���J�5^�^o>�W���j3�\|j���@�JD���@�t�:�J�M�Z��d#-n�!S�Y�#8�O��{O[�'8�eږ���a5?���mvy���Z|j�s�W]'Ћ4��z$F/ۭ����p�n���^��4PwĂ��>�����Ց�EM��l*�0��|��zA��f�{�^��;0 ,  WO[�#�9̯`yt���ٗ��x(SK�X���`]�m��n���`�WUр�V �OL�7X� �܎�?�uE+Pc�/7X/��^o��:�Rk�T�}I��rQ��G����gn��z��| �M*2�3�J~��*}d�^�M:J��$�����A�t}���z�&���sF*���Li��rԴj+	�Szk�.���}7S_l��h9d*<،j���7S���g�~B{������"���r5�0�������S�W���
�{{�[�����6��!���,MV)��]ъ
ڔ�=�գ%x�@�u9��)B
i��������i*�sE��Ԃ�i�
by}3�
����o�Q� 32��{ZȬ6w���BFHj@&J���P��-��'\ַ0M�_P�D�,�-�˻������ȓS�4�ze�R�F�ݹ��+6����鯂�Fݣh:��Cm�ۚ44�ؾ�A�\��r��=����s�o!k��q����Lޠ��4�oA�'D�'H�(���B���[ЫhW����!'���B���-�����۷�J0$�         �   x�}��q�0E�q4�T��,[`��ݼ�z%�X��&3LvwFs�ѭ��^�Y���ǈTCA3;[!�<XZ�~/L=����sIXxǬ��9�	\�x��\�s���JH|�E�ɮ���2[�uuHg�m��Q�)h�4
H����g�����d6+������x�Ϥ�_�wc�$kX]7g��h@����L��K���Q������ h�>>C�.(������j+�z      &   P  x�mQ�n�0����TAh�@ڮڱ+1��X2$;թ��+-[B
k���x�H핤أ���
#����3��ҺsN�z���\O��_���H4�4���;�j@��M��8f��u�.ۋ�yJ�\.<+UX��ιM)뵏� ���f�7[~T��� KT(�:�����4�&�Z��<��#�ɓ�1�L���,o����(��@�Z'�8 ? B��ɨ�;Y#�b0�!���_�b�^���&���,�+3���AǬ���}�CeW��1�!R�[�
Wˮ��>/bV���Zn�����(Y�π�x����z�ge\�O�Y�I�C#��B�?�l=         g   x����0�s<Ep'�%����$Mk1�����j(a�3yں[��ٮ����Ja��=�-����l�;��W�+E�S埧��zL��D�_(�      !   }  x����q�0Eך(H�]��3��6��!�>&����,<��.6�I��{tu��@��f%5XT3�6&���A�I��q�Z��Wݙ��-2���ꚟ��b0���#�קeA]F�v�@7'�&�� �)�H���:A��dz�_�=5�1����R�evHy��c�F�c��8x7�����6b���7#�sV�U^]��C�u ����p��� �FD?w;���e��i}��Rf��\��nk�Rr �G�uvɈ��&E=#K��H����N85-0M>@3��C�GK�:c�ſ�8�����?�deZ���q�]G-�en_Co�8sؓ�6�E�=V�khPߥ%yD�{v.�0�{�EVU�!����t����            x���I�9�%�?��"��$#"�>Ko`�� 1�0��u�Z��%u��X?��)�9����$0@��PE㭐=�'�+Gy��/�:���n�������|r��_����y�q9�N�UO�^��c����������W+����K�����\�d��E�?~DT^���B����p�/�b!������l���_d33�-1��|����ϧ����]�x����/g^��4����t��d{'������}����/?�b�NZy��D�aY�O�_˱����
�}�El�v���S�Q����׿��T.��e��(���R~^��_>��s=�`��͎�h�/n5b�k}2�T��䶐�j�|�����}*S����c�/]�L5�}[��*�����+�+c��ޞU����#�H�i�vZ����P /��� ��2��[�Y�h��d�E�]܋����ϟ}Z��S={�u� .߾� +�N�sO���W���4M�en�˯+彖g}�IIEK̦wG[\Rb�~������bQ�ϯ[�b�����E����FX�6����r{�������2���V��ʿ��ߞt�j�$%�9����OLD�Ŋ�sb�h2��'ڥ�����}q+�yo�2�*��3d�;1��2ӏ�*Ѩ���>�^����$�f�i;=t_�D)�~6*�C%�}���oj��S����)1	OƊMw�8���ݣ��JMqo�۴ob�2��m]dxtч���T�w�ߺ_�߭�?_~j�i�1��n�d��:��OeՖ��3�+U��V�����Yh;�Jqu��ć*��C尥�?ua-��$,��_��q��؇-&/Tl��e�����U���Ny����ˋ�a����1������ED	D������Z��LP�\S;[z� ����G~���|Ү*�cs�u7_�oO��.kʗ2��ɾ]������(��H���Y�^Q[��2
��co�2�_$k_�b�]�>�+^pQ$,p���;��H+!۔� �K~;�ԉMD��C��T��&_�[��o��F��_}���8Xwn~z�.����Nd����h�l����B^U귩�W�<�Ktx��ϔ�b^��Q��/?�Qw �`��'�\��%��]����h���i�D�����>}��_��j���_?j�~��'��C����>E��.�dչ�_��8bb���L��ı!�@?���/,�k5��$��O���e���7��_���_�}�tfs�O#NEM�.;�,����Z(Eׁ�D��^l5�^�t��t�N̅���ݫ'����*l�О̆�?v��p���+��>d�5��uf�:ɟ��G�0�^�Η��/Z+�K?��Ϯ7���D�u��妦6�HԷp��
�픢���i�<�1�Vė ��h�э9}������I��F�J��;/�Hڷi��1*��VX�}|���͒��,I�)�~P-��[��������>�u��?�Y�����>m�[ʬi�6(�����NDK}	�r�����~�\��I�`�Sz�k;�@9�DR�J]���������;�!�3�_sa�/�t%\����"�(�
�_�W��r��s |��~Qɂ�wv�dL�_�ͯO{�-\1� ~���'�s"��
���qv���t�U�ٝ ~A{���M}��m_N:���	yk�q��ù	L���Y�DT�@�-tXW����K���CGd6|U���7�hd6��~�!��?�_}Ca�p��C���HCL���x�h��;�L�5jd~T���Q�W�������\Y(˓�\�Z��v~V@]�]����%�Z��<��U;��%\tۙ#!�e_p��'��"&N�.pK'�|�DR���u�
������s�_��k`a��-Yk�*����PY�m'���"�U̫�� �'��}Y@�6�����qR��k{u�lR�8�����˨A������I"��T�ԏ#����DZơNMށ,�ʄ�&�����	;��#@1�Ŗ��j�Mz:ExE�A�D�������JtqSn��ǂ嵕$��V�� �'����V2�P�a�\�J��{[�e9���",�M��xI�m���O����5SG���9Qu,<cL�vN��u�>? ����Z)4�6��z�n�ڌe'{q��Ը6 �����BL����i�Ȝ�����<��W�£���|���~D�=Ö�hm��g����i�& +_W
��Y
�N���Ӛ�L,��m=�W�7�r��~,�� '��<W���&5�]ı�=�)oa����~�%
|_�w�7h����A������9��J�p}��=��k|`x�6|'�/qG�.pΧ�tH���*�2�J��(�y���Ui�v'�x|���MW�J���K�2�;�[߯��+��
0�t�~���B�nL�[m���t��
�V���F6p~���� �`O�
���8V�:�cfqa[^}�k�~uw�l����\s�X��Iv �L V��G�ޫ�h��km�?�4
%o�I�	d;�;+�`��2j�sX�л��r�M�N�~���#vNܥw�۟y�@z� 5���h^>��<�f	� O�<�r}�Fb��D<��f'Qב�]m�B�����Ѻ���#��v8ô�B�8��z��/�6���8���I��a�;<2���c�_�7���l|b�k
��)3l����d���(/E-��t`}2��\�u�HR��/���~/�!d�mI�ƥ�̦����~���i�:���4�W�����<�$�d%k��H�:�P��Ô"K���7�~,��:g�e#m'��#E�m9>?�ݝ�ݭI=(�r���h�a=@�[�e]��D�tC'�R��f��-�b��?��"���m+w���M�D��Y���=�%I��(⽚�_?J��\%��#���������J�wޫ�{{� w@Mρ�~���5o �ʭ����������1wZ6�]_�Yl�wA[�C˺+:�?\ %}a�8P���6�}?!�\��YQ���v��Eҗ���N-T�Q�7����������eN0B-�5T2�_���ό�Z� �0+�C5�~�ij|\P[ r9�}�c���xk�Cg+�K/��a������Ц��n�l��V�ƒ��u;���o�mz�`P�`p�ˑ cD�.���{�����)���h�6�J>�z��Ö9�B�����Ҭ��`2�`�~Y���ݣ!��?��GSܔt瞢���m}���2H�=N�ݑ,���]�$"-$i���y���-�3c$��-.�n�c����(�խ��W:c+�k� ��#�Ѧ�ۺ Ȝ����>#��H����x[��
-Sߌ��WI[�tQ~LjȬ����(�[m�T�ișzб�J%�=�%����z�C��� ��6����μV���vo���}���Wb���[�QW����OP�~1Pĳ�ɶ���4C�������د�G��I���^�?�i�p|�D�@ �����J� xoh��jh����a�6k*R  e?��=����{8�ڏk���B���雥��45�%d ��.��qy����mZX�#��ܵ,Ӡ�}����=�}`N�e;9���hͧ����X1�ס�q�������9�*"�,Lsx��I=���U�/��e��7A��~�]��Xj�>��IぷJ���Ƴ"ݒ�N��]��<hё�N�����ϖ��!$��<�@�OhF���k��F�Ǻ���f�*h�栴Nl�DϽ��e�dҕ��W��q�K%����k��.��>�?�GWv���Ii�`y7�� �o�2Y�8!�z��PKⰮjظQ	
mfC��d�a�zs���1~`q"ȡ��攜���4xP��K�A�$�e��If���-Xl1�|�7Ҡ� ��VaIB����υ�-X�5xJ_��y{9NY������$�|#��C̾fG�z2��mwk*i��BkQ��F`llõ��"��a��ҥ����{#m�|U��    �n6�R�i��
;��6@+Uw�'f˗��MQq��g{8j�M�F>��+s�{��VkW,+X�������e �ȅ��|�F`��?	\��#��	�5��ӳ
�q�?�=���l'�����?�I#����"�u߳�\�mKb~�m.����Y�����e��#G�0�&�F�*�s{��V���a-�
��c�3*##B���P6��F��ӻ�K�$�d�B�����\`���p)�9�k�^MQE����U��+�U�e��<.V��5Qhp�[�X�-D�U���zΣ���Av�R<�}�|.����_��Tc�+1;A�W}h��lլ��ﲑBp�fI�L�n.�-�i�H�fK[�Ki���mEX����۪���B�.2���~k�s����`��q(_���:5X�Z�/֑���
��UDw��G��� ����_���
`���𮚬	q������{ޜ��I��F�%;�%��"X$2�Dh������\84�B�-&�VW�m��d���ȹ$4�k�!sa����{�U�:�H��I1	ʱ;@+����$�Vݨ���JU�[42u��V��`���.lL]�[XڦA��Vf ��)"�P�N �ŷ�}��zd��3<���\"�h����9y,��f��m'���M�W���$r=�T]�~�i�y[��P�ߞJ��b�q�V�[��MD�N�g�t���V��w��\e��s��Q���=�A�;Ϥͺ+���)��O�{Z�����R��9%v-��4�`���v��j�IoK���q�s������Ш�ew�ǿ�K�ba��I��)���b���Vp�
4(k���T�UrG)3F��o�7�~�����9�v,��hm���c���Sm�EG��#�L`Mv���w�uiS�	�{��>-,*�S,9ͰVf�N���s��d>��3�V1��\�������뇥)=��U��P�<��-QXG\��}���#���˨%4�#G��l��*��`�`���v��ё��Y��BI���
�٧�'�9./�02�.�A�n�e=��b��&�����/:�5
�"�X�3 ټ��ύ��Z�E�:������x��^�E�%�����>?�Q�d%��5��r�sdS.R
��~d�6�j핂 2�iwV�'G���jm���e�=�e1�����t�H�G��e��� ��sUH��h��X]څ���O�@����U2�}���<�2��<�A�6�K�/������]8]Z����bV����A[�=�� �G#�l��aYsz{p�����ciiY����/��==Jt�pZ�6|��������MG�v���ɀ͹�鈃���;��0(LiS��(���Vo1@A�Qaa� �4�����q�r@��+�X��4�9���4�� بT\yt��e���n���e$�vr�d��܀CG�,�Ƀ�O?��.�2j��ܗ#��ݭ�׭�Ls�'^Z��m�|�큍�d�|��޵�xDM&��A��	��Y����M�JS�*Qe�:*S�_83b�,��¾���L�Ү�L��F�A������8M���
��e�f7������o?�����V����O�mgˡ���#~������</Ԕ 4��];#U�Z6F�wKt������M��7����;R���}(�������5�EU_�ɣ}�L�s���#0��-���5�P�m�&-T:�nA'�.°�(Iw�:|,�l;��
4,W�5˰hf�?��G	Dj����Q��ڃ�m�J�.y����/�>������	�sD
�٧�ЏD��q:���k����߼�kur��7P(s}������i=s�(\��-=�XZ�2\��F���G��5Y{�r�:�L�8����g�����t��G�_ț�K#b���#�R��o�DV?VA�A7l\5��Y 7a�{�ڱZ��Jl�Y����>$��@��_���>���r���e�o3sE���(����.nӷ�-`]��A�MF<g�C����w�!�G؜�;��[Q�Jͽ	@��2�c�cBc>����'��r+���#�f�RG��A�i����K��	H+�ّ�7����i�pe��� ��V7u���8Y���%zl1������v2�m�V��Q�\�� �V��ֹ�"�⻣���&l�����F.!����(P�<`4�t�Q�Ʀ9�}b��&������Z͓o����W�lsM��D�^@z� 2Q��#d��OB��X9�rՓ�u���`Z���Q���ߞ������W�^������M�M��K�@�Z�;̳�!�w��Up�Mn��v.Q���k�S�� a��ӊ3Yݨ�m�kt�����hR�_x��k�z�3�
lU$P���eW��L�_�&,j_<Y/�mƟR��k��2tY���0�֜v��}������4��ˈ��ů��׼����"/8������>��ͅ)�=!e�@f((�g�[�@�F�"QZ��.j4@��#��Il�]��Q��\�X���s�jM��`�3����ֺ7�D��{�;��gܷiy���9޹�E�N�n�6D�PS�K������ؠ������Q�8>��Hn_[���d�M��0�ȏBצ��Pj"�9�g�@0/���xR!�W�S<�ajV']�mo5øe��?5�����q
N#1��~{��t��|AP8γܱ���c4��؏h�5�%��ͥ�,>J�>������9�q��h���p_�`���X[�W��qCr=�q���o{���AU��u���6{35��:�d�E��ǩp��� �F<�l��S�r�{��7J���v��Y�V�F����R�X��3P�Zߩ�\`�Ta�W2���Q� p.͜��l\1
��dJsw�k&���FP�#�����Q���� �����:mT�P�W�Np���FM!b0w�������G����r`�+%J��|E,P�1:��S�0c^�����.��[���Z��)��
���D��XHwL/���p~��cQ�¡��=���0����ܯ�-뼧s�]lӼ�\��t�\�m�V�{���Un��Q�OW��m���J�K�Lu��[�K\b �s1n��yu.M|yѨ��\�O}ǉ|t���Ǚ݅g�R���c�_��ڦ����oX�o���4���B�x���[w��zn��[�*��O��>|��ew3���,�?����d�7xЄ�H|t��ulaut��u�m�>�ӎfD�*X������sgJ�J9s�=�`�%{�q�F㉨���� ���A�%��x��q��E,׷�'���A��7nq�a�g'�|�*��NE˨r����-	K��/��_�ӾuNtb�X� ����Wo����0�	��+h-�����έ[��-���i9ٟs�mT���q�4�Nmh"*�;�2Y���n�	���Q� Olz\�����F��i��5��(-�\{M�?��G���{Tr�%y��wwN����D9W�������gl��-��[�����H�T��u��ځIVQ�/�}#���}Sd<޷� �����
�
�x�t�L�#Y��́)r���jAôݹ��y�i���柣��k��n��������D����:V�ȅ�q�F��&�A]�/��d˻�1Z���Fs�H��4}.��u�ӯ��9�����(�S����w���g�ft�Q��̹��>��6rS�h񦱦E�i�K�F��;l����_���'�R��5
�b���, ��tJu�!5�����gS��������e��*���UA��s#!T|{��{8�(7��r���g�v���Oz�����ͭ�m�K�"�#��>6/�y�gk��|s���1�\Zt��uyڴ���&-+�r2j�t^��)����i�bCx�w�����,�OJ��hc���aj��/�7�Qd�Hţ<7�,�V^���_ kK��gM$�x�����D�υO��Ԡ3܌�4;Ai&=�Ѽ����pp�X}�~�>�����"�~@e�t�)�    L�_�R<m#l���V�}��M[��8�����h��.���4�� �r�Eo��G} i���\�+՚H�.n�&���p�,{In���Ő]�EM��3�)�|(�k�׵��'
���V����6�X�֠=>�?��%��Q�QY� 8[���������L˘ �8]��~�XZ6���nȟ�}$�vJ�K>��ᆀ��z�U�Hc��T��G���}~���c��A��߮��_ۅM`'([�cj�SaUk��[�˸!Թ<Km��u��6R���4��Cdf%��N���6oz����o�B���pFj�	�ml�S6���h�S� ��_�6 lҏ����{�>�n�TGW^�A^�K�9B���r=y�,8r$Hf-�v����9�A�N<��z�HI��DKn�E-�H���ӎt.�g'AL�m��})j��r�[�zWl�Eu���-0;M��\�Y��Iб+8){�b�J��"�2����s,9��W%Z�h��X+뜅}(T��sڜV���˼c�V��"K'u�
�h�>�s[�R�)����m�g'?������Ynm>�I��w���2�Z/:k(/w���^dx4PŻ�Ƈ�~{��R��/y<ȴъ�<{J#�H2��*"-[��bůOB��N��SX���}Ȝ�����6�!��X�Y<Y}��M�p��N~,�_ �+l��Lw�f�m1�D�&9�~v؂�k9ܜ��N�)�㹽�S-Bð��7!-.�[��@ڛ�����u�����,���I�"zpq�T��9�s�#౦�Q�]�Y�x"�IY��i;��Z�s�&�oK��g����GI�W��~a���a���2���aw+��;O��d9��o_�z}ˋ��:è����K�/��:?��{bS㲶����J/�?'J�n�ru��R���,������rr�������Ʊ���DL@�,�4�2u�-يq(:�!����L-k���;"y��u�o�̟����\�#��>���Z�$��V�xBR�@�F��r�+"�;*V�Ly��|(m��ߞxY���z��f�9K�O�*���@�W��2u�{@(�/P�r����#���]�[�z��q��j\G�'t"�*��̥�+���F�T��|9��}8>oܝ����DZဂ녨���؃W�\�/�o�숯Vg
 N襁�pT�� �lN���sa��8l���v��r���7�8�a�ӗ�f��7%�\��1���Mtެ��vV�q��)�q��Eu�M\$֬/l �Zo��� 6���ao�q�>���w�,f�9���T_�L�Ny��ma������5��꫹�
3�� 3Z}s�	�8��Z�=��S7�/�>�D�4|���U�Hjl�ba0ET;i[��q}B�/�<����wY�0U��yz'�q!<]@)��H���Ɛ�������H�6�5�����^ȩ+�LrJ����*����S������l� �q��	�i_q\��Ƴ�2,oS���.�?�}�P
����&�N�U�,`� .�Ѱf���y����E}�:�� �~�z��$/������>������T��.6.�+}��#��i�ʓ�lT���i��D�A�飾���=SL2e����儒ּ��K�6.����;����֨�U�=��He�)���T�����e���L���|ͮN��[���=�fa5K�d
�Ɋ�������ڛ��Fߥ���/�/�n� 3�$a�s���V��Q�A������]ԞH�K���*[�=��sW)X<�ˍV�i���^��q��3� 6��ˉ$��Lz��5mmez^��~Vد�:�M��Tr��(��o���vN�~"J��lGS���/�(��Vy�͖�Qފ��
��7�\���VN�vK�6� ��]Nb"-�R�S��HC��M��(n��Y#�9Svv��X��P��E0����N��C)Ƶ�󂬫����K�r��������Ȑ�(D<�<���Ѻ~{�v;�N&y5��_���f$t.L�T�⼅ۯ
(.NK%�'(,�9\�>��~I�x�1�Ԗ��o��&ҔX�S�жK��K�7�:-ܔ�pc&��*X��G����e��) ��9����Ԡ�Ps�o��:�dϭ�V�����i�k�|=�1e<����(�*����7l;Be-&����a�Sg�/���,�	���ʙ�=iq�{,j�>Ϝ�D����~9�m�{�/U��'�y<�{]�YTw$R�)�e ���Ie�ZƓ|:��qk��~��O� ,����,ς@!��[u��'���my"N���q�@�+����N�����:�?���Uͤ����� �Z,`�9qJ���Ev��צ���#~�����a����c�+We���z�������(�B��u����F���N�q궄ɕ�����s�݅{>�y_(��s��DRT΍�#�;<0��A��K�Ȗkp*�W2��o����)���To����+��*���/����k��ߞ��h�
1�j���_�:V�ϔ����s����H�	�h40Sldr�:�&��:�#<�U<	���?&5��
���;���P_wX��җˈ�2r�}K~��>}��h���j��/�߶O�r�w����{�F�u�^�!4�GB,��+�{��]����UŖ�������N��q�}�9�P!����/cԶQ�X:��D1^���[��_�jE�Y^|�i��~y�m�]a'���tnm�o��l�w����_{"ĕ�}͑�b������w�MU �ɯ{#S��l@��]���->G����N��௨�?+�����u�R�ϟM����0U=ـ����4��t�
�ZP�`a9�;y^�q⻮� ��}�4��I�xW3ă!i�<�w'��G%N�y�ԭ�I��u�Ek�|���ehP�E2�9˜�x����ٝ�6�L�Un�98���W'�F/��h4�,@Hns+��H�}^����0n�\}���,-G8g����F�i�����'���d���[Z���>�L'�o�2=��f3އ9�}�~�v���h�{ /����&+�����w!�>ϡ�ɓ�t��~!t톔�Ӿ�v&�q2r��a��'�o��f[�����=�r�/o���B��im�O��~��$��~�]��i��K �6�R7�����W��� =�;�h���|��J9����pf����2��������	���eנ��_��h��}0��d�m���T~�4��$���ҋְ���!�W)^e'�D۸����Ԓ���͆�4�@NFu��f���QQGC�����g��K{D�}�����j�;�&*O��1.G��	tU���6���Z��3��E�u\2$�=� ��<%�E�K��;�u�?'q'oL�Z|'}���m�T��ECo�����|�����M�F��|=X�����:�u��ȶ؇�n��|�Tm4W�-��L�~;���c�s��cMI:�#��i�g+X�Q2����ѓ�����Q�x<(8m��&g�H���P���T�����&�CT�:���x�mm���]�ZR�E���.S/�� �A�~<ˊ�5�� 3��1��*�v��~����8�)�M������Pi�)%����(Y�$��yͫxAخ�>�=z�������jX6��0ZM���z	u�0��0��~i�v���}z���7@}C�"�Q]�����*�X]�̞�T�x��v�+#�4�M_[|��O���ì����&������0��~w��q\��nv]��b�UÛ�#�<�Ao"�� 6��O�����ws'ra#	����Gd#���p'/�џ|m�{L2D��R�G
(�9i�N:l |��n�����1�e�275�?x��X�L��V5�z]����VG�H^�ѡ�0q~�D���%���;[,"@]�D1�ec�ӵ"T�|<��o��˹uu�`���~|r\�g���{!xr����r�1Y'ه�-T�X1���   ��(��͎v�q���a�2�ō��=����aZ�h�/�I>~��Eǩ褩$���%Ov��hm[��VD0f�SK��F���1�A����m����:�(�Anz0�צ=w!�Fd�YsC`��K����G���wʍ����m<_d��WЕ�}'�ّO>�o@��[T#2��ĹT;���}�6�����^�b�e� ��O����f��W�_���f.�J�V��\�O��d"X��zPLP ���Qe^�m#}9�|,=\߮]<����\
�%��8�+1i��b��]�F{�㹥�FW�m�U��A�QȚ.���P�G�spj��x�h4
�Ȣ���L���b�aH�j�9��f�=_z@!�(�7�_��j�o르���9ב�(M[�l���$��l�%�U=m~Ь��Ct.
�'WJ�
�&�[��q�C48)-�8yn�
�g���D�=AC��{���'=����anGH�8E�Bx>%p�>�T������F��9�G�]Ls�b�"�FkZ�c!�
�*W�#��+��<�vW�/˗���
�N���$�:
��w��>�����mT�r��C��7���>��W�j_IՔ���f��J��N��A�.�����e�R�7m��cUp-A�p�O��G���'��,y%�-�����G'�z"x��:�k� � صq� q<X�}yO�u#�]@HDv]ޗ5<�l�)�-t88�`�JN�DUIh �Qd,���ɳS�sQ`����j@�[ y#�.|h���e�Uu3K3����
�KKw�?D0E��	��ǻ1�L��͂;��p�Ŷ`=�mq������F3j��������0D7���t�r�o�w'ӎG����)'h�i����e�lK���;�bL����z :����?,oa�#��}4�����f,f��^��YXeI��04p�,I+�δ�D�[��#0���j�M��F^=OG.ᗺ�W2����xz�wM,�����Z-ˣ�f%���6{v#Ұ�I�ѩ�� ����o��)ao3��7�N�x}�cX�h�w����xl`$m�d�\�n��݉�5>S7�`@��k��w��h�W �#�D���W�6.^�
��E���m����ō�� hW��
w2۱ŧsd����扈;�j�ql�p�t���U����2UoO*��^qM��c'���S�Ѷ���;��ͣ��x\f{=�3���*��$iێ�Pz\���_߈Yt%[*�]�Y���it���#"�f����;qWHM]��?BIY�^�Mӎ���0T �sd|�{��B���(:�Iyz��N\��`E���]�u�n�!h��P�mb#�����������b�qz��iV����?1_���/�������o��$���{;F��}njw��J��t0�K~������}w�f�J���f�0�6Xz9f���c��P8<�����;q�J��V,Ym]a���y��~����5��pY�ֳ���5Ӌ�7��f7�(6�-��Z��ӫp@;���&J���U�nA��Gb��+�L��t�2G�HG)|�ӝ<q~�q	�wؑVr��Ky�׍+�|i��}T[�[��g %��J������]��61N�[�v�r.�r�B*�G�e���BJi��W̅ӕ�t'�-����e�e��t�ǆ���ڌ:��~w;<{i+��@Iw;��~TX��[,���sa��q.��֎
�C�����Vb��h�G��빓�D�O�+��ydZ�/��:��d�-�B`�j3�ḰE�g�2E��?�/U���yg���,eD��Kh�-������q����ؕ�ZĮ�W��ͯ[��k%Э�@���r�n
�:�J�K����l�#};�V`r+�����;�1|�[E
z�Щa�׈���GiM?/�|��g:��D�����ƻ��nD�
otZXJY�B���.����q�MZ!�?�;����2e?��u�ޝ@0��#6Z�q�-�gz���,k�v�V
���{�2Xo�}t���>Q~'3(�I�}&�P��1��qlܪᬍ����Gy��DG��R�}����T�N���p����l mgU�fԸ��w�@K���f�|Qk��R1���ܝ̬|"�^��8�ݩ�K�l(dvV(f���}�M���F{;���
w��
��8T�����_z�=ZA6z~���串{���~���5��C.��<���� ը�Ij������Xn�q����RGZ��Ӏ���C��}1��x�%0m�e�I��	�
��'�7s��˼o���
�=�,��v�D/-�W��A_�����..��.2��</�(�eF�Z4UV_��a�LY������i��aU�rq�}�c������h��)�b7ʥ=I��w���,��B�V�G���>wy�u4%̓��%W���G����'��y^�Do���1�+�1qR��9�`�c"�ONI,0��� ��Gp!�+��=�9h��W�:!������X����|��H�^��}��~�gq����2uf��&�\\�QBe"p��"�Tx<jw'ԛ�K�RI�T�љ�ϯ�G��Y�%�*�w�k~~�����*xq�ً��yaW����#��oT�p�7���7a�������b�??_w����'� �s ��y)���AÍ�.v�=@Z*ۏ=Z���#�]0^�	����Z�������Z���ZJ!Q�:=��J�txohF�r���X�=9i�&,���ZBMM�Lak�"ӷ7����)j1n'�
���u��ϑ<�����J@+�����mۖ]��uT=���R����P��,�Q��,Pɏ���<�������M���+T*�{ޜ׷�_�n0�x0�	����3ܮc�v4�>����~x�-n_��+%�����l�%5<w�2`�巷�^n�6���e��������Y��8�i�Gy�fUǣ� �H�5�W�Olw`J��L�Z�=�+n���¾5�xS3���#��x���6�������$�C��|R돌��>8SD}ϳw�m�1-�@����mt;���1n�t�/_޼�����b�����d��|��Z�e�;�J�����!�&>��Hwr�����+��H
-8,A�U��#N6!��_��!R�;kgN��,_VI8|x���l\&��;yg7-[՛���/�A�}���>�W� ��EB��M�w��<xZm}�F�u���:
?��7?޾���o}�@�jb��0��S�S�㩇��vj��l?�}T,Te`sqJB�K�C�����6��p[k^�[���F��Yep��uD�GВ���Tz�t����F1�8�н�rBs�b�^8HM[�LP�y�o.mY����4�=��Ln��q�FY*�#����U�A���Hj��Ϯiͅs��u�{l�k�db�뒣������]�bW�"�A�Z/�lbsa�&�xv�����ټ�&��'9pu���g����٠3x����N���FyÚ.P�ψ�/��ˑ��!��zz�� ���6      "   �   x�M̱�0E�O��Di�e���3Nf�,������I"�m{fص�]5pҞBϲ�R9���#n�9�@I`�P�W�뇊&;ޑ�:�j0�h�b�aE��m>����\Ca\�����F��\�5�P�L�E]is��-+��u�['?Y���oι/*Q�      $   i   x�-�K� F�1��7�c�^:���CMQ��ޠ���1�$�0�m�H���	�j�Գ&��ҿ�MFL��­��,���0����O��������.�*��\          a  x��VI��6]˧���(� �gJ�M/{Q�������N�d)>	����k(�WX�vL��ޮV���#�ZX�����v�v!0�;X�� ��M���_�����Hpl��N�Oܒ#}{;�����\`��A��N�
�²R���WV�z�VF�<�5jȎ	��0`��ҒSU�r�t����4��P�t���q�e��	�p�a�U_d�V=��Fb���l�@��,mM�N��&��Phx���2�DyY�4]�-�C�<���B�tb����� vK������d@��C��z�|��P�%	f �
�!=�r�u�\Ib�/�AS	�&���?a�^��SX����j�bT��C@f��٪xFb�����<�R�9��).˃�X��tc
i�$Ǽ���{����E>5-�e�s�V�DIvBA��wq���V5��n�������70�h�<��~����]>�~F�ζ�h0�npd�,������aĠ��	;R0�+�Xع�+�wBx�!��=���D9�� ��`�vSu��;;' �}��I�w�޾�1� ��>}����8��t�
MQA�-;��8�@3���nA�?����憜�6&:��S����Ԟc��s0����R��LW���/!����]v�-�q����n���s�~���6>S��W�@�MCH��Mv�e�p,�ɀo��7��W�K\�1:�[W�>�Br�ƾ)�Ku� �e�F>��1�yF�c�z�Xl��_1��K����ԁK�/o�}t���=�~M9@qa�!���/��9�H�q����R��M�KX�˥�B����תk��c8G�1f�<E�}���c'����/��_ �W�            x��};�9�����;g�3��]��Y�S� ���õ^�H�����F�:�C$Ɍ�{d���$3�ٵ{3�I���	��(d��	���4
J��9~!������������z�xA�Ͽ??�~0d(�j�0�YA.L~;�?=?��A�����I��z���0�A�8��K��(���>��_�9���i�?Vzy ��*�
��*���OCy0��H͠E��qu$�Y��B&~|j�?�e�,�p[�~�@�a:|��x��Q	͉:�1�2�`I���x��%�eL�\3T�x�V�4��i~L|\�Ӥp�:D�F_��O��\�������hzs`�0��U������>��}��h*N/�����99������B_�9p��Ws|�s�*~N�s�$���b"jI����(4U)�L��M4��tZZ�I᳈:��=���+IE$��c�֮ق�?��g�1(Д˹����ϒU�c��0�D�:$-\�DF�q����4Yx4�:=���ѱDX�ktD6w�<�O�b��#����^#�0��\���r�_��p���|��tՍ3�!/�� ���◯�}�I=�-�������q�T
p�g��(4X����F�����~�`�,@�y����G7k~Z���(c�aL�@��K;�cG¾�#|3'�HG:�N��@x�10)�cח�s���a�����?ȑh����4j���^{f7H�i�������頾��z���oP8�.6o�=_��*3��v���z>��iw �$A�h��hx��'K�N��I=X���Y�o��]0xC��*��Zn�H�NF0���	��s��ف�C:�u�� ����w�`:y�o{�U�R�%���P���g�q���c�_0�<�ϝ�"���e��t��r6�W�}�=�'��񳝱����ѽN57�b�N����,�znA���6�1m���h 1�Wwk`����Y�����!QP}8̭������b�wW~��y����z�*t�_�t�
o̖ah� '�~��q�y����X`�̢W�x�_�i1C#�W&<���n8�E�������d�=�S/�F#�YV,�$}9��5۽o7+��4�j�5(���`=0�zȵ`�&�+�������8���#�L"2[ֱ��ט���r�������֞�x� �^@B'�J��B�$�p/�3�#Æ��I����>�)��H�3A��y�1����鷕i�% �݄2m^`��Ɇx����5�'�5�d����EJ�L����%�nu�^�r7�#��0�ԄI�m��:\3ˣ�]Yp!��h� ]Eǳ�2mMm�#^��2\�a���m��r�8B{����˧�1����.s���|�p�ơqѝ�br��ư�/��u���9�x�n�_ Y��T�y0[��5�|9/3H9"ӶH��DӁ�ې����߆e�͋���5���J�y�R߼��!*�a �jK���R��a�o^���d���l�^G�OO�C� ��J+	Y�&}h��Sݎ�OO(LY#HT�	d$��z��?�a_���Őp�'ȡ-�
��$�
�/�8���A�ydX����_HG(x+E�c��7�� �f�Uÿ������#*AI+e^�ዻ���C]�{�E_��U\��z��E�+ >�1�`��[��p!��kn���;��U�Y_���C�Q(u�K�g�����]���/8��V��6L՞C2�e˜�C'����0�1@i/��#b�q����/�(<�N'�kj�<'�<������U��)c>?列��x�l3� {1\�8��pD�n�ۋ�=rִ0v���~�c�|	�.X,�9�8����,x]��`�Y��PQȗP>/��n��������c��w׭�`B���_���ގ\�R*�Ԓ!1�h�}�2<!7�C�<��w @��C�_|�;����t@�������&?���ÿ=���A-L� ]8��+�G���~�xƤ��a��o����5b�P���&��%�������=���=�˧?�<��$�qD�i�0Μ���>��8�R�Q
�q�_V���s�e3vqI;Z2���r�id���iXsoaf�q��6G^=��'7/_ƺ�".y{յ9~g������� =!ʭӓKr\��5q��L��u�/'�q;��2�(�9�,�Èy��誨���"6�n�!��@9������k�N�ۍ��0�P���-%�����s��b�	�᳎�UX_��Y�
k�|Kg���ʘQ����P���%y?K���`��"���݃7'��"R�0�tK�X����c<?>�����L�	#�-8a�t�߰��}!T�m{	x[�R��K�"[��I���,*���I(��)ط���#����(3���/�7��wL����є���m��t�>/٤L�B�@F��ڏ~��>����W�>�j�(���A��=a|��|G%?]�K.V�P&'��dSz}���K���_P�������\���@���&��s��\
23b�'(ƍ�D�Sw���*�~;��)+�[��Ѓ����͠�k�HPNg�����D,Ń�� �Az7�w��@g����P�g��)�_ƗmK`h��IO>>�K�d%�Q0ש�A8���V��^�/;���b�`�ү��㣪�2����3
��9����ˁ��r92RḁKb�K?���s ��r���P��-�ѕw�����jd��è+dM,>8��dz�B!\�qNt�����L���I�mm���İO����+�������{#AL^����Uh ����ߩ��&ɻ�"B+T�L���TZ�㲯��>/k�N�y{�Q�q��"�"�2PS��]uǟ�'����'��nߣA�DV$珌���ȯ�|>0�{�\Ň�<������^.`䗋�ǠP����O5�k bo�aef�I@v�Tre���,�C����_�1+�%H��zDI	K@�}��=�:@�؃�q�w��C�;�qg$g��߲�q����jl2e�I0E蕞aQi|��������E�f�8j�lz?M~T;��-�(�	�yN�=��zs� ���m���z�tv<|~{�5������_a�0(��;ј�s�>�GI+:�.��F�/��.�����P���.���?%�~z�fx}BE����$��UVj��QK,*�(F
f>6+�n;�g�����"�-׶%�ը�K0��#��F���8坺��M�,9e�����n���J s|���:Ĺ��w̳>�)�)�Ȓ=̴mٞ��>���{@*/1g�yH��,�^�C�`:@�@t�D��qGY�D��+m,��ڙ�+�\���B'eA��s�R�[��U�B2��4\�%�����9��������F<�*��wW��L"AZ�8Q�/Z��WH5݂�YpR�c�h���?N�����$�S3�"�\aѿ^�V��z���PQ�&�H���T���KId��9��
�5��AOT�V`�Z2�p���.d�������?��p'�'�P���l���Avt}Vr����:���w�OW!(an
�/��Nq�=1����c�l��8Jы���Լkw=��z�a{�7�yqP{�n}*�Pm��^l��T�V�z��~�]?�hQ�-_9�-ܮ> -'��{L���$D�NC���Z�ׇ��R��q�#�`��[!m��յ3I��LP��;�cV�W�N�e�$#��fd������SD�^�d������$��Ͼ%4�~�(�vw�<��̠.)j��:��ɸJ�}@WWN��H��Z��i=}�=�0#�����pE������I�J}�%�'�U.Խ$.:]�݊�ג��a@;�"q3diⷱg�'���xj�iUTI�8��A˯N7q
�ZaTa�����9�`��U��0{���B�
=\� =}ޝ-��G�D<�n:�������t�J#pZ'��z�&����I>�f�u�%�l�AN��*��`��u �  �M(�Z�:�Cii7�K�Wol����
&&`1X��g�A�������t��m;��T�1d,[�S[��+g0����K>�3�x���7l�]�@T:a�©,�o��%�Fh�)Y�N;����ǏV�	y�=D��<mۛe�W����>9�"���
���8�� <��7:<�� �  ���}���ůdmV
\�1�3T��D��\Q>�
p)]�*0F�8��Gj���h����y��[b�6�[?'�Y��r���h�MIN��:�IE(�<k'�!G�~�������VQ�Y'�j�d����F%�<Jz�e�����'`D�%�����Z���po�����Ӯ�nP��s[�년�U�[J�bf��G��n��}Q^7F8K�{�=�Q�Sw���T^�C0+ձ%�^��l��{n�y�	yJ� O�|hG��:@�*K-1��L���v��7���3�G�6�/�b��"6��k�.՛�q�Wk??���}7���i#�Vi6�7J�oK��ҥZ(�R�j&��.ߜ�<�p�܅V5�g�t0Q�m��o�Yc�bB�R������]qѫṑ�����R���c �V�o�y�[�]�����v$� ������4da;L
�2p�_6���Ƣ+.�ĲS� qP��Ü~\����u>ܯtΦ�Ո�vD�-U��$�׻Vp�r$:�����G�(�e��^:���&WH�Mk]}��+�ӹx$��"CC��,���Z�R�7+�2�~Te� y���
�a�(�fe��n�u�;}~�L���4�&�������
�!:�	i���u7;����vУ���5�vq��lQ��k'�O�B�8�\�m�]�M�H��2A���5��7�<�ˮo�CK�Z�/����U�?���n�+���P!w.����^7�v�L�Hö�y�B��F��e�Tgp�h�����2~#��桫���\��A�c�.L�j+bw����T#��ى�\[���n���hp�C^Ɨ�����q�9�xg~?Ƽ*OE�ڀ"��4A�9��O<ЌJҶB���sW�m���2�$!�8����;��r�U���	Ɣ�� �i|'�?z�Õ,,�tQ>g��J�z�6�t��4o�|BGf�n���&���՘�R�s������!�7zVB�R�E�Od�Y��mr���n��jY`�(�};���|[�����ͱ��	�t�������j=�[�����p�v��]����+n��t��ʫ�Y��	�#؞k$�}<gE�i��^@�Ȁ���6�k��8�=��K�`n��g�����toV�[���8�7���,���nZ)����bB,��)��.L8H�_�.��s`�d��8J�8�Fޭ�|~�����X�CQx큶��~��-F��:P�+ *"s�P��L����+���i h�)jpO�vxu{e��P�/�0��9N�lA+�����c
�L.:�2L��d��� �d��˂�4J{�F��Է�(�(������-�bB	"�.F��ޮ���)dX��og��:W�y7����mԜ����æ��x��1�2$U��i�H���:Qݖ%���N��U���^��w�FKRG����������J��y�;����
��;#��0c���A��Լ�k,N��C��l-�`
{���#��9�/�N"�ݻ`o7)p�÷�dXp�ۓN�W ^W�Of��� ��`;��$VO��6z�m�RE
T���CyF�K����U�l9�M]��/a��iQX�7�7����%b:,Ias�|k'���g/��Cv�,���U�aq7��b,tIc���և��m`��rິˡZH��RL�ؓ�Ox��a*�,-0�حV��2�P���HS����޽�RĈ�4Mt}n�񑶓>tҠ-����)���k�V�p<FO:2�^�����r�ډ���!�mC FM	���9m]����_fL-��7)7����=GBҡ�/���T@-i���t��ӺU��Q>!v,3YkL�~g����襗�a��P9�P#���4�j��W�(rp�K�(AZ��.k�l��t=r��ϭq�6�W���5]��厜ٽ!���0D
]$ة'?g�K��}�(�����o�Mב������*L6����0͑��)�
$���T�?�j���/�K��[����*t9+H=�;튻�!�z�UFR���1vR����=X5���_o.��P�rL�3J�:�_~xg[�nTMRY��9�9��A~��/}D�*oE��a�`X���*{�U���!㰨:�^o���;\=<̶`�M9�d@�~��;*�N[�(����K�@B�>�p�(Ɓ!�Q�y.Ü�w���wE1	a���0z�^����=߸]Qb����̤�8�yC������	 � {I�uj���r��ÙT����QQ���S���c4v)OPJ��z_j\\����+CR�|�d��Zw�oW��,��t����;t�%�w�&g��ֻ :�F����v����]?ِ ��2�2TA�s^'V�[�w���*BeȮzA�/��wc�Uwj7(���i7�l����R� �,׃�6��oo�������5J�?���Q"{���+��Щ���>�$~�����/���:@�`.��%h�o���������`�YP�����Is�
�п�F5�S���1`�zv{>�]S5� p�mv>�22�`*,D���I�%����;��Np���\L��]7�\0{/�~�Z�GL�Z��m�#W���	�T?�M�����ik�g��Tv�(7��=�t�8�X�!�i�,��2�?�w\��l&�|���	N6��wŮX�s��������Ů��BTv�d�q�,��O�2�o;Y�9�L-�QX��:�O����kt�<C��%Ї��?�ݜ��>x�RWp�����HoZ�_W�Vk�;Ͽ�OL�jUb����8�^@�ث_�$�;�Ռ�S�`�'���W���(�����2����7��4�+O:�̞r�t��rׂr2j���V)%�,��~��-]�X�?(d��	{�|ܿ7�ҍcBQQ&qą��i��fg�K�1��<��3��3���>����Ҏ�7����W��5	��R��f�螽����_���tQ`u�e_f"׵N&��T4��3���\�-�A�R
����0���u�d!�� ���B\�ϟ���sm�&q�Xh_�J�Su�t�P���d�
VίI߹���ܢ�s�4
>0CU{��	L���YU@�`�c���Z����!�> �}�~�I_iX�0���N�I�Mn�M��{PTX�<��s�Y�2.h="T�BdJ��v�7;3���<��3ș�{ͳݛ�1$(r!��8�*��91p����ج1�x��iw��1��z�,�S�m;����i�x|�4N��/��w���3x�:��\�o޺�+0��iUOЂ񪘍v�;0�R֖�63��i��P^�i�1FIm�TO��k}�.W�ȍ
5`/=�.JX�~�Lh�7y�X�(���L��R�殳#�
'�ȝ/�3�.:��9�ھ���0��u2��%|+�Y9��8|:;�+|�0Τ}g�[`��n���-!�;'(&��A�w�8Ӓ4��087(s0kAp��SD<��M[[L"���ǭ�8;�Š����.�b�<ݯX/ x�.���Tq
T�y��ڣ����ʵ�nF&غZ�7�Q �:?v�ZIa/]sFz�I}�n���Z�}����O���c�f\P����.��
y��0B*9��������q/A"I���ySh_�� H\�_:�H�%Ȩ]k�˷���˜Um����>�wn�s�:}�.(�M@�Lڠ�)O7P[����<��Z�%;�E�;:ϑv�x�&����ڦ�4���3��=m���G/�Z7�J�gh�%��P�  �>��h���Cei�eD�"��p����|��b���ۗb�Q����%:�ׯ�����c�ϼ         n  x��SK��(�Ux��eE�� 0��#��������Pϕ_wuO2��{%�+IF�����Z���d���-̉�A��2+�mةTk��ߗ*���s%�3V�9^�Cܯ��8�8�հ{7>-�i��@�\��J�ݝN(�$/Le\p�F�:C��f5/Ա���U���N�Awl*�-��J"i�Sy	�I&X���wޅnA�B}�NɖJ�go8s"��ynq��<6����Q5�	}?��Y`��v��I��qf�%��Ɍ\g���A?zn��P����z8�Z&�~tv!�Y0%�r��!�p�������0��#�������4|*N��\�|��:x��}�2�C?��O�<l��p_�l������m��X�2�X�ֳ�1z�����T;P2+h�q�������m�D�C�hA���My������z��P������l�>�2�l���؏�l�~h���Pw�`�*��w��3�Ť��E�
\^�ieR/;�u5@k�_�K�箖xM��R�R��<酁K8&�c��bت���}�^o��WT�˰C���2(p���pz�6\��dR�Ǫ�1�/�=�tB�k��ȑtG�n��q���}���;�'�$         g   x�ʻ�@ ����Q�&bc;�)'���q2���?�¶��:U|G���*�==sI�2C�Mq�Qt�ɕ��(ݧ	�2kP`�cG���Í���� ?E[$�      '     x��P1N�0�7��9��..�u��A�q����I.����'��0H��-fgF��m\�h�<�_;
�wη�T�;�Ay�f���5���ؽ���A�|G�V[Z٣
/�~��AM�U���aj�>}�bJ.J�b+�A�˲�r9�eUmd) )��r o���c����G3�#Ec���S��v=,zn0��'l�c���T��]�9�-H�u/8�
��`yj³a5+}r�ƺ�z!�?��S=]eY�	���!     