import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { Modalidad } from '../../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../../services/dialogos.service';
import { TransferService } from '../../../../services/transfer.service';

@Component({
  selector: 'app-modalidades',
  templateUrl: './modalidades.component.html',
  styles: []
})
export class ModalidadesComponent implements OnInit {

  Modalidades: Modalidad[] = [];
  leyendo = false;
  contIntentos = 1;

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Modalidades de Trabajo de Grado');
    this.leerModalidades();
  }

  leerModalidades() {

    this.leyendo = true;

    this.genService.getModalidades().subscribe((rModalidades: any) => {
      this.Modalidades = rModalidades.Modalidades;

      this.leyendo = false;
    });
  }

  agregarModalidad() {
    this.dlgService.DlgModalidad('Crear', '').subscribe((rRespuesta: any) => {

      this.leerModalidades();
    });
  }

  editarModalidad(modalidad: Modalidad) {
    this.dlgService.DlgModalidad('Editar', modalidad.idmodalidad).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar(rRespuesta);
      this.leerModalidades();
    });
  }

  eliminarModalidad(modalidad: Modalidad) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Modalidad?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteModalidad(modalidad.idmodalidad).subscribe((rRespuesta: any) => {

          this.dlgService.mostrarSnackBar(rRespuesta.Respuesta || rRespuesta.Error);
          this.leerModalidades();
        });
      }
    });
  }

}
