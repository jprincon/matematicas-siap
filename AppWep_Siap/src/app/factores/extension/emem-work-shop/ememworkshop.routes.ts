import { CursilloEmemComponent } from './cursillo-emem/cursillo-emem.component';
import { PostersEmemComponent } from './posters-emem/posters-emem.component';
import { Routes } from '@angular/router';
import { PaginaInicioComponent } from './pagina-inicio/pagina-inicio.component';
import { InscripcionesEmemComponent } from './inscripciones-emem/inscripciones-emem.component';
import { CronogramaEmemComponent } from './cronograma-emem/cronograma-emem.component';
import { CursillosEmemComponent } from './cursillos-emem/cursillos-emem.component';
import { CertificadosEmemComponent } from './certificados-emem/certificados-emem.component';
import { ResumenesComponent } from './resumenes/resumenes.component';
import { CrearResumenComponent } from './crear-resumen/crear-resumen.component';
import { VerResumenComponent } from './ver-resumen/ver-resumen.component';


export const RUTAS_EMEMWORKSHOP: Routes = [
  {path: 'inicio', component: PaginaInicioComponent},
  {path: 'inscripciones', component: InscripcionesEmemComponent},
  {path: 'cronograma', component: CronogramaEmemComponent},
  {path: 'cursillos', component: CursillosEmemComponent},
  {path: 'cursillo/:id', component: CursilloEmemComponent},
  {path: 'posters', component: PostersEmemComponent},
  {path: 'certificados', component: CertificadosEmemComponent},
  {path: 'resumenes', component: ResumenesComponent},
  {path: 'crear-editar-resumen/:id', component: CrearResumenComponent},
  {path: 'ver-resumen/:id', component: VerResumenComponent},
  {path: '**', pathMatch: 'full', redirectTo: 'inicio'}
];
