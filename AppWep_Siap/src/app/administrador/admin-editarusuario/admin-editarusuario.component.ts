import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import {Md5} from 'ts-md5/dist/md5';
import { Usuario } from '../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../services/general.service';

@Component({
  selector: 'app-admin-editarusuario',
  templateUrl: './admin-editarusuario.component.html',
  styles: []
})
export class AdminEditarusuarioComponent implements OnInit {

  usuario: Usuario = {
    nombre: '',
    cedula: '',
    contra: '',
    correo: ''
  };

  accion = 'crear';

  cedulaValida = true;
  nombreValido = true;
  correoValido = true;
  contraValida = true;
  puedeGuardar = false;

  constructor(private servicio: GeneralService,
              private activatedRoute: ActivatedRoute,
              private router: Router) { }

  ngOnInit() {
      this.obtenerParametro();
  }

  obtenerParametro() {
    this.activatedRoute.params.subscribe((rParametro: any) => {
      this.accion = rParametro.id;

      if (this.accion !== 'crear') {
        this.servicio.getUsuario(rParametro.id).subscribe((rUsuario: Usuario) => {
          this.usuario = rUsuario;
        });
      }
    });
  }

  crearUsuario() {
    if (this.accion === 'crear') {
      const contraMD5: string = new Md5().appendStr(this.usuario.contra).end().toString();
      console.log(contraMD5);
      this.usuario.contra = contraMD5;

      const datos = JSON.stringify(this.usuario);
      this.servicio.postUsuario(datos).subscribe((rUsuario: any) => {
        console.log(rUsuario);
        this.router.navigate(['administrador', 'usuario']);
      });
    } else {

      const contraMD5: string = new Md5().appendStr(this.usuario.contra).end().toString();
      console.log(contraMD5);
      this.usuario.contra = contraMD5;

      const datos = JSON.stringify(this.usuario);
      this.servicio.putUsuario(datos).subscribe((rUsuario: any) => {
        console.log(rUsuario);
        this.router.navigate(['administrador', 'usuario']);
      });
    }
  }

  validarDatos() {
    this.cedulaValida = this.usuario.cedula.length > 6;
    this.nombreValido = this.usuario.nombre.length > 6;
    this.contraValida = this.usuario.contra.length > 8;
    this.correoValido = this.usuario.correo.indexOf('@') >= 0;

    this.puedeGuardar = this.cedulaValida && this.nombreValido && this.contraValida && this.correoValido;
  }

}
