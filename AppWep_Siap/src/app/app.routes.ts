import { Routes, RouterModule } from '@angular/router';

// %%%%%%% Rutas Generales %%%%%%%
import { InicioComponent } from './general/inicio/inicio.component';

// %%%%%%% Ruta de Adminstrador %%%%%%%
import { AdministradorComponent } from './administrador/administrador/administrador.component';
import { RUTAS_ADMINISTRADOR } from './administrador/administrador.routes';

// %%%%%%% Guard-Service %%%%%%%
import { RutaAdminService } from './services/ruta-admin.service';
import { RutaNavegarService } from './services/ruta-navegar.service';

// %%%%%%% Rutas Factor Internacionalización %%%%%%%

// %%%%%%% Rutas Factor Extension %%%%%%%
import { ExtensionComponent } from './factores/extension/extension.component';
import { EmemWorkShopComponent } from './factores/extension/emem-work-shop/emem-work-shop.component';
import { RUTAS_EMEMWORKSHOP } from './factores/extension/emem-work-shop/ememworkshop.routes';

// %%%%%%% Rutas Factor Docentes %%%%%%%
import { FactorDocentesComponent } from './factores/docentes/factor-docentes.component';

// %%%%%%% Rutas Factor Estudinates %%%%%%%
import { EstudiantesComponent } from './factores/estudiantes/estudiantes.component';

// %%%%%%% Rutas Procesos Académicos %%%%%%%

// %%%%%%% Rutas Investigación %%%%%%%
import { InvestigacionComponent } from './factores/investigacion/investigacion.component';

// %%%%%%% Rutas de Acceso Público %%%%%%%
import { ManualDesarrolloComponent } from './general/manual-desarrollo/manual-desarrollo.component';
import { NoPaginaComponent } from './general/no-pagina/no-pagina.component';
import { FactoresComponent } from './factores/factores.component';
import { InternacionalizacionComponent } from './factores/internacionalizacion/internacionalizacion.component';
import { ProcesosAcademicosComponent } from './factores/procesos_academicos/procesos-academicos.component';
import { TiposContratoComponent } from './factores/docentes/tipos-contrato/tipos-contrato.component';
import { ActualizacionesComponent } from './general/actualizaciones/actualizaciones.component';
import { CategoriasDocentesComponent } from './factores/docentes/categorias-docentes/categorias-docentes.component';
import { DocentesComponent } from './factores/docentes/docentes/docentes.component';
import { DocenteComponent } from './factores/docentes/docente/docente.component';
import { ErroresComponent } from './general/errores/errores.component';
import { AgendasComponent } from './factores/docentes/agendas/agendas.component';

import { RUTA_DOCENTES, RUTA_TIPO_CONTRATO, RUTA_CATEGORIA_DOCENTE, RUTA_FACTOR_DOCENTES, RUTA_DOCENTE, RUTA_ERRORES, RUTA_AGENDAS, RUTA_FACULTADES, RUTA_PROGRAMAS, RUTA_SERVICIOSPROGRAMA, RUTA_SERVICIOPROGRAMA, RUTA_ACTUALIZACIONES, RUTA_TAREAS_PENDIENTES, RUTA_FUNCIONESDOCENTE, RUTA_EGRESADOS, RUTA_FACTOR_EXTENSION } from './config/config';
import { FacultadesComponent } from './factores/docentes/facultades/facultades.component';
import { ProgramasComponent } from './factores/docentes/programas/programas.component';
import { ServiciosProgramaComponent } from './factores/docentes/servicios-programa/servicios-programa.component';
import { ServicioProgramaComponent } from './factores/docentes/servicios-programa/servicio-programa/servicio-programa.component';
import { TareasPendientesComponent } from './general/tareas-pendientes/tareas-pendientes.component';
import { FuncionesDocenteComponent } from './factores/docentes/funciones-docente/funciones-docente.component';
import { EgresadosComponent } from './factores/extension/egresados/egresados.component';

