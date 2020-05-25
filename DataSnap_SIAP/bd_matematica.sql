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