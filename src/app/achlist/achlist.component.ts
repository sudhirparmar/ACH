import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
import { ActivatedRoute } from '@angular/router';
import { AchService } from '../services/ach.service';
import { Globals } from '../globals';
declare var $, swal: any;

@Component({
  selector: 'app-achlist',
  templateUrl: './achlist.component.html',
  styleUrls: ['./achlist.component.css']
})
export class AchlistComponent implements OnInit {
  achlist;
  achEntity;
  achuserList;
  Userid;
  constructor(private http: Http, private router: Router,  public globals: Globals,private route: ActivatedRoute,private AchService: AchService) { 

  
  }

  ngOnInit() {
    
   this.AchService.selectData()
   .then((data)=>{
    debugger
    //dataTables-example
    setTimeout(function () {
      var table = $('#dataTables-example').DataTable({
        // scrollY: '55vh',
        responsive: {
          details: {
            display: $.fn.dataTable.Responsive.display.childRowImmediate,
            type: ''
          }
        },
        scrollCollapse: true,
        "oLanguage": {
          "sLengthMenu": "_MENU_ Departments per Page",
          "sInfo": "Showing _START_ to _END_ of _TOTAL_ Departments",
          "sInfoFiltered": "(filtered from _MAX_ total Departments)",
          "sInfoEmpty": "Showing 0 to 0 of 0 Departments"
        },
        dom: 'lBfrtip',
        buttons: [
          {
            extend: 'excel',
            title: 'User List',
            exportOptions: {
              columns: [0, 1]
            }
          },
          {
            extend: 'print',
            title: 'User List',
            exportOptions: {
              columns: [0, 1]
            }
          },
        ]
      });
      $('.buttons-excel').attr('data-original-title', 'Export as Excel').tooltip();
      $('.buttons-print').attr('data-original-title', 'Print').tooltip();
    }, 100);

    this.achlist = data;
    console.log(this.achlist);

   },
   (error) => {
    this.globals.isLoading = false;
    this.router.navigate(['/pagenotfound']);
  });

  }

  ViewDetail(ach)
  {
    this.achEntity = {};
    alert("view");
    alert(ach.UserId);
    this.Userid = ach.UserId;
    var obj = { 'UserId': ach.UserId};
    this.globals.isLoading = true;

    //call method in service
    this.AchService.ViewDetail(this.Userid)
      .then((data) => {
        if (data) {
          this.achuserList = data;
          $('#Details_Modal').modal('show');
        }
        this.globals.isLoading = false;
       
       // $('.right_content_block').addClass('style_position');
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }

}
