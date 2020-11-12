import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { TransferService } from '../../../../services/transfer.service';
import { Contrato } from '../../../../interfaces/interfaces.interfaces';

@Component({
  selector: 'app-estado-agendas',
  templateUrl: './estado-agendas.component.html',
  styles: []
})
export class EstadoAgendasComponent implements OnInit {

  periodo = '';
  Contratos: Contrato[] = [];
  Leyendo = false;

  constructor(private genService: GeneralService,
              private activatedRoute: ActivatedRoute,
              private transfer: TransferService) { }

  ngOnInit() {
    this.obtenerParametros();
  }

  obtenerParametros() {
    this.activatedRoute.params.subscribe((rParams: any) => {
      this.periodo = rParams.periodo;

      this.transfer.enviarTituloAplicacion('Estado de las Agendas (' + this.periodo + ')');
      document.title = 'Estado de las Agendas (' + this.periodo + ')';

      this.obtenerEstadoAgendas();
    });
  }

  obtenerEstadoAgendas() {
    this.Leyendo = true;
    this.genService.getEstadoAgendas(this.periodo).subscribe((rEstadoAgendas: any) => {
      console.log(rEstadoAgendas);
      this.Contratos = rEstadoAgendas.Contratos;
      this.Leyendo = false;
    });
  }

}
