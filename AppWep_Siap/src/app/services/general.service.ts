import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

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

  constructor(private http: HttpClient) {
    this.postToken().subscribe((respuesta: any) => {
      this.token = respuesta.token;
      // console.log(respuesta);
    });
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
}
