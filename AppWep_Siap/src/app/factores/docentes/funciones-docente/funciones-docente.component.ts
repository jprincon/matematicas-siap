import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { DialogosService } from '../../../services/dialogos.service';
import { FuncionDocente, ActividadDocente, SubactividadDocente } from '../../../interfaces/interfaces.interfaces';
import { TransferService } from '../../../services/transfer.service';

@Component({
  selector: 'app-funciones-docente',
  templateUrl: './funciones-docente.component.html',
  styles: []
})
export class FuncionesDocenteComponent implements OnInit {

  FuncionesDocente: FuncionDocente[] = [];
  ActividadesDocente: ActividadDocente[] = [];
  SubactividadesDocente: SubactividadDocente[] = [];
  leyendo = false;
  contIntentos = 1;
  editar = true;

  IdFuncionDocente = '';
  IdActividadDocente = '';
  FuncionDocente = '';
  ActividadDocente = '';

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.leerFuncionesDocente();

    this.transfer.enviarTituloAplicacion('Estructura de Actividades de Docencia');
  }

  leerFuncionesDocente() {

    this.leyendo = true;

    this.genService.getFuncionesDocente().subscribe((rFuncionesDocente: any) => {
      this.FuncionesDocente = rFuncionesDocente.FuncionesDocentes;
      console.log(rFuncionesDocente);
      this.leyendo = false;

      this.leerActividadesDocente(this.FuncionesDocente[0].idfunciondocente);
    });
  }

  verActividadesFuncion(funcion: FuncionDocente) {
    this.IdFuncionDocente = funcion.idfunciondocente;
    this.genService.getActividadesDocente(funcion.idfunciondocente).subscribe((rActividades: any) => {
      console.log(rActividades);
      this.ActividadesDocente = rActividades.ActividadesDocentes;
    });
  }

  verSubActividades(actividad: ActividadDocente) {
    this.IdActividadDocente = actividad.idactividaddocente;

    this.leerSubactividadesDocente();
  }

  agregarFuncionDocente() {
    this.dlgService.DlgFuncionDocente('Crear', '').subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.leerFuncionesDocente();
    });
  }

  editarFuncionDocente(funciondocente: FuncionDocente) {
    this.dlgService.DlgFuncionDocente('Editar', funciondocente.idfunciondocente).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerFuncionesDocente();
    });
  }

  eliminarFuncionDocente(funciondocente: FuncionDocente) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este FuncionDocente?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteFuncionDocente(funciondocente.idfunciondocente).subscribe((rRespuesta: any) => {
          console.log(rRespuesta);
          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerFuncionesDocente();
        });
      }
    });
  }

  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     Actividades Docentes
  =========================================================================================================================*/

  leerActividadesDocente(IdFuncion: string) {

    this.leyendo = true;

    this.genService.getActividadesDocente(IdFuncion).subscribe((rActividadesDocente: any) => {
      this.ActividadesDocente = rActividadesDocente.ActividadesDocentes;
      console.log(rActividadesDocente);
      this.leyendo = false;
    });
  }

  agregarActividadDocente(funcionDocente: FuncionDocente) {
    this.dlgService.DlgActividadDocente('Crear', '', funcionDocente.idfunciondocente).subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.leerFuncionesDocente();
    });
  }

  editarActividadDocente(actividaddocente: ActividadDocente) {
    this.dlgService.DlgActividadDocente('Editar', actividaddocente.idactividaddocente, actividaddocente.idfunciondocente).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerActividadesDocente(this.IdFuncionDocente);
    });
  }

  eliminarActividadDocente(actividaddocente: ActividadDocente) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este ActividadDocente?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteActividadDocente(actividaddocente.idactividaddocente).subscribe((rRespuesta: any) => {
          console.log(rRespuesta);
          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerActividadesDocente(this.IdFuncionDocente);
        });
      }
    });
  }

  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     Subactivdades Docentes
  =========================================================================================================================*/

  leerSubactividadesDocente() {

    this.leyendo = true;

    this.genService.getSubactividadesDocente(this.IdActividadDocente).subscribe((rSubactividadesDocente: any) => {
      this.SubactividadesDocente = rSubactividadesDocente.SubactividadesDocentes;
      console.log(rSubactividadesDocente);
      this.leyendo = false;
    });
  }

  agregarSubactividadDocente() {
    this.dlgService.DlgSubactividadDocente('Crear', '', this.IdActividadDocente).subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.leerSubactividadesDocente();
    });
  }

  editarSubactividadDocente(subactividaddocente: SubactividadDocente) {
    this.dlgService.DlgSubactividadDocente('Editar', subactividaddocente.idsubactividaddocente, this.IdActividadDocente).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerSubactividadesDocente();
    });
  }

  eliminarSubactividadDocente(subactividaddocente: SubactividadDocente) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este SubactividadDocente?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteSubactividadDocente(subactividaddocente.idsubactividaddocente).subscribe((rRespuesta: any) => {
          console.log(rRespuesta);
          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerSubactividadesDocente();
        });
      }
    });
  }

}
