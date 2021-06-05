import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { Facultad } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';

@Component({
  selector: 'app-facultades',
  templateUrl: './facultades.component.html',
  styles: []
})
export class FacultadesComponent implements OnInit {

  Facultades: Facultad[] = [];
  leyendo = false;
  contIntentos = 1;

  constructor(private genService: GeneralService,
              private dlgService: DialogosService) { }

  ngOnInit() {
    this.leerFacultades();
  }

  leerFacultades() {

    this.leyendo = true;

    this.genService.getFacultades().subscribe((rFacultades: any) => {
      this.Facultades = rFacultades.Facultades;

      this.leyendo = false;
    });
  }

  agregarFacultad() {
    this.dlgService.DlgFacultad('Crear', '').subscribe((rRespuesta: any) => {

      this.leerFacultades();
    });
  }

  editarFacultad(facultad: Facultad) {
    this.dlgService.DlgFacultad('Editar', facultad.idfacultad).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar(rRespuesta);
      this.leerFacultades();
    });
  }

  eliminarFacultad(facultad: Facultad) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Facultad?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.borrarFacultad(facultad.idfacultad);
      }
    });
  }

  borrarFacultad(id: string) {
    this.genService.deleteFacultad(id).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar(rRespuesta.Respuesta || rRespuesta.Error);
      this.leerFacultades();
    });
  }

}
