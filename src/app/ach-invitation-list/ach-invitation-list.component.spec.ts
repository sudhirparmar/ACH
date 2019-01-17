import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AchInvitationListComponent } from './ach-invitation-list.component';

describe('AchInvitationListComponent', () => {
  let component: AchInvitationListComponent;
  let fixture: ComponentFixture<AchInvitationListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AchInvitationListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AchInvitationListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
