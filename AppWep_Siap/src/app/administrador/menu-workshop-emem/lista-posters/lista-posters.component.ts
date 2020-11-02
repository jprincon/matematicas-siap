import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { Poster } from '../../../interfaces/interfaces.interfaces';

@Component({
  selector: 'app-lista-posters',
  templateUrl: './lista-posters.component.html',
  styles: []
})
export class ListaPostersComponent implements OnInit {

  posters: Poster[] = [];

  constructor(private generalService: GeneralService) { }

  ngOnInit() {
    this.obtenerListaPosters();
  }

  obtenerListaPosters() {
    this.generalService.getObtenerListaPosters().subscribe((rListaPosters: any) => {

      this.posters = rListaPosters.Poster;
    });
  }

}
