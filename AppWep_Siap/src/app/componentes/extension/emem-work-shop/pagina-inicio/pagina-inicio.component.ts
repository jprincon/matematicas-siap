import { Component, OnInit } from '@angular/core';
import { TransferService } from '../../../../services/transfer.service';

@Component({
  selector: 'app-pagina-inicio',
  templateUrl: './pagina-inicio.component.html',
  styles: []
})
export class PaginaInicioComponent implements OnInit {

  constructor(private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloEmem('Información del Evento');

    const cedula = localStorage.getItem('cedula');
    const autorIniciado = ((cedula !== undefined) && (cedula !== null));

    this.transfer.enviarVerMenuRegistro(autorIniciado);
  }

}
