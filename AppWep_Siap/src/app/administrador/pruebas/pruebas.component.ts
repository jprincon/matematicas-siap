import { GeneralService } from './../../services/general.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-pruebas',
  templateUrl: './pruebas.component.html',
  styles: []
})
export class PruebasComponent implements OnInit {

  asunto = '';
  correo = '';
  mensaje = '';

  constructor(private servicioGeneral: GeneralService) { }

  ngOnInit() {
  }

  enviarCorreo() {
    const datos = JSON.stringify({
      asunto: this.asunto,
      correo: this.correo,
      mensaje: this.mensaje
    });

    this.servicioGeneral.postEnviarCorreo(datos).subscribe((rRespuesta: any) => {

    });
  }

}
