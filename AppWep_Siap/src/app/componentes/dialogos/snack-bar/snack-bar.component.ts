import { Component, OnInit } from '@angular/core';
import { TransferService } from '../../../services/transfer.service';

@Component({
  selector: 'app-snack-bar',
  templateUrl: './snack-bar.component.html',
  styles: []
})
export class SnackBarComponent implements OnInit {

  message = '';

  constructor(private transfer: TransferService) { }

  ngOnInit() {
    this.transfer.getMessageSnakBar.subscribe((rMessage: string) => {
      this.message = rMessage;
    });
  }

}
