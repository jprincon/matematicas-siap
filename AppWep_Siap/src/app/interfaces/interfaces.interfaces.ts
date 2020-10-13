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

export interface TipoContrato {
  idtipocontrato?: string;
  contrato?: string;
  horas?: string;
}

export interface CategoriaDocente {
  idcategoriadocente?: string;
  categoria?: string;
}

export interface Docente {
  iddocente?: string;
  nombre?: string;
  telefono?: string;
  correo?: string;
  idcategoriadocente?: string;
  idtipocontrato?: string;
  foto?: string;
  categoria?: string;
  contrato?: string;
  documento?: string;
  activo?: string;
}

export interface Error {
  iderror?: string;
  hora?: string;
  fecha?: string;
  procedimiento?: string;
  mensaje?: string;
}

export interface Facultad {
  idfacultad?: string;
  facultad?: string;
}

export interface Programa {
  idprograma?: string;
  programa?: string;
  idfacultad?: string;
  facultad?: string;
}

export interface ServicioPrograma {
  idservicioprograma?: string;
  asignatura?: string;
  idprograma?: string;
  horas?: number;
  aulas?: string;
  observacion?: string;
  periodo?: string;
  programa?: string;
  horarios?: HorarioServicio[];
  semanas?: number;
  horassemestre?: string;
  jornada?: string;
  grupo?: string;
}

export interface HorarioServicio {
  idhorarioservicio?: string;
  dia?: string;
  inicio?: string;
  fin?: string;
  total?: string;
  salon?: string;
  idservicioprograma?: string;
}

export interface AgendaServicio {
  idagendaservicio?: string;
  iddocente?: string;
  idservicioprograma?: string;
  periodo?: string;
  asignatura?: string;
  aulas?: string;
  horarios?: HorarioServicio[];
  horas?: string;
  idprograma?: string;
  programa?: string;
  horassemestre?: string;
}

export interface Configuracion {
  idconfiguracion?: string;
  nombredirector?: string;
  nombredecano?: string;
  semanassemestre?: string;
  horascontrato?: string;
  horascatedra?: string;
}

export interface FuncionDocente {
  idfunciondocente?: string;
  funcion?: string;
  actividades?: ActividadDocente[];
}

export interface ActividadDocente {
  idactividaddocente?: string;
  actividad?: string;
  idfunciondocente?: string;
  subactividades?: SubactividadDocente[];
}

export interface SubactividadDocente {
  idsubactividaddocente?: string;
  subactividad?: string;
  idactividaddocente?: string;
}

export interface Egresado {
  idegresado?: string;
  nombre?: string;
  celular?: string;
  correo?: string;
  esegresado?: string;
  fecha?: string;
  gradoescolaridad?: string;
  secretaria?: string;
  institucion?: string;
  municipio?: string;
  cargo?: string;
  nivellabora?: string;
}

export interface GrupoInvestigacion {
  idgrupoinvestigacion?: string;
  nombre?: string;
  sigla?: string;
  iddirector?: string;
  mision?: string;
  vision?: string;
}

export interface Modalidad {
  idmodalidad?: string;
  nombre?: string;
}

export interface AreaProfundizacion {
  idareaprofundizacion?: string;
  nombre?: string;
}

export interface TrabajoGrado {
  idtrabajogrado?: string;
  titulo?: string;
  estudiante1?: string;
  estudiante2?: string;
  estudiante3?: string;
  idjurado1?: string;
  idjurado2?: string;
  idjurado3?: string;
  iddirector?: string;
  idmodalidad?: string;
  idareaprofundizacion?: string;
  idgrupoinvestigacion?: string;
  actapropuesta?: string;
  fechasustentacion?: string;
  calificacion?: string;
}
