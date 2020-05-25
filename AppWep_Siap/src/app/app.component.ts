import { Component } from '@angular/core';
import { GeneralService } from './services/general.service';
import { TransferService } from './services/transfer.service';
import { Router } from '@angular/router';
import { Concurrencia } from './interfaces/interfaces.interfaces';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent {

  constructor(private servicio: GeneralService,
              private router: Router,
              private transfer: TransferService) {

    /* const inicio = localStorage.getItem('inicio');
    if (inicio === 'sistema-abierto') {
      this.transfer.enviarPermisoNavegar(true);
    } else {
      router.navigate(['inicio']);
    } */

    // Temporal: Mientas se construye toda la aplicación de matemáticas
    this.transfer.enviarPermisoNavegar(true);

    servicio.getContador('visitas').subscribe((rVisitas: Concurrencia) => {

      // console.log(rVisitas);
      const visitas = rVisitas;
      let contador = (Number)(rVisitas.contador);
      contador++;
      visitas.contador = contador.toString();
      console.log(visitas);
      const datos = JSON.stringify(visitas);
      transfer.enviarVisitas(contador);

      const cedula = localStorage.getItem('cedula');
      if ((cedula !== undefined) && (cedula !== null)) {
        if (cedula.toString() !== '1098308059') {
            this.registrarVisita(datos);
        }
      } else {
        this.registrarVisita(datos);
      }
    });
  }

  registrarVisita(datos: string) {
    this.servicio.putContador(datos).subscribe((rVisita: any) => {
      console.log(rVisita);
    });
  }
}
