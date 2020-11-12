import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { ServicioPrograma, Programa, HorarioServicio, Periodo } from '../../../../interfaces/interfaces.interfaces';
import { ActivatedRoute } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { DlgProgramaComponent } from '../../programas/dlg-programa/dlg-programa.component';
import { DialogosService } from '../../../../services/dialogos.service';
import { RUTA_FACTOR_DOCENTES, RUTA_SERVICIOSPROGRAMA } from '../../../../config/config';

@Component({
  selector: 'app-servicio-programa',
  templateUrl: './servicio-programa.component.html',
  styles: []
})
export class ServicioProgramaComponent implements OnInit {

  leyendo = false;

  servicioprograma: ServicioPrograma = {
    asignatura: '',
    idprograma: '',
    horas: 0,
    aulas: '',
    periodo: '',
    semanas: 17
  };

  HorariosServicio: HorarioServicio[] = [];

  jornada: string;
  Periodos: Periodo[] = [];
  programas: Programa[] = [];


  id: string;
  guardando = false;
  dondeRegresa = '';

  constructor(private genService: GeneralService,
              private activatedRoute: ActivatedRoute,
              public dialog: MatDialog,
              private dlgService: DialogosService) { }

  ngOnInit() {
    this.obtenerParametro();
  }

  obtenerParametro() {
    this.leyendo = true;
    this.activatedRoute.params.subscribe((rParams: any) => {
      this.servicioprograma.idprograma = rParams.id;
      this.dondeRegresa = rParams.donde;

      this.leerPeriodos();
    });
  }

  leerPeriodos() {
    this.genService.getPeriodos().subscribe((rPeriodos: any) => {
      this.Periodos = rPeriodos.Periodos;

      this.leerProgramas();
    });
  }

  leerProgramas() {
    this.genService.getProgramas().subscribe((rProgramas: any) => {
      this.programas = rProgramas.Programas;

      this.leerServicio();
    });
  }

  leerServicio() {
    this.genService.getServicioPrograma(this.servicioprograma.idprograma).subscribe((rServicio: ServicioPrograma) => {
      this.servicioprograma = rServicio;
      console.log(rServicio);
      this.jornada = this.servicioprograma.jornada;

      if (this.servicioprograma.jornada !== 'virtual') {
        this.leerHorarios();
      } else {
        this.leyendo = false;
      }
    });
  }

  leerHorarios() {
    this.genService.getHorariosServicio(this.servicioprograma.idservicioprograma).subscribe((rHorarios: any) => {
      this.HorariosServicio = rHorarios.HorariosServicios;
      if ((this.servicioprograma.jornada !== 'virtual') && (this.servicioprograma.jornada !== 'distancia')) {
        this.servicioprograma.horas = rHorarios.totalHoras;
      }

      this.leyendo = false;
    });
  }

  agregarPrograma() {
    this.DlgPrograma('Crear', '').subscribe((rRespuesta: any) => {

      this.leerProgramas();
    });
  }

  guardarServicioPrograma(regresar: boolean) {

    this.guardando = true;
    const datos = JSON.stringify(this.servicioprograma);

    this.genService.putServicioPrograma(datos).subscribe((rRespuesta: any) => {

      this.guardando = false;

      if (regresar) {
        this.genService.navegar([RUTA_FACTOR_DOCENTES, this.dondeRegresa]);
      }
    });
  }

  DlgPrograma(accion: string, idprograma: string) {
    const dialogRef = this.dialog.open(DlgProgramaComponent, {
      width: '60%',
      data: {accion, idprograma}
    });

    return dialogRef.afterClosed();
  }

  agregarHorarioServicio(servicio: ServicioPrograma) {
    this.dlgService.DlgHorarioServicio('Crear', '', servicio.idservicioprograma, this.jornada).subscribe((rRespuesta: any) => {

      this.leerHorarios();
    });
  }

  editarHorarioServicio(horarioservicio: HorarioServicio) {

    this.dlgService.DlgHorarioServicio('Editar', horarioservicio.idhorarioservicio, horarioservicio.idservicioprograma, this.jornada).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerHorarios();
    });
  }

  eliminarHorarioServicio(horarioservicio: HorarioServicio) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Horario?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteHorarioServicio(horarioservicio.idhorarioservicio).subscribe((rRespuesta: any) => {
          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerHorarios();
        });
      }
    });
  }

}
