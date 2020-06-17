import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'noImagen'
})
export class NoImagenPipe implements PipeTransform {

  transform(value: any, args?: any): any {

    if (!value || value === 'El Archivo No Existe') {
      return 'assets/Imagenes/noImagenPerfil.jpg';
    } else {
      return value;
    }
  }

}
