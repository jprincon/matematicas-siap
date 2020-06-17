import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TransferService } from '../../services/transfer.service';

@Component({
  selector: 'app-administrador',
  templateUrl: './administrador.component.html',
  styles: []
})
export class AdministradorComponent implements OnInit {

  tituloVentana = '';

  menuAdmin: any[] = [
    {nombre: 'Usuarios', ruta: 'usuario'},
    {nombre: 'Workshop EMEM', ruta: 'workshop-emem'},
    {nombre: 'Pruebas', ruta: 'pruebas'},
    {nombre: 'Configuraciones', ruta: 'configuraciones'}
  ];

  constructor(private router: Router,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.obtenerTituloAdministrador.subscribe((rTitulo: string) => {
      this.tituloVentana = rTitulo;
    });
  }

  abrirMenu(ruta: string) {
    this.router.navigate(['administrador', ruta]);
  }

}
