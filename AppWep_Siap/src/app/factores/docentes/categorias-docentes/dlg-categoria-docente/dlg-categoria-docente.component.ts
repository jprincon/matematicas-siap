import { GeneralService } from './../../../../services/general.service';
import { Component, OnInit, Inject } from '@angular/core';
import { CategoriaDocente } from '../../../../interfaces/interfaces.interfaces';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Utilidades } from '../../../../utilidades/utilidades.class';
import { SnackBarComponent } from '../../../../dialogos/snack-bar/snack-bar.component';

@Component({
  selector: 'app-dlg-categoria-docente',
  templateUrl: './dlg-categoria-docente.component.html',
  styles: []
})
export class DlgCategoriaDocenteComponent implements OnInit {


  categoriadocente: CategoriaDocente = {
    categoria: ''
  };

  accion: string;
  id: string;
  contIntentos = 0;
  guardando = false;
  leyendo = false;

  constructor(public dialogRef: MatDialogRef<DlgCategoriaDocenteComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.accion = this.data.accion;
    this.id = this.data.idcategoriadocente;


    if (this.accion === 'Editar') {
      this.leerCategoriaDocente();
    }
  }

  leerCategoriaDocente() {
      this.genService.getCategoriaDocente(this.id).subscribe((rCategoriaDocente: CategoriaDocente) => {
        this.categoriadocente = rCategoriaDocente;
      });
  }

  guardarCategoriaDocente() {

    this.guardando = true;

    if (this.accion === 'Crear') {

      this.categoriadocente.idcategoriadocente = new Utilidades().generarId();
      console.log(this.categoriadocente);
      const datos = JSON.stringify(this.categoriadocente);
      this.genService.postCategoriaDocente(datos).subscribe((rRespuesta: any) => {
        console.log(rRespuesta);
        return this.dialogRef.close(rRespuesta.Respuesta || rRespuesta.Error);
      });
    } else {
      const datos = JSON.stringify(this.categoriadocente);

      this.genService.putCategoriaDocente(datos).subscribe((rRespuesta: any) => {
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
