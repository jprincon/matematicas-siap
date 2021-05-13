import { Component, OnInit } from '@angular/core';
import { TransferService } from '../../services/transfer.service';

@Component({
  selector: 'app-tareas-pendientes',
  templateUrl: './tareas-pendientes.component.html',
  styles: []
})
export class TareasPendientesComponent implements OnInit {

  constructor(private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Tareas Pendientes');
  }

}
