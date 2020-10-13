import { GeneralService } from './../../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Modalidad } from '../../../../../interfaces/interfaces.interfaces';
import { Utilidades } from '../../../../../utilidades/utilidades.class';
import { SnackBarComponent } from '../../../../../dialogos/snack-bar/snack-bar.component';

@Component({
  selector: 'app-dlg-modalidad',
  templateUrl: './dlg-modalidad.component.html',
  styles: []
})
export class DlgModalidadComponent implements OnInit {


   modalidad: Modalidad = {
    nombre: ''
  };

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgModalidadComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idmodalidad;


    if (this.accion === 'Editar') {
      this.leerModalidad();
    }
  }

  leerModalidad() {
      this.genService.getModalidad(this.id).subscribe((rModalidad: Modalidad) => {
        this.modalidad = rModalidad;
      });
  }

  guardarModalidad() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.modalidad.idmodalidad = new Utilidades().generarId();
      console.log(this.modalidad);
      const datos = JSON.stringify(this.modalidad);
      this.genService.postModalidad(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.modalidad);

      this.genService.putModalidad(datos).subscribe((rRespuesta: any) => {
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
