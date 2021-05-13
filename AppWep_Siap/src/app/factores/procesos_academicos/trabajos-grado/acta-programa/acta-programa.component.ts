import { Component, OnInit, Inject } from '@angular/core';
import { ActaConsejoCurricular } from '../../../../interfaces/interfaces.interfaces';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-acta-programa',
  templateUrl: './acta-programa.component.html',
  styles: []
})
export class ActaProgramaComponent implements OnInit {

  acc: ActaConsejoCurricular = {
    Acta: '001',
    Dia: '11',
    Mes: 'Septiembre',
    Anyo: '2020'
  };

  constructor(public dialogRef: MatDialogRef<ActaProgramaComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any) { }

  ngOnInit() {

  }

  guardar() {
    this.dialogRef.close('ACC ' + this.acc.Acta + ' del ' + this.acc.Dia + ' de ' + this.acc.Mes + ' del ' + this.acc.Anyo);
  }

}
