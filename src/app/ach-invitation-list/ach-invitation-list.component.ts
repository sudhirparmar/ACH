import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
import { ActivatedRoute } from '@angular/router';
import { AchInvitationService } from '../services/ach-invitation.service';
import { Globals } from '../globals';
declare var $, swal: any;

@Component({
  selector: 'app-ach-invitation-list',
  templateUrl: './ach-invitation-list.component.html',
  styleUrls: ['./ach-invitation-list.component.css']
})
export class AchInvitationListComponent implements OnInit {
  userList;
  revokeEntity;
  reinviteEntity

  constructor(private http: Http, private router: Router, public globals: Globals, private route: ActivatedRoute, private AchInvitationService: AchInvitationService) { }

  ngOnInit() {

    setTimeout(function () {
      if ($("body").height() < $(window).height()) {
        $('footer').addClass('footer_fixed');
      }
      else {
        $('footer').removeClass('footer_fixed');
      }
    }, 1000);

    this.globals.isLoading = true;
    this.userList = [];
 
    this.AchInvitationService.getUserInvitationList()
      .then((data) => {
        debugger
        //dataTables-example
        setTimeout(function () {
          var table = $('#dataTables-invitations').DataTable({
            // scrollY: '55vh',
            responsive: {
              details: {
                display: $.fn.dataTable.Responsive.display.childRowImmediate,
                type: ''
              }
            },
            scrollCollapse: true,
            "oLanguage": {
              "sLengthMenu": "_MENU_ Users per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Users",
              "sInfoFiltered": "(filtered from _MAX_ total Users)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Users"
            },
            dom: 'lBfrtip',
            buttons: [
              {
                extend: 'excel',
                title: 'Invitation List',
                exportOptions: {
                  columns: [0, 1, 2, 3]
                }
              },
              {
                extend: 'print',
                title: 'Invitation List',
                exportOptions: {
                  columns: [0, 1, 2, 3]
                }
              },
            ]
          });
          $('.buttons-excel').attr('data-original-title', 'Export as Excel').tooltip();
          $('.buttons-print').attr('data-original-title', 'Print').tooltip();
        }, 100);
        if (data) {
          this.userList = data;
          this.globals.isLoading = false;
        } else {
          this.globals.isLoading = false;
        }

      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }

  RevokeInvitation(UserDetail) {
    swal({
      title: 'Are you sure?',
      text: "You want to revoke this invitation?",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, revoke it!'
    })
      .then((result) => {
        if (result.value) {
          var revoke = { 'UserId': this.globals.authData.UserId, 'id': UserDetail.UserId, 'Email': UserDetail.EmailAddress };
          this.globals.isLoading = true;
          this.AchInvitationService.RevokeUser(revoke)
            .then((data) => {
              this.globals.isLoading = false;
              let index = this.userList.indexOf(UserDetail);
              this.userList[index].StatusId = '2';

              swal({
                position: 'top-end',
                type: 'success',
                title: 'Revoke successfully!',
                showConfirmButton: false,
                timer: 1500
              })
            },
              (error) => {
                if (error.text) {
                  swal({
                    position: 'top-end',
                    type: 'success',
                    title: "You can't delete this record because of their dependency!",
                    showConfirmButton: false,
                    timer: 1500
                  })
                }
              });
        }
      })
  }

  ReInvitation(UserDetail) {
    swal({
      title: 'Are you sure?',
      text: "You want to re-invite this user?",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, Re-Invite it!'
    })
      .then((result) => {
        if (result.value) {
          var reinvite = { 'UserId': this.globals.authData.UserId, 'id': UserDetail.UserId, 'Email': UserDetail.EmailAddress };
          this.globals.isLoading = true;
          this.AchInvitationService.ReInviteUser(reinvite)
            .then((data) => {
              this.globals.isLoading = false;
              let index = this.userList.indexOf(UserDetail);
              this.userList[index].StatusId = '0';

              swal({
                position: 'top-end',
                type: 'success',
                title: 'Re-Invite successfully!',
                showConfirmButton: false,
                timer: 1500
              })
            },
              (error) => {
                this.globals.isLoading = false;
                if (error.text) {
                  swal({
                    position: 'top-end',
                    type: 'success',
                    title: "You can't delete this record because of their dependency!",
                    showConfirmButton: false,
                    timer: 1500
                  })
                }
              });
        }
      })
  }
}

