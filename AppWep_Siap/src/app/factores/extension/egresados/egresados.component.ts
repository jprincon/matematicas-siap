import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { DialogosService } from '../../../services/dialogos.service';
import { Egresado } from '../../../interfaces/interfaces.interfaces';
import { TransferService } from '../../../services/transfer.service';

@Component({
  selector: 'app-egresados',
  templateUrl: './egresados.component.html',
  styles: []
})
export class EgresadosComponent implements OnInit {

  Egresados: Egresado[] = [];
  leyendo = false;
  contIntentos = 1;

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.enviarTituloAplicacion('Egresados del Programa');
    this.leerEgresados();
  }

  leerEgresados() {

    this.leyendo = true;

    this.genService.getEgresados().subscribe((rEgresados: any) => {
      this.Egresados = rEgresados.Egresados;
      console.log(rEgresados);
      this.leyendo = false;
    });
  }

  agregarEgresado() {
    this.dlgService.DlgEgresado('Crear', '').subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.leerEgresados();
    });
  }

  editarEgresado(egresado: Egresado) {
    this.dlgService.DlgEgresado('Editar', egresado.idegresado).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerEgresados();
    });
  }

  eliminarEgresado(egresado: Egresado) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Egresado?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteEgresado(egresado.idegresado).subscribe((rRespuesta: any) => {
          console.log(rRespuesta);
          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerEgresados();
        });
      }
    });
  }

}
