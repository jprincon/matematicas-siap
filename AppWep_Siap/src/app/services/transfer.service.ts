import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Usuario } from '../interfaces/interfaces.interfaces';

@Injectable({
  providedIn: 'root'
})
export class TransferService {


  private bsNavegar = new BehaviorSubject<boolean>(false);
  public obtenerPermisoNavegar = this.bsNavegar.asObservable();

  private bsAdministrador = new BehaviorSubject<boolean>(false);
  public obtenerPermisoAdministrador = this.bsAdministrador.asObservable();

  private bsTituloAdministrador = new BehaviorSubject<string>('Administrador');
  public obtenerTituloAdministrador = this.bsTituloAdministrador.asObservable();

  private bsTituloEmem = new BehaviorSubject<string>('');
  public obtenerTituloEmem = this.bsTituloEmem.asObservable();

  private bsContadorVisitas = new BehaviorSubject<number>(0);
  public obtenerVisitas = this.bsContadorVisitas.asObservable();

  private bsVerMenuRegistro = new BehaviorSubject<boolean>(false);
  public obtenerVerMenuRegistro = this.bsVerMenuRegistro.asObservable();

  private bsMessageSnakBar = new BehaviorSubject<string>('');
  public getMessageSnakBar = this.bsMessageSnakBar.asObservable();

  // %%%%%%% Retificación de lo que realmente se usa %%%%%%%
  private bsUsuario = new BehaviorSubject<Usuario>({});
  public obtenerUsuario = this.bsUsuario.asObservable();

  private bsTitulo = new BehaviorSubject<string>('');
  public obtenerTitulo = this.bsTitulo.asObservable();

  constructor() { }

  enviarUsuario(usuario: Usuario) {
    this.bsUsuario.next(usuario);
  }

  enviarTituloAplicacion(titulo: string) {
    this.bsTitulo.next(titulo);
  }

  // %%%%%%% Por Revisar %%%%%%%
  sendMessageSnakBar(message: string) {
    this.bsMessageSnakBar.next(message);
  }

  enviarPermisoAdminstrador(permiso: boolean) {
    this.bsAdministrador.next(permiso);
  }

  enviarPermisoNavegar(permiso: boolean) {
    this.bsNavegar.next(permiso);
  }

  enviarTituloAdministrador(titulo: string) {
    this.bsTituloAdministrador.next(titulo);
  }

  enviarTituloEmem(titulo: string) {
    this.bsTituloEmem.next(titulo);
  }

  enviarVisitas(contador: number) {
    this.bsContadorVisitas.next(contador);
  }

  enviarVerMenuRegistro(ver: boolean){
    this.bsVerMenuRegistro.next(ver);
  }
}
