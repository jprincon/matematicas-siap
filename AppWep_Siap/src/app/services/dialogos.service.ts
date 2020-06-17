
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
import { Usuario, Resumen } from '../interfaces/interfaces.interfaces';
import { DlgTipoContratoComponent } from '../factores/docentes/tipos-contrato/dlg-tipo-contrato/dlg-tipo-contrato.component';
import { DlgCategoriaDocenteComponent } from '../factores/docentes/categorias-docentes/dlg-categoria-docente/dlg-categoria-docente.component';
import { DlgDocenteComponent } from '../factores/docentes/docentes/dlg-docente/dlg-docente.component';
import { DlgFacultadComponent } from '../factores/docentes/facultades/dlg-facultad/dlg-facultad.component';
import { DlgProgramaComponent } from '../factores/docentes/programas/dlg-programa/dlg-programa.component';
import { DlgServicioProgramaComponent } from '../factores/docentes/servicios-programa/dlg-servicio-programa/dlg-servicio-programa.component';
import { DlgHorarioServicioComponent } from '../factores/docentes/servicios-programa/dlg-horario-servicio/dlg-horario-servicio.component';
import { DlgAgendaServicioComponent } from '../factores/docentes/agendas/dlg-agenda-servicio/dlg-agenda-servicio.component';

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

  DlgHorarioServicio(accion: string, idhorarioservicio: string, idservicioprograma: string) {
    const dialogRef = this.dialog.open(DlgHorarioServicioComponent, {
      width: '60%',
      data: {accion, idhorarioservicio, idservicioprograma}
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
}
