import { Component, OnInit } from '@angular/core';
import { TransferService } from '../../services/transfer.service';

@Component({
  selector: 'app-titulo-menu',
  templateUrl: './titulo-menu.component.html',
  styles: []
})
export class TituloMenuComponent implements OnInit {

  titulo = '';
  constructor(private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.obtenerTitulo.subscribe((rTitulo: string) => {
      this.titulo = rTitulo;
    });
  }

}
