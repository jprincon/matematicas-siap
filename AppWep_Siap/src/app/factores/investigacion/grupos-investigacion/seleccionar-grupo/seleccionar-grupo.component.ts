import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { GeneralService } from '../../../../services/general.service';
import { GrupoInvestigacion } from '../../../../interfaces/interfaces.interfaces';

@Component({
  selector: 'app-seleccionar-grupo',
  templateUrl: './seleccionar-grupo.component.html',
  styles: []
})
export class SeleccionarGrupoComponent implements OnInit {

  gruposInvestigacion: GrupoInvestigacion[] = [];

  constructor(public dialogRef: MatDialogRef<SeleccionarGrupoComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService) { }

  ngOnInit() {
    this.obtenerGruposInvestigacion();
  }

  obtenerGruposInvestigacion() {
    this.genService.getGruposInvestigacion().subscribe((rGrupos: any) => {

      this.gruposInvestigacion = rGrupos.GruposInvestigacion;
    });
  }

  seleccionar(grupo: GrupoInvestigacion) {
    this.dialogRef.close(grupo);
  }

}
