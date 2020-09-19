import { Component, OnInit } from '@angular/core';
import { Afiliacion } from '../../../Interfaces/interfaces.interface';
import { ServiciosService } from '../../../Servicios/servicios.service';
import { DialogService } from '../../../Servicios/dialog.service';

@Component({
  selector: 'app-afiliaciones',
  templateUrl: './afiliaciones.component.html',
  styles: []
})
export class AfiliacionesComponent implements OnInit {

  Afiliaciones: Afiliacion[] = [];
  leyendo = false;
  contIntentos = 1;

  constructor(private genService: ServiciosService,
              private dlgService: DialogService) { }

  ngOnInit() {
    this.leerAfiliaciones();
  }

  leerAfiliaciones() {

    this.leyendo = true;

    this.genService.getAfiliaciones().subscribe((rAfiliaciones: any) => {
      this.Afiliaciones = rAfiliaciones.Afiliaciones;
      console.log(rAfiliaciones);
      this.leyendo = false;
    });
  }

  agregarAfiliacion() {
    this.dlgService.DlgAfiliacion('Crear', '').subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.leerAfiliaciones();
    });
  }

  editarAfiliacion(afiliacion: Afiliacion) {
    this.dlgService.DlgAfiliacion('Editar', afiliacion.idafiliacion).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerAfiliaciones();
    });
  }

  eliminarAfiliacion(afiliacion: Afiliacion) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Afiliacion?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteAfiliacion(afiliacion.idafiliacion).subscribe((rRespuesta: any) => {
          console.log(rRespuesta);
          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerAfiliaciones();
        });
      }
    });
  }

}
