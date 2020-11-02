import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';
import { LS_ULTIMA_RUTA } from '../config/config';
import { retry } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class GeneralService {

  letras: string[] = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
                      's', 't', 'u', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  private token = '';
  private ENCABEZADO_HTTP = 'http://';
  private IP_SERVIDOR = '201.185.240.142';
  private PUERTO = ':1952';
  private GENERAL = '/datasnap/rest/tmatematicas/';

  private URL_USUARIO = 'usuario';
  private URL_PARTICPANTE = 'participante';
  private URL_RESUMEN = 'resumen';
  private URL_BORRAR_RESUMEN = 'borrarResumen';
  private URL_TOKEN = 'token';
  private URL_RESUMENES_AUTOR = 'resumenesAutor';
  private URL_PALABRA_CLAVE = 'palabraClave';
  private URL_PALABRA_CLAVE_RESUMEN = 'palabraClaveResumen';
  private URL_AUTOR_RESUMEN = 'autorResumen';
  private URL_AGREGAR_AUTOR_RESUMEN = 'agregarAutorResumen';
  private URL_AUTORES_RESUMEN = 'autoresResumen';
  private URL_REFERENCIA_RESUMEN = 'referenciaResumen';
  private URL_REFERENCIAS_RESUMEN = 'referenciasResumen';
  private URL_CONCURRENCIA = 'concurrencia';
  private URL_ENVIAR_CORREO = 'enviarCorreo';
  private URL_DESCARGAR_RESUMEN = 'descargarResumenEmem';
  private URL_AUTOR_POR_CEDULA = 'autorPorCedula';
  private URL_RESUMEN_POR_TIPO = 'resumenPorTipo';
  private URL_TIPOCONTRATO = 'TipoContrato';
  private URL_TIPOSCONTRATO = 'TiposContrato';
  private URL_CATEGORIADOCENTE = 'CategoriaDocente';
  private URL_CATEGORIASDOCENTE = 'CategoriasDocente';
  private URL_DOCENTE = 'Docente';
  private URL_FOTO_DOCENTE = 'FotoDocente';
  private URL_DOCENTES = 'Docentes';
  private URL_DOCENTES_POR_CONTRATO = 'DocentesPorContrato';
  private URL_ERROR = 'Error';
  private URL_ERROR_POR_MENSAJE = 'ErrorPorMensaje';
  private URL_ERRORES = 'Errores';
  private URL_FACULTAD = 'Facultad';
  private URL_FACULTADES = 'Facultades';
  private URL_PROGRAMA = 'Programa';
  private URL_PROGRAMAS = 'Programas';
  private URL_SERVICIOPROGRAMA = 'ServicioPrograma';
  private URL_SERVICIOSPROGRAMA = 'ServiciosPrograma';
  private URL_SERVICIOSPROGRAMADOCENTE = 'ServiciosProgramaDocente';
  private URL_HORARIOSERVICIO = 'HorarioServicio';
  private URL_HORARIOSSERVICIO = 'HorariosServicio';
  private URL_AGENDASERVICIO = 'AgendaServicio';
  private URL_AGENDASSERVICIO = 'AgendasServicio';
  private URL_DESASOCIAR_AGENDASSERVICIO = 'DesasociarAgenda';
  private URL_CONFIGURACION = 'Configuracion';
  private URL_CONFIGURACIONES = 'Configuraciones';
  private URL_FUNCIONDOCENTE = 'FuncionDocente';
  private URL_FUNCIONESDOCENTE = 'FuncionesDocente';
  private URL_ACTIVIDADDOCENTE = 'ActividadDocente';
  private URL_ACTIVIDADESDOCENTE = 'ActividadesDocente';
  private URL_SUBACTIVIDADDOCENTE = 'SubactividadDocente';
  private URL_SUBACTIVIDADESDOCENTE = 'SubactividadesDocente';
  private URL_EGRESADO = 'Egresado';
  private URL_EGRESADOS = 'Egresados';
  private URL_GRUPOINVESTIGACION = 'GrupoInvestigacion';
  private URL_GRUPOSINVESTIGACION = 'GruposInvestigacion';
  private URL_MODALIDAD = 'Modalidad';
  private URL_MODALIDADES = 'Modalidades';
  private URL_AREAPROFUNDIZACION = 'AreaProfundizacion';
  private URL_AREASPROFUNDIZACION = 'AreasProfundizacion';
  private URL_TRABAJOGRADO = 'TrabajoGrado';
  private URL_TRABAJOSGRADO = 'TrabajosGrado';
  private URL_PERIODO = 'Periodo';
  private URL_PERIODOS = 'Periodos';
  private URL_ACTIVIDADFUNCIONDOCENTE = 'ActividadFuncionDocente';
  private URL_ACTIVIDADESFUNCIONESDOCENTE = 'ActividadesFuncionesDocente';

  constructor(private http: HttpClient,
              private router: Router) {

    this.postToken().subscribe((respuesta: any) => {
      this.token = respuesta.token;
      // console.log(respuesta);
    });
  }

  navegar(rutas: string[]) {
    this.router.navigate(rutas);

    localStorage.setItem(LS_ULTIMA_RUTA, JSON.stringify(rutas));
  }

  restaurarRutas() {
    if (localStorage.getItem(LS_ULTIMA_RUTA)) {
      this.router.navigate(JSON.parse(localStorage.getItem(LS_ULTIMA_RUTA).toString()));
    } else {
      this.router.navigate(['menu-principal']);
    }
  }

  dataSnap_Token() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_TOKEN;
  }

  dataSnap_Usuario() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_USUARIO;
  }

  dataSnap_Participante() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_PARTICPANTE;
  }

  dataSnap_Resumen() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_RESUMEN;
  }

  dataSnap_BorrarResumen() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_BORRAR_RESUMEN;
  }

  dataSnap_PalabraClave() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_PALABRA_CLAVE;
  }

  dataSnap_PalabraClaveResumen() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_PALABRA_CLAVE_RESUMEN;
  }

  dataSnap_ResumenesAutor() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_RESUMENES_AUTOR;
  }

  dataSnap_ResumenePorTipo() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_RESUMEN_POR_TIPO;
  }

  dataSnap_AutorResumen() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_AUTOR_RESUMEN;
  }

  dataSnap_AgregarAutorResumen() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_AGREGAR_AUTOR_RESUMEN;
  }

  dataSnap_AutoresResumen() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_AUTORES_RESUMEN;
  }

  dataSnap_AutorPorCedula() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_AUTOR_POR_CEDULA;
  }

  dataSnap_ReferenciaResumen() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_REFERENCIA_RESUMEN;
  }

  dataSnap_ReferenciasResumen() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_REFERENCIAS_RESUMEN;
  }

  dataSnap_Concurrencia() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_CONCURRENCIA;
  }

  dataSnap_EnviarCorreo() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_ENVIAR_CORREO;
  }

  dataSnap_DescargarResumen() {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL +
    this.URL_DESCARGAR_RESUMEN;
  }

  dataSnap_Path(path: string) {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL + path;
  }

  parametro(dato: string) {
    return '/' + dato;
  }

  postToken() {
    const url = this.dataSnap_Token();
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    const credenciales = {
      nombre: 'jprincon',
      correo: 'jarincon@uniquindio.edu.co',
      clave: 'Donmatematicas#512519'
    };

    const datos = JSON.stringify(credenciales);

    return this.http.post(url, datos, {headers});
  }

  generarID() {

    let id = '';

    for (let i = 1; i < 9; i++) {
      const posicion = Math.round(Math.random() * (this.letras.length - 1));
      id = id + this.letras[posicion];
    }

    id = id + '-';

    for (let i = 1; i < 5; i++) {
      const posicion = Math.round(Math.random() * (this.letras.length - 1));
      id = id + this.letras[posicion];
    }

    id = id + '-';

    for (let i = 1; i < 5; i++) {
      const posicion = Math.round(Math.random() * (this.letras.length - 1));
      id = id + this.letras[posicion];
    }

    id = id + '-';

    for (let i = 1; i < 13; i++) {
      const posicion = Math.round(Math.random() * (this.letras.length - 1));
      id = id + this.letras[posicion];
    }

    return id;
  }

  descargarResumen(idResumen: string) {
    const url = this.dataSnap_DescargarResumen() + this.parametro(idResumen);
    return this.http.get(url);
  }

  // MÉTODOS USUARIOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  getUsuario(cedula: string) {
    const url = this.dataSnap_Usuario() + this.parametro(cedula);
    return this.http.get(url);
  }

  getUsuarios() {
    const url = this.dataSnap_Usuario() + this.parametro('all');
    return this.http.get(url);
  }

  postUsuario(datos: string) {
    const url = this.dataSnap_Usuario() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers});
  }

  putUsuario(datos: string) {
    const url = this.dataSnap_Usuario() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers});
  }

  deleteUsuario(cedula: string) {
    const url = this.dataSnap_Usuario() + this.parametro(cedula) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers});
  }

  // MÉTODOS PARTICIPANTES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  getParticipantes() {
    const url = this.dataSnap_Participante() + this.parametro('all');
    return this.http.get(url);
  }

  getParticipante(idParticipante: string) {
    const url = this.dataSnap_Participante() + this.parametro(idParticipante);
    return this.http.get(url);
  }

  getObtenerCertificados(datos: string) {
    const url = this.dataSnap_Path('obtenerCertificados');
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers});
  }

  getDescargarCertificadosUnificados(fecha: string) {
    const url = this.dataSnap_Path('descargarCertificadosUnificados') + this.parametro(fecha);
    return this.http.get(url);
  }

  postParticipante(datos: string) {
    const url = this.dataSnap_Participante() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers});
  }

  putParticipante(datos: string) {
    const url = this.dataSnap_Participante()+ this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers});
  }

  deleteParticipante(idParticipante: string) {
    const url = this.dataSnap_Participante() + + this.parametro(idParticipante) + this.parametro(this.token);
    return this.http.delete(url);
  }

  // MÉTODOS RESUMENES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  getResumenes() {
    const url = this.dataSnap_Resumen() + this.parametro('all');
    return this.http.get(url);
  }

  getResumenesAutor(cedula: string) {
    const url = this.dataSnap_ResumenesAutor() + this.parametro(cedula);
    return this.http.get(url);
  }

  getResumen(idResumen: string) {
    const url = this.dataSnap_Resumen() + this.parametro(idResumen);
    return this.http.get(url);
  }

  getResumenPorTipo(tipo: string){
    const url = this.dataSnap_ResumenePorTipo() + this.parametro(tipo);
    return this.http.get(url);
  }

  postResumen(datos: string) {

    const url = this.dataSnap_Resumen() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers});
  }

  putResumen(datos: string) {
    const url = this.dataSnap_Resumen() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers});
  }

  deleteResumen(idResumen: string) {
    const url = this.dataSnap_BorrarResumen() + this.parametro(idResumen) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers});
  }


  // MÉTODOS PALABRAS CLAVE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  getPalabrasClaveResumen(idResumen) {
    const url = this.dataSnap_PalabraClaveResumen() + this.parametro(idResumen);
    return this.http.get(url);
  }

  getPalabraClave(idPalabra: string) {
    const url = this.dataSnap_PalabraClave() + this.parametro(idPalabra);
    return this.http.get(url);
  }

  postPalabraClave(datos: string) {
    const url = this.dataSnap_PalabraClave() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers});
  }

  putPalabraClave(datos: string) {
    const url = this.dataSnap_PalabraClave() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers});
  }

  deletePalabraClave(idPalabra: string) {
    const url = this.dataSnap_PalabraClave() + this.parametro(idPalabra) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers});
  }

  // MÉTODOS AUTORES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  getAutores(idResumen) {
    const url = this.dataSnap_AutoresResumen() + this.parametro(idResumen);
    return this.http.get(url);
  }

  getAutorPorCedula(cedula) {
    const url = this.dataSnap_AutorPorCedula() + this.parametro(cedula);
    return this.http.get(url);
  }

  getAutor(idPalabra: string) {
    const url = this.dataSnap_AutorResumen() + this.parametro(idPalabra);
    return this.http.get(url);
  }

  postAutor(datos: string) {
    const url = this.dataSnap_AutorResumen() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers});
  }

  agregarAutorResumen(datos: string) {
    const url = this.dataSnap_AgregarAutorResumen() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers});
  }

  putAutor(datos: string) {
    const url = this.dataSnap_AutorResumen() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers});
  }

  deleteAutor(cedula: string, idResumen: string) {
    const url = this.dataSnap_AutorResumen() + this.parametro(cedula) + this.parametro(idResumen) + this.parametro(this.token);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers});
  }

  // MÉTODOS REFERENCIAS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  getReferencias(idResumen) {
    const url = this.dataSnap_ReferenciasResumen() + this.parametro(idResumen);
    return this.http.get(url);
  }

  getReferencia(idPalabra: string) {
    const url = this.dataSnap_ReferenciaResumen() + this.parametro(idPalabra);
    return this.http.get(url);
  }

  postReferencia(datos: string) {
    console.log(datos);
    const url = this.dataSnap_ReferenciaResumen() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers});
  }

  putReferencia(datos: string) {
    const url = this.dataSnap_ReferenciaResumen() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers});
  }

  deleteReferencia(idPalabra: string) {
    const url = this.dataSnap_ReferenciaResumen() + this.parametro(idPalabra) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers});
  }

  // Comunicación con los usuarios

  postEnviarCorreo(datos: string) {
    const url = this.dataSnap_EnviarCorreo() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers});
  }

  // INSCRIPCIÓN A LOS TALLERES

  getEstadisticas(idResumen: string) {
    const url = this.dataSnap_Path('estadisticasTaller') + this.parametro(idResumen);
    return this.http.get(url);
  }

  getObtenerTallerParticipante(cedula: string) {
    const url = this.dataSnap_Path('obtenerTallerParticipante') + this.parametro(cedula);
    return this.http.get(url);
  }

  getObtenerListaTalleres() {
    const url = this.dataSnap_Path('obtenerListasTalleres');
    return this.http.get(url);
  }

  getObtenerListaPosters() {
    const url = this.dataSnap_Path('listaPosters');
    return this.http.get(url);
  }

  postInscribirseTaller(datos: string) {
    const url = this.dataSnap_Path('inscribirTaller') + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers});
  }

  deleteSalirDelTaller(cedula: string) {
    const url = this.dataSnap_Path('salirDelTaller') + this.parametro(cedula) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers});
  }

  // MÉTODOS CONCURRENCIAS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  getContador(idVisita: string) {
    const url = this.dataSnap_Concurrencia() + this.parametro(idVisita);
    return this.http.get(url);
  }

  putContador(datos: string) {
    const url = this.dataSnap_Concurrencia() + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers});
  }

  getPermiteCrearResumenes() {
    const url = this.dataSnap_Path('permiteCrearResumenes');
    return this.http.get(url);
  }

  getPermiteInscribirseTalleres() {
    const url = this.dataSnap_Path('permiteInscribirseTalleres');
    return this.http.get(url);
  }

  getCronograma() {
    return this.http.get('assets/pruebas/cronograma.json');
  }

  getCursillo(id: string) {
    return this.http.get('assets/pruebas/cursillos.json');
  }

  getCursillos() {

  }

  getNoticias() {
    return this.http.get('assets/pruebas/noticias.json');
  }

  // %%%%%%% Tipos de Contrato %%%%%%%

  postTipoContrato(datos: string) {
    const url = this.dataSnap_Path(this.URL_TIPOCONTRATO) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getTiposContrato() {
    const url = this.dataSnap_Path(this.URL_TIPOSCONTRATO);
    return this.http.get(url).pipe(retry(10));
  }

  getTipoContrato(id: string) {
    const url = this.dataSnap_Path(this.URL_TIPOCONTRATO) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putTipoContrato(datos: string) {
    const url = this.dataSnap_Path(this.URL_TIPOCONTRATO) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteTipoContrato(id: string) {
    const url = this.dataSnap_Path(this.URL_TIPOCONTRATO) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* CategoriaDocente %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postCategoriaDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_CATEGORIADOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getCategoriasDocente() {
    const url = this.dataSnap_Path(this.URL_CATEGORIASDOCENTE);
    return this.http.get(url).pipe(retry(10));
  }

  getCategoriaDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_CATEGORIADOCENTE) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putCategoriaDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_CATEGORIADOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteCategoriaDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_CATEGORIADOCENTE) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* Docente %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_DOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getDocentes(ordenarPor: string) {
    const url = this.dataSnap_Path(this.URL_DOCENTES) + this.parametro(ordenarPor);
    return this.http.get(url).pipe(retry(10));
  }

  getDocentesPorContrato(IdContrato: string) {
    const url = this.dataSnap_Path(this.URL_DOCENTES_POR_CONTRATO) + this.parametro(IdContrato);
    return this.http.get(url).pipe(retry(10));
  }

  getDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_DOCENTE) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_DOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  putFotoDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_FOTO_DOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_DOCENTE) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* Error %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postError(datos: string) {
    const url = this.dataSnap_Path(this.URL_ERROR) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getErrores() {
    const url = this.dataSnap_Path(this.URL_ERRORES);
    return this.http.get(url).pipe(retry(10));
  }

  getError(id: string) {
    const url = this.dataSnap_Path(this.URL_ERROR) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putError(datos: string) {
    const url = this.dataSnap_Path(this.URL_ERROR) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteError(id: string) {
    const url = this.dataSnap_Path(this.URL_ERROR) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  deleteErrorPorMensaje(msg: string) {
    const url = this.dataSnap_Path(this.URL_ERROR_POR_MENSAJE) + this.parametro(this.token) + this.parametro(msg);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* Facultad %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postFacultad(datos: string) {
    const url = this.dataSnap_Path(this.URL_FACULTAD) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getFacultades() {
    const url = this.dataSnap_Path(this.URL_FACULTADES);
    return this.http.get(url).pipe(retry(10));
  }

  getFacultad(id: string) {
    const url = this.dataSnap_Path(this.URL_FACULTAD) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putFacultad(datos: string) {
    const url = this.dataSnap_Path(this.URL_FACULTAD) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteFacultad(id: string) {
    const url = this.dataSnap_Path(this.URL_FACULTAD) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* Programa %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postPrograma(datos: string) {
    const url = this.dataSnap_Path(this.URL_PROGRAMA) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getProgramas() {
    const url = this.dataSnap_Path(this.URL_PROGRAMAS);
    return this.http.get(url).pipe(retry(10));
  }

  getPrograma(id: string) {
    const url = this.dataSnap_Path(this.URL_PROGRAMA) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putPrograma(datos: string) {
    const url = this.dataSnap_Path(this.URL_PROGRAMA) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deletePrograma(id: string) {
    const url = this.dataSnap_Path(this.URL_PROGRAMA) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* ServicioPrograma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postServicioPrograma(datos: string) {
    const url = this.dataSnap_Path(this.URL_SERVICIOPROGRAMA) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getServiciosPrograma(ordenarPor: string, periodo: string) {
    const url = this.dataSnap_Path(this.URL_SERVICIOSPROGRAMA) + this.parametro(ordenarPor) + this.parametro(periodo);
    return this.http.get(url).pipe(retry(10));
  }

  getServiciosProgramaDocente(IdDocente: string, periodo: string) {
    const url = this.dataSnap_Path(this.URL_SERVICIOSPROGRAMADOCENTE) + this.parametro(IdDocente) + this.parametro(periodo);
    return this.http.get(url).pipe(retry(10));
  }

  getServicioPrograma(id: string) {
    const url = this.dataSnap_Path(this.URL_SERVICIOPROGRAMA) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putServicioPrograma(datos: string) {
    const url = this.dataSnap_Path(this.URL_SERVICIOPROGRAMA) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteServicioPrograma(id: string) {
    const url = this.dataSnap_Path(this.URL_SERVICIOPROGRAMA) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* HorarioServicio %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postHorarioServicio(datos: string) {
    const url = this.dataSnap_Path(this.URL_HORARIOSERVICIO) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getHorariosServicio(IdServicioPrograma: string) {
    const url = this.dataSnap_Path(this.URL_HORARIOSSERVICIO) + this.parametro(IdServicioPrograma);
    return this.http.get(url).pipe(retry(10));
  }

  getHorarioServicio(id: string) {
    const url = this.dataSnap_Path(this.URL_HORARIOSERVICIO) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putHorarioServicio(datos: string) {
    const url = this.dataSnap_Path(this.URL_HORARIOSERVICIO) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteHorarioServicio(id: string) {
    const url = this.dataSnap_Path(this.URL_HORARIOSERVICIO) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* AgendaServicio %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postAgendaServicio(datos: string) {
    const url = this.dataSnap_Path(this.URL_AGENDASERVICIO) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getAgendasServicio(IdDocente: string, Periodo: string) {
    const url = this.dataSnap_Path(this.URL_AGENDASSERVICIO) + this.parametro(IdDocente) + this.parametro(Periodo);
    return this.http.get(url).pipe(retry(10));
  }

  getAgendaServicio(id: string) {
    const url = this.dataSnap_Path(this.URL_AGENDASERVICIO) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putAgendaServicio(datos: string) {
    const url = this.dataSnap_Path(this.URL_AGENDASERVICIO) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteDesasociarAgendaServicio(id: string) {
    const url = this.dataSnap_Path(this.URL_DESASOCIAR_AGENDASSERVICIO) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  deleteAgendaServicio(id: string) {
    const url = this.dataSnap_Path(this.URL_AGENDASERVICIO) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* Configuracion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postConfiguracion(datos: string) {
    const url = this.dataSnap_Path(this.URL_CONFIGURACION) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getConfiguraciones() {
    const url = this.dataSnap_Path(this.URL_CONFIGURACIONES);
    return this.http.get(url).pipe(retry(10));
  }

  getConfiguracion(id: string) {
    const url = this.dataSnap_Path(this.URL_CONFIGURACION) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putConfiguracion(datos: string) {
    const url = this.dataSnap_Path(this.URL_CONFIGURACION) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteConfiguracion(id: string) {
    const url = this.dataSnap_Path(this.URL_CONFIGURACION) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* FuncionDocente %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postFuncionDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_FUNCIONDOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getFuncionesDocente() {
    const url = this.dataSnap_Path(this.URL_FUNCIONESDOCENTE);
    return this.http.get(url).pipe(retry(10));
  }

  getFuncionDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_FUNCIONDOCENTE) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putFuncionDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_FUNCIONDOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteFuncionDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_FUNCIONDOCENTE) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* ActividadDocente %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postActividadDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_ACTIVIDADDOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getActividadesDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_ACTIVIDADESDOCENTE) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  getActividadDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_ACTIVIDADDOCENTE) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putActividadDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_ACTIVIDADDOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteActividadDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_ACTIVIDADDOCENTE) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* SubactividadDocente %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postSubactividadDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_SUBACTIVIDADDOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getSubactividadesDocente(IdActividadDocente: string) {
    const url = this.dataSnap_Path(this.URL_SUBACTIVIDADESDOCENTE) + this.parametro(IdActividadDocente);
    return this.http.get(url).pipe(retry(10));
  }

  getSubactividadDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_SUBACTIVIDADDOCENTE) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putSubactividadDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_SUBACTIVIDADDOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteSubactividadDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_SUBACTIVIDADDOCENTE) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* Egresado %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postEgresado(datos: string) {
    const url = this.dataSnap_Path(this.URL_EGRESADO) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getEgresados() {
    const url = this.dataSnap_Path(this.URL_EGRESADOS);
    return this.http.get(url).pipe(retry(10));
  }

  getEgresado(id: string) {
    const url = this.dataSnap_Path(this.URL_EGRESADO) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putEgresado(datos: string) {
    const url = this.dataSnap_Path(this.URL_EGRESADO) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteEgresado(id: string) {
    const url = this.dataSnap_Path(this.URL_EGRESADO) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* GrupoInvestigacion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postGrupoInvestigacion(datos: string) {
    const url = this.dataSnap_Path(this.URL_GRUPOINVESTIGACION) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getGruposInvestigacion() {
    const url = this.dataSnap_Path(this.URL_GRUPOSINVESTIGACION);
    return this.http.get(url).pipe(retry(10));
  }

  getGrupoInvestigacion(id: string) {
    const url = this.dataSnap_Path(this.URL_GRUPOINVESTIGACION) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putGrupoInvestigacion(datos: string) {
    const url = this.dataSnap_Path(this.URL_GRUPOINVESTIGACION) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteGrupoInvestigacion(id: string) {
    const url = this.dataSnap_Path(this.URL_GRUPOINVESTIGACION) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* Modalidad %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postModalidad(datos: string) {
    const url = this.dataSnap_Path(this.URL_MODALIDAD) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getModalidades() {
    const url = this.dataSnap_Path(this.URL_MODALIDADES);
    return this.http.get(url).pipe(retry(10));
  }

  getModalidad(id: string) {
    const url = this.dataSnap_Path(this.URL_MODALIDAD) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putModalidad(datos: string) {
    const url = this.dataSnap_Path(this.URL_MODALIDAD) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteModalidad(id: string) {
    const url = this.dataSnap_Path(this.URL_MODALIDAD) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* AreaProfundizacion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postAreaProfundizacion(datos: string) {
    const url = this.dataSnap_Path(this.URL_AREAPROFUNDIZACION) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getAreasProfundizacion() {
    const url = this.dataSnap_Path(this.URL_AREASPROFUNDIZACION);
    return this.http.get(url).pipe(retry(10));
  }

  getAreaProfundizacion(id: string) {
    const url = this.dataSnap_Path(this.URL_AREAPROFUNDIZACION) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putAreaProfundizacion(datos: string) {
    const url = this.dataSnap_Path(this.URL_AREAPROFUNDIZACION) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteAreaProfundizacion(id: string) {
    const url = this.dataSnap_Path(this.URL_AREAPROFUNDIZACION) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* TrabajoGrado %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postTrabajoGrado(datos: string) {
    const url = this.dataSnap_Path(this.URL_TRABAJOGRADO) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getTrabajosGrado() {
    const url = this.dataSnap_Path(this.URL_TRABAJOSGRADO);
    return this.http.get(url).pipe(retry(10));
  }

  getTrabajoGrado(id: string) {
    const url = this.dataSnap_Path(this.URL_TRABAJOGRADO) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putTrabajoGrado(datos: string) {
    const url = this.dataSnap_Path(this.URL_TRABAJOGRADO) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteTrabajoGrado(id: string) {
    const url = this.dataSnap_Path(this.URL_TRABAJOGRADO) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* Periodo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postPeriodo(datos: string) {
    const url = this.dataSnap_Path(this.URL_PERIODO) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getPeriodos() {
    const url = this.dataSnap_Path(this.URL_PERIODOS);
    return this.http.get(url).pipe(retry(10));
  }

  getPeriodo(id: string) {
    const url = this.dataSnap_Path(this.URL_PERIODO) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putPeriodo(datos: string) {
    const url = this.dataSnap_Path(this.URL_PERIODO) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deletePeriodo(id: string) {
    const url = this.dataSnap_Path(this.URL_PERIODO) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* ActividadFuncionDocente %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postActividadFuncionDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_ACTIVIDADFUNCIONDOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getActividadesFuncionesDocente() {
    const url = this.dataSnap_Path(this.URL_ACTIVIDADESFUNCIONESDOCENTE);
    return this.http.get(url).pipe(retry(10));
  }

  getActividadFuncionDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_ACTIVIDADFUNCIONDOCENTE) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putActividadFuncionDocente(datos: string) {
    const url = this.dataSnap_Path(this.URL_ACTIVIDADFUNCIONDOCENTE) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteActividadFuncionDocente(id: string) {
    const url = this.dataSnap_Path(this.URL_ACTIVIDADFUNCIONDOCENTE) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }
}
