import { Component } from '@angular/core';
import { GeneralService } from './services/general.service';
import { TransferService } from './services/transfer.service';
import { Router } from '@angular/router';
import { Concurrencia } from './interfaces/interfaces.interfaces';
import { LS_USUARIO, LS_CLAVE } from './config/config';
import { Md5 } from 'ts-md5/dist/md5';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent {

  constructor(private genService: GeneralService,
              private router: Router,
              private transfer: TransferService) {

    this.inicioSesionAutomatico();
  }

  inicioSesionAutomatico() {
    if (!localStorage.getItem(LS_USUARIO)) {
      this.genService.navegar(['inicio']);
      return;
    }

    if (!localStorage.getItem(LS_CLAVE)) {
      this.genService.navegar(['inicio']);
      return;
    }

    const usuario = localStorage.getItem(LS_USUARIO).toString();
    this.genService.getUsuario(usuario).subscribe((rUsuario: any) => {

      const clave = rUsuario.nombre + rUsuario.correo + rUsuario.contra;
      const claveMd5 = new Md5().appendStr(clave).end().toString();

      if (claveMd5 === localStorage.getItem(LS_CLAVE).toString()) {
        console.log('Restauro Rutas');

        this.genService.restaurarRutas();
      } else {
        this.genService.navegar(['inicio']);
      }
    });
  }
}
