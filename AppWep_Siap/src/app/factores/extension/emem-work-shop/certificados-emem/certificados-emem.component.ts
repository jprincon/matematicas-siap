import { Component, OnInit } from '@angular/core';
import { TransferService } from '../../../../services/transfer.service';
import { GeneralService } from '../../../../services/general.service';
import { DialogosService } from '../../../../services/dialogos.service';

@Component({
  selector: 'app-certificados-emem',
  templateUrl: './certificados-emem.component.html',
  styles: []
})
export class CertificadosEmemComponent implements OnInit {

  documento = '';
  correo = '';
  fecha = '';
  nombre = '';

  constructor(private transfer: TransferService,
              private dialogos: DialogosService,
              private generalService: GeneralService) { }

  ngOnInit() {
    this.transfer.enviarTituloEmem('Certificados');
  }

  buscarCertificado() {
    const datos = JSON.stringify({
      cedula: this.documento,
      fecha: this.fecha,
      nombre: this.nombre
    });

    this.generalService.getObtenerCertificados(datos).subscribe((rCertificados: any) => {

      this.dialogos.mostrarConfirmacion('El Certificado se exportó correctamente').subscribe((rRespuesta: boolean) => {
        if (rRespuesta) {
            window.open(rCertificados.descarga, '_blank');
        }
      });
    });
  }

}
