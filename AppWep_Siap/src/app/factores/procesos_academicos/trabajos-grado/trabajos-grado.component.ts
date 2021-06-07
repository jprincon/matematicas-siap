import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { TrabajoGrado, Modalidad, AreaProfundizacion, GrupoInvestigacion, Paginacion } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';
import { TransferService } from '../../../services/transfer.service';
import { RUTA_CREAR_EDITAR_TRABAJO_GRADO, RUTA_MODALIDADES, RUTA_AREASPROFUNDIZACION, RUTA_GRUPOSINVESTIGACION, RUTA_FACTOR_DOCENTES, RUTA_DIRECTORES_JURADOS_TRABAJO_GRADO, RUTA_VER_TRABAJO_GRADO, RUTA_EXPORTAR_TRABAJOS_GRADO, RUTA_DOCENTES_DIRECCION_TRABAJOS_GRADO } from '../../../config/config';
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
    cantidadsemestresejecucion: {
      Dias: '',
      Meses: '',
      Semestres: '',
      Anos: ''
    },
    estadoproyecto: ''
  };

  estadoTrabajo = '';
  tituloTrabajo = '';
  nombreDocente = '';
  nombreDirector = '';
  nombreEstudiante = '';
  modalidad: Modalidad = {
    nombre: ''
  };
  areaProfundizacion: AreaProfundizacion = {
    nombre: ''
  };
  grupoInvestigacion: GrupoInvestigacion = {
    nombre: ''
  };

  verLista = true;
  verTarjetas = false;
  verDescripciones = false;

  Modalidades: Modalidad[] = [];
  AreasProfundizacion: AreaProfundizacion[] = [];
  GruposInvestigacion: GrupoInvestigacion[] = [];

  Menus: Menu[] = [
    {
      nombre: 'Exportar',
      ruta: 'exportar-trabajos',
      imagen: 'assets/Iconos/Excel.png',
      descripcion: 'Permite exportar los trabajos de grado a formato Excel'
    },
    {
      nombre: 'Reporte Docentes con Dirección de Trabajos de Grado',
      ruta: 'reporte-trabajos-grado',
      imagen: 'assets/Iconos/Ver.png',
      descripcion: 'Genera un reporte de los trabajos de grado que esta dirigiendo cada docente'
    },
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

  paginacion: Paginacion = {
    desde: 1,
    cantidad: 5,
    resultado: '',
    todos: 'no',
    ordenarPor: 'fechainicioejecucion',
  };

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.leerTrabajosGrado();

    this.leerGruposInvestigacion();
    this.leerModalidades();
    this.leerAreasProfundizacion();
  }

  abrirMenu(menu: Menu) {
    if (menu.ruta === 'ver-modalidades') {
      this.genService.navegar([RUTA_MODALIDADES]);
    }

    if (menu.ruta === 'exportar-trabajos') {
      this.genService.navegar([RUTA_EXPORTAR_TRABAJOS_GRADO]);
    }

    if (menu.ruta === 'ver-areas-profundizacion') {
      this.genService.navegar([RUTA_AREASPROFUNDIZACION]);
    }

    if (menu.ruta === 'reporte-trabajos-grado') {
      this.genService.navegar([RUTA_DOCENTES_DIRECCION_TRABAJOS_GRADO]);
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

    const datos = JSON.stringify(this.paginacion);

    this.genService.getTrabajosGrado(datos).subscribe((ResultPaginacion: Paginacion) => {
      console.log(ResultPaginacion);
      this.paginacion = ResultPaginacion;
      this.TrabajosGrado = ResultPaginacion.contenido;
      this.bTrabajosGrado = this.TrabajosGrado;

      this.leyendo = false;
    });
  }

  cambiarPagina(delta: number) {
    this.paginacion.desde = Number(this.paginacion.desde) + Number(this.paginacion.cantidad) * delta;
    console.log(this.paginacion);
    this.leerTrabajosGrado();
  }

  leerModalidades() {
    this.genService.getModalidades().subscribe((rModalidades: any) => {
      console.log(rModalidades);
      this.Modalidades = rModalidades.Modalidades;
    });
  }

  leerAreasProfundizacion() {
    this.genService.getAreasProfundizacion().subscribe((rAreasProfundizacion: any) => {
      console.log(rAreasProfundizacion);
      this.AreasProfundizacion = rAreasProfundizacion.AreasProfundizacion;
    });
  }

  leerGruposInvestigacion() {
    this.genService.getGruposInvestigacion().subscribe((rGruposInvestigacion: any) => {
      console.log(rGruposInvestigacion);
      this.GruposInvestigacion = rGruposInvestigacion.GruposInvestigacion;
    });
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

          this.dlgService.mostrarSnackBar(rRespuesta.Respuesta || rRespuesta.Error);
          this.leerTrabajosGrado();
        });
      }
    });
  }

  verTrabajoGrado(trabajoGrado: TrabajoGrado) {
    this.genService.navegar([RUTA_VER_TRABAJO_GRADO, trabajoGrado.idtrabajogrado]);
  }

  buscarTrabajosGrado_porEstadoProyecto() {
    this.bTrabajosGrado = [];
    for (const trabajo of this.TrabajosGrado) {
      if (trabajo.estadoproyecto === this.estadoTrabajo) {
        this.bTrabajosGrado.push(trabajo);
      }
    }
  }

  buscarTrabajosGrado_porTitulo() {
    this.bTrabajosGrado = [];
    for (const trabajo of this.TrabajosGrado) {
      const titulo = trabajo.titulo.toLowerCase();
      this.tituloTrabajo = this.tituloTrabajo.toLowerCase();
      if (titulo.indexOf(this.tituloTrabajo) >= 0) {
        this.bTrabajosGrado.push(trabajo);
      }
    }
  }

  buscarTrabajosGrado_porJurado() {
    this.bTrabajosGrado = [];
    this.nombreDocente = this.nombreDocente.toLowerCase();
    for (const trabajo of this.TrabajosGrado) {

      const jurado1 = trabajo.jurado1.nombre.toLowerCase();
      const jurado2 = trabajo.jurado2.nombre.toLowerCase();
      const jurado3 = trabajo.jurado3.nombre.toLowerCase();

      console.log(jurado1, jurado2, jurado3);

      const validacion = (jurado1.indexOf(this.nombreDocente) >= 0)
                              || (jurado2.indexOf(this.nombreDocente) >= 0)
                              || (jurado3.indexOf(this.nombreDocente) >= 0);
      if (validacion) {
        this.bTrabajosGrado.push(trabajo);
      }
    }
  }

  buscarTrabajosGrado_porDirector() {
    this.bTrabajosGrado = [];
    for (const trabajo of this.TrabajosGrado) {
      const director = trabajo.director.nombre.toLowerCase();
      this.nombreDirector = this.nombreDirector.toLowerCase();

      const validacion = (director.indexOf(this.nombreDirector) >= 0);
      if (validacion) {
        this.bTrabajosGrado.push(trabajo);
      }
    }
  }

  buscarTrabajosGrado_porNombreEstudiante() {
    this.bTrabajosGrado = [];

    for (const trabajo of this.TrabajosGrado) {

      const estudiante1 = trabajo.estudiante1.toLowerCase();
      const estudiante2 = trabajo.estudiante2.toLowerCase();
      const estudiante3 = trabajo.estudiante3.toLowerCase();

      const validacion = (estudiante1.indexOf(this.nombreEstudiante) >= 0)
                            || (estudiante2.indexOf(this.nombreEstudiante) >= 0)
                            || (estudiante3.indexOf(this.nombreEstudiante) >= 0);

      if (validacion) {
        this.bTrabajosGrado.push(trabajo);
      }
    }
  }

  buscarTrabajosGrado_porModalidad() {
    this.bTrabajosGrado = [];
    this.modalidad.nombre = this.modalidad.nombre.toLowerCase();
    for (const trabajo of this.TrabajosGrado) {
      const modalidad = trabajo.modalidad.nombre.toLowerCase();
      const validacion = modalidad === this.modalidad.nombre;
      if (validacion) {
        this.bTrabajosGrado.push(trabajo);
      }
    }
  }

  buscarTrabajosGrado_porAreaProfundizacion() {
    this.bTrabajosGrado = [];
    this.areaProfundizacion.nombre = this.areaProfundizacion.nombre.toLowerCase();
    for (const trabajo of this.TrabajosGrado) {
      const areaProfundizacion = trabajo.areaProfundizacion.nombre.toLowerCase();
      const validacion = areaProfundizacion === this.areaProfundizacion.nombre;
      if (validacion) {
        this.bTrabajosGrado.push(trabajo);
      }
    }
  }

  buscarTrabajosGrado_porGrupoInvestigacion() {
    this.bTrabajosGrado = [];
    this.grupoInvestigacion.nombre = this.grupoInvestigacion.nombre.toLowerCase();
    for (const trabajo of this.TrabajosGrado) {
      const grupoInvestigacion = trabajo.grupoInvestigacion.nombre.toLowerCase();
      const validacion = grupoInvestigacion === this.grupoInvestigacion.nombre;
      if (validacion) {
        this.bTrabajosGrado.push(trabajo);
      }
    }
  }
}
