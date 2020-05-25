import { Component, OnInit } from '@angular/core';
import { Usuario } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';
import { DialogosService } from '../../../../services/dialogos.service';

@Component({
  selector: 'app-particpantes-emem',
  templateUrl: './particpantes-emem.component.html',
  styles: []
})
export class ParticpantesEmemComponent implements OnInit {

  participantes: Usuario[] = [];

  constructor(private servicio: GeneralService,
              private dialog: DialogosService) { }

  ngOnInit() {
    this.obtenerParcipantes();
  }

  obtenerParcipantes() {
    this.servicio.getParticipantes().subscribe((rParticipantes: any) => {
      console.log(rParticipantes);
      this.participantes = rParticipantes.participantes;
    });
  }

  ver(participante: Usuario) {
    this.dialog.mostrarDatosParticipante(participante).subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
    });
  }

  editar(participante: Usuario) {

  }

  eliminar(participante: Usuario) {

  }

  descargarLista() {
    alert('descargando lista');
  }

}
