import { GeneralService } from './../../../services/general.service';
import { Component, OnInit } from '@angular/core';
import { TransferService } from '../../../services/transfer.service';
import { TipoContrato, Docente, AgendaServicio, ServicioPrograma, Periodo } from '../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../services/dialogos.service';
import { Utilidades } from '../../../utilidades/utilidades.class';

@Component({
  selector: 'app-agendas',
  templateUrl: './agendas.component.html',
  styles: []
})
export class AgendasComponent implements OnInit {

  contratos: TipoContrato[] = [];
  tipoContrato = '';
  buscarNombre = '';
  bDocentes: Docente[] = [];
  Docentes: Docente[] = [];
  Periodos: Periodo[] = [];

  AgendasServicio: AgendaServicio[] = [];
  leyendo = false;
  soloCatedraticos = false;

  docenteSeleccionado: Docente = {};

  periodo = '';
  termino = '';

  docenciaDirecta = 0;
  horasRestantes = 0;
  horasTotales = 0;

  posDoc = 0;

  constructor(private transfer: TransferService,
              private genService: GeneralService,
              private dlgService: DialogosService) { }

  ngOnInit() {
    const fecha = new Date();
    this.periodo = fecha.getFullYear().toString();
    if (fecha.getMonth() < 6) {
      this.periodo += '1';
    } else {
      this.periodo += '2';
    }

    // temporal
    this.periodo = '20201';

    this.transfer.enviarTituloAplicacion('Agendas');

    this.leerContratos();
    this.leerPeriodos();
  }

  leerPeriodos() {
    this.genService.getPeriodos().subscribe((rPeriodos: any) => {

      this.Periodos = rPeriodos.Periodos;
    });
  }

  eliminarAgendaServicio(agenda: AgendaServicio) {
    this.genService.deleteAgendaServicio(agenda.idagendaservicio).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta.Respuesta || rRespuesta.Error);
      this.leerAgendasServicio();
    });
  }

  leerAgendasServicio() {

    this.genService.getAgendasServicio(this.docenteSeleccionado.iddocente, this.periodo).subscribe((rAgendasServicio: any) => {
      this.AgendasServicio = rAgendasServicio.AgendasServicios;

      this.leyendo = false;

      this.docenciaDirecta = rAgendasServicio.docenciaDirecta;
      this.horasRestantes = rAgendasServicio.horasRestantes;
      this.horasTotales = rAgendasServicio.horasTotales;
    });
  }

  agregarServicio() {
    this.dlgService.DlgAgendaServicio(this.docenteSeleccionado.iddocente, this.periodo).subscribe((rRespuesta: ServicioPrograma) => {

      if (rRespuesta !== undefined) {
        // %%%%%%% Guardar el Servicio %%%%%%%
        const agendaServicio: AgendaServicio = {
          idagendaservicio: new Utilidades().generarId(),
          idservicioprograma: rRespuesta.idservicioprograma,
          iddocente: this.docenteSeleccionado.iddocente,
          periodo: this.periodo
        };

        const datos = JSON.stringify(agendaServicio);

        this.genService.postAgendaServicio(datos).subscribe((rRespuesta2: any) => {


          this.leerAgendasServicio();
        });
      } else {
        this.leerAgendasServicio();
      }
    });
  }

  leerContratos() {
    this.leyendo = true;

    this.genService.getTiposContrato().subscribe((rContratos: any) => {
      this.contratos = rContratos.TiposContratos;
      this.tipoContrato = this.contratos[0].idtipocontrato;
      this.leerDocentes();
    });
  }

  leerDocentes() {
    this.genService.getDocentesPorContrato(this.tipoContrato).subscribe((rDocentes: any) => {
      this.Docentes = rDocentes.Docentes;
      this.docenteSeleccionado = this.Docentes[this.posDoc];
      this.bDocentes = this.Docentes;
      this.leerAgendasServicio();
    });
  }

  agregarFuncion() {
    this.dlgService.DlgFuncionesDocente('Crear', this.docenteSeleccionado.iddocente, '', this.periodo).subscribe((rRespuesta: any) => {

    });
  }

  seleccionarDocente(docente: Docente) {
    this.soloCatedraticos = (this.tipoContrato === 'catedrático');

    this.docenteSeleccionado = docente;

    this.leerAgendasServicio();
  }

  buscarDocente() {
    this.bDocentes = [];
    for (const docente of this.Docentes) {
      if (docente.nombre.toLowerCase().indexOf(this.termino.toLowerCase()) >= 0) {
        this.bDocentes.push(docente);
      }
    }
  }

  editarDocente(docente: Docente) {
    this.posDoc = this.Docentes.indexOf(this.docenteSeleccionado);
    this.dlgService.DlgDocente('Editar', docente.iddocente).subscribe((rRespuesta: any) => {
      this.dlgService.mostrarSnackBar('Información', rRespuesta);
      this.leerDocentes();
    });
  }

}
