import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
import { ActivatedRoute } from '@angular/router';
import { AchService } from '../services/ach.service';
import { Globals } from '../globals';

@Component({
  selector: 'app-achlist',
  templateUrl: './achlist.component.html',
  styleUrls: ['./achlist.component.css']
})
export class AchlistComponent implements OnInit {
  achlist;

  constructor(private http: Http, private router: Router,  public globals: Globals,private route: ActivatedRoute,private AchService: AchService) { 

  
  }

  ngOnInit() {
    
   
  }

}
