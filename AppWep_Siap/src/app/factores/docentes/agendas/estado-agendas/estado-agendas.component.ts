import { GeneralService } from './../../../../services/general.service';
import { AfterViewInit, Component, ElementRef, OnInit, ViewChild, Inject } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { TransferService } from '../../../../services/transfer.service';
import { Contrato } from '../../../../interfaces/interfaces.interfaces';
import * as XLSX from 'xlsx';
import { DOCUMENT } from '@angular/platform-browser';

@Component({
  selector: 'app-estado-agendas',
  templateUrl: './estado-agendas.component.html',
  styles: []
})
export class EstadoAgendasComponent implements OnInit  {

  periodo = '';
  Contratos: Contrato[] = [];
  Leyendo = false;
  nombreArchivo = 'Estado_Agenda.xlsx';
  contrato: Contrato = {};

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

      this.Contratos = rEstadoAgendas.Contratos;
      this.Leyendo = false;

      this.contrato = this.Contratos[0];

      // Exportar el Excel
      // this.exportarExcel2();
    });
  }

  exportarExcel() {
    const element = document.getElementById('estadoAgendas');
    const ws: XLSX.WorkSheet = XLSX.utils.table_to_sheet(element);

    // Generar el libro y agregar la hoja
    const wb: XLSX.WorkBook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Estado de las Agendas');

    // Guardar el archivo
    XLSX.writeFile(wb, this.nombreArchivo);
  }

  exportarExcel2() {
    const element = document.getElementById('estadoAgendas');

    const table = document.getElementById("estadoAgendas");
    const html = table.outerHTML;
    const url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url
    element.setAttribute("href", url);
    element.setAttribute("download", "export.xls"); // Choose the file name
    return false;
  }

}
