
import { Injectable } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';

import { MatSnackBar } from '@angular/material/snack-bar';
import { MensajeComponent } from '../dialogos/mensaje/mensaje.component';
import { TransferService } from './transfer.service';
import { ConfirmacionComponent } from '../dialogos/confirmacion/confirmacion.component';
import { UnValorComponent } from '../dialogos/un-valor/un-valor.component';
import { EsperaComponent } from '../dialogos/espera/espera.component';
import { MostrarParticipanteComponent } from '../dialogos/mostrar-participante/mostrar-participante.component';
import { EvaluarResumenEmemComponent } from '../dialogos/evaluar-resumen-emem/evaluar-resumen-emem.component';
import { SnackBarComponent } from '../dialogos/snack-bar/snack-bar.component';
import { Usuario, Resumen, ActaConsejoCurricular, PlanMejoramiento, FactorCalidad } from '../interfaces/interfaces.interfaces';
import { DlgTipoContratoComponent } from '../factores/docentes/tipos-contrato/dlg-tipo-contrato/dlg-tipo-contrato.component';
import { DlgCategoriaDocenteComponent } from '../factores/docentes/categorias-docentes/dlg-categoria-docente/dlg-categoria-docente.component';
import { DlgDocenteComponent } from '../factores/docentes/docentes/dlg-docente/dlg-docente.component';
import { DlgFacultadComponent } from '../factores/docentes/facultades/dlg-facultad/dlg-facultad.component';
import { DlgProgramaComponent } from '../factores/docentes/programas/dlg-programa/dlg-programa.component';
import { DlgServicioProgramaComponent } from '../factores/docentes/servicios-programa/dlg-servicio-programa/dlg-servicio-programa.component';
import { DlgHorarioServicioComponent } from '../factores/docentes/servicios-programa/dlg-horario-servicio/dlg-horario-servicio.component';
import { DlgAgendaServicioComponent } from '../factores/docentes/agendas/dlg-agenda-servicio/dlg-agenda-servicio.component';
import { DlgFuncionDocenteComponent } from '../factores/docentes/funciones-docente/dlg-funcion-docente/dlg-funcion-docente.component';
import { DlgActividadDocenteComponent } from '../factores/docentes/funciones-docente/dlg-actividad-docente/dlg-actividad-docente.component';
import { DlgSubactividadDocenteComponent } from '../factores/docentes/funciones-docente/dlg-subactividad-docente/dlg-subactividad-docente.component';
import { DlgEgresadoComponent } from '../factores/extension/egresados/dlg-egresado/dlg-egresado.component';
import { DlgGrupoInvestigacionComponent } from '../factores/investigacion/grupos-investigacion/dlg-grupo-investigacion/dlg-grupo-investigacion.component';
import { DlgModalidadComponent } from '../factores/procesos_academicos/trabajos-grado/modalidades/dlg-modalidad/dlg-modalidad.component';
import { DlgAreaProfundizacionComponent } from '../factores/procesos_academicos/trabajos-grado/areas-profundizacion/dlg-area-profundizacion/dlg-area-profundizacion.component';
import { DlgPeriodoComponent } from '../factores/docentes/periodos/dlg-periodo/dlg-periodo.component';
import { DlgFuncionesDocenteComponent } from '../factores/docentes/agendas/dlg-funciones-docente/dlg-funciones-docente.component';
import { CrearEditarTrabajoGradoComponent } from '../factores/procesos_academicos/trabajos-grado/crear-editar-trabajo-grado/crear-editar-trabajo-grado.component';
import { SeleccionarDocenteComponent } from '../factores/docentes/docentes/seleccionar-docente/seleccionar-docente.component';
import { ChartDataSets, ChartType } from 'chart.js';
import { Label } from 'ng2-charts';
import { GraficaEstadisticaComponent } from '../dialogos/grafica-estadistica/grafica-estadistica.component';
import { ActaProgramaComponent } from '../factores/procesos_academicos/trabajos-grado/acta-programa/acta-programa.component';
import { CrearDirectorJuradoComponent } from '../factores/docentes/docentes/crear-director-jurado/crear-director-jurado.component';
import { VerPlanMejoraComponent } from '../factores/procesos_academicos/plan-mejoramiento/ver-plan-mejora/ver-plan-mejora.component';
import { CrearEditarFactorCalidadComponent } from '../factores/procesos_academicos/plan-mejoramiento/crear-editar-factor-calidad/crear-editar-factor-calidad.component';

