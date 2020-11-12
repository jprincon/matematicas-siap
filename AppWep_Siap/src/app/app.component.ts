import { Component } from '@angular/core';
import { GeneralService } from './services/general.service';
import { TransferService } from './services/transfer.service';
import { Router } from '@angular/router';
import { Concurrencia } from './interfaces/interfaces.interfaces';
import { LS_USUARIO, LS_CLAVE } from './config/config';
import { Md5 } from 'ts-md5/dist/md5';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent {

  constructor(private genService: GeneralService,
              private router: Router,
              private transfer: TransferService) {

    // console.clear();
    this.genService.navegar(['inicio']);
  }
}
