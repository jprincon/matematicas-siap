import { Injectable } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { DlgAfiliacionComponent } from '../componentes/administrar/afiliaciones/dlg-afiliacion/dlg-afiliacion.component';
import { SnackbarComponent } from '../dialogos/snackbar/snackbar.component';
import { ConfirmacionComponent } from '../dialogos/confirmacion/confirmacion.component';
import { DlgParticipanteEmemComponent } from '../componentes/administrar/participantes-emem/dlg-participante-emem/dlg-participante-emem.component';

@Injectable({
  providedIn: 'root'
})
export class DialogService {

  constructor(public dialog: MatDialog,
              private snackBar: MatSnackBar) { }


  DlgAfiliacion(accion: string, idafiliacion: string) {
    const dialogRef = this.dialog.open(DlgAfiliacionComponent, {
      width: '60%',
      data: {accion, idafiliacion}
    });

    return dialogRef.afterClosed();
  }

  mostrarSnackBar(titulo: string, msg: string) {
    this.snackBar.openFromComponent(SnackbarComponent, {
      data: {Titulo: titulo, Mensaje: msg}, duration: 5000
    });
  }

  confirmacion(msg: string) {
    const dialogRef = this.dialog.open(ConfirmacionComponent, {
      width: '60%',
      data: {mensaje: msg}
    });

    return dialogRef.afterClosed();
  }

  DlgParticipanteEmem(accion: string, idparticipante: string) {
    const dialogRef = this.dialog.open(DlgParticipanteEmemComponent, {
      width: '60%',
      data: {accion, idparticipante}
    });

    return dialogRef.afterClosed();
  }
}
