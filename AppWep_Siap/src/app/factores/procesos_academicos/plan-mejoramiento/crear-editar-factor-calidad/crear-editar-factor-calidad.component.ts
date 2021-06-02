import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { FactorCalidad } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';

@Component({
  selector: 'app-crear-editar-factor-calidad',
  templateUrl: './crear-editar-factor-calidad.component.html',
  styles: []
})
export class CrearEditarFactorCalidadComponent implements OnInit {

  factorCalidad: FactorCalidad = {
    factor: '',
    orden: 0
  };

  accion = 'Crear';

  constructor(public dialogRef: MatDialogRef<CrearEditarFactorCalidadComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService) { }

  ngOnInit() {
    if (this.data.factorCalidad !== null) {
      this.factorCalidad = this.data.factorCalidad;
      this.accion = 'Editar';
    }
  }

  guardar() {
    const datos = JSON.stringify(this.factorCalidad);

    if (this.accion === 'Crear') {
      this.genService.postFactorCalidad(datos).subscribe((rFactor: any) => {
        this.dialogRef.close(rFactor);
      });
    } else {
      this.genService.putFactorCalidad(datos).subscribe((rFactor: any) => {
        this.dialogRef.close(rFactor);
      });
    }
  }

}
