import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from "@angular/common/http";
import { Http } from '@angular/http';
import { Globals } from '../globals';


@Injectable()


export class AchService {

  constructor(private http: HttpClient, private globals: Globals,private router: Router){}
  
  addData(achEntity) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'Ach/addData', achEntity)
        .toPromise()
        .then(
          res => { // Success
            alert("Record Inserted Successfully");
            resolve(res);
          },
          msg => { // Error
            alert("reject");

            reject(msg);
            
          }
        );
    });
    return promise;
  }

 
  selectData() {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'Ach/getAchData')
        .toPromise()
        .then(
          res => { // Success
            alert("succss");
            resolve(res);
          },
          msg => { // Error
            alert("error");
            reject(msg);
            //  this.globals.isLoading = false;
            //this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }

  ViewDetail(Userid) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'Ach/viewDetail/'+Userid)
        .toPromise()
        .then(
          res => { // Success
            alert("succss viewdetail");
            resolve(res);
          },
          msg => { // Error
            alert("error");
            reject(msg);
            //  this.globals.isLoading = false;
            //this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }

}
