import { Component, OnInit, Inject } from '@angular/core';
import { TransferService } from '../../services/transfer.service';
import { MAT_SNACK_BAR_DATA } from '@angular/material/snack-bar';

@Component({
  selector: 'app-snack-bar',
  templateUrl: './snack-bar.component.html',
  styles: []
})
export class SnackBarComponent implements OnInit {

  Titulo = 'SIAP dice ...';
  Mensaje: string;

  constructor(@Inject(MAT_SNACK_BAR_DATA) public data: any) { }

  ngOnInit() {
    this.Titulo = this.data.Titulo;
    this.Mensaje = this.data.Mensaje;
  }

}
