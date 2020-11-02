import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Usuario } from '../../interfaces/interfaces.interfaces';
import { GeneralService } from '../../services/general.service';

@Component({
  selector: 'app-admin-usuario',
  templateUrl: './admin-usuario.component.html',
  styles: []
})
export class AdminUsuarioComponent implements OnInit {

  busquedaCedula = '';
  busquedaNombre = '';

  bUsuarios: Usuario[] = [];
  usuarios: Usuario[] = [];

  constructor(private servicio: GeneralService,
              private router: Router) { }

  ngOnInit() {
    this.obtenerUsuarios();
  }

  obtenerUsuarios(){
    this.servicio.getUsuarios().subscribe((rUsuarios: any) => {
      this.usuarios = rUsuarios.usuarios;
      this.bUsuarios = this.usuarios;
    });
  }

  crearUsuario() {
    this.router.navigate(['administrador', 'editar-usuario', 'crear']);
  }

  buscarPorCedula() {

  }

  buscarPorNombre() {

  }

  editar(usuario: Usuario) {
    this.router.navigate(['administrador', 'editar-usuario', usuario.cedula]);
  }

  eliminar(usuario: Usuario){
      this.servicio.deleteUsuario(usuario.cedula).subscribe((rUsuario: any) => {

        this.obtenerUsuarios();
      });
  }

}
