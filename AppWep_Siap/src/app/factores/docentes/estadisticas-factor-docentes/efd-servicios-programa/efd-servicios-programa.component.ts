import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { Programa, ReporteServicio, Periodo } from '../../../../interfaces/interfaces.interfaces';
import { TransferService } from '../../../../services/transfer.service';
import { CapitalizadoPipe } from '../../../../pipes/capitalizado.pipe';

@Component({
  selector: 'app-efd-servicios-programa',
  templateUrl: './efd-servicios-programa.component.html',
  styles: []
})
export class EfdServiciosProgramaComponent implements OnInit {

  filtroProgrma = '';
  bProgramas: Programa[] = [];
  Programas: Programa[] = [];
  ReportesServicios: ReporteServicio[] = [];
  periodo = '2021-1';
  Periodos: Periodo[] = [];
  nombreDoc = '';
  nombreExcel = '';
  nombrePDF = '';

  constructor(private genService: GeneralService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Reporte de Servicios por Programa');
    this.obtenerProgramas();
  }

  obtenerReportePrograma(IdPrograma: string, periodo: string) {
    this.genService.getReporteProgramasServicios(IdPrograma, periodo).subscribe((rServicios: any) => {
      console.log(rServicios);
      this.ReportesServicios = rServicios.Servicios;
    });
  }

  borrarBusqueda() {
    this.filtroProgrma = '';
    this.bProgramas = this.Programas;
  }

  obtenerPeriodos() {
    this.genService.getPeriodos().subscribe((rPeriodos: any) => {
      this.Periodos = rPeriodos.Periodos;

      this.periodo = this.Periodos[this.Periodos.length - 1].periodo;
    });
  }

  obtenerProgramas() {
    this.genService.getProgramas().subscribe((rProgramas: any) => {
      console.log(rProgramas);
      this.Programas = rProgramas.Programas;
      this.bProgramas = this.Programas;

      this.obtenerPeriodos();
    });
  }

  buscarProgramas() {
    this.bProgramas = [];

    if (this.filtroProgrma.length === 0) {
      this.bProgramas = this.Programas;
      return;
    }

    for (const programa of this.Programas) {
      if (programa.programa.indexOf(this.filtroProgrma) > 0) {
        this.bProgramas.push(programa);
      }
    }
  }

  seleccionarPrograma(programa: Programa) {
    console.log(programa);

    this.nombreDoc = 'Reporte de Servicios - ' + programa.programa.toUpperCase() + ' - (' + this.periodo + ').doc';
    this.nombreExcel = 'Reporte de Servicios - ' + programa.programa.toUpperCase() + ' - (' + this.periodo + ').xls';
    this.nombrePDF = 'Reporte de Servicios - ' + programa.programa.toUpperCase() + ' - (' + this.periodo + ').pdf';

    this.transfer.enviarTituloAplicacion('Reporte de Servicios por Programa (' + programa.programa.toUpperCase() + ')');
    this.obtenerReportePrograma(programa.idprograma, this.periodo);
  }

}
