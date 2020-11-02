import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { AreaProfundizacion } from '../../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../../services/dialogos.service';
import { TransferService } from '../../../../services/transfer.service';

@Component({
  selector: 'app-areas-profundizacion',
  templateUrl: './areas-profundizacion.component.html',
  styles: []
})
export class AreasProfundizacionComponent implements OnInit {

  AreasProfundizacion: AreaProfundizacion[] = [];
  leyendo = false;
  contIntentos = 1;

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Áreas de Profundización');
    this.leerAreasProfundizacion();
  }

  leerAreasProfundizacion() {

    this.leyendo = true;

    this.genService.getAreasProfundizacion().subscribe((rAreasProfundizacion: any) => {
      this.AreasProfundizacion = rAreasProfundizacion.AreasProfundizacion;

      this.leyendo = false;
    });
  }

  agregarAreaProfundizacion() {
    this.dlgService.DlgAreaProfundizacion('Crear', '').subscribe((rRespuesta: any) => {

      this.leerAreasProfundizacion();
    });
  }

  editarAreaProfundizacion(areaprofundizacion: AreaProfundizacion) {
    this.dlgService.DlgAreaProfundizacion('Editar', areaprofundizacion.idareaprofundizacion).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerAreasProfundizacion();
    });
  }

  eliminarAreaProfundizacion(areaprofundizacion: AreaProfundizacion) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Área de Profundización?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteAreaProfundizacion(areaprofundizacion.idareaprofundizacion).subscribe((rRespuesta: any) => {

          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerAreasProfundizacion();
        });
      }
    });
  }

}
