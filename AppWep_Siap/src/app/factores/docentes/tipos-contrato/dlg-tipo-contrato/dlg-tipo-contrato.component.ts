import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { TipoContrato } from '../../../../interfaces/interfaces.interfaces';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';
import { Utilidades } from '../../../../utilidades/utilidades.class';

@Component({
  selector: 'app-dlg-tipo-contrato',
  templateUrl: './dlg-tipo-contrato.component.html',
  styles: []
})
export class DlgTipoContratoComponent implements OnInit {


  tipocontrato: TipoContrato = {
    contrato: ''
  };

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgTipoContratoComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idtipocontrato;

    if (this.accion === 'Editar') {
      this.leerTipoContrato();
    }
  }

  leerTipoContrato() {
      this.genService.getTipoContrato(this.id).subscribe((rTipoContrato: TipoContrato) => {
        this.tipocontrato = rTipoContrato;
      });
  }

  guardarTipoContrato() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.tipocontrato.idtipocontrato = new Utilidades().generarId();

      const datos = JSON.stringify(this.tipocontrato);
      this.genService.postTipoContrato(datos).subscribe((rRespuesta: any) => {

        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.tipocontrato);

      this.genService.putTipoContrato(datos).subscribe((rRespuesta: any) => {

        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    }
  }

  mostrarSnackBar(titulo: string, msg: string) {
    this.snackBar.openFromComponent(SnackBarComponent, {
      data: {Titulo: titulo, Mensaje: msg}, duration: 5000
    });
  }

}
