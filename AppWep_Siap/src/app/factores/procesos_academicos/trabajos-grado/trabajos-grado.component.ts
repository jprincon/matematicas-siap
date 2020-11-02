import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { TrabajoGrado } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';
import { TransferService } from '../../../services/transfer.service';

@Component({
  selector: 'app-trabajos-grado',
  templateUrl: './trabajos-grado.component.html',
  styles: []
})
export class TrabajosGradoComponent implements OnInit {

  TrabajosGrado: TrabajoGrado[] = [];
  leyendo = false;
  contIntentos = 1;

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.leerTrabajosGrado();
  }

  leerTrabajosGrado() {

    this.leyendo = true;

    this.genService.getTrabajosGrado().subscribe((rTrabajosGrado: any) => {
      this.TrabajosGrado = rTrabajosGrado.TrabajosGrado;

      this.leyendo = false;
    });
  }

  agregarTrabajoGrado() {
    this.dlgService.DlgTrabajoGrado('Crear', '').subscribe((rRespuesta: any) => {

      this.leerTrabajosGrado();
    });
  }

  editarTrabajoGrado(trabajogrado: TrabajoGrado) {
    this.dlgService.DlgTrabajoGrado('Editar', trabajogrado.idtrabajogrado).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerTrabajosGrado();
    });
  }

  eliminarTrabajoGrado(trabajogrado: TrabajoGrado) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este TrabajoGrado?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteTrabajoGrado(trabajogrado.idtrabajogrado).subscribe((rRespuesta: any) => {

          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerTrabajosGrado();
        });
      }
    });
  }

}
