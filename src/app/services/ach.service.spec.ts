import { TestBed, inject } from '@angular/core/testing';

import { AchService } from './ach.service';

describe('AchService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [AchService]
    });
  });

  it('should be created', inject([AchService], (service: AchService) => {
    expect(service).toBeTruthy();
  }));
});
