import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AchlistComponent } from './achlist.component';

describe('AchlistComponent', () => {
  let component: AchlistComponent;
  let fixture: ComponentFixture<AchlistComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AchlistComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AchlistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
