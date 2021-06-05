import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-titulo-dialogo',
  templateUrl: './titulo-dialogo.component.html',
  styles: []
})
export class TituloDialogoComponent implements OnInit {

  @Input() Titulo = '';
  @Input() Descripcion = '';

  constructor() { }

  ngOnInit() {
  }

}
