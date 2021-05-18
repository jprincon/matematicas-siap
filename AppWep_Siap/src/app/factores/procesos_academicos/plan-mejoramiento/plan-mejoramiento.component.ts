import { Component, OnInit } from '@angular/core';
import { TransferService } from '../../../services/transfer.service';
import { GeneralService } from '../../../services/general.service';
import { RUTA_CREAR_EDITAR_PLAN_MEJORAMIENTO } from '../../../config/config';
import { PlanMejoramiento } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';

@Component({
  selector: 'app-plan-mejoramiento',
  templateUrl: './plan-mejoramiento.component.html',
  styles: []
})
export class PlanMejoramientoComponent implements OnInit {

  PlanesMejoramiento: PlanMejoramiento[] = [];

  constructor(private transfer: TransferService,
              private genService: GeneralService,
              private dlgService: DialogosService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Plan de Mejoramiento');

    this.obtenerPlanesMejoramiento();
  }

  obtenerPlanesMejoramiento() {
    this.genService.getPlanesMejoramiento().subscribe((rPlanes: any) => {
      console.log(rPlanes);
      this.PlanesMejoramiento = rPlanes.Planes;
    });
  }

  agregarPlanMejoramiento() {
    this.genService.navegar([RUTA_CREAR_EDITAR_PLAN_MEJORAMIENTO, 'crear']);
  }

  verPlan(plan: PlanMejoramiento) {
    this.dlgService.mostrarPlanMejoramiento(plan);
  }

  editarPlan(plan: PlanMejoramiento) {
    this.genService.navegar([RUTA_CREAR_EDITAR_PLAN_MEJORAMIENTO, plan.idplan]);
  }

  eliminarPlan(plan: PlanMejoramiento) {
    this.dlgService.confirmacion('¿Está seguro de eliminar éste plan de mejoramiento?').subscribe((rEliminar: boolean) => {
      if (rEliminar) {
        this.genService.deletePlanMejoramiento(plan.idplan).subscribe((rResp: any) => {
          this.dlgService.mostrarSnackBar('SIAP dice ...', rResp.Respuesta);
          this.obtenerPlanesMejoramiento();
        });
      }
    });
  }

}
