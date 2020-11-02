import { GeneralService } from './../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DialogosService } from '../../services/dialogos.service';

@Component({
  selector: 'app-menu-workshop-emem',
  templateUrl: './menu-workshop-emem.component.html',
  styles: []
})
export class MenuWorkshopEmemComponent implements OnInit {



  constructor(private router: Router,
              private servicio: GeneralService,
              private dialogos: DialogosService) { }

  ngOnInit() {

  }

  verMenu(menu: string) {
      this.router.navigate(['administrador', menu]);
  }

  descargarListas() {
    this.servicio.getObtenerListaTalleres().subscribe((rListas: any) => {

      this.dialogos.mostrarConfirmacion('La lista se exportó correctamente. ¿Desea verla?').subscribe((rRespuesta: boolean) => {
        if (rRespuesta) {
          // window.open(rListas.rutaCsv, '_blank');
          window.open(rListas.rutaPdf, '_blank');
        }
      });
    });
  }

  descargarCertificadosUnificados() {
    this.servicio.getDescargarCertificadosUnificados('2019').subscribe((rRespuesta: any) => {

    });
  }


}
