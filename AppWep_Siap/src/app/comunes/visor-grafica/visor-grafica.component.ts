import { Component, Input, OnChanges, OnInit, SimpleChange } from '@angular/core';
import { AngularEditorConfig } from '@kolkov/angular-editor';
import { ChartOptions, ChartType, ChartDataSets } from 'chart.js';
import { Label } from 'ng2-charts';
import { Utilidades } from '../../utilidades/utilidades.class';

@Component({
  selector: 'app-visor-grafica',
  templateUrl: './visor-grafica.component.html',
  styles: []
})
export class VisorGraficaComponent implements OnInit {

  @Input() Titulo = '';

  public opciones: ChartOptions = {
    responsive: true,
    scales: { xAxes: [{}], yAxes: [{}] },
    plugins: {
      datalabels: {
        anchor: 'end',
        align: 'end',
      }
    }
  };
  public tipo: ChartType = 'bar';
  public leyendas = true;
  public tiposGrafica: string[] = ['line', 'bar', 'pie', 'doughnut', 'radar', 'polar'];

  @Input() public Etiquetas: Label[] = ['2006', '2007', '2008', '2009', '2010', '2011', '2012'];
  @Input() public Datos: ChartDataSets[] = [
    { data: [65, 59, 80, 81, 56, 55, 40], label: 'Series A' }
  ];
  public Colores = [
    {
      backgroundColor: ['rgba(255,0,0,0.3)', 'rgba(0,255,0,0.3)', 'rgba(0,0,255,0.3)'],
    },
  ];

  constructor() { }

  ngOnInit() {

    this.Colores[0].backgroundColor = [];
    const colores: string[] = [];

    for (let i=1; i < 200; i++) {
      colores.push(new Utilidades().generarColor());
    }

    this.Colores[0].backgroundColor = colores;
  }

  cambiarTipoGrafica() {
    if ((this.tipo === 'line') || (this.tipo === 'bar')) {
      this.opciones = {
        responsive: true,
        scales: { xAxes: [{}], yAxes: [{}] },
        plugins: {
          datalabels: {
            anchor: 'end',
            align: 'end',
          }
        }
      };
    } else {
      this.opciones = {
        responsive: true,
        legend: {
          position: 'top',
        },
        plugins: {
          datalabels: {
            formatter: (value, ctx) => {
              const label = ctx.chart.data.labels[ctx.dataIndex];
              return label;
            },
          },
        }
      };
    }
  }

}
