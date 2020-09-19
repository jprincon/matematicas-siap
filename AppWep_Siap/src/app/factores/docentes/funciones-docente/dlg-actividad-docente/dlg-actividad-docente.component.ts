import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActividadDocente, FuncionDocente } from '../../../../interfaces/interfaces.interfaces';
import { Utilidades } from '../../../../utilidades/utilidades.class';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';

@Component({
  selector: 'app-dlg-actividad-docente',
  templateUrl: './dlg-actividad-docente.component.html',
  styles: []
})
export class DlgActividadDocenteComponent implements OnInit {


  actividaddocente: ActividadDocente = {
    actividad: '',
    idfunciondocente: '',
    subactividades: []
  };

  FuncionesDocente: FuncionDocente[] = [];

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgActividadDocenteComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idactividaddocente;
    this.actividaddocente.idfunciondocente = this.data.idfunciondocente;

    this.leerFuncionesDocente();

    if (this.accion === 'Editar') {
      this.leerActividadDocente();
    }
  }

  leerFuncionesDocente() {

    this.leyendo = true;

    this.genService.getFuncionesDocente().subscribe((rFuncionesDocente: any) => {
      this.FuncionesDocente = rFuncionesDocente.FuncionesDocentes;
      console.log(rFuncionesDocente);
      this.leyendo = false;
    });
  }


  leerActividadDocente() {
      this.genService.getActividadDocente(this.id).subscribe((rActividadDocente: ActividadDocente) => {
        this.actividaddocente = rActividadDocente;
      });
  }

  guardarActividadDocente() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.actividaddocente.idactividaddocente = new Utilidades().generarId();
      console.log(this.actividaddocente);
      const datos = JSON.stringify(this.actividaddocente);
      this.genService.postActividadDocente(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.actividaddocente);

      this.genService.putActividadDocente(datos).subscribe((rRespuesta: any) => {
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
