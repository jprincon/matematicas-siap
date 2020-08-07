import { GeneralService } from './../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { RUTA_DOCENTES, RUTA_LISTADO_DOCENTES, RUTA_TIPO_CONTRATO, RUTA_ACTUALIZACIONES, RUTA_CATEGORIA_DOCENTE, RUTA_FACTOR_DOCENTES, RUTA_ERRORES, RUTA_AGENDAS, RUTA_FACULTADES, RUTA_PROGRAMAS, RUTA_SERVICIOSPROGRAMA, RUTA_ADMINISTRADOR, RUTA_TAREAS_PENDIENTES, RUTA_FUNCIONESDOCENTE } from '../../config/config';

export interface SubMenu {
  nombre?: string;
  ruta?: string;
  habilitado?: boolean;
}

export interface Menu {
  nombre?: string;
  ruta?: string;
  habilitado?: boolean;
  tieneSubMenu?: boolean;
  subMenu?: SubMenu[];
}

export interface MenuPrincipal {
  nombre?: string;
  menu: Menu[];
}
@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styles: []
})
export class MenuComponent implements OnInit {

  // %%%%%%% Listado de Constantes %%%%%%%
  _RUTA_DOCENTES = RUTA_DOCENTES;
  _RUTA_FACTOR_DOCENTES = RUTA_FACTOR_DOCENTES;
  _RUTA_LISTADO_DOCENTES = RUTA_LISTADO_DOCENTES;
  _RUTA_TIPO_CONTRATO = RUTA_TIPO_CONTRATO;
  _RUTA_ACTUALIZACIONES = RUTA_ACTUALIZACIONES;
  _RUTA_CATEGORIA_DOCENTE = RUTA_CATEGORIA_DOCENTE;
  _RUTA_ERRORES = RUTA_ERRORES;
  _RUTA_AGENDAS = RUTA_AGENDAS;
  _RUTA_FACULTADES = RUTA_FACULTADES;
  _RUTA_PROGRAMAS = RUTA_PROGRAMAS;
  _RUTA_SERVICIOSPROGRAMA = RUTA_SERVICIOSPROGRAMA;
  _RUTA_TAREAS_PENDIENTES = RUTA_TAREAS_PENDIENTES;
  _RUTA_FUNCIONESDOCENTE = RUTA_FUNCIONESDOCENTE;

  _RUTA_ADMINISTRAR = RUTA_ADMINISTRADOR;

  Grupos: any[] = [
    {nombre: 'GEDES - Grupo de Estudio y Desarrollo de Software'},
    {nombre: 'GEMAUQ - Grupo de Educación Matemática'},
    {nombre: 'GEDIMA - Grupo en Didáctica de la Matemática' },
    {nombre: 'GMME - Grupo de Modelación Matemática en Epidemiología'},
    {nombre: 'Grupo de Investigación y Asesoría en Estadística'},
    {nombre: 'EIB - Escuela de Investigación en Biomatemáticas'},
    {nombre: 'SIGMA - Seminario Interdisciplinario y Grupo de Matemática Aplicada'}
  ];

  constructor(private genService: GeneralService) { }

  ngOnInit() {
  }

  irAMenu(ruta: string) {
    this.genService.navegar([ruta]);
  }

  verMenu(rutas: string[]) {
    this.genService.navegar(rutas);
  }

}
