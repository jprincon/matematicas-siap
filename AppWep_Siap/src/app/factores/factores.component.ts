import { GeneralService } from './../services/general.service';
import { Component, OnInit } from '@angular/core';
import { TransferService } from '../services/transfer.service';

@Component({
  selector: 'app-factores',
  templateUrl: './factores.component.html',
  styles: []
})
export class FactoresComponent implements OnInit {

  constructor(private genService: GeneralService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Factores de Autoevaluación');
  }

  abrirMenu(menu: string) {
    this.genService.navegar([menu]);
  }

}
