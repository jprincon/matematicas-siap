import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TransferService } from '../../services/transfer.service';
import { RUTA_ADMINISTRADOR, RUTA_ADMIN_USUARIO, RUTA_ADMIN_WORKSHOP_EMEM, RUTA_ADMIN_CONFIGURACIONES, RUTA_ADMIN_PRUEBAS, RUTA_ADMIN_TIPO_PRODUCCION } from '../../config/config';

@Component({
  selector: 'app-administrador',
  templateUrl: './administrador.component.html',
  styles: []
})
export class AdministradorComponent implements OnInit {

  tituloVentana = '';

  menuAdmin: any[] = [
    {nombre: 'Usuarios', ruta: RUTA_ADMIN_USUARIO},
    {nombre: 'Workshop EMEM', ruta: RUTA_ADMIN_WORKSHOP_EMEM},
    {nombre: 'Pruebas', ruta: RUTA_ADMIN_PRUEBAS},
    {nombre: 'Configuraciones', ruta: RUTA_ADMIN_CONFIGURACIONES},
    {nombre: 'Tipos de Producción', ruta: RUTA_ADMIN_TIPO_PRODUCCION},
  ];

  constructor(private router: Router,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.obtenerTituloAdministrador.subscribe((rTitulo: string) => {
      this.tituloVentana = rTitulo;
    });
  }

  abrirMenu(ruta: string) {
    this.router.navigate([RUTA_ADMINISTRADOR, ruta]);
  }

}
