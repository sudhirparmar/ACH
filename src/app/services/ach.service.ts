import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from "@angular/common/http";
import { Http } from '@angular/http';
import { Globals } from '../globals';


@Injectable()


export class AchService {

  constructor(private http: Http, private globals: Globals, private router: Router, private httpc: HttpClient) { }

  getACHLink(UserId) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'Ach/getACHLink', UserId)
        .toPromise()
        .then(
          res => { // Success
            resolve(res.json());
          },
          msg => { // Error
            reject(msg);
            // this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  
  addAchForm(obj) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'Ach/addAchForm', obj)
        .toPromise()
        .then(
          res => {
            resolve(res.json());
          },
          msg => {
            reject(msg);
          }
        );
    });
    return promise;
  }


  

  uploadFile(file) {
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'Ach/uploadFile', file)
        .toPromise()
        .then(
          res => { // Success
            resolve(res.json());
          },
          msg => { // Error
            reject(msg);
            //this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }

}
