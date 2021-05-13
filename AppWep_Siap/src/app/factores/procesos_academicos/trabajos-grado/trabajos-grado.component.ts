import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { TrabajoGrado } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';
import { TransferService } from '../../../services/transfer.service';
import { RUTA_CREAR_EDITAR_TRABAJO_GRADO, RUTA_MODALIDADES, RUTA_AREASPROFUNDIZACION, RUTA_GRUPOSINVESTIGACION, RUTA_FACTOR_DOCENTES, RUTA_DIRECTORES_JURADOS_TRABAJO_GRADO } from '../../../config/config';
import { Menu } from '../../../general/menu/menu.component';

@Component({
  selector: 'app-trabajos-grado',
  templateUrl: './trabajos-grado.component.html',
  styles: []
})
export class TrabajosGradoComponent implements OnInit {

  TrabajosGrado: TrabajoGrado[] = [];
  bTrabajosGrado: TrabajoGrado[] = [];
  leyendo = false;
  contIntentos = 1;

  trabajogrado: TrabajoGrado = {
    titulo: '',
    idtrabajogrado: '',
    estudiante1: '',
    estudiante2: '',
    estudiante3: '',
    idjurado1: '',
    jurado1: {nombre: ''},
    jurado2: {nombre: ''},
    jurado3: {nombre: ''},
    idjurado2: '',
    idjurado3: '',
    iddirector: '',
    director: {nombre: ''},
    idcodirector: '',
    codirector: {nombre: ''},
    idmodalidad: '',
    modalidad: {nombre: ''},
    idareaprofundizacion: 'j',
    areaProfundizacion: {nombre: ''},
    idgrupoinvestigacion: '',
    grupoInvestigacion: {nombre: ''},
    actanombramientojurados: '',
    actapropuesta: '',
    evaluacionpropuesta: '',
    evaluaciontrabajoescrito: '',
    evaluacionsustentacion: '',
    fechasustentacion: '',
    calificacionfinal: '',
    estudiantecedederechos: '',
    fechainicioejecucion: '',
    cantidadsemestresejecucion: 0,
    estadoavance: 0
  };

  verLista = true;
  verTarjetas = false;
  verDescripciones = false;

  Menus: Menu[] = [
    {
      nombre: 'Ver Lista',
      ruta: 'ver-lista',
      imagen: 'assets/Iconos/lista.png',
      descripcion: 'Vista de los trabajos como una lista de elementos'
    },
    {
      nombre: 'Ver Descripciones',
      ruta: 'ver-descripciones',
      imagen: 'assets/Iconos/descripcion.png',
      descripcion: 'Vista de los trabajos como una lista de descripciones (Incluye la mayoría de los atributos)'
    },
    {
      nombre: 'Ver Tarjetas',
      ruta: 'ver-tarjetas',
      imagen: 'assets/Iconos/tarjetas.png',
      descripcion: 'Vista de los trabajos como tarjetas organizadas'
    },
    {
      nombre: 'Grupos de Investigación',
      ruta: 'ver-grupos-investigacion',
      imagen: 'assets/Iconos/pendiente.png',
      descripcion: 'Gestión de los grupos de investigación'
    },
    {
      nombre: 'Modalidades de Trabajo de Grado',
      ruta: 'ver-modalidades',
      imagen: 'assets/Iconos/pendiente.png',
      descripcion: 'Gestión de los tipos de modalidad para trabajos de grado'
    },
    {
      nombre: 'Áreas de profundización',
      ruta: 'ver-areas-profundizacion',
      imagen: 'assets/Iconos/pendiente.png',
      descripcion: 'Gestión de los tipos de áreas de profundización'
    },
    {
      nombre: 'Directores y Jurados',
      ruta: 'ver-directores-jurados',
      imagen: 'assets/Iconos/pendiente.png',
      descripcion: 'Gestión de la lista de docentes que son directores y jurados.'
    }
  ];

  bTitulo = '';

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.leerTrabajosGrado();
  }

  abrirMenu(menu: Menu) {
    if (menu.ruta === 'ver-modalidades') {
      this.genService.navegar([RUTA_MODALIDADES]);
    }


    if (menu.ruta === 'ver-areas-profundizacion') {
      this.genService.navegar([RUTA_AREASPROFUNDIZACION]);
    }

    if (menu.ruta === 'ver-grupos-investigacion') {
      this.genService.navegar([RUTA_GRUPOSINVESTIGACION]);
    }

    if (menu.ruta === 'ver-directores-jurados') {
      this.genService.navegar([RUTA_FACTOR_DOCENTES, RUTA_DIRECTORES_JURADOS_TRABAJO_GRADO]);
    }

    if (menu.ruta === 'ver-lista') {
      this.verLista = true;
      this.verDescripciones = false;
      this.verTarjetas = false;
    }

    if (menu.ruta === 'ver-descripciones') {
      this.verLista = false;
      this.verDescripciones = true;
      this.verTarjetas = false;
    }

    if (menu.ruta === 'ver-tarjetas') {
      this.verLista = false;
      this.verDescripciones = false;
      this.verTarjetas = true;
    }
  }

  leerTrabajosGrado() {

    this.leyendo = true;

    this.genService.getTrabajosGrado().subscribe((rTrabajosGrado: any) => {
      this.TrabajosGrado = rTrabajosGrado.TrabajosGrado;
      this.bTrabajosGrado = this.TrabajosGrado;
      console.log(this.TrabajosGrado);

      this.leyendo = false;
    });
  }

  buscarTrabajosGrado() {
    console.log(this.trabajogrado);
  }

  agregarTrabajoGrado() {
    this.genService.navegar([RUTA_CREAR_EDITAR_TRABAJO_GRADO, 'Crear']);
  }

  editarTrabajoGrado(trabajogrado: TrabajoGrado) {
    this.genService.navegar([RUTA_CREAR_EDITAR_TRABAJO_GRADO, trabajogrado.idtrabajogrado]);
  }

  eliminarTrabajoGrado(trabajogrado: TrabajoGrado) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este TrabajoGrado?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteTrabajoGrado(trabajogrado.idtrabajogrado).subscribe((rRespuesta: any) => {

          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerTrabajosGrado();
        });
      }
    });
  }

  buscarTrabajosGrado_porTitulo() {
    this.bTrabajosGrado = [];

  }

}
