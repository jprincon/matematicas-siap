import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { TipoProduccion } from '../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../services/general.service';

@Component({
  selector: 'app-crear-editar-tipo-produccion',
  templateUrl: './crear-editar-tipo-produccion.component.html',
  styles: []
})
export class CrearEditarTipoProduccionComponent implements OnInit {

  tipoProduccion: TipoProduccion = {
    tipo: ''
  };

  accion = 'Crear';
  Titulo = 'Creando tipo de producción ...';
  Descripcion = 'Permite crear un tipo de producción. Ejemplo: Libro, Artículo, ...';

  constructor(public dialogRef: MatDialogRef<CrearEditarTipoProduccionComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService) { }

  ngOnInit() {
    if (this.data.tipoProduccion !== null) {
      this.tipoProduccion = this.data.tipoProduccion;
      this.accion = 'Editar';
    }
  }

  guardarTipoProduccion() {
    const datos = JSON.stringify(this.tipoProduccion);

    if (this.accion === 'Crear') {
      this.genService.postTipoProduccio(datos).subscribe((rResp: any) => {
        this.dialogRef.close(rResp);
      });
    } else {
      this.genService.putTipoProduccio(datos).subscribe((rResp: any) => {
        this.dialogRef.close(rResp);
      });
    }
  }

}
