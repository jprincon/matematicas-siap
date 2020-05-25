import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class RutaAdminService {

  constructor() { }

  canActivate(next: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    return true;
  }
}
