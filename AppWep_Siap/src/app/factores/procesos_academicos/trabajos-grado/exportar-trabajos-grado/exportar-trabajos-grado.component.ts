import { Component, OnInit } from '@angular/core';
import { TrabajoGrado, Paginacion } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';

@Component({
  selector: 'app-exportar-trabajos-grado',
  templateUrl: './exportar-trabajos-grado.component.html',
  styles: []
})
export class ExportarTrabajosGradoComponent implements OnInit {

  TrabajosGrado: TrabajoGrado[] = [];
  leyendo = false;

  paginacion: Paginacion = {
    desde: 1,
    cantidad: 5,
    resultado: '',
    todos: 'si',
    ordenarPor: 'titulo',
    attrOrdenar: ['titulo']
  };

  constructor(private genService: GeneralService) { }

  ngOnInit() {
    this.leerTrabajosGrado();
  }

  leerTrabajosGrado() {

    this.leyendo = true;

    const datos = JSON.stringify(this.paginacion);
    this.genService.getTrabajosGrado(datos).subscribe((resultPaginacion: Paginacion) => {
      this.TrabajosGrado = resultPaginacion.contenido;
      this.paginacion = resultPaginacion;
      this.leyendo = false;
    });
  }

}
