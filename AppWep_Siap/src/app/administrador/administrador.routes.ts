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


export const RUTAS_ADMINISTRADOR: Routes = [
  {path: 'inicio', component: AdminInicioComponent},
  {path: 'usuario', component: AdminUsuarioComponent},
  {path: 'pruebas', component: PruebasComponent},
  {path: 'resumenes-emem', component: ResumenesEmemComponent},
  {path: 'lista-posters', component: ListaPostersComponent},
  {path: 'workshop-emem', component: MenuWorkshopEmemComponent},
  {path: 'configuraciones', component: ConfiguracionesComponent},
  {path: 'participantes-emem', component: ParticpantesEmemComponent},
  {path: 'editar-usuario/:id', component: AdminEditarusuarioComponent},
  {path: '**', pathMatch: 'full', redirectTo: 'inicio'}
];
