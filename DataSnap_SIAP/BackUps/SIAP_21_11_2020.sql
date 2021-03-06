PGDMP                     
    x            siap    12.4    12.4 �    )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ,           1262    17724    siap    DATABASE     �   CREATE DATABASE siap WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
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
       public          postgres    false    211            -           0    0 )   math_resumenes_autor_id_resumen_autor_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.math_resumenes_autor_id_resumen_autor_seq OWNED BY public.math_resumenes_autor.id_resumen_autor;
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
       public         heap    postgres    false            �            1259    18127    siap_trabajosgrado    TABLE     �  CREATE TABLE public.siap_trabajosgrado (
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
 &   DROP TABLE public.siap_trabajosgrado;
       public         heap    postgres    false            %           2604    17804 %   math_resumenes_autor id_resumen_autor    DEFAULT     �   ALTER TABLE ONLY public.math_resumenes_autor ALTER COLUMN id_resumen_autor SET DEFAULT nextval('public.math_resumenes_autor_id_resumen_autor_seq'::regclass);
 T   ALTER TABLE public.math_resumenes_autor ALTER COLUMN id_resumen_autor DROP DEFAULT;
       public          postgres    false    210    211    211                      0    18036    emem_afiliaciones 
   TABLE DATA           E   COPY public.emem_afiliaciones (idafiliacion, afiliacion) FROM stdin;
    public          postgres    false    227   ��                 0    18044    emem_participantes 
   TABLE DATA           �   COPY public.emem_participantes (idparticipante, primernombre, segundonombre, primerapellido, segundoapellido, correo, contra, idafiliacion) FROM stdin;
    public          postgres    false    228   �                 0    17791    math_autor_resumen 
   TABLE DATA           Q   COPY public.math_autor_resumen (cedula, nombre, correo, institucion) FROM stdin;
    public          postgres    false    209   ��                 0    17749    math_bd_articulos 
   TABLE DATA           �   COPY public.math_bd_articulos (id_articulo, titulo, resumen, autores, nombre_revista, volumen, paginas, fecha, objetivos, metodologia, conclusiones) FROM stdin;
    public          postgres    false    205   ��                 0    17820    math_bibliografia_resumen 
   TABLE DATA           ^   COPY public.math_bibliografia_resumen (id_bibliografia, bibliografia, id_resumen) FROM stdin;
    public          postgres    false    212   ��       
          0    17778    math_palabras_clave 
   TABLE DATA           T   COPY public.math_palabras_clave (id_palabra_clave, palabra, id_resumen) FROM stdin;
    public          postgres    false    208   ��                 0    17757    math_participante_emem 
   TABLE DATA           d   COPY public.math_participante_emem (cedula, correo, nombre, tipo_participacion, contra) FROM stdin;
    public          postgres    false    206   
�       	          0    17765    math_resumen 
   TABLE DATA           �   COPY public.math_resumen (id_resumen, titulo, resumen, linea, tipo, objetivo, capacidad, materiales, prerequisito, requiere_sala, evaluado, nombre_autor, subtitulo, salon, fecha, id_autor) FROM stdin;
    public          postgres    false    207   '�                 0    17833    math_resumen_participante 
   TABLE DATA           P   COPY public.math_resumen_participante (id_participante, id_resumen) FROM stdin;
    public          postgres    false    213   D�                 0    17801    math_resumenes_autor 
   TABLE DATA           T   COPY public.math_resumenes_autor (id_resumen_autor, cedula, id_resumen) FROM stdin;
    public          postgres    false    211   a�                 0    17741    math_rol 
   TABLE DATA           2   COPY public.math_rol (id_rol, nombre) FROM stdin;
    public          postgres    false    204   ~�                 0    17733    math_usuario 
   TABLE DATA           F   COPY public.math_usuario (cedula, correo, nombre, contra) FROM stdin;
    public          postgres    false    203   ��                 0    17725    math_visitas 
   TABLE DATA           ;   COPY public.math_visitas (id_visita, contador) FROM stdin;
    public          postgres    false    202   ��                 0    17969    siap_actividades_docentes 
   TABLE DATA           d   COPY public.siap_actividades_docentes (idactividaddocente, actividad, idfunciondocente) FROM stdin;
    public          postgres    false    225   ��       %          0    18216 "   siap_actividades_funciones_docente 
   TABLE DATA           �   COPY public.siap_actividades_funciones_docente (idactividadprograma, idfuncion, idactividad, idsubactividad, actividad, iddocente, periodo, horas, calculada) FROM stdin;
    public          postgres    false    235   ��                 0    17935    siap_agendas_servicios 
   TABLE DATA           �   COPY public.siap_agendas_servicios (idagendaservicio, iddocente, idservicioprograma, periodo, numerocontrato, actafacultad, actaprograma, concertada, completada) FROM stdin;
    public          postgres    false    222   ��       "          0    18119    siap_areasprofundizacion 
   TABLE DATA           P   COPY public.siap_areasprofundizacion (idareaprofundizacion, nombre) FROM stdin;
    public          postgres    false    232                   0    17854    siap_categoria_docentes 
   TABLE DATA           P   COPY public.siap_categoria_docentes (idcategoriadocente, categoria) FROM stdin;
    public          postgres    false    215   �                0    17953    siap_configuraciones 
   TABLE DATA           n   COPY public.siap_configuraciones (idconfiguracion, nombredirector, nombredecano, semanassemestre) FROM stdin;
    public          postgres    false    223   2                0    17862    siap_docentes 
   TABLE DATA           �   COPY public.siap_docentes (iddocente, nombre, correo, telefono, idcategoriadocente, idtipocontrato, activo, documento) FROM stdin;
    public          postgres    false    216   �                0    18082    siap_egresados 
   TABLE DATA           �   COPY public.siap_egresados (idegresado, nombre, celular, correo, esegresado, fecha, gradoescolaridad, secretaria, institucion, municipio, cargo, nivellabora) FROM stdin;
    public          postgres    false    229   �                0    17880    siap_errores 
   TABLE DATA           T   COPY public.siap_errores (iderror, hora, fecha, procedimiento, mensaje) FROM stdin;
    public          postgres    false    217   Z*                0    17888    siap_facultades 
   TABLE DATA           ?   COPY public.siap_facultades (idfacultad, facultad) FROM stdin;
    public          postgres    false    218   �8      &          0    18244    siap_favoritos 
   TABLE DATA           U   COPY public.siap_favoritos (idfavorito, titulo, icono, ruta, frecuencia) FROM stdin;
    public          postgres    false    236   �9                0    17961    siap_funciones_docentes 
   TABLE DATA           L   COPY public.siap_funciones_docentes (idfunciondocente, funcion) FROM stdin;
    public          postgres    false    224   �:                 0    18098    siap_gruposinvestigacion 
   TABLE DATA           s   COPY public.siap_gruposinvestigacion (idgrupoinvestigacion, nombre, sigla, iddirector, mision, vision) FROM stdin;
    public          postgres    false    230   %;                0    17922    siap_horarios_servicios 
   TABLE DATA           q   COPY public.siap_horarios_servicios (idhorarioservicio, dia, inicio, fin, idservicioprograma, salon) FROM stdin;
    public          postgres    false    221   �<      !          0    18111    siap_modalidades 
   TABLE DATA           ?   COPY public.siap_modalidades (idmodalidad, nombre) FROM stdin;
    public          postgres    false    231   z      $          0    18208    siap_periodos 
   TABLE DATA           m   COPY public.siap_periodos (idperiodo, periodo, hormaxcarrera, hormaxcontrato, hormaxcatedratico) FROM stdin;
    public          postgres    false    234   �z                0    17896    siap_programas 
   TABLE DATA           J   COPY public.siap_programas (idprograma, programa, idfacultad) FROM stdin;
    public          postgres    false    219   +{                0    17909    siap_servicios_programas 
   TABLE DATA           �   COPY public.siap_servicios_programas (idservicioprograma, asignatura, idprograma, horas, aulas, periodo, jornada, grupo, semanas, tipo) FROM stdin;
    public          postgres    false    220   T~                0    17982    siap_subactividades_docentes 
   TABLE DATA           o   COPY public.siap_subactividades_docentes (idsubactividaddocente, subactividad, idactividaddocente) FROM stdin;
    public          postgres    false    226   2�                0    17846    siap_tipo_contrato 
   TABLE DATA           M   COPY public.siap_tipo_contrato (idtipocontrato, contrato, horas) FROM stdin;
    public          postgres    false    214   ��      #          0    18127    siap_trabajosgrado 
   TABLE DATA             COPY public.siap_trabajosgrado (idtrabajogrado, titulo, estudiante1, estudiante2, estudiante3, idjurado1, idjurado2, idjurado3, iddirector, idmodalidad, idareaprofundizacion, idgrupoinvestigacion, actapropuesta, fechasustentacion, calificacion) FROM stdin;
    public          postgres    false    233   '�      .           0    0 )   math_resumenes_autor_id_resumen_autor_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.math_resumenes_autor_id_resumen_autor_seq', 1, false);
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
       public            postgres    false    225            g           2606    18223 J   siap_actividades_funciones_docente siap_actividades_funciones_docente_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_pkey PRIMARY KEY (idactividadprograma);
 t   ALTER TABLE ONLY public.siap_actividades_funciones_docente DROP CONSTRAINT siap_actividades_funciones_docente_pkey;
       public            postgres    false    235            M           2606    17942 2   siap_agendas_servicios siap_agendas_servicios_pkey 
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
       public            postgres    false    218            i           2606    18251 "   siap_favoritos siap_favoritos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.siap_favoritos
    ADD CONSTRAINT siap_favoritos_pkey PRIMARY KEY (idfavorito);
 L   ALTER TABLE ONLY public.siap_favoritos DROP CONSTRAINT siap_favoritos_pkey;
       public            postgres    false    236            Q           2606    17968 4   siap_funciones_docentes siap_funciones_docentes_pkey 
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
       public            postgres    false    231            e           2606    18215     siap_periodos siap_periodos_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.siap_periodos
    ADD CONSTRAINT siap_periodos_pkey PRIMARY KEY (idperiodo);
 J   ALTER TABLE ONLY public.siap_periodos DROP CONSTRAINT siap_periodos_pkey;
       public            postgres    false    234            G           2606    17903 "   siap_programas siap_programas_pkey 
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
       public            postgres    false    214            c           2606    18134 *   siap_trabajosgrado siap_trabajosgrado_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_pkey PRIMARY KEY (idtrabajogrado);
 T   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_pkey;
       public            postgres    false    233            y           2606    18052 7   emem_participantes emem_participantes_idafiliacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.emem_participantes
    ADD CONSTRAINT emem_participantes_idafiliacion_fkey FOREIGN KEY (idafiliacion) REFERENCES public.emem_afiliaciones(idafiliacion);
 a   ALTER TABLE ONLY public.emem_participantes DROP CONSTRAINT emem_participantes_idafiliacion_fkey;
       public          postgres    false    227    228    2903            n           2606    17828 C   math_bibliografia_resumen math_bibliografia_resumen_id_resumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.math_bibliografia_resumen
    ADD CONSTRAINT math_bibliografia_resumen_id_resumen_fkey FOREIGN KEY (id_resumen) REFERENCES public.math_resumen(id_resumen);
 m   ALTER TABLE ONLY public.math_bibliografia_resumen DROP CONSTRAINT math_bibliografia_resumen_id_resumen_fkey;
       public          postgres    false    207    2865    212            k           2606    17786 7   math_palabras_clave math_palabras_clave_id_resumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.math_palabras_clave
    ADD CONSTRAINT math_palabras_clave_id_resumen_fkey FOREIGN KEY (id_resumen) REFERENCES public.math_resumen(id_resumen);
 a   ALTER TABLE ONLY public.math_palabras_clave DROP CONSTRAINT math_palabras_clave_id_resumen_fkey;
       public          postgres    false    208    2865    207            j           2606    17773 '   math_resumen math_resumen_id_autor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.math_resumen
    ADD CONSTRAINT math_resumen_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES public.math_usuario(cedula);
 Q   ALTER TABLE ONLY public.math_resumen DROP CONSTRAINT math_resumen_id_autor_fkey;
       public          postgres    false    2857    203    207            o           2606    17841 C   math_resumen_participante math_resumen_participante_id_resumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.math_resumen_participante
    ADD CONSTRAINT math_resumen_participante_id_resumen_fkey FOREIGN KEY (id_resumen) REFERENCES public.math_resumen(id_resumen);
 m   ALTER TABLE ONLY public.math_resumen_participante DROP CONSTRAINT math_resumen_participante_id_resumen_fkey;
       public          postgres    false    2865    213    207            l           2606    17810 5   math_resumenes_autor math_resumenes_autor_cedula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.math_resumenes_autor
    ADD CONSTRAINT math_resumenes_autor_cedula_fkey FOREIGN KEY (cedula) REFERENCES public.math_autor_resumen(cedula);
 _   ALTER TABLE ONLY public.math_resumenes_autor DROP CONSTRAINT math_resumenes_autor_cedula_fkey;
       public          postgres    false    211    209    2869            m           2606    17815 9   math_resumenes_autor math_resumenes_autor_id_resumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.math_resumenes_autor
    ADD CONSTRAINT math_resumenes_autor_id_resumen_fkey FOREIGN KEY (id_resumen) REFERENCES public.math_resumen(id_resumen);
 c   ALTER TABLE ONLY public.math_resumenes_autor DROP CONSTRAINT math_resumenes_autor_id_resumen_fkey;
       public          postgres    false    211    207    2865            w           2606    17977 I   siap_actividades_docentes siap_actividades_docentes_idfunciondocente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_docentes
    ADD CONSTRAINT siap_actividades_docentes_idfunciondocente_fkey FOREIGN KEY (idfunciondocente) REFERENCES public.siap_funciones_docentes(idfunciondocente);
 s   ALTER TABLE ONLY public.siap_actividades_docentes DROP CONSTRAINT siap_actividades_docentes_idfunciondocente_fkey;
       public          postgres    false    2897    224    225            �           2606    18229 V   siap_actividades_funciones_docente siap_actividades_funciones_docente_idactividad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_idactividad_fkey FOREIGN KEY (idactividad) REFERENCES public.siap_actividades_docentes(idactividaddocente);
 �   ALTER TABLE ONLY public.siap_actividades_funciones_docente DROP CONSTRAINT siap_actividades_funciones_docente_idactividad_fkey;
       public          postgres    false    2899    225    235            �           2606    18239 T   siap_actividades_funciones_docente siap_actividades_funciones_docente_iddocente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_iddocente_fkey FOREIGN KEY (iddocente) REFERENCES public.siap_docentes(iddocente);
 ~   ALTER TABLE ONLY public.siap_actividades_funciones_docente DROP CONSTRAINT siap_actividades_funciones_docente_iddocente_fkey;
       public          postgres    false    216    2881    235            �           2606    18224 T   siap_actividades_funciones_docente siap_actividades_funciones_docente_idfuncion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_idfuncion_fkey FOREIGN KEY (idfuncion) REFERENCES public.siap_funciones_docentes(idfunciondocente);
 ~   ALTER TABLE ONLY public.siap_actividades_funciones_docente DROP CONSTRAINT siap_actividades_funciones_docente_idfuncion_fkey;
       public          postgres    false    2897    235    224            �           2606    18234 Y   siap_actividades_funciones_docente siap_actividades_funciones_docente_idsubactividad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_actividades_funciones_docente
    ADD CONSTRAINT siap_actividades_funciones_docente_idsubactividad_fkey FOREIGN KEY (idsubactividad) REFERENCES public.siap_subactividades_docentes(idsubactividaddocente);
 �   ALTER TABLE ONLY public.siap_actividades_funciones_docente DROP CONSTRAINT siap_actividades_funciones_docente_idsubactividad_fkey;
       public          postgres    false    2901    226    235            u           2606    17943 <   siap_agendas_servicios siap_agendas_servicios_iddocente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_agendas_servicios
    ADD CONSTRAINT siap_agendas_servicios_iddocente_fkey FOREIGN KEY (iddocente) REFERENCES public.siap_docentes(iddocente);
 f   ALTER TABLE ONLY public.siap_agendas_servicios DROP CONSTRAINT siap_agendas_servicios_iddocente_fkey;
       public          postgres    false    216    222    2881            v           2606    17948 E   siap_agendas_servicios siap_agendas_servicios_idservicioprograma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_agendas_servicios
    ADD CONSTRAINT siap_agendas_servicios_idservicioprograma_fkey FOREIGN KEY (idservicioprograma) REFERENCES public.siap_servicios_programas(idservicioprograma);
 o   ALTER TABLE ONLY public.siap_agendas_servicios DROP CONSTRAINT siap_agendas_servicios_idservicioprograma_fkey;
       public          postgres    false    2889    220    222            p           2606    17870 3   siap_docentes siap_docentes_idcategoriadocente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_docentes
    ADD CONSTRAINT siap_docentes_idcategoriadocente_fkey FOREIGN KEY (idcategoriadocente) REFERENCES public.siap_categoria_docentes(idcategoriadocente);
 ]   ALTER TABLE ONLY public.siap_docentes DROP CONSTRAINT siap_docentes_idcategoriadocente_fkey;
       public          postgres    false    2879    215    216            q           2606    17875 /   siap_docentes siap_docentes_idtipocontrato_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_docentes
    ADD CONSTRAINT siap_docentes_idtipocontrato_fkey FOREIGN KEY (idtipocontrato) REFERENCES public.siap_tipo_contrato(idtipocontrato);
 Y   ALTER TABLE ONLY public.siap_docentes DROP CONSTRAINT siap_docentes_idtipocontrato_fkey;
       public          postgres    false    2877    214    216            z           2606    18106 A   siap_gruposinvestigacion siap_gruposinvestigacion_iddirector_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_gruposinvestigacion
    ADD CONSTRAINT siap_gruposinvestigacion_iddirector_fkey FOREIGN KEY (iddirector) REFERENCES public.siap_docentes(iddocente);
 k   ALTER TABLE ONLY public.siap_gruposinvestigacion DROP CONSTRAINT siap_gruposinvestigacion_iddirector_fkey;
       public          postgres    false    230    2881    216            t           2606    17930 G   siap_horarios_servicios siap_horarios_servicios_idservicioprograma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_horarios_servicios
    ADD CONSTRAINT siap_horarios_servicios_idservicioprograma_fkey FOREIGN KEY (idservicioprograma) REFERENCES public.siap_servicios_programas(idservicioprograma);
 q   ALTER TABLE ONLY public.siap_horarios_servicios DROP CONSTRAINT siap_horarios_servicios_idservicioprograma_fkey;
       public          postgres    false    221    220    2889            r           2606    17904 -   siap_programas siap_programas_idfacultad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_programas
    ADD CONSTRAINT siap_programas_idfacultad_fkey FOREIGN KEY (idfacultad) REFERENCES public.siap_facultades(idfacultad);
 W   ALTER TABLE ONLY public.siap_programas DROP CONSTRAINT siap_programas_idfacultad_fkey;
       public          postgres    false    2885    219    218            s           2606    17917 A   siap_servicios_programas siap_servicios_programas_idprograma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_servicios_programas
    ADD CONSTRAINT siap_servicios_programas_idprograma_fkey FOREIGN KEY (idprograma) REFERENCES public.siap_programas(idprograma);
 k   ALTER TABLE ONLY public.siap_servicios_programas DROP CONSTRAINT siap_servicios_programas_idprograma_fkey;
       public          postgres    false    219    2887    220            x           2606    17990 Q   siap_subactividades_docentes siap_subactividades_docentes_idactividaddocente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_subactividades_docentes
    ADD CONSTRAINT siap_subactividades_docentes_idactividaddocente_fkey FOREIGN KEY (idactividaddocente) REFERENCES public.siap_actividades_docentes(idactividaddocente);
 {   ALTER TABLE ONLY public.siap_subactividades_docentes DROP CONSTRAINT siap_subactividades_docentes_idactividaddocente_fkey;
       public          postgres    false    226    225    2899            �           2606    18160 ?   siap_trabajosgrado siap_trabajosgrado_idareaprofundizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idareaprofundizacion_fkey FOREIGN KEY (idareaprofundizacion) REFERENCES public.siap_areasprofundizacion(idareaprofundizacion);
 i   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idareaprofundizacion_fkey;
       public          postgres    false    233    232    2913            ~           2606    18150 5   siap_trabajosgrado siap_trabajosgrado_iddirector_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_iddirector_fkey FOREIGN KEY (iddirector) REFERENCES public.siap_docentes(iddocente);
 _   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_iddirector_fkey;
       public          postgres    false    216    2881    233            �           2606    18165 ?   siap_trabajosgrado siap_trabajosgrado_idgrupoinvestigacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idgrupoinvestigacion_fkey FOREIGN KEY (idgrupoinvestigacion) REFERENCES public.siap_gruposinvestigacion(idgrupoinvestigacion);
 i   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idgrupoinvestigacion_fkey;
       public          postgres    false    2909    233    230            {           2606    18135 4   siap_trabajosgrado siap_trabajosgrado_idjurado1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idjurado1_fkey FOREIGN KEY (idjurado1) REFERENCES public.siap_docentes(iddocente);
 ^   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idjurado1_fkey;
       public          postgres    false    216    2881    233            |           2606    18140 4   siap_trabajosgrado siap_trabajosgrado_idjurado2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idjurado2_fkey FOREIGN KEY (idjurado2) REFERENCES public.siap_docentes(iddocente);
 ^   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idjurado2_fkey;
       public          postgres    false    216    233    2881            }           2606    18145 4   siap_trabajosgrado siap_trabajosgrado_idjurado3_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idjurado3_fkey FOREIGN KEY (idjurado3) REFERENCES public.siap_docentes(iddocente);
 ^   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idjurado3_fkey;
       public          postgres    false    216    2881    233                       2606    18155 6   siap_trabajosgrado siap_trabajosgrado_idmodalidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.siap_trabajosgrado
    ADD CONSTRAINT siap_trabajosgrado_idmodalidad_fkey FOREIGN KEY (idmodalidad) REFERENCES public.siap_modalidades(idmodalidad);
 `   ALTER TABLE ONLY public.siap_trabajosgrado DROP CONSTRAINT siap_trabajosgrado_idmodalidad_fkey;
       public          postgres    false    231    233    2911               k   x��KB! б�V�#����Nwz�
.�O��5��>�����l]0v��ÿA�/V��XU<�2��26
�-:}�����%Ե�cвՉ+�o �*.�         o   x��1�0�ٹK� T��8���Q�)f�6��!���C��c�0Q�U�Đ����?�-��ڨ�*N��B��,R%���=�h�F�����ů���2?�98��'�            x������ � �            x������ � �            x������ � �      
      x������ � �            x������ � �      	      x������ � �            x������ � �            x������ � �            x������ � �         �   x�m�1R!Dc8'��ȴ4�����2�|`k���́�<�\�1ߠ;zկZ������6�Y�~��RmCN뀍=�SݾH�R���,�vp�%q��63K(��TB�զ�c@�t�ʛp�c紴ޮ(r��=��������0�(؇Cʱ�T&&�!��YG����Ԩ�T1VX��.��=a���܀@�M ���&�_+ɍ��hЁD�+�K��R�s��<j            x������ � �           x�uбm�0�Z��0Y(M�ϲ��d��mR���XtI� ��aC����;_`/<��v�L���Je���=�����T����������D��d� ɲu�Hr�z��a���X!����dYU썿8��� �H�u�a� 2D\"�͑�dqv�~�y�[xP[5���d�Tye��{/�����$s��S��T��F��8�GCB{~��̉KUl���mA_��Z�o����z����\4x�㠠%�����j$� u++T	��o��K�u����$      %      x��}Kr�:��8�*bXe��L�o��+�	@�$H$ �C��[Fkp�z	����2I��)��,�������|�I�0zH��C�p��#T�PP}{hiۂE�	,��P��@M[6Yz������\yR�����O��ۛ�8N�wǿs�-�������3�7hѺM�A���"$$���'_��{�x��$����������c�o�VK��N���-�0m������������+�g>�zᒉ -Q=�D8Yg�k�T
�!��Ar��^��%��P�Q�0Ԩ;�Vcu������~E�yFXՒAm�������F���]��%�T�C�9ݴF���ۨ���4zڢ������^�r���Ȟ�Q�@Բ����bQqٴS� (��/Rw��q�<�R�w��~;�n�b7�SZ/F����������ӯe�������M�ۑC�u�ޖۺ�������*�c�@lm��$�8j$�/&r^���ݒ�ȩ�������R��v�4�/(2T�B��V��؋`�(�$����Z�h\�Ͽ���q+�n'�j��j��z���R|�:~'���'Yqq?q�*�T]��_��s�6[[�3B(����`{b*�Q(��/ߴR������Lv�30���U��q8%��E�@UA~�>B�-��~����4S���Qw�Rx�=H��nt��Չ���YgyQ�?��w2I� ��O�d�=����_�*_���Jk(�����V��V�崐&I�$V-��N�P^'��0��	鈤d����twwڌ4�"=(�2�\A�Զ���>d"xxXlÈ\��u	-3
Zi/w:߆���"mB�� ���GW]l~�9EI(�{�I�xa�~������D�[������]K���&�&�/pB+�NȧP@ז�XG���)(���Z�mKLY�X ,�����C��E�`б�膶*��r��|�3�=7j@ፁ ����aWͨ玪J��o��6@����=�"/�F�������ͦ�f�`K�r�ld:��F憨m��{���"JkY"Wy
ˑ���{���A�5D0���B��	5�-g�B��&��o�ѡ޶b��Q�;v5lYr��^;j	E�йP+]�w�]��ԗ��Ak���l�&��8�x�ۤGU����0�����v3�H���2�4m��f9����P��0K����q���j�|�� f;������w����G]��,�ж=hC��{��uL��`�8Bc�
L���:����訠�x6@�a�\$ߓA2��?c	E)�:¬P���kMr�o�K(�Tv�;�D㌃̶d���5�U �����Zږ�DSS��)���}BC�$D���m�Q����my�6����
��Z\	�+G�k8#Տ������e��шR@����^n��T����[U��C� KeBg0xb�DRbt8�ǟ8V�����Q�8�1����Kg1
��)M�y�2 �˃L�W4��4�q-�����Ow���-��z��AX�f{�8���ސƷ盛�Ǉool��j�Z�s�K�5� K<���<ͽ,0�4�
4�㰽9��M^�z�*����J
k1��d_`��s==�c�~����UL�f��p�� X�G	�9���PE$�B�y�1�Y�_+�3O�f��ƴ�$��MO77O�t������r{��������e��r�Mfa!N��P��x�v(��Zݾj���������핥�R	��%��Blk�0Am�]����x�r�T��ZԪ�Έ�tz �>P9�����O�S�J܉�e���sGȂ�@��0JT\5�mc�pm����<<�=nA\������h�W.r��tyT�N2\�m�&�����t�
����@ؾ�R��G�w�
�@�⎤ �ǿ��B��w�7O[��ʾ
mD�:O��ҍ��R��#Y_)JT����Qه�`�A�-ìB���VF;�{+��|��[�4TcSA ���ʽ6��pww{{��I�i^�ZcU"u/j������G�
�B1dvV���˳��zJ�<�0嗿S�U�u��<`�q쁔e��(Jwys�j���Њ!6��T�9�ؖ�x_��6$h�v�!�`�������d���r�A�SY��]��E�f�M���naĭ�ؓ�"�kѳ����v���ƾݯ?�ˑ#��.��g��r�+�s�>����퀰 �n��dsF�<4.)�vL9:��W�gs��H�NJ�݂�<��Ɩ��}[�eHJ�ZY@a�/���2�ݮ�q6�2��fgl�5���qG�v�yĤ������M��1;�?�I��5��7�t|��ڔzG��Ս�z�c���PjO�(ǽ�?b�y�H<�qS�o��1|@.)y�1o�����/����_�s?�X�s]���p�Y5_��b9xb� ��~�w���L��.#�H�	�/��E������ް�㊗J��R��{ހcj;��&�](��MV�q-&tʧAf��^���W�k+�(ie]O #��y`R��N���֬���vZT2p&�59������p��I�K\D���Q�)�m��Թn��bb�����W�R�fjڋ˧�v�#[3��x
M��ء^DN��0�ϼI���n:֏�TP �Ƞ�o����z�'Kxm*��:��e���t�3���.�pO�7����x�K�mɀ{ʡ�1L��=�]4&�m�0��i14PEVBS���ť��,������n���*�~�۞]K��ܴI�骃�X��a�Y��u��03�huo� �خ�`��I�|�����f���WLC�!���P��]�J!T��S�����=NP5c���f����Q劳�gٚ���z�涅Ȧ�λ��0@j����6�:���Γ_��+v��`�I}*�4Tz��뭄�����:DN)���~��N����p�v�|���
��-�N Լ�v$�^yN|e���[(D��H�z�>0r��*���!P�;�LXv�@��Y�c�Z��k^[�"���]�3/hȁD(�C�i���v����}�rx��Z`~Q�FC��_�r�����]UE��`,lwF?�����ڛ��#�WB�0��t�x��t�l�gs�#cf�@4��J��ڄZ7�k�9��i����E`m��U���B�J�6�KY���>�`�J�#ԙ?݄��������-sV�F��L[Nm%����=`�,ݟ��t@�l�,[ż��۩-������}�ݧ��N��"V4�cDbl�� H�o�}E<����1��	
��Ўn[��z+5X������������*U7�j��X׊$ca!Vt��A_ĩ�����ߞnާl)Do��
X�=����9�e��o�M��� �!�>32�a���a�%��/,-p�o7>xL��r����oO���ym��~Ā$�^�z����ӊ�Z�
LW[�c���%�2g�׻ѣU���0Ĳ⫝�j+�:�i>pMߔ��myq�Jn�����������~:�e���
ә�I�t��"��Ћ�	�c�߄� �����^��q|g0�J�Rh��} 7����%f�����IJg@H̱���Pl{�+�Y���w������[1����B�K����uM�7�S�i������z]�g3��]���x��v��	�K�4��ihSц~���%���0B1�%ԺFU+�v5��rY��qz�J���"ڼm���Ry�h��������o}���o1DhH*j����Hߊ�\\���6��#�z#����n�����3���m;u�1�&}�]��|�fI�ny3��<J2����%���gC��O&��20����dQ����ǦR�Ӭ_�c�&T�c�?c��nc]Qf����j�I;H�ŀ��oTܯk�gǒ�c��@�Ii������N�M��5SkRC���%v������]�}o�i5ܽ�7��DDH�R0�e�����Ks�>�:B��?`��奢�� �
  �9sr@"	����ܶ�継��7���� �ң���f�^E��A�_E#����`��GC�����w���z�X�_%|X1�P���0��H=�:��MbvDzŞW}�E���]t2�^$�ڛ�3�P:D��g��<'��.�\�b(Z`�A�G��d�*I}pc%�$���UU��u������0EnG
����o��dg�E1OFpwV?���f"�g*�4DS"�h[:����W��L��1��5�CT� ���+��fLd��"&� 1kl������ձ��G�EN6P7�D�WRPR�:�5$�H�
�7.hC��������z�_���_5$�JPf����X!��=/�򧬸�<�iZ��#f�ƥ�g)��t��0wz(S���`5���|@�?C�x��Y�x��`�����ɐ��	0vqV]�L��w���t�����Uy9���6��ZK�7�D��#ۏ��NY1W��=��P��3�;��u?-��H?]Y�bqj�K��`_B*2H���h爛Ey�Q���.��m?U�A��:�X-ח'][�}aU�����w���kr>ߎP�ߛP�=>GthPƔ��������"���׆�`@��F/���[�	[�϶d��zh)"2�q�"������V��@�C@��EC_Ӑ���W~*<1LOV�P�����Z��_[]OyUU�,͍n��|�i��Ujέ�ո�S�����
.���.SЙ�]t5����D�^��
.j������P�A�#�ʹ�y�u�C6F��^
�B5��`���V�st���J����T>Ae#�
���N�/*{sgR���8
)�n��7G��ؒ,PW0�P �(�KN{7�6�٘~�������^b�^�qz�Ǽw���aj0�uT"*�7�py�}��׳i���EI�����XTKn_o�{��_�����+BlQ��}�4U�ZR]�����)��.�ZcB�,�����t[0�p������6��wnӽy=�����EmO/z�^��y�SZ�mk�-���FJ��oir>��t���lj@K��Xb`k�]��<o�ߴ!�+��:p�7㼅�9����I���q#��A�(��l᥸�C�IrD�h`(��GMz��o��;&9mΣ��5��!�*��MS�ј����NW��b��(&�+��]?݋�T�T�6��d��ᮜ�з5�t7=j�/T_I&s�.�`M*�	�R��U]���#�v�3w s%)�Y�P����_��ҋ/ƪ}��QH���x0�ӓMo�G�ɽN����<~~�9��hg��t�7��k��U�پ^��*�l�0��c�QU�4���D+�,J(�)��b�ԗ�k��������~E����n�� Uz:�þ�eE<s ^�(���CG_��s<{�a2��ɣl5⧰�]�K�@���"�`�K���f�_h�cޠ�m���S�#%�>���wD� �4��@.!���rڹ���l��p/D�J]^���b�U���H+�
�h.�"|�~��b����%�kR#�j�Q��v�U�KA�_*����`�f�z�j�}F?h\��X�D��G�v���_��U���\S��s3"(Cq�x��^�P��!���6�i�w��A��jQM(W) ���P����읛�~�6ޕ��c�������r�>���F��u�`�C�D��P�7.V��a�S�}fT�=�^]�c~ٕ{9��(�QG�"[E��y���ݭf�
���|)Gp����偰m4"���d`K��-M��/�V鈀��3�F�S�_�6*q�R/`�}m◿@�{7�jg�􌍨@tӵm���9�-��G�Y��:���ZR7~�do���
�P�������G����畯{�	=�����W�$� �����c@$F����V����ן5
K�'��:��}`��s�	n�A+��Q�0j1�v�wK����3�j����%���4P%��7|�wDɿ�ɂ��<�JW���K�d`7��^�%ْ@K�@ZT���ӣγ�V�Ae���-�@X���c����Ձk1�q:΄���јSv�]ت�H�d0��7���l����=�N@�9���v{dôbmh��<[@���n�ߌ��_�ċ�=�Fw9��'��_�F1�fY���N_�fLg�i�s�4�Yo���&ZB�z��m��09�p�O{f�#[
n�
P=�IM����\�T�8q�� � u �o�;Y��t>��d�u����`@��D�)ٮq}�Q�Ϭˣ9K����8��V��u�����r�9�i�Ɛ��Ԩ������Y��N���~�@�No�����9��d�Hw� ��c�e��(��y-Jia,+h�*B�.Wu3�,��OϘ�����I�u�np���K|v�p�\PZƸ�E� �z�2|E5�e+����6i��mc�=��9�mq������W�.Q%��M�4�꭛H�xg3�cZ��f:��$H�|_�Y|}�rC\L"��X�h�>p��UϬ�pE=�`��!����Ab���k�y����Px�F�zv]d����U�T5tnCE`�d�K��sD�q���1}f|�1����^_sJ.6fP��TǎHٵo���(ۇb�iI�`P���� EԏI�ċ�C<�(]8D^�KPj�}v:x�{"ٌ���������?���c�e�            x�}|[��8��w�^�T��cg� ��A W�t15Y��n����$��@��+�M3�
݉�_?޾������Tϳ;� ^������+}}�?ż�����kQ$�ȴ~���||>���I/(�����GI�
F:�BU�����_�ߟ/̧�Ff�xӚ���� ���`�N�?WZ��T�/?}�����ϗu��Σr�c�<=�yHE����W�] v���eU9�� /��ɭ���Sɭ\ g�%-9-�<�g� �i�����6jc��o߾|}a�r�����0��J���v2�;��6m.�m],Y�J,iҌ��]l�S:WG..��&���/؂�o����,�j:YO��q�4K�_ ���{��_|�|2���-m�����4d��TD�Z�����#[��b����)fIr|�Qx�:�#�6D�uI����k±�l���H]`�?b�Ld���-�IYO�o?�W���y"��Jy=� ���u��Tj��G�E&K�aG�Q7��7@Ʈ�DFki�C-�@�����q$�s���u�)�XD�ե�^-w�Ω�I�1�����D����#���/�~��H��D|Y%Iw�o`vo:�C�Q�Nќ�q|���p��ZܭOn1c����~��[������_^�͆�]�a�&��gT?��/H�c#S��������IKrw/V���o�iOk-�_@N��(H1��e�� �e�Tk�^�������b�Lz�P�]z�Q����C�4������~v
����z�� ��5�����|x�ڒQ �~J:@�w/֜���6�dD��)Ł���
��bZ��Fz�ص�wՒv��Q��:��3;2^
U�.�v���gu��x}��&��-B �󎅎u���hQ�TW�H��D�b��Y;������(%��ٷ~�G�-!nJ<wbb�� kt�}����Zq�@�/$��;R��m�̴h��غ����H�`3ꚶ�Y��U����=� ��{2�#��Qf���6_k�)%��l')Uy��{����bK�^�h�N_��'ƫuh=-"WL��Bۂ��P摗�ƕ�iO�"�-`���� ٱ�{A��ݭw�%�<�nE����w	N�r�j� ]K���$���.��ԛ�`RlqV��lt.��E�d�Q,��['7�Fou���F����n����F�-bOUX���o__����	��h�Rv�0��J�)V*����BI�3�6T{�w!�~�8�` �B�*H�-ʗ�?Pu^DЎr��C����B�S��9�]r�����)��i��P�+��)��}�TH��K����o/�ۍ�EC�k�hh�n`΁?�<rJ��@�k�`�yT�#
����]�nD�U�D-�j�8%Է�o_�^/F#�	��]��|�O�%���.��0��`xA��K/�@Ż�)5�d�^�F~�ݬ#4�A��p�=�]{	1�Q�CBr����~����K��Q{"1S�uޟ,�f�vy-�y�xHE(pI���Z2u.��0�&T�b�Rv�/��u�6;f8�p��<��e0�����3�/�x�����ɥ�S�	�.���A�)HN���@���,l�>�;���:p��[6;J<������?�~yq	��+��'{WO#)G��ނF��!��D���h;�O����89��O
H�ys��ß�v���݋�O !l�Xv���{�C�Q���~|����:�ΎO{w��	�it��u��:OϨl ׂ�R�?A�p��h��6�_~k̟o_~~y��Ҽ����o��d�-�g����`
���/�#�� G�#�p�����f�=��x��A�G�Pb���DC���92�UX��8b)����ޏ�_�ޠp-=(�5�i��Iv��J7ܲ�����_�}��=þ( {ϑi�Q�� ��Ӝj��B�������w՞�4P��A#�::{�W�ėy"VKZ��ǆ5�֧�o��׽QQ�� ������E�ILM���
+O������ts�&���זNR|������o0����>�C����\V��ǯ/yͨޙ�����S~,¯�� F"x���G\�C!��~|{��6�YS	�5�������"�F����v�^�/8L�� �M�A�����z���doK�j9㩡�Wf��`��B��/�)�Ϭ)9�A7�6J���S_�!gAlVO�bVq��]�ޘ�;rUi����	�o?�^���-�a��A�;�R�
̃TtӍ�.�&�`����i�#%�|�rvX:n�I��#���yH��G���w�u�ȇ�X,��଴�@[�+q봲��:ǝ��A/98) 6�7߾����֦(%�*5�x�Л�ŷr+-�%U-��ׯW�����L��;O.n��bE���0��Ƞb�\ٷ_?�}��k���� ��C�=�`�H5���
x�������o�,��-��X�k������WH�
.i& �c���o߿ Ÿ6�\ŚWt���^���]e�e8A&�����c����t���v�C�Zr#d{�`'^__�Z�H�^Qdo�Z��T����m�@d�� �{�|| *�N���p��y����__�PQ 1!Dx}	�A~}��:ۣ��H�� �g	� �;��Y�B2<J_ڧ ��&m
�b�/g|�����!#�?�
̬���4�Q�"ъ���,���m��sUiP�����"��kd��3�������4G��x�׏װ������[uF%-�9sLTPb�"�ip|�3�mҺ�p�z)V����o�?�߿�C��,��7 �$g�5��ֺ�M��G��ǆ�U��ϗ};8��UƘ�?G��̡�(��غ/�#�9�j����s�����%|�1 �$�Uޘ�y~t�!P��>-o��Y���}�������+� ���t��a>�U����X2h�\l��>�t���ݑO�~���g��Mc�Ҧ���k�����W>��\�$�'�/h�woˠ6=R9s��?&W��B����Y�� a��W�Vxx�~Ip|�����T�lw�̧���V�����V�
v�X�=�����ԍz2p Mi�>���"�����#�����m��ܹ��y��<׎��a&R�4ֈ����51}Ζ2��Q8][�6�m(���"��]h�� !���P��g��"�YRΚ�k���0%�w��#���	m3��E�j���V���������p��l�)��4��4�br��q�zv��F�o�g�(P��G7��q|�U���gꀀ���k>�Ֆ����@�g����G=�X��\9�F>l�5S|�2�A����-L�Bֳ��껻�U��B�ƈ�S6����av����bg��d����
QyQlj^"�3����t��<��[8��Ѐ ꟯_��;*W�0���@f3�#?Om����үM�/���_�z ~aJk��#�� eVk2��i�X�|��}�G�z1�`��b@8Mx-��a��Ɂ���Lf(�Lۡi3Q��.b�`���5��-:�1���S��p=�<=;e�uU�
Z��\�I���F�ӌu*��n�T��ied�B�E'C`����6FUI�!�A��E�)w\G(M)�q��>b����X��Ɲ�r��ŋu�i9��a?3�=��I���yU���[m��"��	����O�'^
N�	u�On&:T`t��@�AI��fM
);K��xgs�r�5b����о�}���Eeu���c���Ȝ�} .$_;����!�4�T�z@D�ui�={�|7(�cY�z"�B�=(���9A��۹��c�y�%��,xD�Z��zA��ȋ�*��m��,u����]�ګ�U�݅N�iA�|s�*_���ɓ<29(�
h�B�y=;�p��Qg�����َC����
}�J����dNg�g?A.3�?��믗���y���u(T��K�����n�ɲ=�}��]�ʓ�X�&���.2s�͋���l��:I��wg1p��x���o�    ���c��޿��)���PQN*�w������T,=���m��עM2����;��XPN�Xv��G �������V�w����@J��g�>K������.���q�� 1�]�]�^�B��Pࡌm8�#� �b����cw�a�����xC	��O���+�7�y�����eg2wB�ȲV!�����x��0

���w��c��`�-Ah��"�(td�R�J�Y-n�=hb�1Hfu����_�~����'bO��A��}�j�n�Z���:`Im����0�1g�2ݦ�w��g�?oU/�U��Ӫ{�����5��1yR���n׶�V�r�����,���__�
¬'1Z��Ӕ����ɯ��p�@I 9��\����I:!NO��~��-+������]@Nu*sҬ�9��|��O�6��?�;v-19J�sb�κ�.�e?�J|�ul��J��i�;�~��`v�Q8�KOxh���8Jw`:;����<i�s�z��e2@Iz[�觥Á��I��	u�GF� �L8Xɯw崋e�͙�c��5��`rE�X�I�<D��wQ��>(́��������{���<����8�B���c�q��@�s���*�h"�bGU���`�r6
�;���UX�z�2 �E>�E2
)��]��#�1�b�:힇((�~t�cղ�.��_V���Z`�w��b<~�0�G����7�+X������v5����a�a-ܝ�N�/4��(�5�]0:���5��
Z������k�g1�k�`bL�z4dP"�+��.�7x�=G�g�Ӌex����#�㻼<h�0�������������X@Lr<\��{��������h� �/�jt �El#�
��������������] ��	����Y,\1O@ȓ�N����Ι�a��X�麖]�yV�Fj�{Y]�J���dɒ�E�
7��;�Bܡ��y`�f�W�iQ�k���M�Py��c��G���v����]�6
�)��>&�n�6�=P(d�5�
�jK�[���2Tg6؝�f/Vp�+3X�����B�॑���5��^v�C�ԃZ���>�3Z�
�U��w�N%��9��/(Pp鉏~����i��Ɏ��Ne<HJ5h�SE��+|}�����:(HUa��l��ޭM_�@�=��
�q�f[����Έ:6�tB��Ѽ�T�lE����&i��Cڞ�a��<� �	�o'�/�ʜX��voYn����y)��s�[��s��2�@������p�X�t���T<n�#*P��po|�n���<01uJ���:[.�$�p7��̱l�����jF%����aASL���j���c����"S���0@�A��p�,����a�6ws7y5(.s�F��S��r~���
�)��N���0����\.<�l��t�ű{7ᄇ�Qρfi��`���6'��[}$�a��Ճ�8)�\/��`�������qqi}v�Jg�������x���y.�~�~v�J����lr��S����G����bE&r�rG[ŀ�Պ7[���)�qN�$(�"a ����#�c-ޘ&�-�j�����
獅�� ��4�}:`�ʤ��A����Y��e���ٱ�x����lXB�5�*d���J�E�}U�S�a�-Q�o�>X���׫��BqD.~O�����H\Q��+`�4�9�q�����g!)����1a�s���sg��r�l��a�����۬<{AY�`&��e6(Ӝ��������{5EIA�ٽݭ̑��i�	.��{�>P��c��4As���ϻ�a[��1$�*8v~�tvׇ����Sٻ���k���0q������y�D�Д'�9��ma�*-��Y�5�Y~���9%/%�x��B��]�*#@��!Hei��]�C�[׍Oe�V�](��7��!đh�6\0�!���������i"C�9|��n5��q��O��)�J�"o�F�io�Ρ���,�:���(��7.��q���v9x��$��N�.ǆ&�fa˂����j�vJ�'Eԩ�������s��nG�V�=mŃM�H	&\0g�H�����si����;��0tK`���u~�)gh�5�N�玃TlS���E����cp����
��K{�ް��k)�&�I���_�߾����s�L�6��EHZ���A�9����!��?0��eJ�������b?m�2�ak�Ǽ������O���/^����Q�^է��-$���蒜5-B}�>�I���q��p�d�O�ȃ��˷ן?�M+��G���a�@Ɂ�[�Oml�Q"�t�`\ZA�m�s�:N6����lK��o�����l�j���q��0���E_��5y�S7sZ����K����y`����#��f5^�wW��@'HH��z���vw2�&��e?Z
��JW*Q��8NsW�\���3H �W^8������_��e٨��S��۬l�ϓ���e�u��z���I��#ym��zW�NVO,*|	_�"�\��$�I��w�QK�[���$i*̻�{$�TP�4���'B�N<,��y� J(�>;��E��ݦ�]�a��d��lszC=�}{�x
)��+���{,k�rH�{�ţ��C�ق}���^��*�yν�|��g(�v"��>(�z�>���y	�Gh��4k~�BpJ��@��;(p�����&��'���2��T�prN,m�$�����c*�}x��0Y�M���A��'X�nAf��<��]P>� �����a�yZi;�l���S_�_�U��ĳ4�_ ����m��m�Kv|
��j��An�G���s�:�1��bN��!F��-o����p�Z-�C�q7���H)fM���W�wD��夳��c�ȶ���Ƽ���1��;HtC�'|�y�K�=�K�
k+�e]?�(
�@�PJ(�ه�bi�VM���P�_������+�vvR[ݎp�3�l66����+�u�P�XM�S��%��NͩB��m�A��#=N�]�e�\�CՔ-��"ҽùE�/*��P�5��wh��6��(v�z��c�jv���U�S8�)st��s�9�t��u��τ�?6Y����2[d.��ya%�[���Еd���PA�Оb��`&a!"�:[�f���v"Q��`(Zw��:<�
lG�7���&��� ��ߞc�ӳ?��	+�C��m�lOc�'�-	װF�eO��?r`���vp�cb��an����0�#�B�{bb�j��G�O������Ȍ����T�MN_ �O�H{XK;GM��lj[�I��Y=�A��U�Gڴ�?a�n�~�9Y�Q۶Ӿ"X����p�v9 ��6�����Et�0s
y~���gg�l
�*��_>>�:t��z�+��b֧ϻ(W��Զ
�����&�jZA-�d[�o��;hJ���fծ��[��o�ǰ52�x�v�؉y@"3ˮ�CGV�r�j~����x�1��"���hO^���QH�AU����)�}M�3xH���������.C��<q��y�s��W�ob�xh1�KS�٨���>�D8b��*5�R|Z. |�;`����2�����T��BG
�<B��|E��C�F�ϐ)��' �Ԉ�C�B�A��C���搞���{�DWVq���z*�֦?�D��H����f��(ϙpf�1/`���v\�� ql��>�@B�����*zABs��C4\:�#D�Y�KH��_敛'���!Q��pP�g�|��FAK�)��\�G��/ż��^ƜV����5��'#e���G���>?I��w�
��ZA9��x;��Bg�O�6���gwDwH���t{n�u�{2�(n�r�fJ��)���oY�m��QdD�l}md��(��g�,ʟ�@�ꑳ�Q	AA��)2~������R���W�9%Ü>�\U�N�y�@�QƎ�o���
�(m�hH���W��cb��ۥϋD�W\�g���+|�ZR����!ث6{�5̛�� �F�) a  ��`�5�/�Q��k$Uma�X�s�+QRaЌ�'���8q�%o�W���O�Wa�i�s���7j�_�P��(H�yk�����4� e\A������G���.��=P\���%���&A1�:�[M���@��|l$�j�`{��I���C<NBH,ff����
�܉jP�ﲀ��H��9!����X��O.�j[��`�����d�ۅ'?���q*�~���y�!i:�ǥ�CK��8�dMH}'������	�Xi��D���@D����E�y�rb||ܼ��F�e',3�J�Ƭ"_=U�	�h�j�G]>�PG��Fy�ª:���ļ͋��t�^��O1t^��١re��,�X%��B�
�����+=�2�d�9�*��M��ŕ�00�?P]�M{T��c����4�\N�+�خ�/ucf�΄�>_��@��aq(�S5��~���.�b����^?�fO�m\Q�S�Q���3�콘?XE��i��Ϸ�S����̳�8*+{���$�2 �h���߷g�+P�V��fο~ތ��6����-ϡ�j��I�T���)!\7��y^m�a?7ߟ�@�����_�����V�      "   �   x�U��� @�3Ta��r�ePDb7) ��`cqrJN��f~9���c�\ϫ ��B�yXT��|V�JR�
�k�4����*���t�v��}Pi�b���;�;8���QP�ʜ��=E�h�koPk��d�����M������GN         h   x��A� ���/�텅2�u@h����5��r�hdwqG?{�&��B��T�[4DaQ�J��t���U��]۲-q���k�"R��B%(�k�� ���,P         I   x�K��K�L�5��H-�;�0O!%����|����|��ĂĒDά���<��Ģ���D�P������\1z\\\ ]O�           x��X;��:��Upt� ?`�2	�DK�5H�[̼�	�&{�C�f	�؜K��P�bUW�l ,�\�Ϲ�"e�I�:�::i����r�0��zQ&��E��u'5����ͷ}��o���j�D�H�gE�2=�����Uź����U������������9�lhY��ҤʪLH^�a�W�GN�G;��ֵ�ao��o�֍^�9�h��QǬ��xxkn�t���_O�n��W�c=*�ݼ#�O�]�U�2;��E�o������j`V������?b��G��Sޚ�Z1C�
��4K+δiquXbM۫�h�����)T?�����N�ҘՂ�*�<)������:e���eF����XQ���*�i�ߑ�Fwd���Qn��Q���O$�Z�_����i�HdJ���ҀlP��F�&Ţ~�^����r�����r�k^�#5�<t�)�.�����v����2���0����!�.Q������>؄4�n�Q�k��'�,�RH��0�J
I�,���b�O�{?��D/޵c[+f.�hÆ]� ��L�jI@�Bx��s�\�����|�@IQ��3�o� MD��I�w ���i�esĆgb�茨�.�!�|9�f�Rf2����_u��]�ѧ��ݪ��W�%i.K���:��I��$5��E����n=z��Rxp�J��T0����C��w�1�H���y=ڌF��\�R�iR�H�����S�_DI/ڍ�{�E��֨���v4�L+�&��h���EQ%eU>\�Ջ&���_v��e�y�<KQ�E�?�RO�x�5�B�[��9)smq{;���r�}��E�Şd\Q<OsQp�P�_*���~��퐝:k���Mr2�����4�%�g]k�Ӑ'���/T��Am��HK��'�����y(�W�dL��_$ǖpG�*賈����&p����l���\Te����uh@�»fhp���v�����6�=���x�rt�TB� �� m>ێ9�Փ8BH�+� ���ȑU7�p6-�.��SC��$G�ɲ��w���b"M3�eqԩk�<C��éh����,l^��%�E����!��Z�s�:���Aj�����I�)�J"��w���N��N�����u�.yD����q�cĮ�����
J�hTs"=�Z �H�'�#��"vg�5��4)�|Wi��3��N_�/j��Al�����sZC���Zޓs�\��%�����`q��rJ��ۖ�Fڀ�28s��� ��RU����a�ś#�zP۲n��(
	��֘��g�:;�<K���oHb�jk�����Y�e���1�"��<)S�z��Kc��j��}9y�#R�V����\��BJ_D��Oo#��a���[$�p�ԟ�{Ƅ�"��e�ϓ���@���A��<71��6�9����G���,#R`�"�x��=u3;����{"�\8��@)�H�b���X�s�أS5���c�_�:�F��ώ˗��T�5v�b���DWp�yY2����4RN�xg���<�h�#W�Yϓ��}W+�y���?j��Myh��=�� ����c��9��������&�y%v��
8�Ȓ4h��gt���.�:b�w4V������:��:˝�7���0є,��wsU�`�����t~�+�{�[�$�^3r�J�8=�=�tu�[�YE��g�%����2s�5�#�3�YQ��Xc��v�i	�P�|Ϛg脞WU��4�hB�s�|�E�N���ꚶgHΓꉈO�oB��(1�?����#r=��˿�A����ta�
��G�	�k��q��/���^�OX��&߽�;��з��+�c� U�X�'ѳ��q������^r����s�	���M;��&꿪^��Z*{aY<�\��}J
Д�y.���fl}}w^���ʡ�� �h�>��V��C
�m?�������.��`[i	�W9��9��X%T�$i?ig}���mu_f��d�'��n�u1�h�8���G��#ʝ��ꈁ�Έ�7g��(�[��=�=����p��9�)            x��]���8��9_!�Z]A�ЛوHBK�&	)jV��O��16�[�~�HJ*Q*�����#��R�|����p�2��*���.�n���]4�*���ͪ(m�e��u����m�Ů�r���n�Z���6I[$,�2q�Εŋ]������l��~ؖ���?�h-��^�&�<���m����~E�|��-VvѺUW�mS�ߤВ�4�b]���6k_��+,�}c׶̵�P:��v����B�A���UW�b�V[[�즶��6����dҊ����ٷn����`e�c"�<5:��%f�}���-J�X/�Iv��������s_ڣ]l]�@iW"Un)~�2ٺ��54S�f�!��R͇�~aZ�Q9�u����9�����ֶɪhV�}O9i.%��@L���3�U"R�e\i�_��]�7�g�F����]�}�88������2�ι�,��_lR�춨]��r%TT��Nݾh�l��s�o&͗��.]S�v-Ω�[ȶ�<��b:�D����+V&cؔ����E�\s��@tx��q��`��i���/��}!SN��%~k�FK�2)��<eK��׿��=�o'#�J��'���^��!:m�;΂��hKٱ<K'���"��Ԩ�
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
_�� ��T�Vif� �m�Jy���n�'�t��~�>r��R�,t7o\K�v_���#5�c�7�P��2�J��|�=s�ّ޾Ԋ���;_Ro�{�"%y�����^g��F���~����/��g         [  x��\�n�Ȓ]��B𦻁
���-�Ώ��|�Lf2�|dNc>�����u��Jr�]��e�e��DJ����$�*J�fƠ�� �N�b6�L��l⮚+|���|:�^ƄkI)'Q�^2i�c���j�Jk&����xp:%���H3i,ﴘ��IK�!�SCx�I�t5	���-}o��kD�̚6��^n.on�7����K�ZR��p<>���LW��.�2���O,�7xBrn�0�����|��.�AZ>^}����?��#(d�ГD@
���7��@Y�O��f]�,�R�-(7���oJj�#]9:H��oJ� ;�WP�JnA��̏VSN]��a(�6P��A�M�'����{P^D�ϦoE��9��mWHڳ u��8������ -d���~uU�����W-��MD6l&�ND��M&��1d¯$g���\݅;�SB�hFD'��"�IE��@!�0L�	y|�?����W��_W��X�C]���b6�,��	�z4��<�Sr���4���kr��C+#�A0
2Vn�bv. ��n�>�W)��u������۱@/o���� �/��k�U�@��F�o7�����>����#v�}2�@u�@U�2��}&���U=Hӎ��p�j��v��#埾K$�R���l�\?���)AQ ���)M��#�>s��(d�ckX}�dD`���l:���j�:0JSY(|�i����=I��S,gX
�G�p��H���j	&R�e���!�9������70?i�KL��fb'8܎h�_dw@��ɵ��F%bso!~�������Z�^L
���_��'��_*��HG���??���?��%�����qز�g�hHW�_�(KC�.��cZD���8��QR�8�b��vBq��ē���5^�$^n�K�Mqw�I�>^F�3���?^�6TAx��_��2tn�6��r�}�`k�������d�$VŠ�!b^xV�y�%��RmH����ex�/�1]�7K��/��F	�>���@A`�+��y�)fཛྷ��H���}L�!�6��f�:�*�\�7���:�H�2�A�CUf�#�{�w� �n����2h�������3�b�Y^�"q���X�n��ա>P�]�0`N0��/��
iq. |=bQ�)J��G��# ��f�4J����w{K�kG'�ؐ'�Me�&�m�R(�Q��32�&n6��L�)]E� �)M������h^��:�}��B	}���z̔�ͱL�j�E�7�@��%�fq�F^��^t-�gM|��Oq�ʗ�)9�%��C^����_�+9�P��CD�Yi���P������@��@��R��� ��R,Vo��a�e��̮7�L������Gĩz����	4����Zξ+P�I
z�ɸ`a0��x���w)Dϡ�U��R:<���+	!c���s�.�96������B}i�UK<�d��� ��h�j�Q�A������� �)U-wd�����^���Tm�Z�ٸ�և��#�Tk7@Ø9 ��������$jWR�"GtXY��V�� �A�#v�A	��μܬ�{5�~WT�v�%�ǥ���-��PS�@通t+H���@�~��l~��i"��X�e��nE)���h7�s�2�h�� U�542���IV�y�a�A�bgh�:�!Vcb1 �v �}�XlV�q�����F(H@ԘP��w�>W�#r�9h�`K[C-��Z-�k�SR��,B'�Doj����fqdC���
��(�� FC���Q���ؘ2}�ڮ�,�����L`�����(�
�^`O�o�G�(ה�`�ȷ)��FC�Ń�;����8��@T�C���NאIQC,Xފuq⣡��)AY��� Vb�����m�"	Ue�]�Q���<�������.X�5X�P ���f�+o�c�٢!$xgh��h���qJT,A�6�NPa���t�g�5�ηtqK~�q���5������dr5ж�GCK̇�jI� K�c�C��b���q:�!�#��ZT�I���1Z����*�E�fʉ�h�I�����3��U��E����������ooFzl�M�����(b���j���ۨ�-�������4���R�HHC����*b7����M����i�l�@����z��^}+&��X=Z,Sʸʪ����)y�,��b��H�ģ�!@�M��Y��{~�Yܞ��5��	v墂�Pi[R;D>o�?yD�=C����:��k��+��h�?��'��+s�ؚ����k�@%��|ܟ�%"_��B"��bR�� &?���]�G��]�iI����ݸ������G���b�q���Ek���D䓖4��3�8kFK�&f#�l���6�!w�H�8�҈�b����흎�tS3�ڠ�L�~��_ͅ�J�~u.��͘�48-"���
E��nğU�#�2i�od���l�o� �,P(Y���i�>]/E��L�2@9��2�����M����Sp7U���"�8x`�Gw��,ϳ�$���'��^\a����3��Z�=PZ"�T� �k������R#����)��Ȩ�K{wo�(��Eu�I��dx�j���|�AZ�a��ZA���sw6?������������3-�!&�DR��J�*�K���ç�2wx�s�B!s���9��:YB]u$��NF��]�i���xIA���R
�w��(�j
m,3�:��۳��!)v�^���J��&�H��+���\=A/�Dz��F!�%�3����\����m讏`��g��W$�\	��\%�+�͖/v���/��L׷�^-!S2���*3P	>�
��<t=�_���������$��
`J�1-�������W��W4�FP�^���ޏ���d4���7�|Z�����u�ѭ�"8(��AŎB�I�w�~=�be�,!I�A�� z�u���s�Z��ʠƝ�B�x��Sn��{�,8��a�V齻�ĉ�$PC5��0@_�����&@�i����{ypE�S���{>n]*�jH;wg�$td�{�� k�W�{yNB�d�R�h*�{+���E/O9uu�	5z%P�{�M�/�{��A���M �d�����ޡ;�,2J�T�-�ݡ�,ս���f�.wP���H�"�n?~��S���X�(Ԣ�!��2��a�9U$�������D��u񒗧�A�(CYZԖ�+ذs����j
"K�'�r�/yy�A�.(c�7}����L���6��!n�y����
f��9�7g4P�RP����u�y9?�Dv��5�!���|�V�䝟S�Fێ�Z8��X|���˃;�N<��Si2Ԛ����.��<<6ta�9oSH�h����\,7��s�{�;�g������f�͏d�5h��pP��S������%�{��{��((Z���������S��.�,���A���>�yM������YQ�д�Xs=�r�Y>ݞr����J0D�b�m���02���t�ܓ'o���v���=;/�Q^��0y�	��^Z�+�]k|�q���j� 5u		UM��V9≯x���A$�uRYd���7c,毽�w���Շ��         �   x�}��q�0E�q4�T��,[`��ݼ�z%�X��&3LvwFs�ѭ��^�Y���ǈTCA3;[!�<XZ�~/L=����sIXxǬ��9�	\�x��\�s���JH|�E�ɮ���2[�uuHg�m��Q�)h�4
H����g�����d6+������x�Ϥ�_�wc�$kX]7g��h@����L��K���Q������ h�>>C�.(������j+�z      &   �   x�mPA� <�+|�mRc�l�w�^l	��a���W�1)e���ؙ��]F9YuB�^(@V,��읯��`{��B�pк��rȴj���ŏox�^����(n̪�<�]0|�0���Y���`�ܕF�	g7
6k��r�"*�0$d�72,�L��Nh�*z��6��GMv���ǵE��sd�bc7�	G��^S2�-���9|���h-4X=�7�i�ݞ�k����7         g   x����0�s<Ep'�%����$Mk1�����j(a�3yں[��ٮ����Ja��=�-����l�;��W�+E�S埧��zL��D�_(�          }  x����q�0Eך(H�]��3��6��!�>&����,<��.6�I��{tu��@��f%5XT3�6&���A�I��q�Z��Wݙ��-2���ꚟ��b0���#�קeA]F�v�@7'�&�� �)�H���:A��dz�_�=5�1����R�evHy��c�F�c��8x7�����6b���7#�sV�U^]��C�u ����p��� �FD?w;���e��i}��Rf��\��nk�Rr �G�uvɈ��&E=#K��H����N85-0M>@3��C�GK�:c�ſ�8�����?�deZ���q�]G-�en_Co�8sؓ�6�E�=V�khPߥ%yD�{v.�0�{�EVU�!����t����            x���M�ݶ�%����Yk}�˲�~\c�H 	<�� ث1��Y�j��!�����=�:���#_YR�"v� mn���<�U9ʋ�~�����'�V/�����������_������NV=��8i٦������oO�ZA�:�t�e"���c[���������ʓ��E����w�/�b!�Y���O6������S��L_��_�|*�Y�ۡh��R�*�������T���l=I�m�E��q�/��?����R����N�0"qο�����i[Lb�i	�Q�����L�,o������o���T&�0�R�Sa)�������4g��͎*o�/n1����d�ݨ��ɐ�h��������14�W��W�	_�Оj"*{��.���dѕԑ1o���\b�NF����"���k=��-Á<מN�8�󜺵>b��+m'l:h��{��0���oO˶�T�3�"g� ���>2d�~R�gO�?3q���i7M�en��/嵖7�AKE��y:�q�H�I���?'���`?;�׏�U1:�|�q����ˍGX�$U�qJ�dg�_�Ĳ���Կc��u�_f��O�Α�yJ�s�͗!NL�Ǌ�<sE��vx��'��gZ'�ВW~��y�py���a#܎�
)3�xЪ�jj�M�@�����`��-��=|���)��7*�KN�Be�n��S:�֔�� ��b�U4��}BD�QѹMqm���O�yd*E+�'�@t~v�$r����/O�_�ߌ���?��4�7:�j�d�_ ��SY��4��L�JU��t��Dz�Wb/$��R\\�����|��􏧓�F�a+^�o8����8C~�a��[y"y��cۺ'�]l���`����bx]C��v�ښ�.�u�Y���Iǫ��_��OX��̳�����A>r��G>�8��Ӫ*�M��ܺ����S�a�D�P�;���hn�pI-'P��Dj�X�̭ű	�)b�Ѐe��xӳ!�D=:��/���;���"a�
��b`�4�lS�V,y��!�L����t�YP�|��J�$|K]��S��l��ק�!�s+�i9@lqcW�ZO }�5��DM���B>\������ܲK�y�2�9S
�y�v�_�\�>�(����s��_��v�^�ˤ��˗�}�o� ����+~�?�[��i����K��۟_�6���?�����OH���U�J~��/|���yc��d3��7����F/����l�/1������ۿ������׿���_���l�K�SQӤ�J&F��fl�Eѝ`L�q�{ﱚ�
T;@]v+��cc�N�{u��j�~[��'���|!\d=.�&�כ��D-?��<v�;�~K�����|�Ra/ED�^�x��(&p�S%Z�}�,���#S��JM�픢��Ah�yc.-�/"&o�њ������OQŝ��#5�i�W(����k�ށ1*�ƈWX��?>��fANIK�JE�O���e��Wo���h������|��?�>I3[ʬi:$禯��n^�s���)LK9x��8<���晄
3���ױ��SN$��t���9��?%��S�>��16�i";A���;:ލm�G���ʴR>������F� ��'~2��f��Ӛ牦 ��C�>[��9�T}�F	L�d����[9�aɬ�ӼNk�f��};v�\���	�'J..#t`�#� �W��+���̻��E�ɹ�=E����f�QU������8�D+(�1������A��ۍ�]ȝ�6�p�[����
��T?��A�+���y����罳���jFm]�/�w��?�re��,O�Μ�R��)�Qs u�V�w&�ъ~E����u��
@t[�#.�e�<�듍|�L�N���ͣz��R��I0����+�6�Ox�:3��]�\��K�d�	�̞δA@� �e�+)���3.71��?�i�l�n�7�ȤqB��c{��-�i*~H��Q;'��A���\��@�ө�ԃ�o[W����<�C횼�XX�	�Ip�� �f�UG~�c����H�j:���������u���Z�T�;h6�BkذM^[I�iu�w���pq��BFl���46����&h��R�}y7��� ^Pqv�C�}��s��V@�z+Tm�d�� h�4�>���������J�����u�ڠ���N��IG0S�Z'0sx?�(�����K�a�g6o����)�����
6�̣ʟn��֌X���E�_��+6��'ɥ&@�,ҩG%�+s�❖�g:���e�֙o<P�S��1��V���;{������X�o_{c�6x��5�;� �i�3�(�Y�Cn������9��
�p����5�2�� �>b���<��� �w^i���Qd���h�Qķ����Uiv%7y|�������,��̯@�܏���+��r(����z/��Ղ�[m���p��
����F6��eY"���������� +k'0��� ������qePFp��vG�@��|9._�A�c��l "u�>���.�!���(�,�/ye�i�����Bў�Q#�a��Wϝ�`�7ŝ�uS=E[<g�]�������e��FP�Ѽ�#{6(�}�$F�uy�r��F\���!ΜF+Qǖ���}"�y��~�,l�M͑Xm+�0-��{`�9(�3H��'�X,GͮfRnkxН92���o9�o����_6>1�5�_����w�@~��vUS���A:�s���>a�x�
F!&���}k�!eT9%Z�t�̵��X�=��-�<N#ׁ����o��F��1Ҿ%A��J���奣P��#�"�J�����K?6�h�3C�^��U�t/Ѽ��G�����OkE�3���̴��w�YG-������@��I�b��$�g2d�#G�ĳ�à�aa���Y�^���|�֢xGA��$�cy��>�NC�o儗	%��3���������Y�Ы�{�o�@w M���~���1�7�o�������63x#�;�c>i�H:�>қ7>�VWN�в>�n������0W3X4?���\;�Y�Q���v	��E҇E��'�P�_5�߾��ӿ�g|���P�6Z�K�d�y\��<'�:C�"��
�0�憥!�qNmq��e3�Wy^>c[t$�[ӜN�leW�şyW|����?޴Az]�����Z2pU���%��fң��Z8�O[���j�?����H1t�4[�fxӇ���d��u��^���C�\Cɔ�i�$pYݣG�|��V��4,�)�s��=O�ǻ�#C��m��Z����+�CD�)@$���|����)��g$��-N�Hubބ|����9����5�	��3�Ѧm]�dvP���9��9�6�In��6={Z�SGI/�dr8(�g5dV�P�,��V�eհr�n�-�RI��/K�B�˓^����i�Cd0�o����>ʙ�薳J��M���@YOk%&�����r8�ת�u�b���#�v&H���
�O?�����|eفD՝V/�Q�?y���x��&�D���FP��� �ސ���{��>j9{|ڬ�����Qs[yQ�_��[h��iN�����o��_�0`��A�R: �}�P��&�5�2G�չc��I�?�2Ao�p����Y��U��KEK�v�Ċ�_��k�_��n� z{g���8�0e�N�]3mN�^�]��Q��B��,9MZ��t�'�R}����O��U�p���,4uҔ�Ҿ�Y�Cm��$���f�����)	�N�^�~�3�=4}EW�����rY���}ǷY�
�f�QZ�Ll������^e�dґ��G��qZK%'�J�zj�PW��ԣ�	+�e�B�?��}a�L�!O�s9��QS�]հ��*ڌ5�[ 3��@��5��=c����ff5�Ę$�A1�]$	��4��8#�Z��b&ryg7��� ����$.��69���1&�%Q�������8e�e�u�=�A�kqc�싘�M���L)��TR_�4HּN��`lbõ��"6��a��9RYc�C9MQ[wcMp�� B    ��H�B�a�ۡA�$�������a;O,�96Eŵ��vs�f �8k���풬�-�MZ�]0�P]��v9
`W|#���`�gG�)�~%pm8\,��)2/���n_�*��|0��䒊��h:CCέ��{��f��$�v��$1mK|��ml.o�֋�+je�&VṒgI�����~�̎
�[�	N�f�c�V���ĸ��}�9�d��HG���Y/�}�~��k��!XMFZ�N_y�ؠ�	�.xI����LC/QEC4�'h� �#���1b���|s4/y�ifllZ����
��$
)��ie�,C�����d�-�o'��X@G�HŽ\����zl~��#�H5���b{)paxWk2�fu�~��N.�`�%�3>��16i�9{�7[�ɏ��SW0�����]���$+7�$2���z	Kc�����<�e�p�y&�c���K!?YGZ�۳UV�9��L���D[+(�?�8��`U�6�z^5Y�K�L�}��l;�Yy�֝�э�C�T������g��Z?�iڹ`'�֩�m�
�d�(�s;�q��C����2
`�N3��e�ŧm<�bbhu }.�w '���~��$W������kA� 5r�΂d�@F��6�w�2��gp�"� e�rr�����)h�[�Zoi��e܏-��v�G#&���d��`��VcXi�������O<םvuj���@�Z~��G;�>�����{�ؽ9@������%���i_d|Y����n6Y�g���2����v��uΤͲ�������!3�O$E���X��t]�z�%g�}�ωt�w�A����j�I�)���q�c��u����ܑ2����b�����q�XSC�<��I�NP�<�3�F)7�L������_���Mm�`ТV�Lr�*e����H�<�������3ˌcLV��.8V�ujC���>-"*nm�Xr1�̶���+M�/��|f���[��r ���K���w[7Bx���v#p�qU.[	�����&[�g��٧~��P�H��C�R���Qr�5n����G���sH%�Z���V��sLJ�1��FDZy��Vy}��젘��(98l��E�8��H.YJ6>��s���a��U������3�Ȱ^���
*I-��W�^�:�CTR9��(��{�� ��Oj�{��z�B-g����5R�U����6���nmd�[�e�=�e������?P����i�rz�� ��cWH�t�x �)�DG:�,<P�,W@p���?����<�E	�4�>�!�t��Bm�@�������g���մ�t�X#Dp��p�TH�wѦ��mƐ5�'�7.*>P*��,-l"ˑ�@��4��G%��^�r"���Ȕ��+�d�aw�t�|`bl;���V��06�c�BCNT6<��gnWI[N����J6&&dC�Ȫ���)ܣ��'�#��]���Ӳ�{����:]�f��lG*���]�_|2=����%IN��;;��NvP�;�-ᮅ�#0��tA�w�jiP����Ԣ4��U6-�d����_4�ݹ�׃a�?�Ci�tv�AR�q�Z������ˢ	*�o�Т���f���_��1���_���H��߿���M���+����~}��c7IH秅�\&;�.�Z��I�(�S���W~��G��AԞ.�I�G��Sk_�T����U��PT�� <����ͳ�$|��}�������,a��ȕ��p��7�'�N�!��5Q�7t����"f0��S,�qjT���b��{�#�-/���4��,')1�3;�E�|l��_{*kN.�*�E
�Y�g����5�:�������ӱ8���7s���z�n��i�sL?�b�K�$3���~b���I���w9P�{&� �����sB��S$Ej��ys��n �=rE��x*��m��|��E�\�>J�&�u�\O�Գ�2�9�s>ҹvKlߐB�w����ߡ��h�'A�Է�����۠���ޝ_I?���kY��L5	Llm��3r�2+�s���nE'�f�p�ٛ N'����3�栊�j
r��M?B4��ڏm�9H��H/]"�O�3� �����eX[4�!���� �-n����lB��3�S�����ok|��0�	^	6����|{)�j>$�W�U�[��Ak\!F�:���{���S̹�U�ӡ�46�̬}��d:س�z�V��[ ��G,��m�!a�Z��@���H���A��Bh�c"�V���[�>�
=��meC*8��5���Й��j"c�����*�)f	��u�	�[�8[��	�(�Y
y	�c��M��k�I�8��'�Du��n� _�����Ҽ	���qb�������O`�"h_����ە�=gMD�:y���M�Ϙ���1YR�̋`�`ZkN;Z�ڗ��N}��ץg[��~���m`h���B����|[G���1efO�D9�
���ѭd�z�i/��ջ����pfW��+<:�06ȗ� �4e�P&x����ֺ6�D�t��߭��س�mZ^)D%F�;66	}R�ґDF�s�j� ck��}3rF�3�eF<�Q7�l�F���/�ν�Hn/��~2�Ԥ=B.�[�C�0Z�Xr�y�3����H;8!3/~���%ˬv:D���a����1������f
Nm}%�����2�>'����'$�m�˕��zC��A���Y��2�ؚ]�� ����=)ẝC뫾-�fa�O�s�ߐ��j;��ho�!��������y�pՂ�����{���AKs��D�I��EK:IS�@i#�z6]ԡA�w� �Ӓ뀣.���,�	�K#v�[[)A�'�x�{����r���Z���\2�[)٭	�ؚ�!eY�@%ɔ�^�����Ng�������'��j�
��ɫ��FM�(��C��$5����q��Ooa�-#ʆ���(���r���v�:�S1�	�J�� �xݚvu��2�rI���ɷ&r&�B���E� �B��n*W ��-���;q�.�}��j ۲�{�'�xr9�+��9�3���ܴj�܃N~v�`���aqw��-����y�d���D^�qc{� c�K�B�s���.3.����m�I�7j�x�һ��D>��x�������[d�2��l�C�/��C�}h���Ѝ>�$�/��v�`v��twOٻ��C�x����{������G)�����q�@Ȅ�Hs�z�9�aq����u��m�����fD�*D��,����O�a��9 OXk���K\��x`ju� �<��{c���� I�3�~+}�DL���'�1����7nr�$�g�|���<�S�2��^.1C&n���z�k�s�k�a��I,��?���f�l�����v��@��]�����&O���;k�^��[���S97�o��ch`*?�N?���	���˂G�S?3�OH�7/��Kd�����l�k�=
*�>��?��b�JN#��$Z�~��㯩n�DB�s$;����_�bOmr� ߪ�W�j`M���;�j'Yx���퍡
v�ch�V��p ��Z�_��KU�l,n.]4���9sP�3ϩ�I���aؿn�;�i�m��'&�[��y��Q	N��A-g����C֔Ӊ�4b��o����q�aP͇`��鮀���=�L�9V�MơL;˲ �+�:���qc���jW�������mӌ�^"jk�ٗ�2��-�)��-�4ƴ�2L�ck�(�s��1�=��G���/�:S��5
'��ļ��* ��tJ��!5�A�����"�Bu� ���1;,�Z5#�yU��nĹ���I��D!i�`��~�Cx\�Z������W�r[[+�0O��w������b��d<f��< [S���:���$ck�5���Ijs�tF5hY��Q3v�� �pM�<����DzXWZ����]����3>�+����Y�0���2Do����"��ָ���o�X{/�Z[��x���:A'�m�&ҺO� �w93�ޚf� (ͤ���؛7�%=/����G��Sk�?�ٙ�.�7��;    Ã;�f)�&�Qe����w�2�\�sqn4�U�7r��~u@ �lf�[�G�Q�X�"8�i����J�&R��RB��=�����=%9��J��d�.�&N��Ρ�|h���R��'
��L1"��oo7�h�̲�{|�$�7�K�(x?l�	�r6�-���#so-����1��
�~TX��Qt�Ӑ�=h�J��J�K����P"!�i��*�1�k*�����H��xe=��Ի&2b�h�ۗ\[�MP',[�m�CcUk��[ǋ(��\��[���({�r�F�.0DfҞ�/���]z�1o�^��F��<��`�
llm	��4��j����/�v &}�����;���uk�ڻ�
�"��al.��멈�Di���@2j��������[��'��O�h�m#>�i�)?7��~�����Ɖ��ߗ���.;���E���H�ա*B���4���ؚ����I��T ){Yb�Jm$s�d��z��-����-S�k/��e��>��Ӏ�6��4�l��W�Պ]Qdi��-�7sNVP)���tXzi#>j8��)�}�tʬ�Ά���J- �+-;���z�^Cy��e _�>��y�A*^U4>�����S����~!���yt�F
�Df;Ud�d~���'���X�z�)>�u������$�p��d,�(�,>�F�R��D��Mo_6�#ȣw�;H�|y}`M
PN����8�`|[�l�FD�}�������XGx�MH���`��f�������#��(���	�=��W���V����X��Q�U�Q�x`�	YN���0�Z�}D���o�K�0\���"����u�Bڭ��kX�]VW�!��Eڕ���B��#%f0˾�[�t�z��Ti���l���C����:?���Đ��f�����o?fJ����jǮR�ɏ
,gS;e�rb�I�������R"�9�OfX`�:�L`��/������2�cK��8SŚ�!�~'$wޫΘc�����ꈎ��ͧt�sZ��]�����ٯ�<X��|�ޕ���[�9t���Q>��G��Os����ZzD�n��*���@�W��2��5 �y3OX�t��Ʃ��{+�Y� [����q���5.��%|"��*��R�:���^%Ub�����xo���w���19�VfP��@��ށ�I�������m'�ՙ����h �*�ـ�9�h��ؘ<܌��gb�_h����������W��9ż�߇բ��N	?W:hs̾�u���7K۩�8.>:�=n����c'�1;'։{����m� :���am�q���r��F#sg}�>�w'��ܛs91r��������3?g*�X*�h�ͽ�b�Ok��pn�Ns�A��&�O��x?-BDR�������Q��mi����?��k�����|G�"hݜǤw`j���!@���/IUu�r���� ��~9��ͼQ�>ٍ�BY9u$I�II�4�U���U%~���Y|�>�/���4.|�^!~`���o�АA`txR������#.N�:m	>k�Fig@���PA ���f��&3t0�����w�z�:�t�^�=wGb�������3(}6Q��}�B*�����Jo}�F���f؟����m�	��>�n߈DA�9�)�����ir��)Sl?�Џ��pҚ��|I�}Szo	��`a>��k�Т���F�qIml.Հl���x�<+��V�j�f�P:��wu�ϳYD�Ԅ���t����yzd��"�>��4$��w)�yؗU��ieڠ��C7����V��V�Fq��4۫�=�5��t��la�Oy��L���on��L��Z���"C�H�pL/��g�R��0����vx�ǃν"~�<)H��J�)/��\^
$���>���)���M)�#6Z�7Q~sZ��-��)�U�SڷS�Om��4l��kcH@�^�$�bP�<ţ�2����-t��+�bD2gʎ��k+m�o��H�������8�o[��:��/c�Y�c0;�����+�zD
�7�w�:0کo7��ͮd�W����=�H����
X���������ĺ"��a�;��]Mo3�4�+ِ#wmik��<����TcJ3��P���ƭ�v�r0f���B��_����7Sՙr #�����L��O�W0;p��|o0踒�e��2�)�ɬ�,��BcJ����~n�U�E���'Re-!���Ra�C0;�\���rU�����șvz�|����}����_k�~9���
�<F��S��w�s� �8������L�T?2l�>�Tzǝ�_ɧ3�l�ە�����*b�%�����$$�ݡv��}'fYA�SM��yF"�t�l�'Hy��\D��]�cw�fҲ���~���z����)-�Np�"�R����R� ����w�x���C,�*���e�cl����fpE>Ot��y��Xo5��o'b_u��`ˁ�б#����Įܽ-��N�zq =�>�m`)*����:0��I�CK��Ȧ�k*1/d|񯷄t��)�;�������f'+������87�r���O[�4�
9�j@f�?Nu��)ۯ)w�z3׻Ԭ{��v&(��&L�^�Ijp@41��/ᙎ�{?>�}Vsg��BXAS��v˿	ԏq���q�zM^��b�/�����&�P��<_~۾�������y2$|f���]��ER�%�b�!�r߷��NI��ߪ�2t�<V5f�Ck�}�糗9�T!�oq�e�����ЁG&����W���o�?�jA��|�i��~x�m�O�������'����������k"䕀y͑�d������� ����ob>���¦�ڀZ{�b�{��K:��vlm�+�����;���ƺ�
�z��M�����U�������a���Z4�p <´�w��}!�wY�ABq�4��	����⡐�0��we���I�ԗ�ੲ�AX�:�M�R����X���ß�<��o���yve��6��"dW� ��Q]�8��8K?Y� ��AW&0$'݂�4r.W���d�;K�����,M[�G����z�i������'ߘ��y�pD�[Z���:�Le���2�{�f��_�}4~��7q���5@��v���r�����~/�Y�5�+{B�PzH]�!�������B_�
������Л�c����;���eO��˲�ó���qx���퇌y����VP��.rD�~ؾ>G�t��;�����[�0� =�$����e���Vʹ��z1�N��{l����X���(O_[־ڨ����O01�H�UP*wvs9J\��Cz����:��(ţ��ܑH�����֋�$?���fCI�@'�t��FPR8�(����D�k�K��*���n]s����4�I�'�[ILA���9@]�� 3� i�~�R��þ[�^�� Cb]�C�SBtzL��IiY��I\�[9Ӥ&��VX>��sREo��6����I����6Q�I���������ϣ#Z��Al�{�d���{s:HJx�,�Mmx���x��'�p{�)X�؛��tnI����[���#3��<��=�����Ϣ�9n�6�D�D$�� (�FJ(F~��x��7*v�KY����N�O���.�o-)�A�����(��>�� |� ˊ�%���2��1'>qU,�)�r��%h�]pRR��������\)%=�j?��A9L�ޛW�i����������Ks�0I���[MA��rpu?󘸉
}
\���(Mf�|��oی�?C�"�R]��A���S����=5�8�U��'ɦiLzxnl���U~��1|��%ׅ���?�/{0G��3����}�b���N���4�["�1���߉t�b�qݯ�{gV�����zj�>[��z�-��^���Ҡ��`ȜG�9 Wf�e�f�AB�m�t�6K[oz��dJ5�?x�޾zO����Z=��is�`���H�Ѧ�0 �O?b��%͕�='$_��g�ܔ�0Ai���G�V�Wt[�Ks�~�z������S�����"IՉ|w�$�,���.��r�� 1  ��s�+ۯ8�H5���yD����[T�'n#g����gG��C�o�r��Q��M\�ޱPҬ��|L��ͽ0}�ő6"�k=z���o�u��Tt�T�Ot�%f�g�M��I�����6ش�<���b}�^Χ;�}����F���ʪ&�G��z6�;�:1,�\�b/!� v!ɛ#��,�=F�S\��b4����#�4��,Ar������d���s���7�({����_�;=�
��ȫ�
�:�N�'i��W!_��E	n.���vB+EZ,��W6�' Eb�(&8�����C����WX{)rB���ugȣD�N�P V�/ڎ���Q���#N�����.��q����F��t�ws?&��b�W ��<�+�z/ckA~�zy��^lQ�-�m��T?�!���g����[p�EQ�4�yXy������Ҿ�@�9����i(�X����~�.�D���]��?D� �r�d+�j����z�[��;�� �i� ?۱���C�����mw��P�p+����}��̺_B���'��/�A"=��N�W.�3�Y��v�1
���j�ò�O<��*ii�x��&����seѓ�8��clW%��O��+L+�\$���Nw�>iZ���Y5�Tմ�1Fu���SS��W�\HՔ���F�J�S�!��]��%࿽����@���Vm���G<���Hz��&��,y%�������<�f}uG��7vL�4`���@�8Ȥ�o��}�׫}G�����L�'/��0)�-�9 x�b!�Ո���5���(t��z�8���D�f�wC��%��0Y��{��e�U�fT	��xUee	������9;M���:�2w��h�Õ�hfHڶp=�:9���KO�na�_6RN9��ʿ�D�w×�o�r��3xe��۵���B,d�i���Ʃ/cȩ�����f���H�nZg����肔?����&G�\���1�N7R1���j ,��J?95��0�&C���Z�!iE]����EFK:2� Z-�_�/��}w�~�Kj���᮸���S��J%~���]V��ic�w��$ܲ_�.LVfRs�L�� �����/_1bR��f&olL��[�˭GS���|��D�$I��8�L.���L���ی�`D��c��W�r��0�-�D��懻���������G1y�a��m�}r}�6p���.Q��fc+�xw����8_�bqeP��6��MX��Ν��6����z�Si���k�>�@0�m���o�����W&�~�5�.�k*����v�3���ͻ�$Hʭ���o���s��dKŶ��7����ɐ�tDF�ƹݽ2w�����/#@*)�� en��H{OS:��^����,ؖ�(:�Ily�%��\�b�EH��]��u��nr㴊����nH�Q�^A�=���9OaNO��M���t�j���Wk94�q����o�f'��~�|�z#�ujW9��h��~�8�{���}�=yv�۝7f�J���d�2�4Dz�5f��豥�5(3�j�uە9}�@BKVCGX�����x��4G��~�."]�*�z��r�f����VbD1�l:4��GH����߶/1�s���gmA�{b��/�Mg:�IL�H[)��+{|n�	��l/+��ܡ���u}���F}�Qm�G�����7+>Zߺ2'wP��j�/η:l�\���g���gC�|B�Hk,Ƚ
d.�\��+�lbgo�}P��P���p�x�����M?���g�����d��J��7�0��A�g�s���0�>��"�$Hh��0~�"��f=d[�F�T�2�zte��L��}�4_.u�\�(������4�t�ۢ�Mq�"� I7o��4.�ͽ���{��%X�Ȃ���6׻vASmku}����s���ZĬ ��t��W�Z�r����u�X���b%��в����L�}��drPA\��ɘA��V���wkj���¤f�~����|=�+j&�~�|s�l�J��ʤ���v�H)��h2�^UA�;$�"�$U@��|�K�C��4*Sf�Y����Bq�`�Ѵ��cm�$t�ɲ4j{�����JWscH���|^ʯl�O�q�i�(�ir�o��Y��Á�[��[#���T�}�mea�*qepy^d����`6�������S�o������f�|RK��>ԫ��ܕ������iz�ɃZk�66� �>�"�a�y��_�Y�v����$����+�Y�Dj9N�2�w�Nr���YY�P��cf��AQ��rT�ֶ����|\�[*�����w
�{��G_�z����+i��hq�(���ƴ���Pi�U��������t8_�S/�|�������,���X�oЮ�v̗�5��dwCo����LA\L�1�N</ ��
2m;��9D�a�"���њ@��~Z��0�9�����︛E���ȏ���gZf��ISe���d*d�Z��mMN��_6~G��!�8���d�i�����~�M���rhO�;��|���Vx���~p�׆%c����ެ��T�mY|t�|*p?��(P�u��(��y�w�:�V�ⷁ��hȴUk�3ޢ�㶧�!~D@k�;%{����gLd�>S�Q��r�h��9�W��Q׬Ǵ������{zVJ������*�_�՗Tn:�n �B2~x���#A�M�x�U��{5��gQB~�J��2�̲��鱹�G���ľl�y��TУv�WƠ	�Y��
J���Q���*R����Z2-b��������oE�3�j����7vd�y zfD|r��Ƴ�:-��J(���}�4��;�|G��>��ʞ8'0�u��ݺB<� i��'_�<��"_;���ʗ/�����m�@n q0^C��B^�p�H~�q��<��Tj�ͤ�R�W��̴m���hRΞ���m������On7�K5�\(' ]�T�����r�<E���vV���Z�v���o;<�Ӓ�4��s�b�.���69� �/��<�R�����+;gE�%K��LH$�{�b��ݯ��Jȯ�E�l_+\*l�{����kW�o�n}�0R�d�q:s5��.Ǳ�8�Bz�r�y��<�s��ٵ��b��%�mv�2X*���}}�[;�������	`�����l0�}Pr?-�|��c��T�˺�~��=��F�Z�Vi�Ȕ�Yrb��LnΙ|�[d�Ȧ:���>AbL��g9��˦�p�#"��{�����DS��Z��.z��YK;(-��\}��]N�������nׇ��X�����D���/Ҳ%�z�\�����¥.4��i�W����g�����+(��\�����zz�� X��t      !   �   x�M̱�0E�O��Di�e���3Nf�,������I"�m{fص�]5pҞBϲ�R9���#n�9�@I`�P�W�뇊&;ޑ�:�j0�h�b�aE��m>����\Ca\�����F��\�5�P�L�E]is��-+��u�['?Y���oι/*Q�      $   i   x�-�K� F�1��7�c�^:���CMQ��ޠ���1�$�0�m�H���	�j�Գ&��ҿ�MFL��­��,���0����O��������.�*��\            x��UI��6<S���/�;@B(I�f�>��O��R�LL��	�}$��ʥP׹a����c�l�>���vs�M��zfU[�{�ln&X�y,�`Hei����W��b3�C�n-Z��y2���?���f�=�&��PA8VjbW�7V������y��j�=0�2���Ki)�V]Q��Ibr���T���+Q�����]�qeN��Ea��\d��gr'�u�ǧR]���W�j
tZfk���ѡ�+̬/��e��LE�5G�<��QM�"������ vO��o�#�C}a2*��S������)�bOv �Y��}��U0ur#�Rx����07i�f��V����B�<��s����=�b���-b�] �Q��U|E�J�_���JQ޳�Nq9ֲO7�1K�&9��$=jn-�i�V�<} u�Jr�����]@�j���4%.�Q��`�5�x����#.��_���3B�/XV;���g�U����ȫ<�Q�
&�H��ݸS��k���A��Y��hH����������!L5��k��'�ʄm��I�w�޿�1� c}$���kh�lO�#��M��(;��x�`�ڰ��A�?����憼F��:1x��K��H�9g�5��h�u^�tc*��%�����μe�:Ø��|X?o�k�~���6>S�v��5$��Ĕ���䐪���4 Y�f�3^x�����n���1]�����q۵�:$C0 ����ga�>'?�(�>Vm�X�R������.еԀu���\Rx�WA�X�{�S����r�|XC�N            x��};��:��w!Θ�_�̼]}{������ Q �/A�-`�Y����Xk��:�Gdee���d�Y+eYUp��s w��S���l($ņ���/$%GƏ������~��ؼ���['�'������?�����fR�2��?��/�O�tІ��49|y҇����#��T2`����A�}��)�92)��J�����: =O`I��_O�AEW`������P�?zC�9R�jd�`\	~V39���S]������L~nK][׃�mx�O��Ƒ���o,����4��8CJ%Aё�eN�9����7�u8-
��}p�R��/}Z��ړ��x��׿p�́�����Tnfвp��i>_p>L�@�~�	��c>6�u#{ࡳ 23N#A�j������K&a���"!Pr����G���^&r,u��O�����E�Q��N�c�NRN�+�B+���T]���c�|�]U��J���B��e�COFu�Z�Q�%-a�����ck�t�u��l�̑6�5"��|��'�}�ƽ���Jz���WI��-tf�a*]�i�pe�}��]5��M3�ƴ]�~·��:��������}9��8M��*,��\%��e�Є!ה9AB���|��i_��֟O�{^��UϹ4�^�Փɧ	r���SeY߶d�L�EI �#=m������7�Wi�:�y]�>�w�tF�[�1@[\9��|������&���'�uM/{7.�� <�I�:����V�cp���}<�j��e�y�`TyF1�����S����v{,���� ^�	ꤩ�ٽ3Q�p�A������)�x�3�/d[����X���c{�}7����)@�?Hݪ����L'k�c7Z�Z|�;�@
���o�y��4�
��gcA�REx��[��*ޟ�럻S܂n	�!"(���oR�S�/u�� [�f5��}�z� �0��F
J�����JO����~7���)� |a�Ъ@���A0���;
8Eԧ?�ϋe�-�-��Y����_��W|�P�I�?v��!+�2ݬ�.ÐE�{ρǋP^��n�U$�0`�l��ݚ�ޔ���" Fi��"��f�N7�QRi$�Å�|�� ���#m�"����Ꮗ��Ƽ("��1<��ׯg�6���~r"��V�:�I�oǰ{�ɈnÈ�b":+�6��c�`�����ڷӌ2����叕e�e��9�4C7�ֆ��"Z��;��Ek��//��M`bZ�1�hҎ���ȧ�u ��C0H�����M\Uˣ����(�o�)hx������Z����
�͙1gpn�8c��u�����c;2H�
ܗ�@7�t68zc[��NO1)q`��і���~���O]&}� "��(�`�����$�'�ѯET�z�\��瑮Z�[�߼H�::P=o6,W˚V4�ݚ^��b	Z��6�"A��,��߼@A���,0�K�p�]�<��X	0��V�AV�C$˶w|yBVʒ�`@ꇟ@D2�����1���s֘�� N]��-y�ЇD�`�[#O��x� �dX]����HC(8;Ț��ʳܥ��y#�N�rY��i�@���×�B�z��8	Rdh�"/�!|������G#�Ȉc�L�0����ss� R�-7˷����j�Y߰��C��)���N$�z�������o(qUw+r��)�q��g0O�2'��Hs/Zx>�������nF}=j����I��9�j!M��F�w�q⠊;e���ݐ��:om�<$'��q��F�u���Z f�3�`{�a�>^6>fϗ�z�V�nBL�M�;�.	��Ư;���\��B���v�a��㮋k���r��5��[0��^�<v���p�����5+�C�k2$ [;����T�'�橍�zѠ}{�[~-��⛌ө�j�h�=�<���0�"������������ ?�S�������+��G����?cҽ�{��Ǘ�m�d�!Y(|��F��i�G�O�����F94O���7F�ck8F����M���p���(g.�Q�	��w�F>����u�m�wQ�@z`I���c��DӰJ�>���Oƅ��qu���T�|��j��t��]����yEQ��G�4#<!j\�'?��*��=��"��3��u�.�y=��	P�Hs�i��f��UR�y�blM' t�@�8�
E��,4HVz��F�H��P�t�-%��:�q��1]9����Y:�*L�x��Z`����SW	3�x��d�6��=�����dG	Z�0�`�w�F��M�����}�1@Z�o�x~\��s���h	�,���?�V9~�j4��bUi�[���`��Y�1���I���e�q`8����B���p�r<r��ߌ2mMl���>(�hz�(0��CU��/�I��Y��D�C���a�y�]�6@���/W�_Z�M�:��5X��'Ɲ���L��2��;1~��\\��JȌ#2wҁ�B_@���䚬�_h��{���r��{�L>cXz &��s��>��aR�]E5R\���z[�dDS�B�|�e�q�lT"<f4��;�4nl�]�Ę7�g����^j�u�z�%�V��G>?��,��N�0���V�lX���<��nh�W$@��)n���bp1�R2.ã�[��z�fQ�.�# %nּGq��s��,:�24?s�u�ϗ�Z��L	Cn1��&ߏ
��k!�k�d9!�(�y����Ka�T�&��8I�JؗgwyP��9	<�YPO���+a&QP�DжT�IO�����>�~N�����A�N��\U�Hfw��Z?Q�[V"�BZ�d�RU�?�[{����Z���L�;�r����-�1�
�{��q�p��z���}�x=58���!�0}F���~�\0�#1@���@��}P���K5�OH~���y5�b�r�#YU]��^�c�hЭ��x��s!M��	x��UP���N2�F���O�=�}�w�i �� �Fnׄ�f7$�6�l;��y���5�Ve�>9L�1�Pz�Y��q{G��ovC�
	n�!S����������،�{�q��89���,O�RL�1n��rc��׏���ޡ�����p0�=���2ݘ�ay[��W6�-Ɛ	����(������]��Kf�}����Y ��;%����q�ei�e�F�n��d�n�kWN�v^v}�!�,pl��1i��������u]axr-�ZR��A���v���� �LF���ZY'p�N+��`�d�o��}F{A\�#΁c�Չ������������3�s�ݧf� �)������uۈ�L!H�h�V��?o�af��P�:����B���cRh�2��>i*0Ƙ�V|o��> �U�Ezk���E�Ȅ��r�{ŕ�9�j#���u�ϻ˃r��{!ΊC������)��㌟�qQ�Bn1����� �:�
F��ENW�Ң}�U��/���� ͎j����S���.5 �㨡uZa�0��M�T�Z��V��p�YV/7�A�f%gh��.g;>�8�?F@u�b��ؓ�7��jys��ݥ�:v�7�YS�+i������o�5.�G��0��Ɛ,�!8��c_�A���������B��;/8�c鈴�=�Z�=��)�Q�z�t~�]k��`�����pS�&'Z�[��A� q�A���~�m�ݞ]bD�:���Xi�V�I���bw"�/��u#���'��O��{���Bb�-f�r��ޝh����z؎P���~\O��|�z�*vwi<��� }�1h�[��?�X�h���ը[ꈉ����e=}ݽ,?a�����9����K���Õ��K
BƱ�s!=&a&���nVA��A�v�P䒝� Va�6v�����/q`Lӵ*3_��8���k�k����
gA�L�����c��S���Gе?�o]w{[��ew{LQ�NKm������S3��ݰ�tӀ��<�� �NjR��Ymm#��ۆ�4"�� �  ��Ow�4�/�?B��
z6��B�0ʞ������?w�1�z_(�0���[eR[��+=����8�H�kEſ��ⴟ����
.eF��ؾoQU��F��Y��-��^?[;����v0�Bt��M��Vu�OT9�8��1��*�@���>� gb׻aT���yC�߿z�,|�/�R0
�9���M=��(�|����C2���9��A�-d�S���6tN]��Z^�m�/��K��o�@|�������(�T�Bʳ�����S �:�?�f�Rz'l���Ob�.fN@&^�̣ܨ��G���S:�L�!�72Kh"�<��]-�\����7�R��"r�д�;�v�^�]�Y"��f�x0��(�?�o��	g��'q-�R�z����l'h}�Y�tԠ�Z�e��5�s�΅%�>��;��M��N�zWZg�A�b2���k�����{��x�4��q��1G�Mmi)ά�y��~~�,�EqI�(�H�i3�-�٨��(B�.�_�K5S`�dj"��&]]�<T��>�Z�'p27�S�l���o�Ic�rB��y����b���̀N��4�0�ԡ�G\�/�j�['�&B&۶`�2�����N�DG����P,�Q�y#�?�B��",մZ�[�N�G�0�[��|�3�M�B�1���o.:���ޗ�w/%��4�0�ԍ�����J��1�>C?��e�Z��C(myG4e� �Dhh>��v����
��f%P�N&:��K�7@��Tз�F�з0)�?չ�W ����m~H@� Г�F��n�����v�	���˴W��ꍋ�#L�]�	-}��h�8��\)���(�����)��<����FM;��wA�e��QS�p�D�9����������-��ѣ��Z�T}�%r�a�/�|<�r����T'��Ab4��I�72�uZd<���)h|�G���ABK I"�.��v��V#�ݜѴz����~D\����n��0�_�1�Y��ˇ@d�܀b`4B����M<�vJ¶L���������=>dD?�'���E���v�e�#'���� bw'�?�XÂfL�H�jXEpz>�����h��x��LH����M��Ӫ1�H��5e�*�6D�����%�΃���i�4��8����x=�<C�D�z��t]u�l��ñ�[��t�����vQ����b��1FM���&��7�{:�����_�"�X�5k�Q�nXd��zҢ�֚�$�Z�?�{�v��17��F�_d���Ƚ����r��pK�*<Ga��W��_��)$��Ё2�����ۯ��
�n��P?�Z�6Lo�wM2�m_~�TV3")���LL岳hw��{DD�=25��=�0�{Q5���M)E��?.������b�ڷ0�����B+Np���>�~6����fY�����E��yFD{SG��$��m��M���Õ{�،!�xAg�@g׉�^C���$���ȫΙf�R	� ���S�`S>q��p��8�S.C0Pd}�&�x@,�͑�ԭY��S�4oQ����[�κ恔�PO��c`R�n[��D%���oL�2�v��"o8c;��p�@N8j��2��F��q�~�1���g]��v��q�s}}hhn=������?��c�-:��?^��,���<!�x��m`�\�u���}vJ9�A"s�=�ctY��nY�eA�Eɿ�M}�/���~�Y���O����9`:�Aas���8~�N�^�f��p�s�C+@�<^UBw���D�YԢ�[�ߟۮ��QE��Scb�����*����v���
�s}a���+5�Mzyy�5�}N����]���֨35H�G�/��-7�Ȕ١�vm%�0�Cx�E��@l���CE����� #��(���HC��DNà���.k����G'�_f���뒻�VW�k¬e�Q���^��iу���i̠�8]?��w�E�`Ռ ��扬��or�3�}���ʆ��8")K��>m��U�W�>R����^��]��8߮Ïa���j㻭�2���-�
��ٽ.�R�4��d:`{A~NK��O8��[I��9e��L׃���4�ޕ�P~��C?z��H���o���~pM[j�Q�+#�I;��X�HzD!MJ
��L��<.ή^~�o&�;���A4��
�2��)㌤�/�L<a)���7N�nzU?(��:�4%�>?�E~D�_�5[�|��0_.[R��/��W��EZ���R�����p�vm�dG��:��׃n�푻�^Z9 �I���a�eD1#�����OS{����M?�7�<��g4-�st���!�{�2���^����!�l�͕�j��D��H�@`l��[�����٠0ѹ6*� ���3Y��s�|G~�[m�����d�G " �SP��ց�(K�
P�!	�i�n�O-�T��@��C���l?���i�� ,���}�q�~�qϸl�=�NRP�Ű 9�8٥q1N#�Zk$}?8��gq��L�C��`5��e�7^-�ի-9�аր+}T��29[�����V�������D �͌,��h��~����[�F4R��"��T�Ů��]����kR��#x>�^���^�WjM��蚭��C�}��� �aM<60e c�i��O��:��@�Z���J��@���Mk�v1����}���F?����4&pݰ��o���	�ì��M�;�#HG����a�౉���E=ySw�yxabt��MX\��?*<hhr��6ʣM7��u��c������@���V��ŗ8d����~��粤��y��8׶�&�GR�b��e8M����v�1�L����j<6z�_��L�-��w����u��p�����	M�66Em5�����>1�֪�Z�Cw���cS_���7�Մ����A'z�[݋:~�'dZ� ��%�����Tm>+G�����t��s׆r�i���^k�<S�{ꋃe�X}��'�E��^̟��M�4]1�dT�\_L�� �^�3�i����MD��ϩ}a�C큟j�R�I��4zm��$�hq�rĠR���тݿ�{���|W���
�Xr�g�P�3�GF�t;A?��g���[]F��-bc�EB���/S�b1͌�i���*���q���AU�,ەz~l2�J�d�,v��;�z=pJ��W�?e���'�DE&a4b������]7�-��� LB��-j�R6C_o19V�AJ�id�q�Vr��"�܄ _x��~��,�ԌBS���*���Ļ��\� E�s�&�x�?k]��f�C���D	9�ը�/	�3�Y�H�0M�D�����As����K(�m�\�l9�r�0�IcZ%�V}�nw] �7�R�S����#��(H���Vs����.%j�t�B�������������@6ww�|7v\n,�__FI��[	�\�<�}L/��0v
I��&0wb��h��n��
chczd��)U/��WΎ�*\#7�����.��"��#��o�a��wQ�xU����UC+7w���2ot��E=���@��wJ`�����!��g�?�i�1Ui\�ɛ5'�D�)B2r��YR;
 ����A���n����v��-f]�}Mu�4�L�j�Bm�f;ֳ*�]n:E�$�Q���8R�����:��A��(����~�u��A�?~�����?q���         n  x��SK��(�Ux��eE�� 0��#��������Pϕ_wuO2��{%�+IF�����Z���d���-̉�A��2+�mةTk��ߗ*���s%�3V�9^�Cܯ��8�8�հ{7>-�i��@�\��J�ݝN(�$/Le\p�F�:C��f5/Ա���U���N�Awl*�-��J"i�Sy	�I&X���wޅnA�B}�NɖJ�go8s"��ynq��<6����Q5�	}?��Y`��v��I��qf�%��Ɍ\g���A?zn��P����z8�Z&�~tv!�Y0%�r��!�p�������0��#�������4|*N��\�|��:x��}�2�C?��O�<l��p_�l������m��X�2�X�ֳ�1z�����T;P2+h�q�������m�D�C�hA���My������z��P������l�>�2�l���؏�l�~h���Pw�`�*��w��3�Ť��E�
\^�ieR/;�u5@k�_�K�箖xM��R�R��<酁K8&�c��bت���}�^o��WT�˰C���2(p���pz�6\��dR�Ǫ�1�/�=�tB�k��ȑtG�n��q���}���;�'�$         g   x�ʻ�@ ����Q�&bc;�)'���q2���?�¶��:U|G���*�==sI�2C�Mq�Qt�ɕ��(ݧ	�2kP`�cG���Í���� ?E[$�      #      x������ � �     