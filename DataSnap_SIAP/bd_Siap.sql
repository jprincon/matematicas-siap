create table if not exists math_visitas(
	id_visita text primary key not null,
	contador text
);

create table if not exists math_usuario(
	cedula text primary key not null,
	correo text,
	nombre text,
	contra text
);

create table if not exists math_rol(
	id_rol text primary key not null,
	nombre text
);

create table if not exists math_bd_articulos(
	id_articulo text primary key not null,
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

create table if not exists math_participante_emem(
	cedula text primary key not null,
	correo text,
	nombre text,
	tipo_participacion text,
	contra text
);

create table if not exists math_resumen(
	id_resumen text primary key not null,
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
	id_autor text references math_usuario(cedula)
);

create table if not exists math_palabras_clave(
	id_palabra_clave text primary key not null,
	palabra text,
	id_resumen text references math_resumen(id_resumen)
);

create table if not exists math_autor_resumen(
	cedula text primary key not null,
	nombre text,
	correo text,
	institucion text
);

create table if not exists math_resumenes_autor(
	id_resumen_autor serial primary key not null,
	cedula text references math_autor_resumen(cedula),
	id_resumen text references math_resumen(id_resumen)
);

create table if not exists math_bibliografia_resumen(
	id_bibliografia text primary key not null,
	bibliografia text,
	id_resumen text references math_resumen(id_resumen)
);

create table if not exists math_resumen_participante(
	id_participante text primary key not null,
	id_resumen text references math_resumen(id_resumen)
);

create table if not exists siap_tipo_contrato(
	idtipocontrato text primary key not null,
	contrato text
);
alter table siap_tipo_contrato add column horas text

create table if not exists siap_categoria_docentes(
	idcategoriadocente text primary key not null,
	categoria text
);

/* Tabla de Docent es */
-- drop table siap_docentes
create table if not exists siap_docentes
	iddocente integer primary key not null,
	nombre text,
	correo text,
	telefono text,
	idcategoriadocente text references siap_categoria_docentes(idcategoriadocente),
	idtipocontrato text references siap_tipo_contrato(idtipocontrato)
); 
alter table siap_docentes add column activo text;

/* Tabla de Errores: Permite registrar los errores de la aplicación
   y mostrarlos mediante un servicio */
create table if not exists siap_errores(
	iderror text primary key not null,
	hora text,
	fecha text,
	procedimiento text,
	mensaje text
);

/*Tabla para Facultad*/
create table if not exists siap_facultades(
       idfacultad text primary key not null,
       facultad text
);

/*Tabla para Programa*/
create table if not exists siap_programas(
       idprograma text primary key not null,
       programa text,
       idfacultad text references siap_facultades(idfacultad)
);

/*Tabla para ServicioPrograma*/
-- drop table siap_servicios_programas
create table if not exists siap_servicios_programas(
       idservicioprograma text primary key not null,
       asignatura text,
       idprograma text references siap_programas(idprograma),
       horas integer,
       aulas text,
       periodo text
);
alter table siap_servicios_programas add column jornada text;
alter table siap_servicios_programas add column grupo text;

/*Tabla para HorarioServicio*/
create table if not exists siap_horarios_servicios(
       idhorarioservicio text primary key not null,
       dia text,
       inicio text,
       fin text,
       idservicioprograma text references siap_servicios_programas(idservicioprograma)
);
alter table siap_horarios_servicios add column salon text;

/*Tabla para AgendaServicio*/
create table if not exists siap_agendas_servicios(
       idagendaservicio text primary key not null,
       iddocente integer references siap_docentes(iddocente),
       idservicioprograma text references siap_servicios_programas(idservicioprograma),
       periodo text
);

/*Tabla para Configuracion*/
create table if not exists siap_configuraciones(
       idconfiguracion text primary key not null,
       nombredirector text,
       nombredecano text,
       semanassemestre text
);

/* Tabla de funciones de docentes */
create table if not exists siap_funciones_docentes(
	idfunciondocente text primary key not null,
	funcion text
);

/* Tabla de Actividades de Docentes */
create table if not exists siap_actividades_docentes(
	idactividaddocente text primary key not null,
	actividad text,
	idfunciondocente text references siap_funciones_docentes(idfunciondocente)
);

/* Tabla de subactividades de docentes */
create table if not exists siap_subactividades_docentes(
	idsubactividaddocente text primary key not null,
	subactividad text,
	idactividaddocente text references siap_actividades_docentes(idactividaddocente)
);



