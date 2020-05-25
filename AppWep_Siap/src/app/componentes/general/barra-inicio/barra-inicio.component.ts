import { Component, OnInit } from '@angular/core';
import { TransferService } from '../../../services/transfer.service';

@Component({
  selector: 'app-barra-inicio',
  templateUrl: './barra-inicio.component.html',
  styles: []
})
export class BarraInicioComponent implements OnInit {

  verMenu = true;
  verAdministrador = false;

  constructor(private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.obtenerPermisoAdministrador.subscribe((rPermiso: boolean) => {
      this.verAdministrador = rPermiso;
    });

    if ((localStorage.getItem('inicio') !== null) && (localStorage.getItem('inicio') !== undefined)) {
      this.verMenu = localStorage.getItem('inicio').toString() === 'sistema-abierto';
      this.verAdministrador = localStorage.getItem('permiso').toString() === 'admin-user';
    }
  }

}
