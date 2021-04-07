import { GeneralService } from './../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { DialogosService } from '../../services/dialogos.service';
import { Configuracion } from '../../interfaces/interfaces.interfaces';

@Component({
  selector: 'app-configuraciones',
  templateUrl: './configuraciones.component.html',
  styles: []
})
export class ConfiguracionesComponent implements OnInit {

  Configuraciones: Configuracion[] = [];
  leyendo = false;

  configuracion: Configuracion = {
    nombredecano: '',
    nombredirector: ''
  };

  constructor(private genService: GeneralService,
              private dlgService: DialogosService) { }

  ngOnInit() {
    this.leerConfiguraciones();
  }

  leerConfiguraciones() {

    this.leyendo = true;

    this.genService.getConfiguraciones().subscribe((rConfiguraciones: any) => {

      this.Configuraciones = rConfiguraciones.Configuraciones;

      if (this.Configuraciones.length > 0) {
        this.configuracion = this.Configuraciones[0];
      }

      this.leyendo = false;
    });
  }

  guardarConfiguracion() {
    const datos = JSON.stringify(this.configuracion);
    this.genService.putConfiguracion(datos).subscribe((rConfiguracion: any) => {
      this.dlgService.mostrarSnackBar('Información', rConfiguracion.Respuesta || rConfiguracion.Error);
    });
  }

}
