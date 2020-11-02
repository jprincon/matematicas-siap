import { Component, OnInit } from '@angular/core';
import { Cursillo, Resumen, Inscripcion } from '../../../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../../../services/general.service';
import { Router } from '@angular/router';
import { TransferService } from '../../../../services/transfer.service';
import { DialogosService } from '../../../../services/dialogos.service';

@Component({
  selector: 'app-cursillos-emem',
  templateUrl: './cursillos-emem.component.html',
  styles: []
})
export class CursillosEmemComponent implements OnInit {

  cursillos: Resumen[] = [];
  cedula = '';

  inscripcion: Inscripcion = {
    inscrito: '',
    respuesta: ''
  };

  inscribirseTalleres = '';

  constructor(private generalService: GeneralService,
              private router: Router,
              private dialogos: DialogosService,
              private transfer: TransferService) { }

  ngOnInit() {
    this.getCursillos();
    this.transfer.enviarTituloEmem('Talleres');

    this.obtenerCedula();
    this.permiteInscribirseTalleres();
  }

  getCursillos() {
    this.generalService.getResumenPorTipo('Taller').subscribe((rResumenes: any) => {

      this.cursillos = rResumenes.resumenes;
    });
  }

  verCursillo(cursillo: Resumen) {
    this.router.navigate(['emem-workshop', 'cursillo', cursillo.idResumen]);
  }

  permiteInscribirseTalleres(){
    this.generalService.getPermiteInscribirseTalleres().subscribe((rRespuesta: any) => {

      this.inscribirseTalleres = rRespuesta.permite;
    });
  }

  obtenerInscripcion() {
    this.generalService.getObtenerTallerParticipante(this.cedula).subscribe((rInscripcion: any) => {

      this.inscripcion = rInscripcion;
    });
  }

  obtenerCedula() {
    this.cedula = localStorage.getItem('cedula');

    this.obtenerInscripcion();
  }

  cancelarInscripcion() {
    this.generalService.deleteSalirDelTaller(this.cedula).subscribe((rInscripcion: any) => {
      this.dialogos.mostrarMensaje(rInscripcion.respuesta, 'info');

      this.obtenerInscripcion();
    });
  }

}
