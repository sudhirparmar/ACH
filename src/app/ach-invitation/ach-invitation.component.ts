import { Component, OnInit, ElementRef } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
import { ActivatedRoute } from '@angular/router';
import { AchInvitationService } from '../services/ach-invitation.service';
import { Globals } from '../globals';
declare var $, swal: any;

@Component({
  selector: 'app-ach-invitation',
  templateUrl: './ach-invitation.component.html',
  styleUrls: ['./ach-invitation.component.css']
})
export class AchInvitationComponent implements OnInit {

  InvitationEntity;
  btn_disable;
  submitted;

  constructor(private http: Http, private router: Router, public globals: Globals, private route: ActivatedRoute, private AchInvitationService: AchInvitationService, private elem: ElementRef) { }


  ngOnInit() {
    this.globals.isLoading = false;
    setTimeout(function () {
      if ($("body").height() < $(window).height()) {
        $('footer').addClass('footer_fixed');
      }
      else {
        $('footer').removeClass('footer_fixed');
      }
    }, 1000);
    this.InvitationEntity = {};

  }

  inviteUser(inviteUserForm) {

    debugger
    this.submitted = true;

    var email = this.InvitationEntity.EmailAddress;

    if (inviteUserForm.valid) {

      this.btn_disable = true;
      this.globals.isLoading = true;
      this.AchInvitationService.inviteUser(this.InvitationEntity)
        .then((data) => {
          this.globals.isLoading = false;
          if (data == 'email duplicate') {
            this.btn_disable = false;
            swal({
              type: 'warning',
              title: 'Oops...',
              text: 'You already invited this Email Address',
            })
          } else if (data == 'success') {
            this.btn_disable = false;
            this.submitted = false;
            this.InvitationEntity = {};
            inviteUserForm.form.markAsPristine();
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Invitation link sent successfully to <b>' + email,
              showConfirmButton: false,
              timer: 1500
            })
            this.router.navigate(['/ach-invitation/list']);
          }
        },
          (error) => {
            this.btn_disable = false;
            this.submitted = false;
            this.globals.isLoading = false;
            this.router.navigate(['/ach-invitation/list']);
          });
    }
  }
}
