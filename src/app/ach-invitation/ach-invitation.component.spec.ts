import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AchInvitationComponent } from './ach-invitation.component';

describe('AchInvitationComponent', () => {
  let component: AchInvitationComponent;
  let fixture: ComponentFixture<AchInvitationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AchInvitationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AchInvitationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
