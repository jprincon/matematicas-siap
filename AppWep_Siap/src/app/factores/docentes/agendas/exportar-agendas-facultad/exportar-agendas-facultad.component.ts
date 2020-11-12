import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Contrato } from '../../../../interfaces/interfaces.interfaces';

@Component({
  selector: 'app-exportar-agendas-facultad',
  templateUrl: './exportar-agendas-facultad.component.html',
  styles: []
})
export class ExportarAgendasFacultadComponent implements OnInit {

  periodo = '';
  Leyendo = false;

  Contratos: Contrato[] = [];

  constructor(private genService: GeneralService,
              private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    this.obtenerParametros();
  }

  obtenerParametros() {
    this.activatedRoute.params.subscribe((rParams: any) => {
      this.periodo = rParams.periodo;

      this.leerAgendas();
    });
  }

  leerAgendas() {
    this.Leyendo = true;
    this.genService.getEstadoAgendas(this.periodo).subscribe((rAgendas: any) => {
      console.log(rAgendas);
      this.Contratos = rAgendas.Contratos;
      this.Leyendo = false;
    });
  }

}
