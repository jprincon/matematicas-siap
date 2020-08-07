import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { FuncionDocente } from '../../../../interfaces/interfaces.interfaces';
import { Utilidades } from '../../../../utilidades/utilidades.class';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';

@Component({
  selector: 'app-dlg-funcion-docente',
  templateUrl: './dlg-funcion-docente.component.html',
  styles: []
})
export class DlgFuncionDocenteComponent implements OnInit {


  funciondocente: FuncionDocente = {
    funcion: ''
  };

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgFuncionDocenteComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idfunciondocente;


    if (this.accion === 'Editar') {
      this.leerFuncionDocente();
    }
  }

  leerFuncionDocente() {
      this.genService.getFuncionDocente(this.id).subscribe((rFuncionDocente: FuncionDocente) => {
        this.funciondocente = rFuncionDocente;
      });
  }

  guardarFuncionDocente() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.funciondocente.idfunciondocente = new Utilidades().generarId();
      console.log(this.funciondocente);
      const datos = JSON.stringify(this.funciondocente);
      this.genService.postFuncionDocente(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.funciondocente);

      this.genService.putFuncionDocente(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    }
  }

  mostrarSnackBar(titulo: string, msg: string) {
    this.snackBar.openFromComponent(SnackBarComponent, {
      data: {Titulo: titulo, Mensaje: msg}, duration: 5000
    });
  }

}
