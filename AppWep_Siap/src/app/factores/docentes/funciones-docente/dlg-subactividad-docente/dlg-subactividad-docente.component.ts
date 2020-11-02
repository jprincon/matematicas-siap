import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SubactividadDocente } from '../../../../interfaces/interfaces.interfaces';
import { Utilidades } from '../../../../utilidades/utilidades.class';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';

@Component({
  selector: 'app-dlg-subactividad-docente',
  templateUrl: './dlg-subactividad-docente.component.html',
  styles: []
})
export class DlgSubactividadDocenteComponent implements OnInit {


  subactividaddocente: SubactividadDocente = {
    subactividad: '',
    idactividaddocente: ''
  };

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgSubactividadDocenteComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idsubactividaddocente;
    this.subactividaddocente.idactividaddocente = this.data.idactividaddocente;

    if (this.accion === 'Editar') {
      this.leerSubactividadDocente();
    }
  }

  leerSubactividadDocente() {
      this.genService.getSubactividadDocente(this.id).subscribe((rSubactividadDocente: SubactividadDocente) => {
        this.subactividaddocente = rSubactividadDocente;
      });
  }

  guardarSubactividadDocente() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.subactividaddocente.idsubactividaddocente = new Utilidades().generarId();

      const datos = JSON.stringify(this.subactividaddocente);
      this.genService.postSubactividadDocente(datos).subscribe((rRespuesta: any) => {

        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.subactividaddocente);

      this.genService.putSubactividadDocente(datos).subscribe((rRespuesta: any) => {

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
