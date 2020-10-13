import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { TrabajoGrado } from '../../../../interfaces/interfaces.interfaces';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Utilidades } from '../../../../utilidades/utilidades.class';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';

@Component({
  selector: 'app-dlg-trabajo-grado',
  templateUrl: './dlg-trabajo-grado.component.html',
  styles: []
})
export class DlgTrabajoGradoComponent implements OnInit {


   trabajogrado: TrabajoGrado = {
    titulo: '',
    estudiante1: '',
    estudiante2: '',
    estudiante3: '',
    idjurado1: '',
    idjurado2: '',
    idjurado3: '',
    iddirector: '',
    idmodalidad: '',
    idareaprofundizacion: '',
    idgrupoinvestigacion: '',
    actapropuesta: '',
    fechasustentacion: '',
    calificacion: ''
  };

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgTrabajoGradoComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idtrabajogrado;


    if (this.accion === 'Editar') {
      this.leerTrabajoGrado();
    }
  }

  leerTrabajoGrado() {
      this.genService.getTrabajoGrado(this.id).subscribe((rTrabajoGrado: TrabajoGrado) => {
        this.trabajogrado = rTrabajoGrado;
      });
  }

  guardarTrabajoGrado() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.trabajogrado.idtrabajogrado = new Utilidades().generarId();
      console.log(this.trabajogrado);
      const datos = JSON.stringify(this.trabajogrado);
      this.genService.postTrabajoGrado(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.trabajogrado);

      this.genService.putTrabajoGrado(datos).subscribe((rRespuesta: any) => {
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
