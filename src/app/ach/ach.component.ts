import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
import { ActivatedRoute } from '@angular/router';
import { AchService } from '../services/ach.service';
import { Globals } from '../globals';



@Component({
  selector: 'app-ach',
  templateUrl: './ach.component.html',
  styleUrls: ['./ach.component.css']
})
export class AchComponent implements OnInit {

  achEntity;
  submitted;

  constructor(private http: Http, private router: Router,  public globals: Globals,private route: ActivatedRoute,private AchService: AchService) { 

  
  }

  ngOnInit() {
    this.achEntity = {};
    
    
  }
  add(achForm) {
    
    
      this.submitted =true;

    if (achForm.valid) {
      
      this.AchService.addData(this.achEntity)
        .then((data) => {
          
          this.submitted = false;
          this.achEntity = {};
          achForm.form.markAsPristine();
         // alert("data");
         
        },
          (error) => {
            alert('error');
         
            this.submitted = false;
            
            //	this.router.navigate(['/admin/pagenotfound']);
          });
    }
  
  }



}
