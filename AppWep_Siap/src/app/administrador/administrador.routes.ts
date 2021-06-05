import { Routes } from '@angular/router';
import { AdminInicioComponent } from './admin-inicio/admin-inicio.component';
import { AdminUsuarioComponent } from './admin-usuario/admin-usuario.component';
import { AdminEditarusuarioComponent } from './admin-editarusuario/admin-editarusuario.component';
import { ResumenesEmemComponent } from './resumenes-emem/resumenes-emem.component';
import { MenuWorkshopEmemComponent } from './menu-workshop-emem/menu-workshop-emem.component';
import { ParticpantesEmemComponent } from './menu-workshop-emem/particpantes-emem/particpantes-emem.component';
import { PruebasComponent } from './pruebas/pruebas.component';
import { ListaPostersComponent } from './menu-workshop-emem/lista-posters/lista-posters.component';
import { ConfiguracionesComponent } from './configuraciones/configuraciones.component';
import { RUTA_ADMIN_USUARIO, RUTA_ADMIN_WORKSHOP_EMEM, RUTA_ADMIN_CONFIGURACIONES, RUTA_ADMIN_PRUEBAS, RUTA_RESUMENES_EMEM, RUTA_LISTA_POSTERS, RUTA_PARTICIPANTES_EMEM, RUTA_ADMIN_EDITAR_USUARIO, RUTA_INICIO, RUTA_ADMIN_TIPO_PRODUCCION } from '../config/config';
import { AdminTiposProduccionComponent } from './admin-tipos-produccion/admin-tipos-produccion.component';


export const RUTAS_ADMINISTRADOR: Routes = [
  {path: RUTA_INICIO, component: AdminInicioComponent},
  {path: RUTA_ADMIN_USUARIO, component: AdminUsuarioComponent},
  {path: RUTA_ADMIN_PRUEBAS, component: PruebasComponent},
  {path: RUTA_RESUMENES_EMEM, component: ResumenesEmemComponent},
  {path: RUTA_LISTA_POSTERS, component: ListaPostersComponent},
  {path: RUTA_ADMIN_WORKSHOP_EMEM, component: MenuWorkshopEmemComponent},
  {path: RUTA_ADMIN_CONFIGURACIONES, component: ConfiguracionesComponent},
  {path: RUTA_PARTICIPANTES_EMEM, component: ParticpantesEmemComponent},
  {path: RUTA_ADMIN_EDITAR_USUARIO + '/:id', component: AdminEditarusuarioComponent},
  {path: RUTA_ADMIN_TIPO_PRODUCCION, component: AdminTiposProduccionComponent},
  {path: '**', pathMatch: 'full', redirectTo: RUTA_INICIO}
];
