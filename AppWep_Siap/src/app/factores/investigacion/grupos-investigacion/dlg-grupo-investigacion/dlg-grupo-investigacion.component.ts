import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { GrupoInvestigacion, Docente } from '../../../../interfaces/interfaces.interfaces';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Utilidades } from '../../../../utilidades/utilidades.class';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';

@Component({
  selector: 'app-dlg-grupo-investigacion',
  templateUrl: './dlg-grupo-investigacion.component.html',
  styles: []
})
export class DlgGrupoInvestigacionComponent implements OnInit {


   grupoinvestigacion: GrupoInvestigacion = {
    nombre: '',
    sigla: '',
    iddirector: '',
    mision: '',
    vision: ''
  };

  Docentes: Docente[] = [];

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgGrupoInvestigacionComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idgrupoinvestigacion;
    this.leerDocentes();

    if (this.accion === 'Editar') {
      this.leerGrupoInvestigacion();
    }
  }

  leerDocentes() {
    this.genService.getDocentes('nombre').subscribe((rDocentes: any) => {
      this.Docentes = rDocentes.Docentes;
    });
  }

  leerGrupoInvestigacion() {
      this.genService.getGrupoInvestigacion(this.id).subscribe((rGrupoInvestigacion: GrupoInvestigacion) => {
        this.grupoinvestigacion = rGrupoInvestigacion;
      });
  }

  guardarGrupoInvestigacion() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.grupoinvestigacion.idgrupoinvestigacion = new Utilidades().generarId();

      const datos = JSON.stringify(this.grupoinvestigacion);
      this.genService.postGrupoInvestigacion(datos).subscribe((rRespuesta: any) => {

        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.grupoinvestigacion);

      this.genService.putGrupoInvestigacion(datos).subscribe((rRespuesta: any) => {

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
