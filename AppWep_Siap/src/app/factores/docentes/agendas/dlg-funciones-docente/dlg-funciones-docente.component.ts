import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActividadDocente, FuncionDocente } from 'src/app/interfaces/interfaces.interfaces';
import { ActividadFuncionDocente, SubactividadDocente } from '../../../../interfaces/interfaces.interfaces';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';
import { Utilidades } from '../../../../utilidades/utilidades.class';

@Component({
  selector: 'app-dlg-funciones-docente',
  templateUrl: './dlg-funciones-docente.component.html',
  styles: []
})
export class DlgFuncionesDocenteComponent implements OnInit {


  accion: string;
  guardando = false;
  leyendo = false;
  id: string;

  actividadfunciondocente: ActividadFuncionDocente = {
    idfuncion: '',
    idactividad: '',
    idsubactividad: '',
    actividad: '',
    iddocente: 0,
    periodo: '',
    horas: ''
  };

  leyendoFunciones = false;
  leyendoActividades = false;
  leyendoSubactividades = false;

  Funciones: FuncionDocente[] = [];
  Actividades: ActividadDocente[] = [];
  Subactividades: SubactividadDocente[] = [];

  constructor(public dialogRef: MatDialogRef<DlgFuncionesDocenteComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.id = this.data.idactividadprograma;

    this.actividadfunciondocente.iddocente = this.data.iddocente;
    this.actividadfunciondocente.periodo = this.data.periodo;

    this.accion = this.data.accion;

    this.leerFunciones();

    if (this.accion === 'Editar') {
      this.leerActividadFuncionDocente();
    }
  }

  leerFunciones() {
    this.leyendoFunciones = true;
    this.genService.getFuncionesDocente().subscribe((rFunciones: any) => {

      this.Funciones = rFunciones.FuncionesDocentes;
      this.leyendoFunciones = false;
    });
  }

  leerActividades() {
    this.leyendoActividades = true;
    this.genService.getActividadesDocente(this.actividadfunciondocente.idfuncion).subscribe((rActividades: any) => {

      this.Actividades = rActividades.ActividadesDocentes;
      this.leyendoActividades = false;
    });
  }

  leerActividadFuncionDocente() {
    this.genService.getActividadFuncionDocente(this.id).subscribe((rActividadFuncionDocente: ActividadFuncionDocente) => {
      console.log(rActividadFuncionDocente);
      this.actividadfunciondocente = rActividadFuncionDocente;

      this.leerActividades();
      this.leerSubactividades();
    });
  }

  leerSubactividades() {
    this.leyendoSubactividades = true;

    this.genService.getSubactividadesDocente(this.actividadfunciondocente.idactividad).subscribe((rSubactividades: any) => {
      this.Subactividades = rSubactividades.SubactividadesDocentes;

      this.leyendoSubactividades = false;
    });
  }

  crearActividadPrograma() {

  }



  guardarActividadFuncionDocente() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.actividadfunciondocente.idactividadprograma = new Utilidades().generarId();

      const datos = JSON.stringify(this.actividadfunciondocente);
      this.genService.postActividadFuncionDocente(datos).subscribe((rRespuesta: any) => {

        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.actividadfunciondocente);

      this.genService.putActividadFuncionDocente(datos).subscribe((rRespuesta: any) => {

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
