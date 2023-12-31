import { Component, Output, EventEmitter } from '@angular/core';
@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent {
  @Output() menuToggle: EventEmitter<void> = new EventEmitter<void>();

  toggleSidebar() {
    this.menuToggle.emit();
  }
}
