import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { MenuFactores, BotonMenu } from '../../../interfaces/interfaces.interfaces';
import { RUTA_FACTOR_DOCENTES, RUTA_ESTADISTICAS_SERVICIOS_PROGRAMA } from '../../../config/config';
import { TransferService } from '../../../services/transfer.service';

@Component({
  selector: 'app-estadisticas-factor-docentes',
  templateUrl: './estadisticas-factor-docentes.component.html',
  styles: []
})
export class EstadisticasFactorDocentesComponent implements OnInit {

  Menus: BotonMenu[] = [
    {
      Titulo: 'Servicios por Programa',
      Icono: 'pendiente.png',
      Ruta: [RUTA_FACTOR_DOCENTES, RUTA_ESTADISTICAS_SERVICIOS_PROGRAMA]
    }
  ];

  constructor(private genService: GeneralService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Estadísticas del Factor Docentes');
  }

  abrirMenu(ruta: string[]) {
    this.genService.navegar(ruta);
  }

}
