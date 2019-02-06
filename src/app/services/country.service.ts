import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { HttpClient } from "@angular/common/http";
import { Router } from '@angular/router';
@Injectable()
export class CountryService {

  constructor(private http: HttpClient, private globals: Globals, private router: Router) { }
  addCountry(countryEntity) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'Country/addCountry', countryEntity)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            //this.globals.isLoading = false;
            // this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  getById(countryId) {
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'Country/getById/' + countryId)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
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
  getAllCountry() {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'Country/getAllCountry')
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            //  this.globals.isLoading = false;
            //this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  isActiveChange(changeEntity) {
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'Country/isActiveChange', changeEntity)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            //   this.globals.isLoading = false;
            //this.router.navigate(['/pagenotfound']);      
          }
        );
    });
    return promise;
  }
  deleteCountry(del) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'Country/deleteCountry', del)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            //  this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }

}

