import { Injectable } from '@angular/core';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Md5 } from 'ts-md5/dist/md5';
import { Router } from '@angular/router';
import { LS_ULTIMA_RUTA } from '../config/config';
import { retry } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ServiciosService {

  letras: string[] = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
                      's', 't', 'u', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  private token = '';
  private ENCABEZADO_HTTP = 'http://';
  private IP_SERVIDOR = '201.185.240.142';
  private PUERTO = ':1952';
  private GENERAL = '/datasnap/rest/tmatematicas/';

  private URL_AFILIACION = 'Afiliacion';
  private URL_AFILIACIONES = 'Afiliaciones';
  private URL_PARTICIPANTEEMEM = 'ParticipanteEmem';
  private URL_PARTICIPANTESEMEM = 'ParticipantesEmem';

  private URL_TOKEN = 'token';


  constructor(private http: HttpClient,
              private router: Router) {

    this.postToken().subscribe((respuesta: any) => {
      this.token = respuesta.token;
      // console.log(respuesta);
    });
  }

  navegar(ruta: string[]) {
    this.router.navigate(ruta);
    localStorage.setItem(LS_ULTIMA_RUTA, JSON.stringify(ruta));
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

  // Rutas del Servidor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  dataSnap_Path(ruta: string) {
    return this.ENCABEZADO_HTTP + this.IP_SERVIDOR + this.PUERTO + this.GENERAL + ruta;
  }

  parametro(dato: string) {
    return '/' + dato;
  }

  postToken() {
    const url = this.dataSnap_Path(this.URL_TOKEN);
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

  /* Afiliacion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postAfiliacion(datos: string) {
    const url = this.dataSnap_Path(this.URL_AFILIACION) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getAfiliaciones() {
    const url = this.dataSnap_Path(this.URL_AFILIACIONES);
    return this.http.get(url).pipe(retry(10));
  }

  getAfiliacion(id: string) {
    const url = this.dataSnap_Path(this.URL_AFILIACION) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putAfiliacion(datos: string) {
    const url = this.dataSnap_Path(this.URL_AFILIACION) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteAfiliacion(id: string) {
    const url = this.dataSnap_Path(this.URL_AFILIACION) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

  /* ParticipanteEmem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

  postParticipanteEmem(datos: string) {
    const url = this.dataSnap_Path(this.URL_PARTICIPANTEEMEM) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers}).pipe(retry(10));
  }

  getParticipantesEmem() {
    const url = this.dataSnap_Path(this.URL_PARTICIPANTESEMEM);
    return this.http.get(url).pipe(retry(10));
  }

  getParticipanteEmem(id: string) {
    const url = this.dataSnap_Path(this.URL_PARTICIPANTEEMEM) + this.parametro(id);
    return this.http.get(url).pipe(retry(10));
  }

  putParticipanteEmem(datos: string) {
    const url = this.dataSnap_Path(this.URL_PARTICIPANTEEMEM) + this.parametro(this.token);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers}).pipe(retry(10));
  }

  deleteParticipanteEmem(id: string) {
    const url = this.dataSnap_Path(this.URL_PARTICIPANTEEMEM) + this.parametro(this.token) + this.parametro(id);
    console.log(url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.delete(url, {headers}).pipe(retry(10));
  }

}
