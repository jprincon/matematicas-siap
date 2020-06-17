import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-extension',
  templateUrl: './extension.component.html',
  styles: []
})
export class ExtensionComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit() {

  }

  irProyecto(ruta: string) {
    this.router.navigate([ruta]);
  }

}
