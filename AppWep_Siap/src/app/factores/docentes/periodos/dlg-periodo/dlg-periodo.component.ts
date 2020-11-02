import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Periodo } from '../../../../interfaces/interfaces.interfaces';
import { Utilidades } from '../../../../utilidades/utilidades.class';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';

@Component({
  selector: 'app-dlg-periodo',
  templateUrl: './dlg-periodo.component.html',
  styles: []
})
export class DlgPeriodoComponent implements OnInit {


  periodo: Periodo = {
    periodo: ''
  };

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgPeriodoComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idperiodo;


    if (this.accion === 'Editar') {
      this.leerPeriodo();
    }
  }

  leerPeriodo() {
      this.genService.getPeriodo(this.id).subscribe((rPeriodo: Periodo) => {
        this.periodo = rPeriodo;
      });
  }

  guardarPeriodo() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.periodo.idperiodo = new Utilidades().generarId();
      console.log(this.periodo);
      const datos = JSON.stringify(this.periodo);
      this.genService.postPeriodo(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.periodo);

      this.genService.putPeriodo(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
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
