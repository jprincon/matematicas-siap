import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { DialogosService } from '../../../services/dialogos.service';
import { Docente } from 'src/app/interfaces/interfaces.interfaces';
import { RUTA_FACTOR_DOCENTES, RUTA_DOCENTE } from '../../../config/config';
import { Utilidades } from '../../../utilidades/utilidades.class';
import { TransferService } from '../../../services/transfer.service';

@Component({
  selector: 'app-docentes',
  templateUrl: './docentes.component.html',
  styles: []
})
export class DocentesComponent implements OnInit {

  Docentes: Docente[] = [];
  leyendo = false;
  contIntentos = 1;

  ordenarPor = 'nombre';

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Docentes');
    this.leerDocentes();
  }

  cambiarTipoOrden(tipo: string) {
    this.ordenarPor = tipo;
    this.leerDocentes();
  }

  leerDocentes() {

    this.leyendo = true;

    this.genService.getDocentes(this.ordenarPor).subscribe((rDocentes: any) => {
      this.Docentes = rDocentes.Docentes;
      console.log(rDocentes);
      this.leyendo = false;
    });
  }

  agregarDocente() {
    this.dlgService.DlgDocente('Crear', '').subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerDocentes();
    });
  }

  verDocente(docente: Docente) {
    this.genService.navegar([RUTA_FACTOR_DOCENTES, RUTA_DOCENTE, docente.iddocente]);
  }

  editarDocente(docente: Docente) {
    this.dlgService.DlgDocente('Editar', docente.iddocente).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerDocentes();
    });
  }

  eliminarDocente(docente: Docente) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Docente?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.borrarDocente(docente.iddocente);
      }
    });
  }

  borrarDocente(id: string) {
    this.genService.deleteDocente(id).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
      this.leerDocentes();
    });
  }

}
