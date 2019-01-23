import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AchListComponent } from './ach-list.component';

describe('AchListComponent', () => {
  let component: AchListComponent;
  let fixture: ComponentFixture<AchListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AchListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AchListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