@Injectable({
  providedIn: 'root'
})
export class DialogosService {

  constructor(public dialog: MatDialog,
              private snackBar: MatSnackBar,
              private transfer: TransferService) { }

  mostrarMensaje(msg: string, tp: string) {
    const dialogRef = this.dialog.open(MensajeComponent, {width: '60%', data: {mensaje: msg, tipo: tp}});
  }

  mostrarConfirmacion(msg: string) {
    const dialogRef = this.dialog.open(ConfirmacionComponent, {
      width: '60%',
      data: {mensaje: msg}
    });

    return dialogRef.afterClosed();
  }

  confirmacion(msg: string) {
    const dialogRef = this.dialog.open(ConfirmacionComponent, {
      width: '60%',
      data: {mensaje: msg}
    });

    return dialogRef.afterClosed();
  }

  pedirUnValor(tlt: string, msg: string) {
    const dialogRef = this.dialog.open(UnValorComponent, {
      width: '60%',
      data: {mensaje: msg, titulo: tlt}
    });

    return dialogRef.afterClosed();
  }

  esperar(msg: string) {
    const dialogRef = this.dialog.open(EsperaComponent, {
      width: '50%',
      data: {mensaje: msg}
    });

    return dialogRef.afterClosed();
  }

  mostrarDatosParticipante(rParticipante: Usuario) {
    const dialogRef = this.dialog.open(MostrarParticipanteComponent, {
      width: '50%',
      data: {participante: rParticipante}
    });

    return dialogRef.afterClosed();
  }

  evaluarResumenEmem(rResumen: Resumen) {
    const dialogRef = this.dialog.open(EvaluarResumenEmemComponent, {
      width: '50%',
      data: {resumen: rResumen}
    });

    return dialogRef.afterClosed();
  }

  mostrarSnackBar(titulo: string, msg: string) {
    this.snackBar.openFromComponent(SnackBarComponent, {
      data: {Titulo: titulo, Mensaje: msg}, duration: 5000
    });
  }

  openSnackBar(message: string) {
    this.transfer.sendMessageSnakBar(message);
    this.snackBar.openFromComponent(SnackBarComponent, {
      duration: 3000,
    });
  }

  DlgTipoContrato(accion: string, idtipocontrato: string) {
    const dialogRef = this.dialog.open(DlgTipoContratoComponent, {
      width: '60%',
      data: {accion, idtipocontrato}
    });

    return dialogRef.afterClosed();
  }

  DlgCategoriaDocente(accion: string, idcategoriadocente: string) {
    const dialogRef = this.dialog.open(DlgCategoriaDocenteComponent, {
      width: '60%',
      data: {accion, idcategoriadocente}
    });

    return dialogRef.afterClosed();
  }

  DlgDocente(accion: string, iddocente: string) {
    const dialogRef = this.dialog.open(DlgDocenteComponent, {
      width: '60%',
      data: {accion, iddocente}
    });

    return dialogRef.afterClosed();
  }

  crearEditarDirectorJurado(accion: string, iddocente: string) {
    const dialogRef = this.dialog.open(CrearDirectorJuradoComponent, {
      width: '60%',
      data: {accion, iddocente}
    });

    return dialogRef.afterClosed();
  }

  DlgFacultad(accion: string, idfacultad: string) {
    const dialogRef = this.dialog.open(DlgFacultadComponent, {
      width: '60%',
      data: {accion, idfacultad}
    });

    return dialogRef.afterClosed();
  }

  DlgPrograma(accion: string, idprograma: string) {
    const dialogRef = this.dialog.open(DlgProgramaComponent, {
      width: '60%',
      data: {accion, idprograma}
    });

    return dialogRef.afterClosed();
  }

  DlgServicioPrograma(accion: string, idservicioprograma: string) {
    const dialogRef = this.dialog.open(DlgServicioProgramaComponent, {
      width: '60%',
      data: {accion, idservicioprograma}
    });

    return dialogRef.afterClosed();
  }

