import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { TransferService } from './transfer.service';

@Injectable({
  providedIn: 'root'
})
export class RutaNavegarService {

  permiso = false;

  constructor(private transfer: TransferService) {
    transfer.obtenerPermisoNavegar.subscribe((rPermiso: boolean) => {
      this.permiso = rPermiso;

    });
   }

  canActivate() {
    return this.permiso;
  }
}
