import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
import { ActivatedRoute } from '@angular/router';
import { AchInvitationService } from '../services/ach-invitation.service';
import { Globals } from '../globals';
declare var $: any;

@Component({
  selector: 'app-ach-list',
  templateUrl: './ach-list.component.html',
  styleUrls: ['./ach-list.component.css']
})
export class AchListComponent implements OnInit {
  userList;
  bankDetails;
  Userid;
  Name;
  addressDetails;
  constructor(private http: Http, private router: Router, public globals: Globals, private route: ActivatedRoute, private AchInvitationService: AchInvitationService) {


  }

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

    this.AchInvitationService.getUserData()
      .then((data) => {
        debugger
        //dataTables-example
        setTimeout(function () {
          var table = $('#dataTables-users').DataTable({
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
                title: 'User List',
                exportOptions: {
                  columns: [0, 1, 2, 3, 4]
                }
              },
              {
                extend: 'print',
                title: 'User List',
                exportOptions: {
                  columns: [0, 1, 2, 3, 4]
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

  ViewBankDetails(UserDetail) {
    debugger
    this.bankDetails = {};
    this.Userid = UserDetail.UserId;
    this.Name = UserDetail.FirstName;
    var user = { 'UserId': UserDetail.UserId };
    //this.globals.isLoading = true;

    this.AchInvitationService.getBankDetails(user)
      .then((data) => {
        if (data) {
          this.bankDetails = data;
        }
        //this.globals.isLoading = false;
        $('#BankDetails_Modal').modal('show');
        $('.right_content_block').addClass('style_position');
      },
        (error) => {
          alert("data not found");
          //this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }
  editDetails(userid) {
    debugger
    alert(userid);
   // this.router.navigate(['/ach'], { queryParams: { userid: userid } });
    window.location.href = '/ach/'+   userid;
    // this.bankDetails = {};
    // this.Userid = UserDetail.UserId;
    // this.Name = UserDetail.FirstName;
    // var user = { 'UserId': UserDetail.UserId };
    //this.globals.isLoading = true;

    // this.AchInvitationService.getBankDetails(user)
    //   .then((data) => {
    //     if (data) {
    //       this.bankDetails = data;
    //     }
    //     //this.globals.isLoading = false;
    //     $('#BankDetails_Modal').modal('show');
    //     $('.right_content_block').addClass('style_position');
    //   },
    //     (error) => {
    //       alert("data not found");
    //       //this.globals.isLoading = false;
    //       this.router.navigate(['/pagenotfound']);
    //     });
  }

  viewAddressDetails(userid)
  {
    alert(userid);
    this.Userid = userid;


   this.AchInvitationService.getAddressDetails(userid)
    .then((data)=>{
        if(data)
        {
          this.addressDetails = data;
        }
        $('#addressDetails_Modal').modal('show');
        $('.right_content_block').addClass('style_position');
    },
    (error)=>{
      alert("data not found");
    })

  }

}
