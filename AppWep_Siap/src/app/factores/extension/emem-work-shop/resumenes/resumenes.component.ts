import { Component, OnInit } from '@angular/core';
import { GeneralService } from '../../../../services/general.service';
import { Resumen, AutorResumen, Usuario } from '../../../../interfaces/interfaces.interfaces';
import { DialogosService } from '../../../../services/dialogos.service';
import { Router } from '@angular/router';
import { TransferService } from '../../../../services/transfer.service';

@Component({
  selector: 'app-resumenes',
  templateUrl: './resumenes.component.html',
  styles: []
})
export class ResumenesComponent implements OnInit {

  resumenes: Resumen[] = [];
  permite = '';
  rutaDescarga = '';

  usuario: Usuario = {
    nombre: '',
    contra: '',
    cedula: '',
    correo: '',
    tipoParticipacion: ''
  };

  puedeCrearResumen = false;

  cantidadResumenes = 0;

  constructor(private servicio: GeneralService,
              private router: Router,
              private transfer: TransferService,
              private dialogo: DialogosService) { }

  ngOnInit() {
    this.transfer.enviarTituloEmem('Resumenes');

    const cedula = localStorage.getItem('cedula');
    this.servicio.getParticipante(cedula).subscribe((rUsuario: Usuario) => {

      this.usuario = rUsuario;
      this.puedeCrearResumen = (this.usuario.tipoParticipacion === 'Tallerista') || (this.usuario.tipoParticipacion === 'Ponente-Poster');
    });

    this.obtenerResumenes();

    this.permiteCrearResumenes();
  }

  permiteCrearResumenes() {
    this.servicio.getPermiteCrearResumenes().subscribe((rPermite: any) => {

      this.permite = rPermite.permite;
    });
  }

  obtenerResumenes() {
    const cedula = localStorage.getItem('cedula');
    this.servicio.getResumenesAutor(cedula).subscribe((rResumenes: any) => {

      this.resumenes = rResumenes.resumenes;
      this.cantidadResumenes = this.resumenes.length;
    });
  }

  crearResumen() {
    const cedula = localStorage.getItem('cedula');
    const resumen: Resumen = {
      idResumen: this.servicio.generarID(),
      titulo: '',
      subtitulo: '',
      salon: '',
      resumen: '',
      linea: '',
      tipo: '',
      objetivo: '',
      capacidad: '',
      materiales: '',
      prerequisito: '',
      requiereSala: '',
      evaluado: 'Sin Evaluar',
      idAutor: cedula,
      nombreAutor: ''
    };

    this.dialogo.pedirUnValor('Workshop EMEM', 'Especifique el título del poster o taller').subscribe((rTitulo: string) => {

      resumen.titulo = rTitulo;
      const datos = JSON.stringify(resumen);

      this.servicio.postResumen(datos).subscribe((rResumen: Resumen) => {

        this.servicio.getResumenesAutor(cedula).subscribe((rResp: any) => {
          this.router.navigate(['emem-workshop', 'crear-editar-resumen', resumen.idResumen]);
        });
      });
    });
  }

  ver(resumen: Resumen) {
    this.servicio.descargarResumen(resumen.idResumen).subscribe((rRuta: any) => {

      this.rutaDescarga = rRuta.ruta;
      this.dialogo.mostrarConfirmacion('El archivo se exporto correctamente').subscribe((rRespuesta: any) => {
        window.open(this.rutaDescarga, '_blank');
      });
    });
  }

  editar(resumen: Resumen) {
    this.router.navigate(['emem-workshop', 'crear-editar-resumen', resumen.idResumen]);
  }

  eliminar(resumen: Resumen) {
    this.dialogo.mostrarConfirmacion('¿Esta seguro de eliminar este resumen?').subscribe((rRespuesta: any) => {
      this.servicio.deleteResumen(resumen.idResumen).subscribe((rResumen: any) => {
        this.dialogo.mostrarMensaje(rRespuesta.respuesta, 'info');
        this.obtenerResumenes();
      });
    });
  }

}
