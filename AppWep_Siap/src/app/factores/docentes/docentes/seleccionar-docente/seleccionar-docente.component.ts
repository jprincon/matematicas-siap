import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { GeneralService } from '../../../../services/general.service';
import { Docente } from '../../../../interfaces/interfaces.interfaces';

@Component({
  selector: 'app-seleccionar-docente',
  templateUrl: './seleccionar-docente.component.html',
  styles: []
})
export class SeleccionarDocenteComponent implements OnInit {

  Docentes: Docente[] = [];
  bDocentes: Docente[] = [];
  leyendo = false;
  termino = '';

  constructor(public dialogRef: MatDialogRef<SeleccionarDocenteComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService) { }

  ngOnInit() {
    this.obtenerDocentes();
  }

  obtenerDocentes() {
    this.leyendo = true;
    this.genService.getDirectoresJurados().subscribe((RespDocentes: any) => {
      console.log(RespDocentes);
      this.Docentes = RespDocentes.Docentes;
      this.bDocentes = this.Docentes;
      this.leyendo = false;
    });
  }

  seleccionar(docente: Docente) {
    console.log(docente);
    this.dialogRef.close(docente);
  }

  buscar() {
    this.bDocentes = [];
    this.termino = this.termino.toLocaleLowerCase();
    for (const docente of this.Docentes) {
      if (docente.nombre.toLowerCase().indexOf(this.termino) >= 0) {
        this.bDocentes.push(docente);
      }
    }
  }

}
