import { Component, OnInit } from '@angular/core';
import { GeneralService } from '../../../../services/general.service';
import { FactorCalidad, SubactividadDocente } from '../../../../interfaces/interfaces.interfaces';
import { TransferService } from '../../../../services/transfer.service';
import { DialogosService } from '../../../../services/dialogos.service';

@Component({
  selector: 'app-factores-calidad',
  templateUrl: './factores-calidad.component.html',
  styles: []
})
export class FactoresCalidadComponent implements OnInit {

  FactoresCalidad: FactorCalidad[] = [];

  constructor(private genService: GeneralService,
              private transfer: TransferService,
              private dlgService: DialogosService) { }

  ngOnInit() {
    this.obtenerFactoresCalidad();
  }

  obtenerFactoresCalidad() {
    this.genService.getFactoresCalidad().subscribe((rFactores: any) => {
      this.FactoresCalidad = rFactores.Factores;
    });
  }

  agregarFactorCalidad() {
    this.dlgService.crearEditarFactorCalidad(null).subscribe((Resp: any) => {
      this.dlgService.mostrarSnackBar('SIAP dice ...', Resp.Respuesta);
      console.log(Resp);

      this.obtenerFactoresCalidad();
    });
  }

  editarFactor(factor: FactorCalidad) {
    this.dlgService.crearEditarFactorCalidad(factor).subscribe((Resp: any) => {
      console.log(Resp);
      this.dlgService.mostrarSnackBar('SIAP dice ...', Resp.Respuesta);
      this.obtenerFactoresCalidad();
    });
  }

  eliminarFactor(factor: FactorCalidad) {
    this.dlgService.confirmacion('¿Está seguro de eliminar éste factor?').subscribe((rEliminar: boolean) => {
      if (rEliminar) {
        this.genService.deleteFactorCalidad(factor.idfactorcalidad).subscribe((rFactor: any) => {
          this.dlgService.mostrarSnackBar('SIAP dice ...', rFactor.Respuesta);

          this.obtenerFactoresCalidad();
        });
      }
    });
  }

}
