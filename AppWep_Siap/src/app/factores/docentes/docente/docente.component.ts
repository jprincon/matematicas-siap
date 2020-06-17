import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Docente, CategoriaDocente, TipoContrato } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';
import { TransferService } from '../../../services/transfer.service';

@Component({
  selector: 'app-docente',
  templateUrl: './docente.component.html',
  styles: []
})
export class DocenteComponent implements OnInit {

  docente: Docente = {
    iddocente: '',
    nombre: '',
    telefono: '',
    correo: '',
    idcategoriadocente: '',
    idtipocontrato: '',
    foto: ''
  };

  Categorias: CategoriaDocente[] = [];
  TiposContrato: TipoContrato[] = [];

  imagenSubir: File;

  guardando = false;
  leyendo = false;

  constructor(private activatedRoute: ActivatedRoute,
              private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.leerTiposContrato();
    this.leerCategorias();
    this.obtenerDocente();

    this.transfer.enviarTituloAplicacion('Perfil del Docente');
  }

  obtenerDocente() {
    this.leyendo = true;
    this.activatedRoute.params.subscribe((rParam: any) => {
      this.docente.iddocente = rParam.id;

      this.genService.getDocente(this.docente.iddocente).subscribe((rDocente: Docente) => {
        this.docente = rDocente;
        this.leyendo = false;
      });
    });
  }

  leerCategorias() {
    this.genService.getCategoriasDocente().subscribe((rCategorias: any) => {
      console.log(rCategorias);
      this.Categorias = rCategorias.CategoriasDocentes;
    });
  }

  leerTiposContrato() {
    this.genService.getTiposContrato().subscribe((rTiposContrato: any) => {
      console.log(rTiposContrato);
      this.TiposContrato = rTiposContrato.TiposContratos;
    });
  }

  seleccionImagen( archivo: File) {

    if (!archivo) {
      this.imagenSubir = null;
      return;
    }

    this.imagenSubir = archivo;

    // %%%%%%% Subir Archivo %%%%%%%
    const reader = new FileReader();
    reader.readAsDataURL(this.imagenSubir);
    reader.onload = () => {

      this.docente.foto = reader.result.toString();

      const datos = JSON.stringify(this.docente);
      this.genService.putFotoDocente(datos).subscribe((rRespuesta: any) => {
        this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
      });
    };

    reader.onerror = (error) => {
      console.log('Error: ', error);
    };

  }

  guardarDocente() {

    this.guardando = true;

    const datos = JSON.stringify(this.docente);

    this.genService.putDocente(datos).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
    });
  }

}
