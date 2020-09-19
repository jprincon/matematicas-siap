import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ServiciosService } from '../../../../Servicios/servicios.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ParticipanteEmem } from 'src/app/Interfaces/interfaces.interface';
import { Utilidades } from '../../../../Utilidades/utilidades.class';
import { SnackbarComponent } from '../../../../dialogos/snackbar/snackbar.component';
import { Afiliacion } from '../../../../Interfaces/interfaces.interface';

@Component({
  selector: 'app-dlg-participante-emem',
  templateUrl: './dlg-participante-emem.component.html',
  styles: []
})
export class DlgParticipanteEmemComponent implements OnInit {


  participanteemem: ParticipanteEmem = {
    primernombre: '',
    segundonombre: '',
    primerapellido: '',
    segundoapellido: '',
    correo: '',
    contra: '',
    idafiliacion: ''
  };

  Afiliaciones: Afiliacion[] = [];

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgParticipanteEmemComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: ServiciosService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idparticipante;

    this.leerAfiliaciones();

    if (this.accion === 'Editar') {
      this.leerParticipanteEmem();
    }
  }

  leerParticipanteEmem() {
      this.genService.getParticipanteEmem(this.id).subscribe((rParticipanteEmem: ParticipanteEmem) => {
        this.participanteemem = rParticipanteEmem;
      });
  }

  leerAfiliaciones() {
    this.genService.getAfiliaciones().subscribe((rAfiliaciones: any) => {
      this.Afiliaciones = rAfiliaciones.Afiliaciones;
    });
  }

  guardarParticipanteEmem() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      console.log(this.participanteemem);
      const datos = JSON.stringify(this.participanteemem);
      this.genService.postParticipanteEmem(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.participanteemem);

      this.genService.putParticipanteEmem(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    }
  }

  mostrarSnackBar(titulo: string, msg: string) {
    this.snackBar.openFromComponent(SnackbarComponent, {
      data: {Titulo: titulo, Mensaje: msg}, duration: 5000
    });
  }

}
