import { Component, OnInit } from '@angular/core';
import { Docente } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';
import { DialogosService } from '../../../../services/dialogos.service';
import { TransferService } from '../../../../services/transfer.service';
import { RUTA_FACTOR_DOCENTES, RUTA_DOCENTE } from '../../../../config/config';

@Component({
  selector: 'app-directores-jurados',
  templateUrl: './directores-jurados.component.html',
  styles: []
})
export class DirectoresJuradosComponent implements OnInit {

  Docentes: Docente[] = [];
  bDocentes: Docente[] = [];
  leyendo = false;
  contIntentos = 1;

  ordenarPor = 'nombre';
  termino = '';
  tipoContrato = 'Todos';
  categoriaDocente = 'Todas';
  documento = '';

  resultados = '';

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Directores y Jurados de Trabajos de Grado');
    this.leerDocentes();
  }

  contarResultados() {
    this.resultados = this.bDocentes.length.toString() + ' Resultados';
  }

  cambiarTipoOrden(tipo: string) {
    this.ordenarPor = tipo;
    this.leerDocentes();
  }

  buscarPorNombre() {
    this.bDocentes = [];
    const termBusq = this.termino.toLowerCase();

    for (const docente of this.Docentes) {
      if (docente.nombre.toLowerCase().indexOf(termBusq) >= 0) {
        this.bDocentes.push(docente);
      }
    }

    this.contarResultados();
  }

  leerDocentes() {

    this.leyendo = true;

    this.genService.getDirectoresJurados().subscribe((rDocentes: any) => {
      this.Docentes = rDocentes.Docentes;
      this.bDocentes = this.Docentes;

      this.contarResultados();
      this.leyendo = false;
    });
  }

  agregarDocente() {
    this.dlgService.crearEditarDirectorJurado('Crear', '').subscribe((rRespuesta: any) => {
      this.leerDocentes();
    });
  }

  editarDocente(docente: Docente) {
    this.dlgService.crearEditarDirectorJurado('Editar', docente.iddocente).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar(rRespuesta);
      this.leerDocentes();
    });
  }

  verDocente(docente: Docente) {
    this.genService.navegar([RUTA_FACTOR_DOCENTES, RUTA_DOCENTE, docente.iddocente]);
  }

  eliminarDocente(docente: Docente) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Director o Jurado?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteDocente(docente.iddocente).subscribe((rRespuesta: any) => {
          this.dlgService.mostrarSnackBar(rRespuesta.Respuesta || rRespuesta.Error);
          this.leerDocentes();
        });
      }
    });
  }

}
