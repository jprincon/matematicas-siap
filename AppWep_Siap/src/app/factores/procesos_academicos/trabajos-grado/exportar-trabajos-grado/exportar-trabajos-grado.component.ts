import { Component, OnInit } from '@angular/core';
import { TrabajoGrado } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';

@Component({
  selector: 'app-exportar-trabajos-grado',
  templateUrl: './exportar-trabajos-grado.component.html',
  styles: []
})
export class ExportarTrabajosGradoComponent implements OnInit {

  TrabajosGrado: TrabajoGrado[] = [];
  leyendo = false;

  constructor(private genService: GeneralService) { }

  ngOnInit() {
    this.leerTrabajosGrado();
  }

  leerTrabajosGrado() {

    this.leyendo = true;

    this.genService.getTrabajosGrado().subscribe((rTrabajosGrado: any) => {
      this.TrabajosGrado = rTrabajosGrado.TrabajosGrado;
      console.log(this.TrabajosGrado);
      this.leyendo = false;
    });
  }

}
