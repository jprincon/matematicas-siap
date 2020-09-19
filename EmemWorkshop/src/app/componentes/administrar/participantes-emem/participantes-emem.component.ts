import { Component, OnInit } from '@angular/core';
import { ParticipanteEmem } from 'src/app/Interfaces/interfaces.interface';
import { ServiciosService } from '../../../Servicios/servicios.service';
import { DialogService } from '../../../Servicios/dialog.service';

@Component({
  selector: 'app-participantes-emem',
  templateUrl: './participantes-emem.component.html',
  styles: []
})
export class ParticipantesEmemComponent implements OnInit {

  ParticipantesEmem: ParticipanteEmem[] = [];
  leyendo = false;
  contIntentos = 1;

  constructor(private genService: ServiciosService,
              private dlgService: DialogService) { }

  ngOnInit() {
    this.leerParticipantesEmem();
  }

  leerParticipantesEmem() {

    this.leyendo = true;

    this.genService.getParticipantesEmem().subscribe((rParticipantesEmem: any) => {
      this.ParticipantesEmem = rParticipantesEmem.ParticipantesEmem;
      console.log(rParticipantesEmem);
      this.leyendo = false;
    });
  }

  agregarParticipanteEmem() {
    this.dlgService.DlgParticipanteEmem('Crear', '').subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.leerParticipantesEmem();
    });
  }

  editarParticipanteEmem(participanteemem: ParticipanteEmem) {
    this.dlgService.DlgParticipanteEmem('Editar', participanteemem.idparticipante).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerParticipantesEmem();
    });
  }

  eliminarParticipanteEmem(participanteemem: ParticipanteEmem) {
    this.dlgService.confirmacion('¿Está seguro de eliminar este ParticipanteEmem?').subscribe((rConfirmacion: any) => {
      if (rConfirmacion) {
        this.genService.deleteParticipanteEmem(participanteemem.idparticipante).subscribe((rRespuesta: any) => {
          console.log(rRespuesta);
          this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
          this.leerParticipantesEmem();
        });
      }
    });
  }

}
