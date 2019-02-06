
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
import { ActivatedRoute } from '@angular/router';
import { AuditLogService } from '../services/audit-log.service';
import { Globals } from '../globals';
declare var $, swal: any;

@Component({
  selector: 'app-login-log',
  templateUrl: './login-log.component.html',
  styleUrls: ['./login-log.component.css']
})
export class LoginLogComponent implements OnInit {

  loginList;

  constructor(private http: Http, private router: Router, public globals: Globals, private route: ActivatedRoute, private AuditLogService: AuditLogService) { }


  ngOnInit() {

    setTimeout(function () {
      if ($("body").height() < $(window).height()) {
        $('footer').addClass('footer_fixed');
      }
      else {
        $('footer').removeClass('footer_fixed');
      }
      $("#collapseExample3").addClass("in");
      $("#test_logs").removeClass("collapsed");
      $("#test_logs").attr("aria-expanded", "true");
    }, 100);

    this.loginList = [];
    this.globals.isLoading = true;
    this.AuditLogService.getLoginLog()
      .then((data) => {
        debugger
        this.globals.isLoading = false;
        //dataTables-example
        setTimeout(function () {
          var table = $('#dataTables-loginlog').DataTable({
            // scrollY: '55vh',
            responsive: {
              details: {
                display: $.fn.dataTable.Responsive.display.childRowImmediate,
                type: ''
              }
            },
            scrollCollapse: true,
            "oLanguage": {
              "sLengthMenu": "_MENU_ Login Logs per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Login Logs",
              "sInfoFiltered": "(filtered from _MAX_ total Login Logs)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Login Logs"
            },
            dom: 'lBfrtip',
            buttons: [
              {
                extend: 'excel',
                title: 'Login Log',
                exportOptions: {
                  columns: [0, 1, 2, 3]
                }
              },
              {
                extend: 'print',
                title: 'Login Log',
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
          this.loginList = data;
        }

      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });


  }

}