  DlgHorarioServicio(accion: string, idhorarioservicio: string, idservicioprograma: string, jornada: string) {
    const dialogRef = this.dialog.open(DlgHorarioServicioComponent, {
      width: '60%',
      data: {accion, idhorarioservicio, idservicioprograma, jornada}
    });

    return dialogRef.afterClosed();
  }

  DlgAgendaServicio(iddocente: string, periodo: string) {
    const dialogRef = this.dialog.open(DlgAgendaServicioComponent, {
      width: '90%', height: '90%',
      data: {iddocente, periodo}
    });

    return dialogRef.afterClosed();
  }

  DlgFuncionDocente(accion: string, idfunciondocente: string) {
    const dialogRef = this.dialog.open(DlgFuncionDocenteComponent, {
      width: '60%',
      data: {accion, idfunciondocente}
    });

    return dialogRef.afterClosed();
  }

  DlgActividadDocente(accion: string, idactividaddocente: string, idfunciondocente: string) {
    const dialogRef = this.dialog.open(DlgActividadDocenteComponent, {
      width: '60%',
      data: {accion, idactividaddocente, idfunciondocente}
    });

    return dialogRef.afterClosed();
  }

  DlgSubactividadDocente(accion: string, idsubactividaddocente: string, idactividaddocente: string) {
    const dialogRef = this.dialog.open(DlgSubactividadDocenteComponent, {
      width: '60%',
      data: {accion, idsubactividaddocente, idactividaddocente}
    });

    return dialogRef.afterClosed();
  }

  DlgEgresado(accion: string, idegresado: string) {
    const dialogRef = this.dialog.open(DlgEgresadoComponent, {
      width: '60%', height: '80%',
      data: {accion, idegresado}
    });

    return dialogRef.afterClosed();
  }

  DlgGrupoInvestigacion(accion: string, idgrupoinvestigacion: string) {
    const dialogRef = this.dialog.open(DlgGrupoInvestigacionComponent, {
      width: '60%', height: '80%',
      data: {accion, idgrupoinvestigacion}
    });

    return dialogRef.afterClosed();
  }

  DlgModalidad(accion: string, idmodalidad: string) {
    const dialogRef = this.dialog.open(DlgModalidadComponent, {
      width: '60%',
      data: {accion, idmodalidad}
    });

    return dialogRef.afterClosed();
  }

  DlgAreaProfundizacion(accion: string, idareaprofundizacion: string) {
    const dialogRef = this.dialog.open(DlgAreaProfundizacionComponent, {
      width: '60%',
      data: {accion, idareaprofundizacion}
    });

    return dialogRef.afterClosed();
  }

  DlgPeriodo(accion: string, idperiodo: string) {
    const dialogRef = this.dialog.open(DlgPeriodoComponent, {
      width: '60%',
      data: {accion, idperiodo}
    });

    return dialogRef.afterClosed();
  }

  DlgFuncionesDocente(accion: string, iddocente: string, idactividadprograma: string, periodo: string) {
    const dialogRef = this.dialog.open(DlgFuncionesDocenteComponent, {
      width: '60%',
      data: {accion, iddocente, idactividadprograma, periodo}
    });

    return dialogRef.afterClosed();
  }

  SeleccionarDocente() {
    const dialogRef = this.dialog.open(SeleccionarDocenteComponent, {
      width: '80%',
      data: {}
    });

    return dialogRef.afterClosed();
  }

  mostrarGrafica(datos: ChartDataSets[], etiquetas: Label[], tipo: ChartType, titulo: string) {
    const dialogRef = this.dialog.open(GraficaEstadisticaComponent, {
      width: '90%',
      data: {datos, etiquetas, tipo, titulo}
    });
  }

  mostrarAcc(acc: string) {
    const dialogRef = this.dialog.open(ActaProgramaComponent, {
      width: '600px',
      data: {acc}
    });

    return dialogRef.afterClosed();
  }

  mostrarPlanMejoramiento(planMejoramiento: PlanMejoramiento) {
    const dialogRef = this.dialog.open(VerPlanMejoraComponent, {
      width: '90%', height: '90%',
      data: {planMejoramiento}
    });
  }

  crearEditarFactorCalidad(factorCalidad: FactorCalidad) {
    const dialogRef = this.dialog.open(CrearEditarFactorCalidadComponent, {
      width: '60%',
      data: {factorCalidad}
    });

    return dialogRef.afterClosed();
  }
}


