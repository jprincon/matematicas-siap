import { Component, OnInit } from '@angular/core';
import { ServiciosService } from '../../Servicios/servicios.service';

@Component({
  selector: 'app-programacion',
  templateUrl: './programacion.component.html',
  styles: []
})
export class ProgramacionComponent implements OnInit {

  Programacion: any[] = [];

  constructor(private genService: ServiciosService) { }

  ngOnInit() {
    this.obtenerProgramacion();
  }

  obtenerProgramacion() {
    this.genService.getCronograma().subscribe((rProgramacion: any[]) => {
      console.log(rProgramacion);
      this.Programacion = rProgramacion;
    });
  }

}
