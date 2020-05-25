import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Resumen, AutorResumen, BibliografiaResumen, PalabraClave } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';
import { DialogosService } from '../../../../services/dialogos.service';

@Component({
  selector: 'app-crear-resumen',
  templateUrl: './crear-resumen.component.html',
  styles: []
})
export class CrearResumenComponent implements OnInit {

  resumen: Resumen = {
    titulo: '',
    resumen: '',
    linea: '',
    tipo: '',
    objetivo: '',
    capacidad: '',
    materiales: '',
    prerequisito: '',
    requiereSala: '',
    evaluado: ''
  };

  autores: AutorResumen[] = [];
  autor: AutorResumen = {
    cedula: '',
    nombre: '',
    correo: '',
    institucion: ''
  };

  referencias: BibliografiaResumen[] = [];
  referencia: BibliografiaResumen = {
    bibliografia: '',
    idResumen: ''
  };

  palabrasClave: PalabraClave[] = [];
  palabraClave: PalabraClave = {
    palabra: ''
  };

  idResumen = '';

  accionPalabra = 'Crear Palabra';
  accionAutor = 'Crear Autor';
  accionReferencia = 'Crear Referencia';

  constructor(private activatedRoute: ActivatedRoute,
              private servicio: GeneralService,
              private router: Router,
              private dialogo: DialogosService) { }

  ngOnInit() {
    this.obtenerParametro();
  }

  obtenerParametro() {
    this.activatedRoute.params.subscribe((rParam: any) => {
      this.idResumen = rParam.id;

      this.obtenerResumen();
    });
  }

  obtenerResumen() {
    this.servicio.getResumen(this.idResumen).subscribe((rResumen: Resumen) => {
      this.resumen = rResumen;

      this.obtenerPalabrasResumen();
      this.obtenerAutoresResumen();
      this.obtenerReferencias();
    });
  }

  agregarAutor() {
    this.activatedRoute.params.subscribe((rParam: any) => {
      this.idResumen = rParam.id;
      if (this.accionAutor === 'Crear Autor') {
        this.autor.id_resumen = this.idResumen;
        const datos = JSON.stringify(this.autor);

        this.servicio.agregarAutorResumen(datos).subscribe((rAutor: any) => {

          this.obtenerAutoresResumen();

          this.autor = {
            cedula: '',
            nombre: '',
            correo: '',
            institucion: ''
          };
        });
      } else {
        const datos = JSON.stringify(this.autor);
        this.servicio.putAutor(datos).subscribe((rAutor: any) => {

          this.obtenerAutoresResumen();
          this.accionAutor = 'Crear Autor';

          this.autor = {
            cedula: '',
            nombre: '',
            correo: '',
            institucion: ''
          };
        });
      }
    });
  }

  buscarAutor() {
    console.log(this.autor);
    this.servicio.getAutorPorCedula(this.autor.cedula).subscribe((rAutor: any) => {
      console.log(rAutor);
      this.autor = rAutor;
      if (rAutor.resultado === 'el autor no existe') {
        this.dialogo.mostrarMensaje('El Autor no existe', 'info');
      }
    });
  }

  obtenerAutoresResumen() {
    this.servicio.getAutores(this.idResumen).subscribe((rAutores: any) => {
      this.autores = rAutores.autores;
      console.log(rAutores);
    });
  }

  editarAutor(autor: AutorResumen) {
    this.autor = autor;
    this.accionAutor = 'Actualizar Autor';
  }

  eliminarAutor(autor: AutorResumen) {
    this.activatedRoute.params.subscribe((rParam: any) => {
      this.idResumen = rParam.id;

      this.dialogo.mostrarConfirmacion('¿Esta seguro de eliminar al autor?').subscribe((rRespuesta: boolean) => {
        if (rRespuesta) {
          this.servicio.deleteAutor(autor.cedula, this.idResumen).subscribe((rAutor: any) => {
            console.log(rAutor);
            this.obtenerAutoresResumen();
          });
        }
      });
    });
  }

