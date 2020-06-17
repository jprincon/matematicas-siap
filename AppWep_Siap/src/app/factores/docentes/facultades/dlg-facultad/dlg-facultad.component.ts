import { GeneralService } from './../../../../services/general.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Component, OnInit, Inject } from '@angular/core';
import { Facultad } from '../../../../interfaces/interfaces.interfaces';
import { Utilidades } from '../../../../utilidades/utilidades.class';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';

@Component({
  selector: 'app-dlg-facultad',
  templateUrl: './dlg-facultad.component.html',
  styles: []
})
export class DlgFacultadComponent implements OnInit {


  facultad: Facultad = {
    facultad: ''
  };

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgFacultadComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idfacultad;


    if (this.accion === 'Editar') {
      this.leerFacultad();
    }
  }

  leerFacultad() {
      this.genService.getFacultad(this.id).subscribe((rFacultad: Facultad) => {
        this.facultad = rFacultad;
      });
  }

  guardarFacultad() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.facultad.idfacultad = new Utilidades().generarId();
      console.log(this.facultad);
      const datos = JSON.stringify(this.facultad);
      this.genService.postFacultad(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.facultad);

      this.genService.putFacultad(datos).subscribe((rRespuesta: any) => {
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
