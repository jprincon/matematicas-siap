import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { DialogosService } from '../../../services/dialogos.service';
import { CategoriaDocente } from '../../../interfaces/interfaces.interfaces';

@Component({
  selector: 'app-categorias-docentes',
  templateUrl: './categorias-docentes.component.html',
  styles: []
})
export class CategoriasDocentesComponent implements OnInit {

  CategoriasDocente: CategoriaDocente[] = [];
  leyendo = false;
  contIntentos = 1;

  constructor(private genService: GeneralService,
              private dlgService: DialogosService) { }

  ngOnInit() {
    this.leerCategoriasDocente();
  }

  leerCategoriasDocente() {

    this.leyendo = true;

    this.genService.getCategoriasDocente().subscribe((rCategoriasDocente: any) => {
      this.CategoriasDocente = rCategoriasDocente.CategoriasDocentes;

      this.leyendo = false;
    }, error => {
       this.leerCategoriasDocente();
    });
  }

  agregarCategoriaDocente() {
    this.dlgService.DlgCategoriaDocente('Crear', '').subscribe((rRespuesta: any) => {

      this.leerCategoriasDocente();
    });
  }

  editarCategoriaDocente(categoriadocente: CategoriaDocente) {
    this.dlgService.DlgCategoriaDocente('Editar', categoriadocente.idcategoriadocente).subscribe((rRespuesta: any) => {

      this.leerCategoriasDocente();
    });
  }

  eliminarCategoriaDocente(categoriadocente: CategoriaDocente) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este CategoriaDocente?').subscribe((rConfirmacion: any) => {

      if (rConfirmacion) {
        this.borrarCategoriaDocente(categoriadocente.idcategoriadocente);
      }
    });
  }

  borrarCategoriaDocente(id: string) {
    this.genService.deleteCategoriaDocente(id).subscribe((rRespuesta: any) => {

      this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
      this.leerCategoriasDocente();
    });
  }

}
