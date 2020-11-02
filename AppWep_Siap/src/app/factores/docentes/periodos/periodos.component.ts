import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { Periodo } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';
import { TransferService } from '../../../services/transfer.service';

@Component({
  selector: 'app-periodos',
  templateUrl: './periodos.component.html',
  styles: []
})
export class PeriodosComponent implements OnInit {

  Periodos: Periodo[] = [];
  leyendo = false;
  contIntentos = 1;

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.leerPeriodos();

    this.transfer.enviarTituloAplicacion('Periodos');
  }

  leerPeriodos() {

    this.leyendo = true;

    this.genService.getPeriodos().subscribe((rPeriodos: any) => {
      this.Periodos = rPeriodos.Periodos;
      console.log(rPeriodos);
      this.leyendo = false;
    });
  }

  agregarPeriodo() {
    this.dlgService.DlgPeriodo('Crear', '').subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.leerPeriodos();
    });
  }

  editarPeriodo(periodo: Periodo) {
    this.dlgService.DlgPeriodo('Editar', periodo.idperiodo).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerPeriodos();
    });
  }

  eliminarPeriodo(periodo: Periodo) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Periodo?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deletePeriodo(periodo.idperiodo).subscribe((rRespuesta: any) => {
          console.log(rRespuesta);
          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerPeriodos();
        });
      }
    });
  }

}
