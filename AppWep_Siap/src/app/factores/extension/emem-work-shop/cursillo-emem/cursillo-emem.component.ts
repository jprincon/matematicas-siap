import { Component, OnInit } from '@angular/core';
import { Cursillo, Resumen, AutorResumen, Estadisticas, Inscripcion } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';
import { ActivatedRoute, Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { TransferService } from '../../../../services/transfer.service';
import { DialogosService } from '../../../../services/dialogos.service';

@Component({
  selector: 'app-cursillo-emem',
  templateUrl: './cursillo-emem.component.html',
  styles: []
})
export class CursilloEmemComponent implements OnInit {

  taller: Resumen = {};
  autores: AutorResumen[] = [];
  cedula = '';
  inscribirseTalleres = '';
  estadisticas: Estadisticas = {
    cupo: 0,
    inscritos: 0,
    capacidad: 0
  };

  constructor(private generalService: GeneralService,
              private activatedRoute: ActivatedRoute,
              private transfer: TransferService,
              private dialogos: DialogosService,
              private router: Router,
              public dialog: MatDialog) { }

  ngOnInit() {
    this.transfer.enviarTituloEmem('Talleres');

    this.obtenerCedula();
    this.permiteInscribirseTalleres();
  }

  obtenerCedula() {
    this.cedula = localStorage.getItem('cedula');

    this.getParametro();
  }

  getParametro() {
    this.activatedRoute.params.subscribe((rParametro: any) => {
      this.getResumen(rParametro.id);
    });
  }

  permiteInscribirseTalleres(){
    this.generalService.getPermiteInscribirseTalleres().subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.inscribirseTalleres = rRespuesta.permite;
    });
  }

  getResumen(id: string) {
    this.generalService.getResumen(id).subscribe((rResumen: any) => {
      console.log(rResumen);
      this.taller = rResumen;

      this.getAutoresResumen();
    });
  }

  getAutoresResumen() {
    this.generalService.getAutores(this.taller.idResumen).subscribe((rAutores: any) => {
      console.log(rAutores);
      this.autores = rAutores.autores;

      this.getEstadisticas();
    });
  }

  getEstadisticas() {
    this.generalService.getEstadisticas(this.taller.idResumen).subscribe((rEstadisticas: any) => {
      console.log(rEstadisticas);
      this.estadisticas = rEstadisticas;
    });
  }

  inscribirse() {
    if ((this.cedula === null) || (this.cedula === undefined)) {
      this.dialogos.mostrarConfirmacion('No ha iniciado sesión. ¿Desea iniciar sesión para inscribirse?').subscribe((rRespuesta: boolean) => {
        if (rRespuesta) {
            this.router.navigate(['emem-workshop', 'inscripciones']);
        }
      });
    } else {
      this.dialogos.mostrarConfirmacion('¿Esta seguro de inscribirse en este cursillo?').subscribe((rRespuesta: any) => {
        console.log(rRespuesta);

        if (rRespuesta) {
          const datos = JSON.stringify({
            idParticipante: this.cedula,
            idResumen: this.taller.idResumen
          });
          this.generalService.postInscribirseTaller(datos).subscribe((rTaller: any) => {
            console.log(rTaller);
            this.dialogos.mostrarMensaje(rTaller.respuesta, 'info');
            this.router.navigate(['emem-workshop', 'cursillos']);
          });
        }
      });
    }
  }

}
