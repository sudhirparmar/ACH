import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { HttpClient } from "@angular/common/http";
import { Globals } from '.././globals';
import { Router } from '@angular/router';

@Injectable()
export class AchInvitationService {

  constructor(private http: HttpClient, private globals: Globals, private router: Router) { }

  getUserData() {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'InviteUser/getUserData')
        .toPromise()
        .then(
          res => {
            resolve(res);
          },
          msg => {
            reject(msg);
          }
        );
    });
    return promise;
  }

  getBankDetails(user) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'InviteUser/getBankDetails/', user)
        .toPromise()
        .then(
          res => {
            resolve(res);
          },
          msg => {
            reject(msg);
          }
        );
    });
    return promise;
  }
  
  inviteUser(InvitationEntity) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'InviteUser/userInvite', InvitationEntity)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
          }
        );
    });
    return promise;
  }
  getUserInvitationList() {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'InviteUser/getUserInvitationList')
        .toPromise()
        .then(
          res => {
            resolve(res);
          },
          msg => {
            reject(msg);
          }
        );
    });
    return promise;
  }
  RevokeUser(userData) {
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'InviteUser/RevokeUser', userData)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  ReInviteUser(userData) {
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'InviteUser/ReInviteUser', userData)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
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
