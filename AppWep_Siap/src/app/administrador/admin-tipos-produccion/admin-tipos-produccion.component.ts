import { Component, OnInit } from '@angular/core';
import { TipoProduccion } from '../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../services/general.service';
import { DialogosService } from '../../services/dialogos.service';

@Component({
  selector: 'app-admin-tipos-produccion',
  templateUrl: './admin-tipos-produccion.component.html',
  styles: []
})
export class AdminTiposProduccionComponent implements OnInit {

  Tipos: TipoProduccion[] = [];

  constructor(private genService: GeneralService,
              private dlgService: DialogosService) { }

  ngOnInit() {
    this.obtenerTiposProduccion();
  }

  obtenerTiposProduccion() {
    this.genService.getTiposProduccion().subscribe((rTiposProduccion: any) => {

      this.Tipos = rTiposProduccion.Tipos;
    });
  }

  agregarTipoProduccion() {
    this.dlgService.crearEditarTipoProduccion(null).subscribe((rResp: any) => {

      this.dlgService.mostrarSnackBar(rResp.Respuesta);
      this.obtenerTiposProduccion();
    });
  }

  editarTipo(tipo: TipoProduccion) {
    this.dlgService.crearEditarTipoProduccion(tipo).subscribe((rResp: any) => {

      this.dlgService.mostrarSnackBar(rResp.Respuesta);
      this.obtenerTiposProduccion();
    });
  }

  eliminarTipo(tipo: TipoProduccion) {
    this.dlgService.confirmacion('¿Está seguro de eliminar el tipo de producción?').subscribe((rEliminar: boolean) => {
      if (rEliminar) {
        this.genService.deleteTipoProduccio(tipo.idtipo).subscribe((rResp: any) => {

          this.dlgService.mostrarSnackBar(rResp.Respuesta);
        });
      }
    });
  }

}
