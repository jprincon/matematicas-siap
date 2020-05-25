import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {HttpClientModule} from '@angular/common/http';
import { FormsModule } from '@angular/forms';

import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {MatDialogModule} from '@angular/material/dialog';
import {MatSnackBarModule} from '@angular/material/snack-bar';


import { AppComponent } from './app.component';
import { BarraInicioComponent } from './componentes/general/barra-inicio/barra-inicio.component';
import { PiePaginaComponent } from './componentes/general/pie-pagina/pie-pagina.component';
import { BannerComponent } from './componentes/general/banner/banner.component';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { routingModule } from './app.routes';
import { AdministradorComponent } from './componentes/administrador/administrador/administrador.component';
import { AdminInicioComponent } from './componentes/administrador/admin-inicio/admin-inicio.component';
import { AdminUsuarioComponent } from './componentes/administrador/admin-usuario/admin-usuario.component';
import { AdminEditarusuarioComponent } from './componentes/administrador/admin-editarusuario/admin-editarusuario.component';
import { MenuPrincipalComponent } from './componentes/menu-principal/menu-principal.component';
import { MensajeComponent } from './componentes/dialogos/mensaje/mensaje.component';
import { CapitalizadoPipe } from './pipes/capitalizado.pipe';
import { InvestigacionComponent } from './componentes/investigacion/investigacion.component';
import { ExtensionComponent } from './componentes/extension/extension.component';
import { DocentesComponent } from './componentes/docentes/docentes.component';
import { EstudiantesComponent } from './componentes/estudiantes/estudiantes.component';
import { EvaluacionComponent } from './componentes/evaluacion/evaluacion.component';
import { EmemWorkShopComponent } from './componentes/extension/emem-work-shop/emem-work-shop.component';
import { PaginaInicioComponent } from './componentes/extension/emem-work-shop/pagina-inicio/pagina-inicio.component';
import { InscripcionesEmemComponent } from './componentes/extension/emem-work-shop/inscripciones-emem/inscripciones-emem.component';
import { CronogramaEmemComponent } from './componentes/extension/emem-work-shop/cronograma-emem/cronograma-emem.component';
import { CursillosEmemComponent } from './componentes/extension/emem-work-shop/cursillos-emem/cursillos-emem.component';
import { PostersEmemComponent } from './componentes/extension/emem-work-shop/posters-emem/posters-emem.component';
import { CertificadosEmemComponent } from './componentes/extension/emem-work-shop/certificados-emem/certificados-emem.component';
import { CursilloEmemComponent } from './componentes/extension/emem-work-shop/cursillo-emem/cursillo-emem.component';
import { ConfirmacionComponent } from './componentes/dialogos/confirmacion/confirmacion.component';
import { ResumenesComponent } from './componentes/extension/emem-work-shop/resumenes/resumenes.component';
import { CrearResumenComponent } from './componentes/extension/emem-work-shop/crear-resumen/crear-resumen.component';
import { UnValorComponent } from './componentes/dialogos/un-valor/un-valor.component';
import { VerResumenComponent } from './componentes/extension/emem-work-shop/ver-resumen/ver-resumen.component';
import { ResumenesEmemComponent } from './componentes/administrador/resumenes-emem/resumenes-emem.component';
import { MenuWorkshopEmemComponent } from './componentes/administrador/menu-workshop-emem/menu-workshop-emem.component';
import { ParticpantesEmemComponent } from './componentes/administrador/menu-workshop-emem/particpantes-emem/particpantes-emem.component';
import { EsperaComponent } from './componentes/dialogos/espera/espera.component';
import { MostrarParticipanteComponent } from './componentes/dialogos/mostrar-participante/mostrar-participante.component';
import { PruebasComponent } from './componentes/administrador/pruebas/pruebas.component';
import { EvaluarResumenEmemComponent } from './componentes/dialogos/evaluar-resumen-emem/evaluar-resumen-emem.component';
import { SnackBarComponent } from './componentes/dialogos/snack-bar/snack-bar.component';
import { ReducirTextoPipe } from './pipes/reducir-texto.pipe';
import { ListaPostersComponent } from './componentes/administrador/menu-workshop-emem/lista-posters/lista-posters.component';
import { ManualDesarrolloComponent } from './componentes/manual-desarrollo/manual-desarrollo.component';

@NgModule({
  declarations: [
    AppComponent,
    BarraInicioComponent,
    PiePaginaComponent,
    BannerComponent,
    InicioComponent,
    AdministradorComponent,
    AdminInicioComponent,
    AdminUsuarioComponent,
    AdminEditarusuarioComponent,
    MenuPrincipalComponent,
    MensajeComponent,
    CapitalizadoPipe,
    InvestigacionComponent,
    ExtensionComponent,
    DocentesComponent,
    EstudiantesComponent,
    EvaluacionComponent,
    EmemWorkShopComponent,
    PaginaInicioComponent,
    InscripcionesEmemComponent,
    CronogramaEmemComponent,
    CursillosEmemComponent,
    PostersEmemComponent,
    CertificadosEmemComponent,
    CursilloEmemComponent,
    ConfirmacionComponent,
    ResumenesComponent,
    CrearResumenComponent,
    UnValorComponent,
    VerResumenComponent,
    ResumenesEmemComponent,
    MenuWorkshopEmemComponent,
    ParticpantesEmemComponent,
    EsperaComponent,
    MostrarParticipanteComponent,
    PruebasComponent,
    EvaluarResumenEmemComponent,
    SnackBarComponent,
    ReducirTextoPipe,
    ListaPostersComponent,
    ManualDesarrolloComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    routingModule,
    HttpClientModule,
    FormsModule,
    MatDialogModule,
    MatSnackBarModule
  ],
  providers: [],
  entryComponents: [
    MensajeComponent,
    ConfirmacionComponent,
    UnValorComponent,
    EsperaComponent,
    MostrarParticipanteComponent,
    EvaluarResumenEmemComponent,
    SnackBarComponent
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
