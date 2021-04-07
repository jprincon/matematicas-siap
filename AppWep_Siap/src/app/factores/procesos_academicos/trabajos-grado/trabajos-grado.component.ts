import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { TrabajoGrado } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';
import { TransferService } from '../../../services/transfer.service';
import { RUTA_CREAR_EDITAR_TRABAJO_GRADO } from '../../../config/config';

@Component({
  selector: 'app-trabajos-grado',
  templateUrl: './trabajos-grado.component.html',
  styles: []
})
export class TrabajosGradoComponent implements OnInit {

  TrabajosGrado: TrabajoGrado[] = [];
  leyendo = false;
  contIntentos = 1;

  trabajogrado: TrabajoGrado = {
    titulo: '',
    idtrabajogrado: '',
    estudiante1: '',
    estudiante2: '',
    estudiante3: '',
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
    idareaprofundizacion: 'j',
    areaProfundizacion: {nombre: ''},
    idgrupoinvestigacion: '',
    grupoInvestigacion: {nombre: ''},
    actanombramientojurados: '',
    actapropuesta: '',
    evaluacionpropuesta: '',
    evaluaciontrabajoescrito: '',
    evaluacionsustentacion: '',
    fechasustentacion: '',
    calificacionfinal: '',
    estudiantecedederechos: '',
    fechainicioejecucion: '',
    cantidadsemestresejecucion: 0,
    estadoavance: 0
};

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

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

  buscarTrabajosGrado() {
    console.log(this.trabajogrado);
  }

  agregarTrabajoGrado() {
    this.genService.navegar([RUTA_CREAR_EDITAR_TRABAJO_GRADO, 'Crear']);
  }

  editarTrabajoGrado(trabajogrado: TrabajoGrado) {
    this.genService.navegar([RUTA_CREAR_EDITAR_TRABAJO_GRADO, trabajogrado.idtrabajogrado]);
  }

  eliminarTrabajoGrado(trabajogrado: TrabajoGrado) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este TrabajoGrado?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteTrabajoGrado(trabajogrado.idtrabajogrado).subscribe((rRespuesta: any) => {

          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerTrabajosGrado();
        });
      }
    });
  }

}
