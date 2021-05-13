import { Component, OnInit } from '@angular/core';
import { GeneralService } from '../../services/general.service';
import { Tema } from '../../interfaces/interfaces.interfaces';

@Component({
  selector: 'app-manual-desarrollo',
  templateUrl: './manual-desarrollo.component.html',
  styles: []
})
export class ManualDesarrolloComponent implements OnInit {

  Temas: Tema[] = [];

  constructor(private genService: GeneralService) { }

  ngOnInit() {
    this.genService.getManualAyuda().subscribe((rManual: any) => {
      console.log(rManual);
      this.Temas = rManual.Temas;
    });
  }

}
