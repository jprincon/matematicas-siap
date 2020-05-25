import { Component, OnInit } from '@angular/core';
import { Usuario, Noticia } from '../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../services/general.service';
import { Md5 } from 'ts-md5/dist/md5';
import { TransferService } from '../../services/transfer.service';
import { MatDialog } from '@angular/material/dialog';
import { MensajeComponent } from '../dialogos/mensaje/mensaje.component';
import { DialogosService } from '../../services/dialogos.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styles: []
})
export class InicioComponent implements OnInit {

  usuario: Usuario = {};
  noticias: Noticia[] = [];

  constructor(private servicio: GeneralService,
              private transfer: TransferService,
              private dialogo: DialogosService,
              private router: Router) { }

  ngOnInit() {
    const inicio = localStorage.getItem('inicio');
    if (inicio === 'sistema-abierto') {
      this.transfer.enviarPermisoNavegar(true);
    }

    this.obtenerNoticias();
  }

  obtenerNoticias() {
    this.servicio.getNoticias().subscribe((rNoticias: Noticia[]) => {
      console.log(rNoticias);
      this.noticias = rNoticias;
    });
  }

  ingresar() {
    this.servicio.getUsuario(this.usuario.cedula).subscribe((rUsuario: Usuario) => {
      console.log(rUsuario);

      if (rUsuario.nombre.length > 0) {
        const contraMD5 = new Md5().appendStr(this.usuario.contra).end().toString();

        if (rUsuario.contra === contraMD5) {
          localStorage.setItem('inicio', 'sistema-abierto');
          localStorage.setItem('permiso', 'admin-user');
          this.transfer.enviarPermisoAdminstrador(true);
          this.dialogo.mostrarMensaje('Bienvenido al sistema de información del programa de licenciatura en matemáticas', 'info');
          this.router.navigate(['menu-principal']);
        } else {
          this.dialogo.mostrarMensaje('Contraseña incorrecta', 'error');
        }
      } else {
        this.dialogo.mostrarMensaje('La cuenta de usuario no existe', 'warning');
      }
    });
  }

}
