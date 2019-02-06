import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { StateService } from '../services/state.service';
declare var $, swal: any;
declare function myInput(): any;
declare var $, Bloodhound: any;
@Component({
  selector: 'app-state-list',
  templateUrl: './state-list.component.html',
  styleUrls: ['./state-list.component.css']
})
export class StateListComponent implements OnInit {
  stateList;
  msgflag;
  deleteEntity;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private StateService: StateService) { }

  ngOnInit() {
    debugger
    this.globals.isLoading = false;

    setTimeout(function () {
      if ($(".bg_white_block").hasClass("ps--active-y")) {
        $('footer').removeClass('footer_fixed');
      }
      else {
        $('footer').addClass('footer_fixed');
      }
      $("#collapseExample2").addClass("in");
      $("#test_state").removeClass("collapsed");
      $("#test_state").attr("aria-expanded", "true");
    }, 100);
    this.globals.isLoading = true;
    this.StateService.getAllState()
      .then((data) => {
        debugger
        setTimeout(function () {
          var table = $('#dataTables-state').DataTable({
            // scrollY: '55vh',
            responsive: {
              details: {
                display: $.fn.dataTable.Responsive.display.childRowImmediate,
                type: ''
              }
            },
            scrollCollapse: true,
            "oLanguage": {
              "sLengthMenu": "_MENU_ States per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ States",
              "sInfoFiltered": "(filtered from _MAX_ total States)",
              "sInfoEmpty": "Showing 0 to 0 of 0 States"
            },
            dom: 'lBfrtip',
            buttons: [
              {
                extend: 'excel',
                title: 'States List',
                exportOptions: {
                  columns: [0, 1]
                }
              },
              {
                extend: 'print',
                title: 'States List',
                exportOptions: {
                  columns: [0, 1]
                }
              },
            ]
          });
          $('.buttons-excel').attr('data-original-title', 'Export as Excel').tooltip();
          $('.buttons-print').attr('data-original-title', 'Print').tooltip();
        }, 100);

        this.stateList = data;
        console.log(this.stateList);
        this.globals.isLoading = false;
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
    this.msgflag = false;
  }
  isActiveChange(changeEntity, i) {
    if (this.stateList[i].IsActive == 1) {
      this.stateList[i].IsActive = 0;
      changeEntity.IsActive = 0;
    } else {
      this.stateList[i].IsActive = 1;
      changeEntity.IsActive = 1;
    }
    this.globals.isLoading = true;
    changeEntity.UpdatedBy = this.globals.authData.UserId;

    this.StateService.isActiveChange(changeEntity)
      .then((data) => {
        this.globals.isLoading = false;
        swal({
          position: 'top-end',
          type: 'success',
          title: 'State updated Successfully!',
          showConfirmButton: false,
          timer: 1500
        })

      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }
  deleteState(state) {
    this.deleteEntity = state;
    swal({
      title: 'Are you sure?',
      text: "You want to delete this State?",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    })
      .then((result) => {
        if (result.value) {
          var del = { 'Userid': this.globals.authData.UserId, 'id': state.StateId, 'Name': state.StateName };
          this.globals.isLoading = true;
          this.StateService.deleteState(del)
            .then((data) => {
              this.globals.isLoading = false;
              let index = this.stateList.indexOf(state);
              if (index != -1) {
                this.stateList.splice(index, 1);
              }
              swal({
                position: 'top-end',
                type: 'success',
                title: 'State deleted successfully!',
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

}
