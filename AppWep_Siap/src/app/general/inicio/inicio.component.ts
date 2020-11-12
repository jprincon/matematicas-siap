import { Component, OnInit } from '@angular/core';
import { Usuario, Noticia } from '../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../services/general.service';
import { Md5 } from 'ts-md5/dist/md5';
import { TransferService } from '../../services/transfer.service';
import { DialogosService } from '../../services/dialogos.service';
import { Router } from '@angular/router';
import { LS_USUARIO, LS_CLAVE } from '../../config/config';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styles: []
})
export class InicioComponent implements OnInit {

  usuario: Usuario = {};
  noticias: Noticia[] = [];

  constructor(private genService: GeneralService,
              private transfer: TransferService,
              private dialogo: DialogosService,
              private router: Router) { }

  ngOnInit() {

  }


  // %%%%%%% Inciar Sesión %%%%%%%
  ingresar() {
    this.genService.getUsuario(this.usuario.cedula).subscribe((rUsuario: Usuario) => {


      if (rUsuario.nombre) {
        const contraMD5 = new Md5().appendStr(this.usuario.contra).end().toString();

        // %%%%%%% Comparar las contraseñas %%%%%%%
        if (rUsuario.contra === contraMD5) {

          // %%%%%%% Guardar Información en el LocalStorage %%%%%%%
          localStorage.setItem(LS_USUARIO, rUsuario.cedula);
          const clave = rUsuario.nombre + rUsuario.correo + rUsuario.contra;
          const claveMd5 = new Md5().appendStr(clave).end().toString();
          localStorage.setItem(LS_CLAVE, claveMd5);

          // %%%%%%% Transferir Información a las Aplicaciones %%%%%%%
          this.transfer.enviarUsuario(rUsuario);
          this.transfer.enviarPermisoNavegar(true);
          this.transfer.enviarPermisoAdminstrador(true);

          // this.dialogo.mostrarMensaje('Bienvenido al Sistema de Información para Autoevaluación del Programa de Licenciatura en Matemáticas', 'info');
          this.genService.navegar(['factores']);

        } else {
          this.dialogo.mostrarMensaje('Contraseña incorrecta', 'error');
        }
      } else {
        this.dialogo.mostrarMensaje('La cuenta de usuario no existe', 'warning');
      }
    });
  }

}
