import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { ChangePasswordService } from '../services/change-password.service';
declare var $: any;
declare var $, swal: any;

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.css']
})
export class ChangePasswordComponent implements OnInit {

  changepasswordEntity;
  submitted;
  btn_disable;
  header;
  newconfsame;
  oldnewsame;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute, private ChangePasswordService: ChangePasswordService) { }

  ngOnInit() {
    debugger
    this.globals.isLoading = false;
    setTimeout(function () {
      if ($("body").height() < $(window).height()) {
        $('footer').addClass('footer_fixed');
      }
      else {
        $('footer').removeClass('footer_fixed');
      }
    }, 100);

    const body = document.querySelector('body');
    var count = $(window).height() - 270;
    body.style.setProperty('--screen-height', count + "px");

    this.changepasswordEntity = {};
  }

  changeNewPassword(changepasswordForm) {
    debugger
    let id = this.route.snapshot.paramMap.get('id');


    this.changepasswordEntity.UserId = id;
    if (id) {
      this.submitted = false;
    } else {
      this.changepasswordEntity.UserId = 0;
      this.submitted = true;
    }
    if (changepasswordForm.valid && !this.newconfsame && !this.oldnewsame) {

      this.changepasswordEntity.UserId = this.globals.authData.UserId;
      //alert(this.globals.authData.UserId);
      this.btn_disable = true;

      //alert(this.changepasswordEntity.UserId);

      this.globals.isLoading = true;
      this.ChangePasswordService.changeNewPassword(this.changepasswordEntity)
        .then((data) => {
          if (data == 'Incorrect Password') {
            swal({
              type: 'warning',
              title: 'Oops...',
              text: 'Your Current Password is incorrect!',
            })
            this.globals.isLoading = false;
            this.btn_disable = false;
            this.submitted = false;
            this.router.navigate(['/change-password']);
          }
          else {
            //alert('success');
            //this.aa=true;
            this.globals.isLoading = false;
            this.btn_disable = false;
            this.submitted = false;
            this.changepasswordEntity = {};
            changepasswordForm.form.markAsPristine();
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Your Password has been changed!',
              showConfirmButton: false,
              timer: 1500
            })
            if (this.globals.authData.RoleId == 1) {
              this.router.navigate(['/dashboard']);
            } else {
              this.router.navigate(['/thank-you']);
            }

          }
        },
          (error) => {
            this.globals.isLoading = false;
            //this.router.navigate(['/pagenotfound']);
            //alert('error');
            this.btn_disable = false;
            this.submitted = false;
          });
    }
  }

  confirmPassword() {
    debugger
    if (this.changepasswordEntity.ConfirmPassword != this.changepasswordEntity.NewPassword) {
      this.newconfsame = true;
      this.oldnewsame = false;
    } else {
      this.newconfsame = false;
      if (this.changepasswordEntity.Password == this.changepasswordEntity.NewPassword) {
        this.oldnewsame = true;
      }
      else {
        this.oldnewsame = false;
      }
    }
  }
}
