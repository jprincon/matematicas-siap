import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Usuario } from '../../../interfaces/interfaces.interfaces';

@Component({
  selector: 'app-mostrar-participante',
  templateUrl: './mostrar-participante.component.html',
  styles: []
})
export class MostrarParticipanteComponent implements OnInit {

  participante: Usuario = {};

  constructor(
              public dialogRef: MatDialogRef<MostrarParticipanteComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any) {

      this.participante = data.participante;
    }

  ngOnInit() {

  }

  cancelar(): void {
    this.dialogRef.close(false);
  }

  aceptar(): void {
    this.dialogRef.close(true);
  }

}
