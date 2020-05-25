import { stringify } from '@angular/core/src/util'

export interface Noticia {
  imagen?: string;
  titulo?: string;
  descripcion?: string;
}

export interface Usuario {
  nombre?: string;
  correo?: string;
  contra?: string;
  tipoParticipacion?: string;
  cedula?: string;
  afiliacion?: string;
  lugarTrabajo?: string;
}

export interface Evento {
  horaInicio?: string;
  horaFin?: string;
  titulo?: string;
  lugar?: string;
}

export interface Cronograma {
  fecha?: string;
  eventos?: Evento[];
}

export interface Cursillo {
  titulo?: string;
  idCursillo?: string;
  cedula?: string;
  docente?: string;
  palabrasClave?: string;
  areaProfundizacion?: string;
  resumen?: string;
  cupos?: number;
  inscriptos?: number;
}

export interface Concurrencia {
  idVisita?: string;
  contador?: string;
}

export interface Resumen {
  capacidad?: string;
  idAutor?: string;
  idResumen?: string;
  linea?: string;
  materiales?: string;
  objetivo?: string;
  prerequisito?: string;
  requiereSala?: string;
  resumen?: string;
  tipo?: string;
  titulo?: string;
  evaluado?: string;
  nombreAutor?: string;
  subtitulo?: string;
  salon?: string;
}

export interface AutorResumen {
  cedula?: string;
  nombre?: string;
  correo?: string;
  institucion?: string;
  id_resumen?: string;
}

export interface BibliografiaResumen {
  idBibliografia?: string;
  bibliografia?: string;
  idResumen?: string;
}

export interface PalabraClave {
  idPalabraClave?: string;
  palabra?: string;
  idResumen?: string;
}

export interface Noticia {
  nombre?: string;
  imagen?: string;
  descripcion?: string;
}

export interface Correo {
  correo?: string;
  asunto?: string;
  mensaje?: string;
}

export interface Estadisticas {
  capacidad?: number;
  inscritos?: number;
  cupo?: number;
}

export interface Inscripcion {
  inscrito?: string;
  respuesta?: string;
}

export interface AutorPoster {
  cedula?: string;
  nombre?: string;
}

export interface Poster {
  linea?: string;
  titulo?: string;
  autores?: AutorResumen[];
}


