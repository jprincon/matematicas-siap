import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { ServicioPrograma, HorarioServicio } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';
import { TransferService } from '../../../services/transfer.service';

@Component({
  selector: 'app-servicios-programa',
  templateUrl: './servicios-programa.component.html',
  styles: []
})
export class ServiciosProgramaComponent implements OnInit {

  ServiciosPrograma: ServicioPrograma[] = [];
  leyendo = false;
  contIntentos = 1;

  periodos: string[] = [];

  periodo = '';
  ordenarPor = 'programa';
  aOrdenarPor: string[] = ['programa', 'asignatura', 'horas', 'aulas'];

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

    fecha = new Date();
    const year = fecha.getFullYear();
    this.periodos.push(year + '1');
    this.periodos.push(year + '2');

    this.tranfer.enviarTituloAplicacion('Servicios de Programas');
    this.leerServiciosPrograma();
  }

  leerServiciosPrograma() {

    this.leyendo = true;

    this.genService.getServiciosPrograma(this.ordenarPor, this.periodo).subscribe((rServiciosPrograma: any) => {
      this.ServiciosPrograma = rServiciosPrograma.ServiciosProgramas;
      console.log(rServiciosPrograma);
      this.leyendo = false;
    });
  }

  agregarServicioPrograma() {
    this.dlgService.DlgServicioPrograma('Crear', '').subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.leerServiciosPrograma();
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

}
