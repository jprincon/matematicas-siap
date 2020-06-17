import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-confirmacion',
  templateUrl: './confirmacion.component.html',
  styles: []
})
export class ConfirmacionComponent implements OnInit {

  mensaje: string;

  constructor(
              public dialogRef: MatDialogRef<ConfirmacionComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any) {

      this.mensaje = data.mensaje;
    }

  ngOnInit() {

  }

  cancelar(): void {
    this.dialogRef.close(false);
  }

  aceptar(): void {
    this.dialogRef.close(true);
  }

  /*

  mostrarConfirmacion(msg: string, id: string): void {
    const dialogRef = this.dialog.open(ConfirmacionComponent, {
      width: '60%',
      data: {mensaje: msg}
    });

    dialogRef.afterClosed().subscribe(result => {

      // Si la respuesta es [Aceptar: true] entonces se borra al usuario
      if (result) {
        this.servicio.Delete_Categoria(id).subscribe((respuesta) => {
          this.leerCategorias();
        });
      }
    });
  }

  */

}
