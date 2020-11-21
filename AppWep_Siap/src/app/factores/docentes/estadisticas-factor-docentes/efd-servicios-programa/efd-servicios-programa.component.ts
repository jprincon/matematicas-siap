import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { Programa } from '../../../../interfaces/interfaces.interfaces';

@Component({
  selector: 'app-efd-servicios-programa',
  templateUrl: './efd-servicios-programa.component.html',
  styles: []
})
export class EfdServiciosProgramaComponent implements OnInit {

  filtroProgrma = '';
  bProgramas: Programa[] = [];
  Programas: Programa[] = [];

  constructor(private genService: GeneralService) { }

  ngOnInit() {
    this.obtenerProgramas();
  }

  obtenerReportePrograma() {

  }

  obtenerProgramas() {
    this.genService.getProgramas().subscribe((rProgramas: any) => {
      console.log(rProgramas);
      this.Programas = rProgramas.Programas;
      this.bProgramas = this.Programas;
    });
  }

  buscarProgramas() {
    this.bProgramas = [];

    for (const programa of this.Programas) {
      if (programa.programa.indexOf(this.filtroProgrma) > 0) {
        this.bProgramas.push(programa);
      }
    }
  }

  seleccionarPrograma(programa: Programa) {
    console.log(programa);
  }

}
