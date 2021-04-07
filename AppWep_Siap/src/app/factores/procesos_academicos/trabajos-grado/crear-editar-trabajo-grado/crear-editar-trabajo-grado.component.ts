import { GeneralService } from '../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { TrabajoGrado, Docente, Modalidad, AreaProfundizacion, GrupoInvestigacion } from '../../../../interfaces/interfaces.interfaces';
import { MatDialogRef, MAT_DIALOG_DATA, MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Utilidades } from '../../../../utilidades/utilidades.class';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';
import { ActivatedRoute } from '@angular/router';
import { DialogosService } from '../../../../services/dialogos.service';
import { SeleccionarDocenteComponent } from '../../../docentes/docentes/seleccionar-docente/seleccionar-docente.component';
import { RUTA_TRABAJOSGRADO } from '../../../../config/config';

@Component({
  selector: 'app-crear-editar-trabajo-grado',
  templateUrl: './crear-editar-trabajo-grado.component.html',
  styles: []
})
export class CrearEditarTrabajoGradoComponent implements OnInit {


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
      idareaprofundizacion: '',
      areaProfundizacion: {nombre: ''},
      idgrupoinvestigacion: '',
      grupoInvestigacion: {nombre: ''},
      actanombramientojurados: '',
      actapropuesta: '',
      evaluacionpropuesta: '',
	    evaluaciontrabajoescrito: '',
	    evaluacionsustentacion: '',
      fechasustentacion: '2020-08-20',
      calificacionfinal: '',
      estudiantecedederechos: '',
	    fechainicioejecucion: '2020-08-20',
	    cantidadsemestresejecucion: 0,
      estadoavance: 0
  };

  /* trabajogrado: TrabajoGrado = {
    titulo: 'Coordenadas Polares',
    idtrabajogrado: '',
    estudiante1: 'Julián Andrés Rincón Penagos',
    estudiante2: 'Leiny Yasmin Rincón Penagos',
    estudiante3: 'Claudia Milena Tavera Montes',
    idjurado1: '24575565',
    jurado1: {nombre: 'pedro'},
    jurado2: {nombre: 'pablo'},
    jurado3: {nombre: 'lucas'},
    idjurado2: '24575565',
    idjurado3: '41942993',
    iddirector: '1094883945',
    director: {nombre: 'simon'},
    idcodirector: '7555071',
    codirector: {nombre: 'fernando'},
    idmodalidad: 'nrik-fvqd-rhin-gfqf',
    modalidad: {nombre: ''},
    idareaprofundizacion: 'eqnt-qtsi-rxub-nyhj',
    areaProfundizacion: {nombre: ''},
    idgrupoinvestigacion: 'wevc-slvy-vvtu-cxqb',
    grupoInvestigacion: {nombre: ''},
    actanombramientojurados: 'jur-002',
    actapropuesta: 'act-pro-001',
    evaluacionpropuesta: '96',
    evaluaciontrabajoescrito: '95',
    evaluacionsustentacion: '95',
    fechasustentacion: '2020-08-20',
    calificacionfinal: '98',
    estudiantecedederechos: 'si',
    fechainicioejecucion: '2020-08-20',
    cantidadsemestresejecucion: 1,
    estadoavance: 100
}; */

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  Modalidades: Modalidad[] = [];
  AreasProfundizacion: AreaProfundizacion[] = [];
  GruposInvestigacion: GrupoInvestigacion[] = [];

  constructor(private genService: GeneralService,
              private snackBar: MatSnackBar,
              private activatedRoute: ActivatedRoute,
              private dlgService: DialogosService,
              public dialog: MatDialog) { }

  ngOnInit() {
    this.obtenerParametros();
  }

  obtenerParametros() {
    this.activatedRoute.params.subscribe((rParams: any) => {
      console.log(rParams);

      this.id = rParams.Id;
      if (this.id !== 'Crear') {
        this.leerTrabajoGrado();
      }

      this.leerModalidades();
      this.leerAreasProfundizacion();
      this.leerGruposInvestigacion();
    });
  }

  leerModalidades() {
    this.genService.getModalidades().subscribe((RespModalidades: any) => {
      console.log(RespModalidades);
      this.Modalidades = RespModalidades.Modalidades;
    });
  }

  leerAreasProfundizacion() {
    this.genService.getAreasProfundizacion().subscribe((RespAreasProfundizacion: any) => {
      console.log(RespAreasProfundizacion);
      this.AreasProfundizacion = RespAreasProfundizacion.AreasProfundizacion;
    });
  }

  leerGruposInvestigacion() {
    this.genService.getGruposInvestigacion().subscribe((RespGruposInvestigacion: any) => {
      console.log(RespGruposInvestigacion);
      this.GruposInvestigacion = RespGruposInvestigacion.GruposInvestigacion;
    });
  }

  leerTrabajoGrado() {
      this.genService.getTrabajoGrado(this.id).subscribe((rTrabajoGrado: TrabajoGrado) => {
        this.trabajogrado = rTrabajoGrado;
      });
  }

  guardarTrabajoGrado() {

    this.guardando = true;

    if (this.id === 'Crear') {

      this.trabajogrado.idtrabajogrado = new Utilidades().generarId();
      this.trabajogrado.jurado1 = {};
      this.trabajogrado.jurado2 = {};
      this.trabajogrado.jurado3 = {};
      this.trabajogrado.director = {};
      this.trabajogrado.codirector = {};
      this.trabajogrado.grupoInvestigacion = {};
      this.trabajogrado.modalidad = {};
      this.trabajogrado.areaProfundizacion = {};

      const datos = JSON.stringify(this.trabajogrado);
      this.genService.postTrabajoGrado(datos).subscribe((rRespuesta: any) => {

        this.dlgService.mostrarSnackBar('Siap dice ...', rRespuesta.Respuesta || rRespuesta.Error);
        this.genService.navegar([RUTA_TRABAJOSGRADO]);
      });
    } else {
      const datos = JSON.stringify(this.trabajogrado);

      this.genService.putTrabajoGrado(datos).subscribe((rRespuesta: any) => {

        this.dlgService.mostrarSnackBar('Siap dice ...', rRespuesta.Respuesta || rRespuesta.Error);
        this.genService.navegar([RUTA_TRABAJOSGRADO]);
      });
    }
  }

  mostrarSnackBar(titulo: string, msg: string) {
    this.snackBar.openFromComponent(SnackBarComponent, {
      data: {Titulo: titulo, Mensaje: msg}, duration: 5000
    });
  }

  SeleccionarDocente(nJurado: number) {
    const dialogRef = this.dialog.open(SeleccionarDocenteComponent, {
      width: '60%px', height: '600px',
      data: {}
    });

    dialogRef.afterClosed().subscribe((RespDocente: Docente) => {
      console.log(RespDocente);
      if (nJurado === 1) {
        this.trabajogrado.idjurado1 = RespDocente.iddocente;
        this.trabajogrado.jurado1 = RespDocente;
      }
      if (nJurado === 2) {
        this.trabajogrado.idjurado2 = RespDocente.iddocente;
        this.trabajogrado.jurado2 = RespDocente;
      }
      if (nJurado === 3) {
        this.trabajogrado.idjurado3 = RespDocente.iddocente;
        this.trabajogrado.jurado3 = RespDocente;
      }
      if (nJurado === 4) {
        this.trabajogrado.iddirector = RespDocente.iddocente;
        this.trabajogrado.director = RespDocente;
      }
      if (nJurado === 5) {
        this.trabajogrado.idcodirector = RespDocente.iddocente;
        this.trabajogrado.codirector = RespDocente;
      }
    });
  }

}
