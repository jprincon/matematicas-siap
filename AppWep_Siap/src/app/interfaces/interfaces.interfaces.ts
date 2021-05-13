import { stringify } from '@angular/core/src/util'
import { Label } from 'ng2-charts';

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
  institucion?: string;
  vinculacion?: string;
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
  docente?: string;
  tipo?: string;
  horasSemestre?: number;
}

export interface HorarioServicio {
  idhorarioservicio?: string;
  dia?: string;
  inicio?: string;
  fin?: string;
  total?: string;
  salon?: string;
  aula?: string;
  idservicioprograma?: string;
}

export interface AgendaServicio {
  asignatura?: string;
  grupo?: string;
  horarios?: HorarioServicio[];
  horas?: string;
  horasfactor?: string;
  horassemestre?: string;
  idagendaservicio?: string;
  iddocente?: string;
  idprograma?: string;
  idservicioprograma?: string;
  jornada?: string;
  numerocontrato?: string;
  actaprograma?: string;
  actafacultad?: string;
  agendaconcertada?: string;
  periodo?: string;
  programa?: string;
  concertada?: string;
  completada?: string;
  aulas?: string;
  semanas?: string;
  tipo?: string;
}

export interface Agenda {
  AgendasServicios?: AgendaServicio[];
  Estado?: string;
  documento?: string;
  horasFunciones?: string;
  horasMaxContrato?: string;
  horasRestantes?: string;
  horasSemanales?: string;
  horasSemestrales?: string;
  horasTotales?: string;
  nombre?: string;
  observacion?: string;
  reconocimientoPosgrado?: string;
  totalHoras?: string;
  numeroContrato?: string;
  actaFacultad?: string;
  actaPrograma?: string;
  agendaConcertada?: string;
  agendaCompletada?: string;
  categoria?: string;
  contrato?: string;
  ActividadesFuncionesDocente?: ActividadFuncionDocente[];
}

export interface Contrato {
  TipoContrato?: string;
  Agendas?: Agenda[];
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
  titulo?: string;
  idtrabajogrado?: string;
  estudiante1?: string;
  estudiante2?: string;
  estudiante3?: string;
  idjurado1?: string;
  jurado1?: Docente;
  idjurado2?: string;
  jurado2?: Docente;
  idjurado3?: string;
  jurado3?: Docente;
  iddirector?: string;
  director?: Docente;
	idcodirector?: string;
  codirector?: Docente;
  idmodalidad?: string;
  modalidad?: Modalidad;
  idareaprofundizacion?: string;
  areaProfundizacion?: AreaProfundizacion;
  idgrupoinvestigacion?: string;
  grupoInvestigacion?: GrupoInvestigacion;
  actanombramientojurados?: string;
  actapropuesta?: string;
  evaluacionpropuesta?: string;
	evaluaciontrabajoescrito?: string;
	evaluacionsustentacion?: string;
  fechasustentacion?: string;
  calificacionfinal?: string;
  estudiantecedederechos?: string;
	fechainicioejecucion?: string;
	cantidadsemestresejecucion?: number;
  estadoavance?: number;
}

export interface Periodo {
  idperiodo?: string;
  periodo?: string;
  hormaxcarrera?: number;
  hormaxcontrato?: number;
  hormaxcatedratico?: number;
}

export interface ActividadFuncionDocente {
  idactividadprograma?: string;
  idfuncion?: string;
  idactividad?: string;
  idsubactividad?: string;
  actividad?: string;
  iddocente?: number;
  periodo?: string;
  horas?: string;
  actividadprograma?: string;
  funcion?: string;
  horassemestre?: number;
  subactividad?: string;
  calculada?: string;
}

export interface BotonMenu {
  Titulo?: string;
  Icono?: string;
  Ruta?: string[];
  IdBoton?: string;
}

export interface MenuFactores {
    Titulo: string;
    Botones: BotonMenu[];
}

export interface Favorito {
  idfavorito?: string;
  titulo?: string;
  icono?: string;
  ruta?: string;
  frecuencia?: string;
}

export interface ReporteServicio {
  asignatura?: string;
  categoria?: string;
  correo?: string;
  grupo?: string;
  horas?: string;
  semanas?: string;
  horsem?: string;
  iddocente?: string;
  jornada?: string;
  nombre?: string;
  contrato?: string;
  numerocontrato?: string;
  periodo?: string;
  programa?: string;
  telefono?: string;
  tipo?: string;
}

export interface FacultadEFD {
  IdFacultad?: string;
  Nombre?: string;
  TotalHoras?: string;
  Color?: string;
  NombreCorto?: string;
}

export interface FuncionEFD {
  IdFuncion?: string;
  Nombre?: string;
  TotalHoras?: string;
}

export interface DocenteEFD {
  IdDocente?: string;
  Nombre?: string;
  totalHorasConFactor?: string;
  totalHorasSinFactor?: string;
  Facultades?: FacultadEFD[];
  Funciones?: FuncionEFD[];
  TotalHorasAgenda?: string;
}

export interface Estadistica {
  Nombre?: string;
  Horas?: string;
}

export interface ContratoEFD {
  Contrato?: string;
  IdTipoContrato?: string;
  Docentes?: DocenteEFD[];
  Facultades?: FacultadEFD[];
  Activo?: boolean;
  Estadisticas?: Estadistica[];
}

export interface AfinidadDocente {
  Docente?: string;
  Etiquetas?: Label[];
  Datos?: number[];
}

export interface AfinidadContrato {
  Nombre?: string;
  Docentes?: AfinidadDocente[];
}

export interface ActaConsejoCurricular {
  Acta?: string;
  Dia?: string;
  Mes?: string;
  Anyo?: string;
}

export interface PerfilDocenteTrabajoGrado {
  CalificacionFinal?: string;
  Estudiante1?: string;
  Estudiante2?: string;
  Estudiante3?: string;
  EvaluacionPropuesta?: string;
  EvaluacionSustentacion?: string;
  EvaluacionTrabajoEscrito?: string;
  Titulo?: string;
}

export interface PerfilDocente {
  JuradoTrabajosGrado?: PerfilDocenteTrabajoGrado[];
  DirectorTrabajosGrado?: PerfilDocenteTrabajoGrado[];
}

export interface Seccion {
  Seccion?: string;
}

export interface Tema {
  Capitulo?: string;
  Secciones?: Seccion[];
}

