import { Component, OnInit } from '@angular/core';
import { TransferService } from '../../services/transfer.service';

@Component({
  selector: 'app-menu-principal',
  templateUrl: './menu-principal.component.html',
  styles: []
})
export class MenuPrincipalComponent implements OnInit {

  constructor(private transfer: TransferService) { }

  ngOnInit() {

  }

}
