import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { Programa } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';
import { TransferService } from '../../../services/transfer.service';

@Component({
  selector: 'app-programas',
  templateUrl: './programas.component.html',
  styles: []
})
export class ProgramasComponent implements OnInit {

  Programas: Programa[] = [];
  leyendo = false;
  contIntentos = 1;

  constructor(private genService: GeneralService,
              private dlgService: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.leerProgramas();
    this.transfer.enviarTituloAplicacion('Programas a los que se presta servicios');
  }

  leerProgramas() {

    this.leyendo = true;

    this.genService.getProgramas().subscribe((rProgramas: any) => {
      this.Programas = rProgramas.Programas;

      this.leyendo = false;
    });
  }

  agregarPrograma() {
    this.dlgService.DlgPrograma('Crear', '').subscribe((rRespuesta: any) => {

      this.leerProgramas();
    });
  }

  editarPrograma(programa: Programa) {
    this.dlgService.DlgPrograma('Editar', programa.idprograma).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerProgramas();
    });
  }

  eliminarPrograma(programa: Programa) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este Programa?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.borrarPrograma(programa.idprograma);
      }
    });
  }

  borrarPrograma(id: string) {
    this.genService.deletePrograma(id).subscribe((rRespuesta: any) => {

      this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
      this.leerProgramas();
    });
  }

}
