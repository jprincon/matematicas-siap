import { Routes, RouterModule } from '@angular/router';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { AdministradorComponent } from './componentes/administrador/administrador/administrador.component';
import { RUTAS_ADMINISTRADOR } from './componentes/administrador/administrador.routes';
import { MenuPrincipalComponent } from './componentes/menu-principal/menu-principal.component';
import { RutaAdminService } from './services/ruta-admin.service';
import { RutaNavegarService } from './services/ruta-navegar.service';
import { InvestigacionComponent } from './componentes/investigacion/investigacion.component';
import { ExtensionComponent } from './componentes/extension/extension.component';
import { EvaluacionComponent } from './componentes/evaluacion/evaluacion.component';
import { DocentesComponent } from './componentes/docentes/docentes.component';
import { EstudiantesComponent } from './componentes/estudiantes/estudiantes.component';
import { EmemWorkShopComponent } from './componentes/extension/emem-work-shop/emem-work-shop.component';
import { RUTAS_EMEMWORKSHOP } from './componentes/extension/emem-work-shop/ememworkshop.routes';
import { ManualDesarrolloComponent } from './componentes/manual-desarrollo/manual-desarrollo.component';


const routes: Routes = [

  {path: 'inicio', component: InicioComponent},
  {path: 'investigacion', component: InvestigacionComponent, canActivate: [RutaNavegarService]},
  {path: 'extension', component: ExtensionComponent, canActivate: [RutaNavegarService]},
  {path: 'manual-desarrollo', component: ManualDesarrolloComponent},
  {
    path: 'emem-workshop',
    component: EmemWorkShopComponent,
    children: RUTAS_EMEMWORKSHOP
  },
  {path: 'evaluacion', component: EvaluacionComponent, canActivate: [RutaNavegarService]},
  {path: 'docentes', component: DocentesComponent, canActivate: [RutaNavegarService]},
  {path: 'estudiantes', component: EstudiantesComponent, canActivate: [RutaNavegarService]},
  {path: 'menu-principal', component: MenuPrincipalComponent, canActivate: [RutaNavegarService]},
  {
    path: 'administrador',
    component: AdministradorComponent,
    children: RUTAS_ADMINISTRADOR,
    canActivate: [RutaAdminService]
  },
  {path: '**', pathMatch: 'full', redirectTo: 'inicio'}
];

export const routingModule = RouterModule.forRoot(routes, {useHash: true});
