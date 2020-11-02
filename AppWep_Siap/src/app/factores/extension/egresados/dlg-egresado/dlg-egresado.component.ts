import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';
import { Egresado } from '../../../../interfaces/interfaces.interfaces';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Utilidades } from '../../../../utilidades/utilidades.class';

@Component({
  selector: 'app-dlg-egresado',
  templateUrl: './dlg-egresado.component.html',
  styles: []
})
export class DlgEgresadoComponent implements OnInit {


   egresado: Egresado = {
    nombre: '',
    celular: '',
    correo: '',
    esegresado: '',
    fecha: '',
    gradoescolaridad: '',
    secretaria: '',
    institucion: '',
    municipio: '',
    cargo: '',
    nivellabora: ''
  };

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgEgresadoComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idegresado;


    if (this.accion === 'Editar') {
      this.leerEgresado();
    }
  }

  leerEgresado() {
      this.genService.getEgresado(this.id).subscribe((rEgresado: Egresado) => {
        this.egresado = rEgresado;
      });
  }

  guardarEgresado() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      const datos = JSON.stringify(this.egresado);
      this.genService.postEgresado(datos).subscribe((rRespuesta: any) => {

        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.egresado);

      this.genService.putEgresado(datos).subscribe((rRespuesta: any) => {

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
