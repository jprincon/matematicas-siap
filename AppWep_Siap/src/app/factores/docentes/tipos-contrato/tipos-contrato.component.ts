import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { TransferService } from '../../../services/transfer.service';
import { TipoContrato } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';

@Component({
  selector: 'app-tipos-contrato',
  templateUrl: './tipos-contrato.component.html',
  styles: []
})
export class TiposContratoComponent implements OnInit {

  TiposContrato: TipoContrato[] = [];
  leyendo = false;
  contIntentos = 1;

  constructor(private transfer: TransferService,
              private genService: GeneralService,
              private dlgService: DialogosService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Tipos de Contrato');
    this.leerTiposContrato();
  }

  leerTiposContrato() {

    this.leyendo = true;

    this.genService.getTiposContrato().subscribe((rTiposContrato: any) => {
      this.TiposContrato = rTiposContrato.TiposContratos;
      console.log(rTiposContrato);
      this.leyendo = false;
    }, error => {
       this.leerTiposContrato();
    });
  }

  agregarTipoContrato() {
    this.dlgService.DlgTipoContrato('Crear', '').subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.leerTiposContrato();
    });
  }

  editarTipoContrato(tipocontrato: TipoContrato) {
    this.dlgService.DlgTipoContrato('Editar', tipocontrato.idtipocontrato).subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.leerTiposContrato();
    });
  }

  eliminarTipoContrato(tipocontrato: TipoContrato) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Tipo de Contrato?').subscribe((rConfirmacion: any) => {
      console.log(rConfirmacion);
      if (rConfirmacion) {
        this.borrarTipoContrato(tipocontrato.idtipocontrato);
      }
    });
  }

  borrarTipoContrato(id: string) {
    this.genService.deleteTipoContrato(id).subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
      this.leerTiposContrato();
    }, error => {
       this.borrarTipoContrato(id);
    });
  }

}
