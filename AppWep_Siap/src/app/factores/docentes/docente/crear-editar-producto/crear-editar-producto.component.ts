import { Component, OnInit, Inject } from '@angular/core';
import { Producto, TipoProduccion } from '../../../../interfaces/interfaces.interfaces';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { GeneralService } from '../../../../services/general.service';
import { ID_LIBRO, ID_ARTICULO, ID_SOFTWARE, ID_PROYECTO_INVESTIGACION, ID_PROYECTO_EXTENSION } from '../../../../config/config';

@Component({
  selector: 'app-crear-editar-producto',
  templateUrl: './crear-editar-producto.component.html',
  styles: []
})
export class CrearEditarProductoComponent implements OnInit {

  Titulo = 'Creando producto ...';
  Descripcion = 'Permite crear productos para el docente. Ejemplos: Artículos, Libros, Software, ...';

  producto: Producto = {
    titulo: '',
    isbn: '',
    issn: '',
    editorial: '',
    revista: '',
    fecha: '',
    ciudad: '',
    volumen: '',
    numero: '',
    registro: '',
    fecha_fin: '',
    fecha_inicio: '',
    institucion: '',
    iddocente: ''
  };

  TiposProducto: TipoProduccion[] = [];
  TipoSeleccionado: TipoProduccion;

  _ID_LIBRO = ID_LIBRO;
  _ID_ARTICULO = ID_ARTICULO;
  _ID_SOFTWARE = ID_SOFTWARE;
  _ID_PROYECTO_INVESTIGACION = ID_PROYECTO_INVESTIGACION;
  _ID_PROYECTO_EXTENSION = ID_PROYECTO_EXTENSION;

  accion = 'Crear';

  constructor(public dialogRef: MatDialogRef<CrearEditarProductoComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private genService: GeneralService) { }

  ngOnInit() {
    if (this.data.producto !== null) {
      this.producto = this.data.producto;
      this.accion = 'Editar';
    }

    this.leerTiposProductos();
  }

  leerTiposProductos() {
    this.genService.getTiposProduccion().subscribe((rTipos: any) => {

      this.TiposProducto = rTipos.Tipos;
      this.TipoSeleccionado = this.TiposProducto[0];
    });
  }

  guardarProducto() {
    const datos = JSON.stringify(this.producto);

    if (this.accion === 'Crear') {
      this.genService.postProducto(datos).subscribe((rResp: any) => {

        this.dialogRef.close(rResp);
      });
    } else {
      this.genService.putProducto(datos).subscribe((rResp: any) => {

        this.dialogRef.close(rResp);
      });
    }
  }

  seleccionarTipo(tipo: TipoProduccion) {
    this.TipoSeleccionado = tipo;
  }

}
