import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { GeneralService } from '../../../services/general.service';
import { Resumen } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';

@Component({
  selector: 'app-resumenes-emem',
  templateUrl: './resumenes-emem.component.html',
  styles: []
})
export class ResumenesEmemComponent implements OnInit {

  resumenes: Resumen[] = [];
  rutaDescarga = '';

  constructor(private router: Router,
              private servicio: GeneralService,
              private dialogos: DialogosService) { }

  ngOnInit() {
    this.obtenerResumenes();
  }

  obtenerResumenes() {
    this.servicio.getResumenes().subscribe((rResumenes: any) => {
      console.log(rResumenes);
      this.resumenes = rResumenes.resumenes;
    });
  }

  descargar(resumen: Resumen) {
    this.servicio.descargarResumen(resumen.idResumen).subscribe((rRuta: any) => {
      console.log(rRuta);
      this.rutaDescarga = rRuta.ruta;
      this.dialogos.mostrarConfirmacion('El archivo se exporto correctamente').subscribe((rRespuesta: any) => {
        window.open(this.rutaDescarga, '_blank');
      });
    });
  }

  eliminar(resumen: Resumen) {
    this.dialogos.mostrarConfirmacion('¿Esta seguro de eliminar este resumen?').subscribe((rRespuesta: boolean) => {
      console.log(rRespuesta);
      if (rRespuesta) {
        this.servicio.deleteResumen(resumen.idResumen).subscribe((rResumen: any) => {
          this.dialogos.mostrarMensaje('El resumen se borro correctamente', 'info');
          this.obtenerResumenes();
        });
      }
    });
  }

  evaluarResumen(resumen: Resumen) {
    this.dialogos.evaluarResumenEmem(resumen).subscribe((rRespuesta: any) => {
      console.log(rRespuesta);
      this.dialogos.openSnackBar(rRespuesta.respuesta);
    });
  }

}
