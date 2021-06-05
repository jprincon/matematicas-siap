import { Component, OnInit } from '@angular/core';
import { ReporteTrabajoGrado } from 'src/app/interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';
import { Docente } from '../../../../interfaces/interfaces.interfaces';
import { Menu } from '../../../../general/menu/menu.component';

@Component({
  selector: 'app-reporte-direccion-trabajos-grado',
  templateUrl: './reporte-direccion-trabajos-grado.component.html',
  styles: []
})
export class ReporteDireccionTrabajosGradoComponent implements OnInit {

  ReportesTrabajosGrado: ReporteTrabajoGrado[] = [];
  Directores: Docente[] = [];
  noDirectores: Docente[] = [];

  Menus: Menu[] = [
    {
      nombre: 'Directores por Tipo de Contrato',
      descripcion: 'Muestra la lista de directores de trabajos de grado por tipo de contrato',
      ruta: 'directores-tipo-contrato'
    },
    {
      nombre: 'Docentes con Dirección de Trabajos de Grado',
      descripcion: 'Muestra la lista de docentes que estan y no dirigiendo trabajos de grado',
      ruta: 'directores-no-directores'
    },
  ];

  Vistas: boolean[] = [
    true,  // directores por tipo de contrato
    false, // todos los directores y no directores
  ];

  constructor(private genService: GeneralService) { }

  ngOnInit() {
    this.obtenerReporte();
  }

  verMenu(menu: Menu) {
    this.Vistas = [false, false];

    if (menu.ruta === 'directores-tipo-contrato') {
      this.Vistas[0] = true;
    }

    if (menu.ruta === 'directores-no-directores') {
      this.Vistas[1] = true;
    }
  }

  obtenerReporte() {
    this.genService.getDirectoresTrabajosGrado().subscribe((rContratos: any) => {
      console.log(rContratos);
      this.ReportesTrabajosGrado = rContratos.Contratos;

      this.Directores = [];
      this.noDirectores = [];

      for (const contrato of this.ReportesTrabajosGrado) {
        for (const docente of contrato.Docentes ) {
          if ((docente.Terminados.length === 0) && (docente.noTerminados.length === 0)) {
            this.noDirectores.push(docente);
          } else {
            if (docente.noTerminados.length === 0) {
              this.noDirectores.push(docente);
            } else {
              this.Directores.push(docente);
            }
          }
        }
      }
    });
  }

  DirectoresPorTipoContrato() {

  }

}
