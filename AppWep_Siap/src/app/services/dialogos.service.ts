
import { Injectable } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MensajeComponent } from '../componentes/dialogos/mensaje/mensaje.component';
import { ConfirmacionComponent } from '../componentes/dialogos/confirmacion/confirmacion.component';
import { UnValorComponent } from '../componentes/dialogos/un-valor/un-valor.component';
import { EsperaComponent } from '../componentes/dialogos/espera/espera.component';
import { Usuario, Resumen } from '../interfaces/interfaces.interfaces';
import { MostrarParticipanteComponent } from '../componentes/dialogos/mostrar-participante/mostrar-participante.component';
import { EvaluarResumenEmemComponent } from '../componentes/dialogos/evaluar-resumen-emem/evaluar-resumen-emem.component';
import { TransferService } from './transfer.service';
import { SnackBarComponent } from '../componentes/dialogos/snack-bar/snack-bar.component';
import { MatSnackBar } from '@angular/material/snack-bar';

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

  openSnackBar(message: string) {
    this.transfer.sendMessageSnakBar(message);
    this.snackBar.openFromComponent(SnackBarComponent, {
      duration: 3000,
    });
  }
}
