import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'reducirTexto'
})
export class ReducirTextoPipe implements PipeTransform {

  transform(value: string, args?: number): string {
    if (value.length > args) {
      return value.substr(0, args) + '...';
    } else {
      return value;
    }
  }

}
