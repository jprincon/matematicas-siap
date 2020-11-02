import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { ServicioPrograma, Programa, HorarioServicio } from '../../../../interfaces/interfaces.interfaces';
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

  periodos: string[] = [];
  programas: Programa[] = [];

  id: string;
  guardando = false;

  constructor(private genService: GeneralService,
              private activatedRoute: ActivatedRoute,
              public dialog: MatDialog,
              private dlgService: DialogosService) { }

  ngOnInit() {
    this.leerProgramas();
    const fecha = new Date();
    const year = fecha.getFullYear();
    this.periodos.push(year + '1');
    this.periodos.push(year + '2');

    this.obtenerParametro();
  }

  obtenerParametro() {
    this.leyendo = true;
    this.activatedRoute.params.subscribe((rParams: any) => {
      this.servicioprograma.idprograma = rParams.id;

      this.leerServicio();
    });
  }

  leerServicio() {
    this.genService.getServicioPrograma(this.servicioprograma.idprograma).subscribe((rServicio: ServicioPrograma) => {
      this.servicioprograma = rServicio;

      this.leerHorarios();
    });
  }

  leerHorarios() {
    this.genService.getHorariosServicio(this.servicioprograma.idservicioprograma).subscribe((rHorarios: any) => {
      this.HorariosServicio = rHorarios.HorariosServicios;
      this.servicioprograma.horas = rHorarios.totalHoras;
      this.leyendo = false;
    });
  }

  agregarPrograma() {
    this.DlgPrograma('Crear', '').subscribe((rRespuesta: any) => {

      this.leerProgramas();
    });
  }

  leerProgramas() {
    this.genService.getProgramas().subscribe((rProgramas: any) => {
      this.programas = rProgramas.Programas;
    });
  }

  guardarServicioPrograma(regresar: boolean) {

    this.guardando = true;
    const datos = JSON.stringify(this.servicioprograma);

    this.genService.putServicioPrograma(datos).subscribe((rRespuesta: any) => {

      this.guardando = false;

      if (regresar) {
        this.genService.navegar([RUTA_FACTOR_DOCENTES, RUTA_SERVICIOSPROGRAMA]);
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
    this.dlgService.DlgHorarioServicio('Crear', '', servicio.idservicioprograma).subscribe((rRespuesta: any) => {

      this.leerHorarios();
    });
  }

  editarHorarioServicio(horarioservicio: HorarioServicio) {

    this.dlgService.DlgHorarioServicio('Editar', horarioservicio.idhorarioservicio, horarioservicio.idservicioprograma).subscribe((rRespuesta: any) => {
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
