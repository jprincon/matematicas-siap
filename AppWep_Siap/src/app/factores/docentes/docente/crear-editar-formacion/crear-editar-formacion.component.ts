import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Formacion, Docente } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';

@Component({
  selector: 'app-crear-editar-formacion',
  templateUrl: './crear-editar-formacion.component.html',
  styles: []
})
export class CrearEditarFormacionComponent implements OnInit {

  accion = 'Crear';
  formacion: Formacion = {
    idformacion: '',
    titulo: '',
    fechafin: '',
    fechainicio: '',
    institucion: '',
    iddocente: ''
  };

  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<CrearEditarFormacionComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService) { }

  ngOnInit() {
    if (this.data.formacion !== null) {
      this.formacion = this.data.formacion;
      this.accion = 'Editar';
    }

    this.formacion.iddocente = this.data.docente.iddocente;
  }

  guardar() {
    const datos = JSON.stringify(this.formacion);

    if (this.accion === 'Crear') {
      this.genService.postFormacion(datos).subscribe((rFormacion: any) => {
        this.dialogRef.close(rFormacion);
      });
    } else {
      this.genService.putFormacion(datos).subscribe((rFormacion: any) => {
        this.dialogRef.close(rFormacion);
      });
    }
  }

}
