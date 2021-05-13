import { Component, OnInit } from '@angular/core';
import { TransferService } from '../../services/transfer.service';

@Component({
  selector: 'app-actualizaciones',
  templateUrl: './actualizaciones.component.html',
  styles: []
})
export class ActualizacionesComponent implements OnInit {

  constructor(private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Actualizaciones');
  }

}
