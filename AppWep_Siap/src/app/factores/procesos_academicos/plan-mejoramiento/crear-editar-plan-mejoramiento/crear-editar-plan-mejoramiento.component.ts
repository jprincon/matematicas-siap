import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PlanMejoramiento } from 'src/app/interfaces/interfaces.interfaces';
import { TransferService } from '../../../../services/transfer.service';
import { FactorCalidad, Requisito, TipoAccion, Fuente } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';
import { access } from 'fs';
import { RUTA_PLAN_MEJORAMIENTO } from '../../../../config/config';
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
    estado_actual_accion: ''
  };

  FactoresCalidad: FactorCalidad[] = [];
  Requisitos: Requisito[] = [];
  TiposAccion: TipoAccion[] = [];
  Fuentes: Fuente[] = [];

  Accion = 'Crear';

  constructor(private activatedRoute: ActivatedRoute,
              private transfer: TransferService,
              private dlgService: DialogosService,
              private genService: GeneralService) { }

  ngOnInit() {
    this.obtenerParametros();

    this.obtenerFactoresCalidad();
    this.obtenerRequisitos();
    this.obtenerTiposAccion();
    this.obtenerFuentes();
  }

  obtenerParametros() {
    this.activatedRoute.params.subscribe((rParams: any) => {
      console.log(rParams);

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

  obtenerFactoresCalidad() {
    this.genService.getFactoresCalidad().subscribe((rFactores: any) => {
      console.log(rFactores);
      this.FactoresCalidad = rFactores.Factores;
    });
  }

  obtenerRequisitos() {
    this.genService.getRequisitos().subscribe((rRequisitos: any) => {
      console.log(rRequisitos);
      this.Requisitos = rRequisitos.Requisitos;
    });
  }

  obtenerTiposAccion() {
    this.genService.getTiposAccion().subscribe((rTiposAccion: any) => {
      console.log(rTiposAccion);
      this.TiposAccion = rTiposAccion.TiposAccion;
    });
  }

  obtenerFuentes() {
    this.genService.getFuentes().subscribe((rFuentes: any) => {
      console.log(rFuentes);
      this.Fuentes = rFuentes.Fuentes;
    });
  }

  guardar() {
    const datos = JSON.stringify(this.planMejoramiento);

    if (this.Accion === 'Crear') {
      this.genService.postPlanMejoramiento(datos).subscribe((rResp: any) => {
        console.log(rResp);
        this.dlgService.mostrarSnackBar('SIAP dice ...', rResp.Respuesta);
        this.genService.navegar([RUTA_PLAN_MEJORAMIENTO]);
      });
    } else {
      this.genService.putPlanMejoramiento(datos).subscribe((rResp: any) => {
        this.dlgService.mostrarSnackBar('SIAP dice ...', rResp.Respuesta);
        this.genService.navegar([RUTA_PLAN_MEJORAMIENTO]);
      });
    }
  }

}
