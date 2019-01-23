import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { debug } from 'util';

declare var $, swal: any;

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginEntity;
  submitted;
  btn_disable;
  invalid;
  constructor(private http: Http, private router: Router, private route: ActivatedRoute, private AuthService: AuthService, public globals: Globals) { }

  ngOnInit() {


    const body = document.querySelector('body');
    var count = $(window).height();
    body.style.setProperty('--screen-height', count + "px");

    this.loginEntity = {};
  }
  login(loginForm) {
    debugger
    //alert("fhdsvfs");
    this.submitted = true;
    if (loginForm.valid) {
      this.btn_disable = true;
      //this.globals.isLoading = true;
      this.AuthService.login(this.loginEntity)
        .then((data) => {
          //alert('success');
          swal({
            position: 'top-end',
            type: 'success',
            title: 'You are logged in successfully!',
            showConfirmButton: false,
            timer: 1500
          })
          // else
          //   {
          // alert('error');
          // this.btn_disable = false;
          // this.submitted = false;
          // this.invalid = false;
          // this.loginEntity = {};
          // loginForm.form.markAsPristine();
          //   }
          //this.globals.isLoading = true;
          window.location.href = '/ach-list';
          //this.router.navigate(['/dashboard']);

        },
          (error) => {

            swal({
              type: 'warning',
              title: 'Oops...',
              text: 'Either Username or Password is incorrect!',
            })
            //this.globals.isLoading = false;
            this.btn_disable = false;
            this.submitted = false;

          });
    }
  }

}


