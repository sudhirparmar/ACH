import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { HttpClient } from "@angular/common/http";
@Injectable()

export class ChangePasswordService {

  constructor(private http: HttpClient, private globals: Globals, private router: Router) { }

  changeNewPassword(UserId) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'ChangePassword/changeNewPassword', UserId)
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
