import { GeneralService } from './../services/general.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-factores',
  templateUrl: './factores.component.html',
  styles: []
})
export class FactoresComponent implements OnInit {

  constructor(private genService: GeneralService) { }

  ngOnInit() {
  }

  abrirMenu(menu: string) {
    this.genService.navegar([menu]);
  }

}
