import { Component, OnInit, ElementRef } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
import { ActivatedRoute } from '@angular/router';
import { Globals } from '../globals';
import { JwtHelper } from 'angular2-jwt';
declare var $, swal: any;

@Component({
  selector: 'app-thank-you',
  templateUrl: './thank-you.component.html',
  styleUrls: ['./thank-you.component.css']
})
export class ThankYouComponent implements OnInit {
  UserId;

  constructor(private http: Http, private router: Router, public globals: Globals, private route: ActivatedRoute, private elem: ElementRef) { }

  ngOnInit() {
    debugger
    this.UserId = this.globals.authData.UserId;
    if (this.globals.authData.StatusId == 0) {
      window.location.href = '/ach/' + this.globals.authData.UserId;
    }    
  }

}