const routes: Routes = [

  // %%%%%%% Rutas de Acceso Público %%%%%%%
  {path: 'inicio', component: InicioComponent},
  {path: 'manual-desarrollo', component: ManualDesarrolloComponent},

  // %%%%%%% Rutas Factor Internacionalización %%%%%%%

  // %%%%%%% Rutas Factor Extension %%%%%%%
  {path: RUTA_FACTOR_EXTENSION, component: ExtensionComponent, canActivate: [RutaNavegarService]},
  {path: RUTA_EGRESADOS, component: EgresadosComponent},

  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     FACTORES
     Rutas para los factores
  =========================================================================================================================*/
  {path: 'factores', component: FactoresComponent, canActivate: [RutaNavegarService]},

  // %%%%%%% Rutas Factor Internacionalización %%%%%%%
  {path: 'internacionalizacion', component: InternacionalizacionComponent, canActivate: [RutaNavegarService]},

  // %%%%%%% Rutas Factor Docentes %%%%%%%
  {path: RUTA_FACTOR_DOCENTES, component: FactorDocentesComponent, canActivate: [RutaNavegarService],
    children: [
      {path: RUTA_TIPO_CONTRATO, component: TiposContratoComponent, canActivate: [RutaNavegarService]},
      {path: RUTA_CATEGORIA_DOCENTE, component: CategoriasDocentesComponent, canActivate: [RutaNavegarService]},
      {path: RUTA_DOCENTES, component: DocentesComponent, canActivate: [RutaNavegarService]},
      {path: RUTA_DOCENTE + '/:id', component: DocenteComponent, canActivate: [RutaNavegarService]},
      {path: RUTA_FACULTADES, component: FacultadesComponent, canActivate: [RutaNavegarService]},
      {path: RUTA_PROGRAMAS, component: ProgramasComponent, canActivate: [RutaNavegarService]},
      {path: RUTA_SERVICIOSPROGRAMA, component: ServiciosProgramaComponent, canActivate: [RutaNavegarService]},
      {path: RUTA_SERVICIOPROGRAMA + '/:id', component: ServicioProgramaComponent, canActivate: [RutaNavegarService]},
      {path: RUTA_AGENDAS, component: AgendasComponent, canActivate: [RutaNavegarService]},
      {path: RUTA_FUNCIONESDOCENTE, component: FuncionesDocenteComponent, canActivate: [RutaNavegarService]},
      {path: '**', pathMatch: 'full', redirectTo: RUTA_DOCENTES}
    ]
  },

  // %%%%%%% Rutas Factor Estudinates %%%%%%%
  {path: 'estudiantes', component: EstudiantesComponent, canActivate: [RutaNavegarService]},

  // %%%%%%% Rutas Procesos Académicos %%%%%%%
  {path: 'procesos-academicos', component: ProcesosAcademicosComponent, canActivate: [RutaNavegarService]},

  // %%%%%%% Rutas Investigación %%%%%%%
  {path: 'investigacion', component: InvestigacionComponent, canActivate: [RutaNavegarService]},

  // %%%%%%% Rutas de Administración %%%%%%%
  {
    path: 'administrador',
    component: AdministradorComponent,
    children: RUTAS_ADMINISTRADOR,
    canActivate: [RutaAdminService]
  },

  // %%%%%%% Acerca de ... %%%%%%%
  {path: RUTA_ACTUALIZACIONES, component: ActualizacionesComponent},
  {path: RUTA_TAREAS_PENDIENTES, component: TareasPendientesComponent, canActivate: [RutaNavegarService]},
  {path: RUTA_ERRORES, component: ErroresComponent, canActivate: [RutaNavegarService]},

  // %%%%%%% Ruta de Página no encontrada %%%%%%%
  {path: 'no-page-found', component: NoPaginaComponent},
  {path: '**', pathMatch: 'full', redirectTo: 'no-page-found'}
];

export const routingModule = RouterModule.forRoot(routes, {useHash: true});
