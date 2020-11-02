import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { ServicioPrograma, HorarioServicio } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';
import { TransferService } from '../../../services/transfer.service';
import { RUTA_SERVICIOPROGRAMA, RUTA_FACTOR_DOCENTES } from '../../../config/config';

@Component({
  selector: 'app-servicios-programa',
  templateUrl: './servicios-programa.component.html',
  styles: []
})
export class ServiciosProgramaComponent implements OnInit {

  bServiciosPrograma: ServicioPrograma[] = [];
  ServiciosPrograma: ServicioPrograma[] = [];
  leyendo = false;

  periodos: string[] = [];

  periodo = '';
  ordenarPor = 'programa';
  verPor = 'Libres';
  aOrdenarPor: string[] = ['programa', 'asignatura', 'horas', 'jornada'];

  terminoAsignatura = '';
  terminoPrograma = '';

  editar = true;

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private tranfer: TransferService) { }

  ngOnInit() {
    let fecha = new Date();
    this.periodo = fecha.getFullYear().toString();
    if (fecha.getMonth() < 7) {
      this.periodo += '1';
    } else {
      this.periodo += '2';
    }

    // temporal
    this.periodo = '20201';

    fecha = new Date();
    const year = fecha.getFullYear();
    this.periodos.push(year + '1');
    this.periodos.push(year + '2');

    this.tranfer.enviarTituloAplicacion('Servicios de Programas');
    this.leerServiciosPrograma();
  }

  filtrarServicios() {
    if (this.verPor === 'Todos') {
      this.bServiciosPrograma = this.ServiciosPrograma;
    }

    if (this.verPor === 'Libres') {
      this.bServiciosPrograma = [];
      for (const servicio of this.ServiciosPrograma) {
        if (!servicio.docente) {
          this.bServiciosPrograma.push(servicio);
        }
      }
    }

    if (this.verPor === 'Asignados') {
      this.bServiciosPrograma = [];
      for (const servicio of this.ServiciosPrograma) {
        if (servicio.docente) {
          this.bServiciosPrograma.push(servicio);
        }
      }
    }
  }

  buscarAsignatura() {
    this.bServiciosPrograma = [];
    const termino = this.terminoAsignatura.toLowerCase();

    for (const servicio of this.ServiciosPrograma) {
      const asignatura = servicio.asignatura.toLowerCase();

      if (asignatura.indexOf(termino) >= 0) {
        this.bServiciosPrograma.push(servicio);
      }
    }
  }

  buscarPrograma() {
    this.bServiciosPrograma = [];
    const termino = this.terminoPrograma.toLowerCase();

    for (const servicio of this.ServiciosPrograma) {
      const programa = servicio.programa.toLowerCase();

      if (programa.indexOf(termino) >= 0) {
        this.bServiciosPrograma.push(servicio);
      }
    }
  }

  leerServiciosPrograma() {

    this.leyendo = true;

    this.genService.getServiciosPrograma(this.ordenarPor, this.periodo).subscribe((rServiciosPrograma: any) => {
      console.log(rServiciosPrograma);
      this.ServiciosPrograma = rServiciosPrograma.ServiciosProgramas;

      this.filtrarServicios();

      this.leyendo = false;
    });
  }

  verServicioPrograma(servicioprograma: ServicioPrograma) {
    this.genService.navegar([RUTA_FACTOR_DOCENTES, RUTA_SERVICIOPROGRAMA, servicioprograma.idservicioprograma]);
  }

  agregarServicioPrograma() {
    this.dlgService.DlgServicioPrograma('Crear', '').subscribe((rIdSercicioPrograma: string) => {
      console.log(rIdSercicioPrograma);

      if (rIdSercicioPrograma !== undefined) {
        this.genService.navegar([RUTA_FACTOR_DOCENTES, RUTA_SERVICIOPROGRAMA, rIdSercicioPrograma]);
      }
    });
  }

  agregarHorarioServicio(servicio: ServicioPrograma) {
    this.dlgService.DlgHorarioServicio('Crear', '', servicio.idservicioprograma).subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.leerServiciosPrograma();
    });
  }

  editarServicioPrograma(servicioprograma: ServicioPrograma) {
    this.dlgService.DlgServicioPrograma('Editar', servicioprograma.idservicioprograma).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerServiciosPrograma();
    });
  }

  eliminarServicioPrograma(servicioprograma: ServicioPrograma) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este ServicioPrograma?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteServicioPrograma(servicioprograma.idservicioprograma).subscribe((rRespuesta: any) => {
          console.log(rRespuesta);
          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerServiciosPrograma();
        });
      }
    });
  }

  editarHorarioServicio(horarioservicio: HorarioServicio) {
    console.log(horarioservicio);

    this.dlgService.DlgHorarioServicio('Editar', horarioservicio.idhorarioservicio, horarioservicio.idservicioprograma).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerServiciosPrograma();
    });
  }

  eliminarHorarioServicio(horarioservicio: HorarioServicio) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Horario?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteHorarioServicio(horarioservicio.idhorarioservicio).subscribe((rRespuesta: any) => {
          console.log(rRespuesta);
          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerServiciosPrograma();
        });
      }
    });
  }

  limpiarFiltros() {
    this.bServiciosPrograma = this.ServiciosPrograma;
    this.terminoAsignatura = '';
    this.terminoPrograma = '';
  }

}
