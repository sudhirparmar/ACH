import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { HttpClient } from "@angular/common/http";
import { Globals } from '.././globals';
import { Router } from '@angular/router';

@Injectable()
export class AchInvitationService {

  constructor(private http: Http, private globals: Globals, private router: Router) { }

  inviteUser(InvitationEntity) {
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'InviteUser/userInvite', InvitationEntity)
        .toPromise()
        .then(
          res => { // Success
            resolve(res.json());
          },
          msg => { // Error
            reject(msg);
            this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
}
