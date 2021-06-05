import { Component, Input, OnChanges, OnInit, SimpleChange } from '@angular/core';
import { AngularEditorConfig } from '@kolkov/angular-editor';

@Component({
  selector: 'app-editor-html',
  templateUrl: './editor-html.component.html',
  styles: []
})
export class EditorHtmlComponent implements OnInit, OnChanges {

  @Input() Contenido = '';


  constructor() { }

  ngOnInit() {
  }

  ngOnChanges(changes: { [property: string]: SimpleChange }) {

  }

}
