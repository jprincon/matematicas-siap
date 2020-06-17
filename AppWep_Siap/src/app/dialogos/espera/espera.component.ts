import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-espera',
  templateUrl: './espera.component.html',
  styles: []
})
export class EsperaComponent implements OnInit {

  mensaje = '';

  constructor(
              public dialogRef: MatDialogRef<EsperaComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any) {

              this.mensaje = data.mensaje;
  }

  ngOnInit() {
  }

}
