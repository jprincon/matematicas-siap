import { Component, OnInit } from '@angular/core';
import { Usuario } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';
import { TransferService } from '../../../../services/transfer.service';
import { DialogosService } from '../../../../services/dialogos.service';
import { Md5 } from 'ts-md5/dist/md5';
import { Router } from '@angular/router';

@Component({
  selector: 'app-inscripciones-emem',
  templateUrl: './inscripciones-emem.component.html',
  styles: []
})
export class InscripcionesEmemComponent implements OnInit {

  usuario: Usuario = {
    nombre: '',
    contra: '',
    cedula: '',
    correo: '',
    tipoParticipacion: ''
  };
  verificacion = '';

  pest2 = true;
  pest1 = false;
  inicioSesion = false;

  usuarioInicio: Usuario = {
    cedula: '',
    contra: ''
  };

  correoValido = true;
  documentoValido = true;
  nombreValido = true;
  contraValida = true;
  constrasIguales = true;
  tipoPartValido = true;
  afilValido = true;
  lugarTrabajoValido = true;

  puedeInscribirse = false;

  usuarioNavegador: Usuario = {};
  usuarioIniciado = '';

  constructor(private servicio: GeneralService,
              private dialogos: DialogosService,
              private router: Router,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloEmem('Inscripciones');

    this.usuarioIniciado = localStorage.getItem('usuario');

    if ((this.usuarioIniciado !== undefined) && (this.usuarioIniciado !== null)) {
      this.obtenerUsuario();
      this.inicioSesion = true;
    }
  }

  reiniciarUsuario() {
    this.correoValido = true;
    this.documentoValido = true;
    this.nombreValido = true;
    this.contraValida = true;
    this.constrasIguales = true;
    this.tipoPartValido = true;
    this.afilValido = true;
    this.lugarTrabajoValido = true;

    this.usuario = {
      nombre: '',
      contra: '',
      cedula: '',
      correo: '',
      tipoParticipacion: '',
      afiliacion: '',
      lugarTrabajo: ''
    };
  }

  obtenerUsuario() {
    const cedula = localStorage.getItem('cedula');

    if ((cedula !== undefined) || (cedula !== null)) {
      this.servicio.getParticipante(cedula).subscribe((rParticipante: Usuario) => {
        this.usuarioNavegador = rParticipante;
      });
    }
  }

  iniciarSesion() {
    this.servicio.getParticipante(this.usuarioInicio.cedula).subscribe((rParticipante: Usuario) => {

      const password = new Md5().appendStr(this.usuarioInicio.contra).end().toString();

      if (password === rParticipante.contra) {
        localStorage.setItem('usuario', 'validado');
        localStorage.setItem('cedula', this.usuarioInicio.cedula);

        this.obtenerUsuario();
        this.inicioSesion = true;
        this.transfer.enviarVerMenuRegistro(true);

      } else {
        this.dialogos.mostrarMensaje('Lo sentimos la contraseña es incorrecta', 'error');
      }
    });
  }

  cerrarSesion() {
    localStorage.removeItem('cedula');
    localStorage.removeItem('usuario');

    this.router.navigate(['emem-workshop', 'inicio']);
  }

  inscribirse() {

    const password = new Md5().appendStr(this.usuario.contra).end().toString();
    this.usuario.contra = password;
    const datos = JSON.stringify(this.usuario);
    console.log(this.usuario);
    this.servicio.postParticipante(datos).subscribe((rParticipante: any) => {
      console.log(rParticipante);
      const respuesta: string = rParticipante.respuesta;

      if (respuesta.indexOf('llave duplicada') >= 0) {
        this.dialogos.mostrarMensaje('El Usuario ya esta registrado en el evento', 'warning');

      } else if (respuesta.indexOf('denegado') >= 0) {
        this.dialogos.mostrarMensaje(respuesta, 'info');

      } else if (respuesta.indexOf('Participante creado') >= 0) {
        this.dialogos.mostrarMensaje('El participante se creo correctamente', 'info');

        localStorage.setItem('usuario', 'validado');
        localStorage.setItem('cedula', this.usuario.cedula);

        this.servicio.getParticipante(this.usuario.cedula).subscribe((rUsuarioActivo: Usuario) => {
          this.usuarioNavegador = rUsuarioActivo;
        });

        this.reiniciarUsuario();

        this.pest1 = false;
        this.pest2 = true;
      }
    });

  }

  sinTrabajo() {
    this.usuario.lugarTrabajo = 'Sin Trabajo';
    this.validarDatos();
  }

  validarDatos() {
    this.documentoValido = this.usuario.cedula.length >= 7;
    this.correoValido = (this.usuario.correo.indexOf('@') >= 0);
    this.nombreValido = this.usuario.nombre.length >= 6;
    this.contraValida = this.usuario.contra.length >= 8;
    this.constrasIguales = this.usuario.contra === this.verificacion;
    this.tipoPartValido = this.usuario.tipoParticipacion !== '';
    this.afilValido = this.usuario.afiliacion !== '';
    this.lugarTrabajoValido = this.usuario.lugarTrabajo !== '';

    this.puedeInscribirse = this.documentoValido && this.correoValido && this.nombreValido && this.contraValida && this.constrasIguales;
  }

}
