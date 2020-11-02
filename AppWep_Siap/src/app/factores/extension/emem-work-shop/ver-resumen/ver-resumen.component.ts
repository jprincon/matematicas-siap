import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { GeneralService } from '../../../../services/general.service';
import { Resumen, PalabraClave, AutorResumen, BibliografiaResumen } from '../../../../interfaces/interfaces.interfaces';

@Component({
  selector: 'app-ver-resumen',
  templateUrl: './ver-resumen.component.html',
  styles: []
})
export class VerResumenComponent implements OnInit {

  idResumen = '';
  resumen: Resumen = {};
  palabrasClave: PalabraClave[] = [];
  autores: AutorResumen[] = [];
  referencias: BibliografiaResumen[] = [];

  constructor(private activatedRoute: ActivatedRoute,
              private servicio: GeneralService) { }

  ngOnInit() {
    this.obtenerResumen();
  }

  obtenerResumen() {
    this.activatedRoute.params.subscribe((rParam: any) => {

      this.idResumen = rParam.id;

      this.servicio.getResumen(this.idResumen).subscribe((rResumen: Resumen) => {

        this.resumen = rResumen;

        this.servicio.getPalabrasClaveResumen(this.idResumen).subscribe((rPalabras: any) => {

          this.palabrasClave = rPalabras.palabrasClave;

          this.servicio.getAutores(this.idResumen).subscribe((rAutores: any) => {

            this.autores = rAutores.autores;

            this.servicio.getReferencias(this.idResumen).subscribe((rReferencias: any) => {

              this.referencias = rReferencias.referencias;
            });
          });
        });
      });
    });
  }

}
