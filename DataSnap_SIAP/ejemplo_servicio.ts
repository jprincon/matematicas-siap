// MÉTODOS PARTICIPANTES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  getParticipantes() {
    const url = this.dataSnap_Participante() + this.parametro('all');
    return this.http.get(url);
  }

  getParticipante(idParticipante: string) {
    const url = this.dataSnap_Participante() + this.parametro(idParticipante);
    return this.http.get(url);
  }

  postParticipante(datos: string) {
    const url = this.dataSnap_Participante();
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(url, datos, {headers});
  }

  putParticipante(datos: string) {
    const url = this.dataSnap_Participante();
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put(url, datos, {headers});
  }

  deleteParticipante(idParticipante: string) {
    const url = this.dataSnap_Participante() + this.parametro(idParticipante);
    return this.http.delete(url);
  }