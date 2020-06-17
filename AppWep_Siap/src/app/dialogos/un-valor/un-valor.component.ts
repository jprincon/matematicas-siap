import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-un-valor',
  templateUrl: './un-valor.component.html',
  styles: []
})
export class UnValorComponent implements OnInit {

  titulo = '';
  mensaje = '';
  valor = '';

  constructor(
    public dialogRef: MatDialogRef<UnValorComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any) {

    this.mensaje = data.mensaje;
    this.titulo = data.titulo;
  }

  ngOnInit() {
  }

  guardar() {
    this.dialogRef.close(this.valor);
  }

}
