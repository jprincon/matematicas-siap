import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { TrabajoGrado } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';

@Component({
  selector: 'app-ver-trabajo-grado',
  templateUrl: './ver-trabajo-grado.component.html',
  styles: []
})
export class VerTrabajoGradoComponent implements OnInit, OnDestroy {

  trabajogrado: TrabajoGrado = {
    titulo: '',
    idtrabajogrado: '',
    estudiante1: '',
    estudiante2: '',
    estudiante3: '',
    estudiante1_tm: 'no',
    estudiante2_tm: 'no',
    estudiante3_tm: 'no',
    idjurado1: '',
    jurado1: {nombre: ''},
    jurado2: {nombre: ''},
    jurado3: {nombre: ''},
    idjurado2: '',
    idjurado3: '',
    iddirector: '',
    director: {nombre: ''},
    idcodirector: '',
    codirector: {nombre: ''},
    idmodalidad: '',
    modalidad: {nombre: ''},
    idareaprofundizacion: '',
    areaProfundizacion: {nombre: ''},
    idgrupoinvestigacion: '',
    grupoInvestigacion: {nombre: ''},
    actanombramientojurados: '',
    actapropuesta: '',
    evaluacionpropuesta: '',
    evaluaciontrabajoescrito: '',
    evaluacionsustentacion: '',
    fechasustentacion: '2000-08-20',
    calificacionfinal: '',
    estudiantecedederechos: '',
    fechainicioejecucion: '2000-08-20',
    cantidadsemestresejecucion: {
      Dias: '',
      Meses: '',
      Anos: '',
      Semestres: ''
    },
    estadoproyecto: ''
};

  constructor(private activatedRoute: ActivatedRoute,
              private genService: GeneralService) { }


  ngOnInit() {
    this.obtenerParametros();
  }

  obtenerParametros() {
    this.activatedRoute.params.subscribe((rParams: any) => {
      console.log(rParams);
      this.trabajogrado = {idtrabajogrado: rParams.IdTrabajoGrado};

      this.obtenerTrabajoGrado();
    });
  }

  obtenerTrabajoGrado() {
    this.genService.getTrabajoGrado(this.trabajogrado.idtrabajogrado).subscribe((rTrabajo: TrabajoGrado) => {
      console.log(rTrabajo);
      this.trabajogrado = rTrabajo;
    });
  }

  ngOnDestroy(): void {

  }

}
