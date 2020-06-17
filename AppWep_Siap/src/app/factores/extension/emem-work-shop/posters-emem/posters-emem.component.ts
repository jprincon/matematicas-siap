import { Component, OnInit } from '@angular/core';
import { TransferService } from '../../../../services/transfer.service';

@Component({
  selector: 'app-posters-emem',
  templateUrl: './posters-emem.component.html',
  styles: []
})
export class PostersEmemComponent implements OnInit {

  constructor(private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloEmem('Posters');
  }

}
