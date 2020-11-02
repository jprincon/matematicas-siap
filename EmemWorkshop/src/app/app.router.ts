import { Routes, RouterModule } from '@angular/router';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { ModalidadesComponent } from './componentes/modalidades/modalidades.component';
import { InscripcionesComponent } from './componentes/inscripciones/inscripciones.component';
import { AuthGuardService } from './Servicios/auth-guard.service';
import { AfiliacionesComponent } from './componentes/administrar/afiliaciones/afiliaciones.component';
import { RUTA_AFILIACIONES, RUTA_PARTICIPANTESEMEM, RUTA_PONENCIAS_CONFERENCIAS, RUTA_CONCURSO, RUTA_INICIO, RUTA_MODALIDADES, RUTA_INSCRIPCION, RUTA_CONTACTO, RUTA_PROGRAMACION } from './config/config';
import { AdministrarComponent } from './componentes/administrar/administrar.component';
import { ParticipantesEmemComponent } from './componentes/administrar/participantes-emem/participantes-emem.component';
import { PonenciasComponent } from './componentes/ponencias/ponencias.component';
import { ConcursoComponent } from './componentes/concurso/concurso.component';
import { ContactoComponent } from './componentes/contacto/contacto.component';
import { ProgramacionComponent } from './componentes/programacion/programacion.component';

const routes: Routes = [
  { path: RUTA_INICIO, component: InicioComponent },
  { path: RUTA_MODALIDADES, component: ModalidadesComponent },
  { path: RUTA_INSCRIPCION, component: InscripcionesComponent },
  {path: RUTA_PONENCIAS_CONFERENCIAS, component: PonenciasComponent},
  {path: RUTA_CONCURSO, component: ConcursoComponent},
  {path: RUTA_CONTACTO, component: ContactoComponent},
  {path: RUTA_PROGRAMACION, component: ProgramacionComponent},

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
