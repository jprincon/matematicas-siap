import { Component, OnInit } from '@angular/core';
import { ServiciosService } from '../../Servicios/servicios.service';

@Component({
  selector: 'app-ponencias',
  templateUrl: './ponencias.component.html',
  styles: []
})
export class PonenciasComponent implements OnInit {

  Conferencias: any[] = [];
  TiposPonencias: any[] = [];
  Contacto: any[] = [];

  constructor(private genService: ServiciosService) { }

  ngOnInit() {
    this.obtenerConferencias();
    this.obtenerPonencias();
    this.obtenerContacto();
  }

  obtenerConferencias() {
    this.genService.getConferencias().subscribe((rConferencias: any) => {
      console.log(rConferencias);
      this.Conferencias = rConferencias;
    });
  }

  obtenerPonencias() {
    this.genService.getPonencias().subscribe((rPonencias: any) => {
      console.log(rPonencias);
      this.TiposPonencias = rPonencias;
    });
  }

  obtenerContacto() {
    this.genService.getContacto().subscribe((rContacto: any) => {
      console.log(rContacto);
      this.Contacto = rContacto;
    });
  }

}
