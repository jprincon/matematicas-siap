import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { Programa, Facultad } from '../../../../interfaces/interfaces.interfaces';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Utilidades } from '../../../../utilidades/utilidades.class';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';

@Component({
  selector: 'app-dlg-programa',
  templateUrl: './dlg-programa.component.html',
  styles: []
})
export class DlgProgramaComponent implements OnInit {


  programa: Programa = {
    programa: '',
    idfacultad: ''
  };

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  facultades: Facultad[] = [];

  constructor(public dialogRef: MatDialogRef<DlgProgramaComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idprograma;

    this.leerFacultades();

    if (this.accion === 'Editar') {
      this.leerPrograma();
    }
  }

  leerPrograma() {
      this.genService.getPrograma(this.id).subscribe((rPrograma: Programa) => {
        this.programa = rPrograma;
      });
  }

  leerFacultades() {
    this.genService.getFacultades().subscribe((rFacultades: any) => {
      this.facultades = rFacultades.Facultades;
    });
  }

  guardarPrograma() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.programa.idprograma = new Utilidades().generarId();

      const datos = JSON.stringify(this.programa);
      this.genService.postPrograma(datos).subscribe((rRespuesta: any) => {

        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.programa);

      this.genService.putPrograma(datos).subscribe((rRespuesta: any) => {

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
