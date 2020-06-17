import { Component, OnInit } from '@angular/core';
import { Cronograma } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';
import { TransferService } from '../../../../services/transfer.service';

@Component({
  selector: 'app-cronograma-emem',
  templateUrl: './cronograma-emem.component.html',
  styles: []
})
export class CronogramaEmemComponent implements OnInit {

  cronograma: Cronograma[] = [];

  constructor(private generalServie: GeneralService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.getCronograma();
    this.transfer.enviarTituloEmem('Cronograma de Actividades');
  }

  getCronograma() {
    this.generalServie.getCronograma().subscribe((rCronograma: Cronograma[]) => {
      this.cronograma = rCronograma;
    });
  }

}
