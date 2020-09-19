import { Routes, RouterModule } from '@angular/router';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { ModalidadesComponent } from './componentes/modalidades/modalidades.component';
import { InscripcionesComponent } from './componentes/inscripciones/inscripciones.component';
import { AuthGuardService } from './Servicios/auth-guard.service';
import { AfiliacionesComponent } from './componentes/administrar/afiliaciones/afiliaciones.component';
import { RUTA_AFILIACIONES, RUTA_PARTICIPANTESEMEM } from './config/config';
import { AdministrarComponent } from './componentes/administrar/administrar.component';
import { ParticipantesEmemComponent } from './componentes/administrar/participantes-emem/participantes-emem.component';

const routes: Routes = [
  { path: 'inicio', component: InicioComponent },
  { path: 'modalidades', component: ModalidadesComponent },
  { path: 'inscripcion', component: InscripcionesComponent },

  // Administrar
  { path: 'administrar', component: AdministrarComponent, canActivate: [AuthGuardService],
    children: [
      {path: RUTA_AFILIACIONES, component: AfiliacionesComponent},
      {path: RUTA_PARTICIPANTESEMEM, component: ParticipantesEmemComponent},
      { path: '**', pathMatch: 'full', redirectTo: RUTA_AFILIACIONES }
    ]},

  { path: '**', pathMatch: 'full', redirectTo: 'inicio' }
];

export const routingModule = RouterModule.forRoot(routes, {useHash: true});
