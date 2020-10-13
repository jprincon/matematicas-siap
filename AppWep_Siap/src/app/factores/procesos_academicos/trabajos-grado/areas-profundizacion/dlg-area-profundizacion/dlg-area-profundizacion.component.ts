import { GeneralService } from './../../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { Utilidades } from '../../../../../utilidades/utilidades.class';
import { AreaProfundizacion } from '../../../../../interfaces/interfaces.interfaces';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-dlg-area-profundizacion',
  templateUrl: './dlg-area-profundizacion.component.html',
  styles: []
})
export class DlgAreaProfundizacionComponent implements OnInit {


   areaprofundizacion: AreaProfundizacion = {
    nombre: ''
  };

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgAreaProfundizacionComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idareaprofundizacion;


    if (this.accion === 'Editar') {
      this.leerAreaProfundizacion();
    }
  }

  leerAreaProfundizacion() {
      this.genService.getAreaProfundizacion(this.id).subscribe((rAreaProfundizacion: AreaProfundizacion) => {
        this.areaprofundizacion = rAreaProfundizacion;
      });
  }

  guardarAreaProfundizacion() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.areaprofundizacion.idareaprofundizacion = new Utilidades().generarId();
      console.log(this.areaprofundizacion);
      const datos = JSON.stringify(this.areaprofundizacion);
      this.genService.postAreaProfundizacion(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.areaprofundizacion);

      this.genService.putAreaProfundizacion(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    }
  }

  mostrarSnackBar(titulo: string, msg: string) {
    this.snackBar.openFromComponent(SnackbarComponent, {
      data: {Titulo: titulo, Mensaje: msg}, duration: 5000
    });
  }

}
