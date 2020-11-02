import { Component, OnInit } from '@angular/core';
import { ServiciosService } from '../../Servicios/servicios.service';

@Component({
  selector: 'app-contacto',
  templateUrl: './contacto.component.html',
  styles: []
})
export class ContactoComponent implements OnInit {

  constructor(private genService: ServiciosService) { }

  Contactos: any[] = [];

  ngOnInit() {
    this.obtenerContacto();
  }

  obtenerContacto() {
    this.genService.getContacto().subscribe((rContacto: any) => {
      console.log(rContacto);
      this.Contactos = rContacto;
    });
  }

}
