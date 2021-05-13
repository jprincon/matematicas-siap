export class Utilidades {

  public mesesDias = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  public letras = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

  generarId() {
    let clave = '';
    const min = 0;
    const max = 25;

    for (let i = 1 ; i <= 16; i++) {
      clave = clave + this.letras[this.getRandomInt(min, max)];

      if (((i % 4) === 0) && (i < 16)) {
        clave = clave + '-';
      }
    }

    return clave;
  }

  generarColor() {
    const r = this.getRandomInt(0, 255);
    const g = this.getRandomInt(0, 255);
    const b = this.getRandomInt(0, 255);

    return `rgba(${r},${g},${b},0.7)`;
  }

  getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min)) + min;
  }

  StrToFloat(s: string): number {
    return Number(s.replace(',', '.'));
  }

  transformarFecha(fechaJS: string): string {
    const fecha = new Date(fechaJS);
    let dia = fecha.getDate() + 1;
    let mes = fecha.getMonth() + 1;
    const anyo = fecha.getFullYear();

    if (dia > this.mesesDias[mes]) {
      dia = 1;
      mes = mes + 1;
    }

    return `${ dia }/${ mes }/${ anyo }`;
  }
}
