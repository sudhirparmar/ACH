import { TestBed, inject } from '@angular/core/testing';

import { AchInvitationService } from './ach-invitation.service';

describe('AchInvitationService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [AchInvitationService]
    });
  });

  it('should be created', inject([AchInvitationService], (service: AchInvitationService) => {
    expect(service).toBeTruthy();
  }));
});
