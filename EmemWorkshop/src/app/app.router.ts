import { Routes, RouterModule } from '@angular/router';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { ModalidadesComponent } from './componentes/modalidades/modalidades.component';
import { InscripcionesComponent } from './componentes/inscripciones/inscripciones.component';

const routes: Routes = [
  { path: 'inicio', component: InicioComponent },
  { path: 'modalidades', component: ModalidadesComponent },
  { path: 'inscripcion', component: InscripcionesComponent },
  { path: '**', pathMatch: 'full', redirectTo: 'inicio' }
];

export const routingModule = RouterModule.forRoot(routes, {useHash: true});
