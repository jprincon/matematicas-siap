import { GeneralService } from './../services/general.service';
import { Component, OnInit } from '@angular/core';
import { TransferService } from '../services/transfer.service';
import { MenuFactores, BotonMenu, Favorito } from '../interfaces/interfaces.interfaces';
import { Utilidades } from '../utilidades/utilidades.class';
import { RUTA_FACTOR_DOCENTES, RUTA_DOCENTES, RUTA_SERVICIOSPROGRAMA, RUTA_PROGRAMAS, RUTA_AGENDAS, RUTA_FACULTADES, RUTA_PERIODOS, RUTA_FUNCIONESDOCENTE, RUTA_ESTADISTICAS_FACTOR_DOCENTES } from '../config/config';

@Component({
  selector: 'app-factores',
  templateUrl: './factores.component.html',
  styles: []
})
export class FactoresComponent implements OnInit {


  // Crear un menu dinámico
  Menus: MenuFactores[] = [
    // PROCESOS ACADÉMICOS
    {
     Titulo: 'Procesos Académicos',
     Botones: [
       {
         IdBoton: 'pro-aca-tra-gra',
         Titulo: 'Trabajos de Grado',
          Icono: 'pendiente.png',
          Ruta: ['']
       },
       {
          Titulo: 'Plan de Mejoramiento',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'pro-aca-plan-mejora'
       },
       {
          Titulo: 'Actualización de Documentos',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'pro-aca-actualiza-doc'
       },
       {
          Titulo: 'Coordinación de Práctica Docente',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'pro-aca-coord-pra-doc'
       },
       {
          Titulo: 'Virtualización',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'pro-aca-virtualiz'
       }
     ]
    },
    // ESTUDIANTES
    {
      Titulo: 'Estudiantes',
      Botones: [
        {
           Titulo: '  Pruebas Saber PRO',
           Icono: 'pendiente.png',
           Ruta: [''],
           IdBoton: 'est-prueba-sab-pro'
        },
        {
          Titulo: 'Comité de Apoyo Estudiantil',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'est-com-apoy-est'
        },
        {
          Titulo: 'Propuesta de Evaluación por Nucleos',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'est-pro-eva-nucleos'
        }
      ]
     },
     // DOCENTES
     {
      Titulo: 'Docentes',
      Botones: [
        {
          Titulo: 'Docentes',
          Icono: 'docentes.svg',
          Ruta: [RUTA_FACTOR_DOCENTES, RUTA_DOCENTES],
          IdBoton: 'doc-docentes'
        },
        {
           Titulo: 'Programas',
           Icono: 'programas.png',
           Ruta: [RUTA_FACTOR_DOCENTES, RUTA_PROGRAMAS],
           IdBoton: 'doc-programas'
        },
        {
          Titulo: 'Facultades',
          Icono: 'facultades.png',
          Ruta: [RUTA_FACTOR_DOCENTES, RUTA_FACULTADES],
          IdBoton: 'doc-facultades'
        },
        {
          Titulo: 'Periodos',
          Icono: 'periodos.png',
          Ruta: [RUTA_FACTOR_DOCENTES, RUTA_PERIODOS],
          IdBoton: 'doc-periodos'
       },
        {
          Titulo: 'Servicios de Programa',
          Icono: 'servicios.png',
          Ruta: [RUTA_FACTOR_DOCENTES, RUTA_SERVICIOSPROGRAMA],
          IdBoton: 'doc-ser-program'
        },
        {
          Titulo: 'Funciones de Docencia',
          Icono: 'funcionesdocencia.png',
          Ruta: [RUTA_FACTOR_DOCENTES, RUTA_FUNCIONESDOCENTE],
          IdBoton: 'doc-func-docencia'
        },
        {
          Titulo: 'Agendas',
          Icono: 'agendas.png',
          Ruta: [RUTA_FACTOR_DOCENTES, RUTA_AGENDAS],
          IdBoton: 'doc-agendas'
        },
        {
          Titulo: 'Estadísticas',
          Icono: 'estadisticas.png',
          Ruta: [RUTA_FACTOR_DOCENTES, RUTA_ESTADISTICAS_FACTOR_DOCENTES],
          IdBoton: 'doc-estadisticas'
        }
      ]
     },

     // INTERNACIONALIZACIÓN
     {
      Titulo: 'Internacionalización',
      Botones: [
        {
           Titulo: 'RED Clema',
           Icono: 'pendiente.png',
           Ruta: [''],
           IdBoton: 'inter-red-clema'
        },
        {
          Titulo: 'Capacitaciones para Convocatorias',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'inter-cap-convo'
        },
        {
          Titulo: 'Proyectos de Doble Titulación',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'inter-pro-doble-tit'
        },
        {
          Titulo: 'Participación en Eventos Científicos',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'inter-par-event-cientif'
        }
      ]
     },

     // INVESTIGACIÓN
     {
      Titulo: 'Investigación',
      Botones: [
        {
           Titulo: 'Representante Ante el CIFE',
           Icono: 'pendiente.png',
           Ruta: [''],
           IdBoton: 'invest-rep-cife'
        },
        {
          Titulo: 'Revisión de Proyectos de Investigación',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'invest-rev-pro-invest'
        },
        {
          Titulo: 'Semillero de Investigación de la Facultad',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'invest-sem-inv-fac'
        },
        {
          Titulo: 'Representante de Investigaciones',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'invest-rep-invest'
        },
        {
          Titulo: 'Grupos de Investigación',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'invest-grup-invest'
       }
      ]
     },

     // EXTENSIÓN Y GESTIÓN DE GRADUADO
     {
      Titulo: 'Extensión y Gestión del Graduado',
      Botones: [
        {
           Titulo: 'MADS - Laboratorio de Matemática Aplicada y Desarrollo de Software',
           Icono: 'pendiente.png',
           Ruta: [''],
           IdBoton: 'egg-mads'
        },
        {
          Titulo: 'Coordinación de Comunicaciones del Programa',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'egg-coord-com-pro'
        },
        {
          Titulo: 'Proyecto: Laboratorio de Didáctica de la Matemática',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'egg-lab-didact-mat'
        },
        {
          Titulo: 'Proyectos de Extensión del Programa',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'egg-pro-ext-program'
        },
        {
          Titulo: 'Graduados',
          Icono: 'graduados.png',
          Ruta: ['graduados'],
          IdBoton: 'egg-egresados'
        }
      ]
     },

     // ACERCA DE ...
     {
      Titulo: 'Acerca de ...',
      Botones: [
        {
           Titulo: '¿Qué es SIAP?',
           Icono: 'pendiente.png',
           Ruta: [''],
           IdBoton: 'acerca-que-siap'
        },
        {
          Titulo: 'Actualizaciones',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'acerca-actualiza'
        },
        {
          Titulo: 'Manual de Ayuda',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'acerca-man-ayu'
        },
        {
          Titulo: 'Gestión de Errores',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'acerca-gestion-err'
        }
      ]
     },

     // ADMINISTRADOR
     {
      Titulo: 'Administración de la Plataforma',
      Botones: [
        {
           Titulo: 'Usuarios',
           Icono: 'pendiente.png',
           Ruta: [''],
           IdBoton: 'admin-usuarios'
        },
        {
          Titulo: 'Configuración General',
          Icono: 'pendiente.png',
          Ruta: [''],
          IdBoton: 'admin-config-gen'
        }
      ]
     }
  ];

  Favoritos: Favorito[] = [];

  constructor(private genService: GeneralService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('');
    this.obtenerFavoritos();
    window.scrollTo(0, 0);
  }

  obtenerFavoritos() {
    this.genService.getFavoritos().subscribe((rFavoritos: any) => {
      console.log(rFavoritos);
      this.Favoritos = rFavoritos.Favoritos;
    });
  }

  abrirMenu2(favorito: Favorito) {
    console.log(favorito.ruta.split(','));

    const boton: BotonMenu = {
      IdBoton: favorito.idfavorito,
      Titulo: favorito.titulo,
      Icono: favorito.icono,
      Ruta: favorito.ruta.split(',')
    };

    this.abrirMenu(boton);
  }

  abrirMenu(boton: BotonMenu) {
    // Registrar el evento en favoritos
    const favorito: Favorito = {
      idfavorito: boton.IdBoton,
      titulo: boton.Titulo,
      icono: boton.Icono,
      ruta: boton.Ruta.toString(),
      frecuencia: '1'
    };

    const datos = JSON.stringify(favorito);
    this.genService.postFavorito(datos).subscribe((rFavorito: any) => {
      console.log(rFavorito);
      this.genService.navegar(boton.Ruta);
    });

  }

}