  editarPalabra(palabra: PalabraClave) {
    this.accionPalabra = 'Actualizar Palabra';
    this.palabraClave = palabra;
  }

  eliminarPalabra(palabra: PalabraClave) {
    this.dialogo.mostrarConfirmacion('¿Esta seguro de eliminar esta palabra?').subscribe((rRespuesta: boolean) => {
      if (rRespuesta) {
        this.servicio.deletePalabraClave(palabra.idPalabraClave).subscribe((rPalabra: any) => {

          this.obtenerPalabrasResumen();
        });
      }
    });
  }

  agregarReferencia() {
    this.activatedRoute.params.subscribe((rParam: any) => {
      this.idResumen = rParam.id;
      if (this.accionReferencia === 'Crear Referencia') {
        this.referencia.idResumen = this.idResumen;
        this.referencia.idBibliografia = this.servicio.generarID();

        const datos = JSON.stringify(this.referencia);
        this.servicio.postReferencia(datos).subscribe((rReferencia: any) => {

          this.obtenerReferencias();
          this.referencia.bibliografia = '';
        });
      } else {

        const datos = JSON.stringify(this.referencia);
        this.servicio.putReferencia(datos).subscribe((rReferencia: any) => {

          this.obtenerReferencias();
          this.referencia.bibliografia = '';
          this.accionReferencia = 'Crear Referencia';
        });
      }
    });
  }

  obtenerReferencias() {
    this.servicio.getReferencias(this.idResumen).subscribe((rReferencias: any) => {
      this.referencias = rReferencias.referencias;
    });
  }

  editarReferencia(referencia: BibliografiaResumen) {
      this.referencia = referencia;
      this.accionReferencia = 'Actualizar Referencia';
  }

  eliminarReferencia(referencia: BibliografiaResumen) {
    this.dialogo.mostrarConfirmacion('¿Esta seguro de eliminar esta referencia?').subscribe((rRespuesta: boolean) => {
      if (rRespuesta) {
        this.servicio.deleteReferencia(referencia.idBibliografia).subscribe((rPalabra: any) => {

          this.obtenerReferencias();
        });
      }
    });
  }

  agregarPalabra() {
    this.activatedRoute.params.subscribe((rParam: any) => {
      this.idResumen = rParam.id;
      if (this.accionPalabra === 'Crear Palabra') {
        this.palabraClave.idPalabraClave = this.servicio.generarID();
        this.palabraClave.idResumen = this.idResumen;

        const datos = JSON.stringify(this.palabraClave);
        this.servicio.postPalabraClave(datos).subscribe((rPalabra: any) => {
          this.obtenerPalabrasResumen();
        });
      } else {
        const datos = JSON.stringify(this.palabraClave);
        this.servicio.putPalabraClave(datos).subscribe((rPalabra: any) => {
          this.obtenerPalabrasResumen();
        });
      }
    });
  }

  obtenerPalabrasResumen() {

    this.servicio.getPalabrasClaveResumen(this.idResumen).subscribe((rPalabras: any) => {

      this.palabrasClave = rPalabras.palabrasClave;
      this.palabraClave.palabra = '';
    });
  }

  guardarResumen() {
    const bTitulo = this.resumen.titulo.length > 0;
    const bTipo = this.resumen.tipo.length > 0;
    const bLinea = this.resumen.linea.length > 0;
    const bContenido = this.resumen.resumen.length > 0;

    if (bTitulo && bTipo && bLinea && bContenido) {
      const datos = JSON.stringify(this.resumen);
      this.servicio.putResumen(datos).subscribe((rResumen: any) => {
        this.router.navigate(['emem-workshop', 'resumenes']);
      });
    } else {
      this.dialogo.mostrarMensaje('Debe ingresar todos los campos requeridos', 'warning');
    }
  }

}
