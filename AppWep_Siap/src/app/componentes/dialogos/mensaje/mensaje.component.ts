import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';

@Component({
  selector: 'app-mensaje',
  templateUrl: './mensaje.component.html',
  styles: []
})
export class MensajeComponent implements OnInit {

  tipo = '';
  mensaje = '';
  titulo = 'Error';

  constructor(
              public dialogRef: MatDialogRef<MensajeComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any) {}

  ngOnInit() {
    this.tipo = this.data.tipo;
    this.mensaje = this.data.mensaje;

    if (this.tipo === 'info') {
      this.titulo = 'Información';
    }

    if (this.tipo === 'error') {
      this.titulo = 'Error';
    }

    if (this.tipo === 'warning') {
      this.titulo = 'Advertencia';
    }
  }

  cerrar() {
    this.dialogRef.close();
  }

}
