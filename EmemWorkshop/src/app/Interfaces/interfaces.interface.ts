export interface Usuario {
  idusuario?: string;
}

export interface Afiliacion {
  idafiliacion?: string;
  afiliacion?: string;
}
export interface ParticipanteEmem {
  idparticipante?: string;
  primernombre?: string;
  segundonombre?: string;
  primerapellido?: string;
  segundoapellido?: string;
  correo?: string;
  contra?: string;
  idafiliacion?: string;
  afiliacion?: Afiliacion;
}
