import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA, MatDialog } from '@angular/material/dialog';
import { ServicioPrograma, Programa, Periodo } from '../../../../interfaces/interfaces.interfaces';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Utilidades } from '../../../../utilidades/utilidades.class';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';
import { DlgProgramaComponent } from '../../programas/dlg-programa/dlg-programa.component';

@Component({
  selector: 'app-dlg-servicio-programa',
  templateUrl: './dlg-servicio-programa.component.html',
  styles: []
})
export class DlgServicioProgramaComponent implements OnInit {


  servicioprograma: ServicioPrograma = {
    asignatura: '',
    idprograma: '',
    horas: 0,
    aulas: '',
    periodo: '',
    semanas: 17,
    jornada: 'diurna',
    grupo: ''
  };

  periodos: string[] = [];
  programas: Programa[] = [];

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  Periodos: Periodo[] = [];

  constructor(public dialogRef: MatDialogRef<DlgServicioProgramaComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar,
              public dialog: MatDialog) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idservicioprograma;

    this.leerProgramas();
    this.leerPeriodos();

    if (this.accion === 'Editar') {
      this.leerServicioPrograma();
    }
  }

  leerPeriodos() {
    this.genService.getPeriodos().subscribe((rPeriodos: any) => {

      this.Periodos = rPeriodos.Periodos;
    });
  }

  agregarPrograma() {
    this.DlgPrograma('Crear', '').subscribe((rRespuesta: any) => {

      this.leerProgramas();
    });
  }

  leerProgramas() {
    this.genService.getProgramas().subscribe((rProgramas: any) => {
      this.programas = rProgramas.Programas;
    });
  }

  leerServicioPrograma() {
      this.genService.getServicioPrograma(this.id).subscribe((rServicioPrograma: ServicioPrograma) => {
        this.servicioprograma = rServicioPrograma;
      });
  }

  guardarServicioPrograma() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.servicioprograma.idservicioprograma = new Utilidades().generarId();

      const datos = JSON.stringify(this.servicioprograma);
      this.genService.postServicioPrograma(datos).subscribe((rRespuesta: any) => {

        return this.dialogRef.close(this.servicioprograma.idservicioprograma);
      });
    } else {
      const datos = JSON.stringify(this.servicioprograma);

      this.genService.putServicioPrograma(datos).subscribe((rRespuesta: any) => {

        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    }
  }

  mostrarSnackBar(titulo: string, msg: string) {
    this.snackBar.openFromComponent(SnackBarComponent, {
      data: {Titulo: titulo, Mensaje: msg}, duration: 5000
    });
  }

  DlgPrograma(accion: string, idprograma: string) {
    const dialogRef = this.dialog.open(DlgProgramaComponent, {
      width: '60%',
      data: {accion, idprograma}
    });

    return dialogRef.afterClosed();
  }

}
