import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-confirmacion',
  templateUrl: './confirmacion.component.html',
  styles: []
})
export class ConfirmacionComponent implements OnInit {

  mensaje = '';
  accion = '';

  constructor(
              public dialogRef: MatDialogRef<ConfirmacionComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any) { }

  ngOnInit() {
    this.mensaje = this.data.mensaje;
  }

  aceptar() {
    this.dialogRef.close(true);
  }

  cancelar() {
    this.dialogRef.close(false);
  }

}
