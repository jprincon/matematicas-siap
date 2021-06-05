import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PlanMejoramiento } from 'src/app/interfaces/interfaces.interfaces';
import { TransferService } from '../../../../services/transfer.service';
import { FactorCalidad, Requisito, TipoAccion, Fuente } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';
import { RUTA_PLAN_MEJORAMIENTO, RUTA_INICIO } from '../../../../config/config';
import { DialogosService } from '../../../../services/dialogos.service';

@Component({
  selector: 'app-crear-editar-plan-mejoramiento',
  templateUrl: './crear-editar-plan-mejoramiento.component.html',
  styles: []
})
export class CrearEditarPlanMejoramientoComponent implements OnInit {

  planMejoramiento: PlanMejoramiento = {
    orden: 0,
    descripcion_mejora: '',
    causas_principales: '',
    metas: '',
    actividades: '',
    responsable_ejecucion: '',
    responsable_seguimiento: '',
    indicador_meta: '',
    formula_indicador: '',
    resultado_indicador: '',
    avance_meta: '',
    seguimiento: '',
    observaciones: '',
    estado_actual_accion: '',
    fecha_inicio: '1900-01-01',
    fecha_fin: '1900-01-01'
  };

  FactoresCalidad: FactorCalidad[] = [];
  Requisitos: Requisito[] = [];
  TiposAccion: TipoAccion[] = [];
  Fuentes: Fuente[] = [];

  Accion = 'Crear';

  constructor(private activatedRoute: ActivatedRoute,
              private transfer: TransferService,
              private dlgService: DialogosService,
              public genService: GeneralService) { }

  ngOnInit() {
    this.obtenerParametros();

    this.obtenerFactoresCalidad();
    this.obtenerRequisitos();
    this.obtenerTiposAccion();
    this.obtenerFuentes();
  }

  obtenerParametros() {
    this.activatedRoute.params.subscribe((rParams: any) => {

      if (rParams.Id === 'crear') {
        this.transfer.enviarTituloAplicacion('Creando plan de mejoramiento ...');
        this.Accion = 'Crear';
      } else {
        this.transfer.enviarTituloAplicacion('Editando plan de mejoramiento ...');
        this.genService.getPlanMejoramiento(rParams.Id).subscribe((rPlan: PlanMejoramiento) => {

          this.planMejoramiento = rPlan;
          this.Accion = 'Editar';
        });
      }
    });
  }

  mostrar(e: any) {

  }

  obtenerFactoresCalidad() {
    this.genService.getFactoresCalidad().subscribe((rFactores: any) => {

      this.FactoresCalidad = rFactores.Factores;
    });
  }

  obtenerRequisitos() {
    this.genService.getRequisitos().subscribe((rRequisitos: any) => {

      this.Requisitos = rRequisitos.Requisitos;
    });
  }

  obtenerTiposAccion() {
    this.genService.getTiposAccion().subscribe((rTiposAccion: any) => {

      this.TiposAccion = rTiposAccion.TiposAccion;
    });
  }

  obtenerFuentes() {
    this.genService.getFuentes().subscribe((rFuentes: any) => {

      this.Fuentes = rFuentes.Fuentes;
    });
  }

  guardar() {
    const datos = JSON.stringify(this.planMejoramiento);

    if (this.Accion === 'Crear') {
      this.genService.postPlanMejoramiento(datos).subscribe((rResp: any) => {

        this.dlgService.mostrarSnackBar(rResp.Respuesta);
        this.genService.navegar([RUTA_PLAN_MEJORAMIENTO]);
      });
    } else {
      this.genService.putPlanMejoramiento(datos).subscribe((rResp: any) => {

        this.dlgService.mostrarSnackBar(rResp.Respuesta);
        this.genService.navegar([RUTA_PLAN_MEJORAMIENTO, RUTA_INICIO]);
      });
    }
  }

}
