import { GeneralService } from './../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { DialogosService } from '../../services/dialogos.service';
import { Error } from '../../interfaces/interfaces.interfaces';
import { TransferService } from '../../services/transfer.service';

@Component({
  selector: 'app-errores',
  templateUrl: './errores.component.html',
  styles: []
})
export class ErroresComponent implements OnInit {

  Errores: Error[] = [];
  leyendo = false;
  contIntentos = 1;

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Gestión de Errores de la Aplicación');
    this.leerErrores();
  }

  leerErrores() {

    this.leyendo = true;

    this.genService.getErrores().subscribe((rErrores: any) => {
      this.Errores = rErrores.Errores;

      this.leyendo = false;
    });
  }


  eliminarError(error: Error) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Error?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.borrarError(error.iderror);
      }
    });
  }

  eliminarErrorPorMensaje(error: Error) {
    this.dlgService.confirmacion('¿Está seguro de eliminar los Errores?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteErrorPorMensaje(error.mensaje).subscribe((rRespuesta: any) => {
          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerErrores();
        });
      }
    });
  }

  borrarError(id: string) {
    this.genService.deleteError(id).subscribe((rRespuesta: any) => {

      this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
      this.leerErrores();
    });
  }

}
