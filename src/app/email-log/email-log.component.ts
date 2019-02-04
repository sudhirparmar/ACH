import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
import { ActivatedRoute } from '@angular/router';
import { AuditLogService } from '../services/audit-log.service';
import { Globals } from '../globals';
declare var $, swal: any;

@Component({
  selector: 'app-email-log',
  templateUrl: './email-log.component.html',
  styleUrls: ['./email-log.component.css']
})
export class EmailLogComponent implements OnInit {

  emailList;

  constructor(private http: Http, private router: Router, public globals: Globals, private route: ActivatedRoute, private AuditLogService: AuditLogService) { }

  ngOnInit() {
    setTimeout(function () {
      if ($("body").height() < $(window).height()) {
        $('footer').addClass('footer_fixed');
      }
      else {
        $('footer').removeClass('footer_fixed');
      }
    }, 1000);
    this.emailList = [];
    this.globals.isLoading = true;
    this.AuditLogService.getEmailLog()
      .then((data) => {
        debugger
        this.globals.isLoading = false;
        //dataTables-example
        setTimeout(function () {
          var table = $('#dataTables-emaillog').DataTable({
            // scrollY: '55vh',
            responsive: {
              details: {
                display: $.fn.dataTable.Responsive.display.childRowImmediate,
                type: ''
              }
            },
            scrollCollapse: true,
            "oLanguage": {
              "sLengthMenu": "_MENU_ Users per Email Logs",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Email Logs",
              "sInfoFiltered": "(filtered from _MAX_ total Email Logs)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Email Logs"
            },
            dom: 'lBfrtip',
            buttons: [
              {
                extend: 'excel',
                title: 'Email Logs',
                exportOptions: {
                  columns: [0, 1, 2, 3]
                }
              },
              {
                extend: 'print',
                title: 'Email Logs',
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
          this.emailList = data;
        }

      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }

}
