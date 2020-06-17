import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TransferService } from '../../../services/transfer.service';
import { GeneralService } from '../../../services/general.service';
import { Concurrencia } from '../../../interfaces/interfaces.interfaces';

@Component({
  selector: 'app-emem-work-shop',
  templateUrl: './emem-work-shop.component.html',
  styles: []
})
export class EmemWorkShopComponent implements OnInit {

  visitasPagina = 0;
  fechaActualizacion = new Date('2019/10/5');
  autorIniciado = false;

  tituloEmem = '';

  constructor(private router: Router,
              private servicio: GeneralService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.obtenerTituloEmem.subscribe((rTitulo: string) => {
      this.tituloEmem = rTitulo;
    });

    this.transfer.obtenerVisitas.subscribe((rVisitas: number) => {
      this.visitasPagina = rVisitas;
    });

    this.transfer.obtenerVerMenuRegistro.subscribe((rVerMenuRegistro: boolean) => {
      this.autorIniciado = rVerMenuRegistro;
    });
  }

  IrAPagina(rutas: string[]) {

    this.router.navigate(rutas);
  }

}
