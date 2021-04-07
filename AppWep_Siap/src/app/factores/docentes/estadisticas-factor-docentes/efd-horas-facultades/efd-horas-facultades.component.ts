import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { ContratoEFD, Periodo } from '../../../../interfaces/interfaces.interfaces';
import { TransferService } from '../../../../services/transfer.service';

@Component({
  selector: 'app-efd-horas-facultades',
  templateUrl: './efd-horas-facultades.component.html',
  styles: []
})
export class EfdHorasFacultadesComponent implements OnInit {

  Contratos: ContratoEFD[] = [];
  leyendo = false;
  Periodos: Periodo[] = [];
  periodo = '';

  nombreExcel = 'Reporte de Horas por Facultad (2021-1).xls';

  constructor(private genService: GeneralService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Reporte de Horas por Facultad');
    // this.obtenerReporteHorasFacultad();
    this.obtenerPeriodos();
  }

  obtenerPeriodos() {
    this.genService.getPeriodos().subscribe((rPeriodos: any) => {

      this.Periodos = rPeriodos.Periodos;
      if (this.Periodos.length > 0) {
        this.periodo = this.Periodos[this.Periodos.length - 1].periodo;
        this.obtenerReporteHorasFacultad();
      }
    });
  }

  obtenerReporteHorasFacultad() {
    this.leyendo = true;
    this.genService.getReporteHorasFacultad('2021-1').subscribe((rReporte: any) => {

      this.Contratos = rReporte.Contratos;
      this.leyendo = false;
    });
  }

  Descargar() {

  }

}
