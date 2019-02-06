import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { CountryService } from '../services/country.service';
declare var $, swal: any;
declare function myInput(): any;
declare var $, Bloodhound: any;
@Component({
  selector: 'app-country-list',
  templateUrl: './country-list.component.html',
  styleUrls: ['./country-list.component.css']
})
export class CountryListComponent implements OnInit {
  countryList;
  msgflag;
  deleteEntity;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private CountryService: CountryService) { }

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
      $("#collapseExample1").addClass("in");
      $("#test_country").removeClass("collapsed");
      $("#test_country").attr("aria-expanded", "true");
    }, 100);
    this.globals.isLoading = true;
    this.CountryService.getAllCountry()
      .then((data) => {
        debugger
        setTimeout(function () {
          var table = $('#dataTables-country').DataTable({
            // scrollY: '55vh',
            responsive: {
              details: {
                display: $.fn.dataTable.Responsive.display.childRowImmediate,
                type: ''
              }
            },
            scrollCollapse: true,
            "oLanguage": {
              "sLengthMenu": "_MENU_ Countries per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Countries",
              "sInfoFiltered": "(filtered from _MAX_ total Countries)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Countries"
            },
            dom: 'lBfrtip',
            buttons: [
              {
                extend: 'excel',
                title: 'Countries List',
                exportOptions: {
                  columns: [0, 1]
                }
              },
              {
                extend: 'print',
                title: 'Countries List',
                exportOptions: {
                  columns: [0, 1]
                }
              },
            ]
          });
          $('.buttons-excel').attr('data-original-title', 'Export as Excel').tooltip();
          $('.buttons-print').attr('data-original-title', 'Print').tooltip();
        }, 100);

        this.countryList = data;
        console.log(this.countryList);
        this.globals.isLoading = false;
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
    this.msgflag = false;
  }
  isActiveChange(changeEntity, i) {
    if (this.countryList[i].IsActive == 1) {
      this.countryList[i].IsActive = 0;
      changeEntity.IsActive = 0;
    } else {
      this.countryList[i].IsActive = 1;
      changeEntity.IsActive = 1;
    }
    this.globals.isLoading = true;
    changeEntity.UpdatedBy = this.globals.authData.UserId;

    this.CountryService.isActiveChange(changeEntity)
      .then((data) => {
        this.globals.isLoading = false;
        swal({
          position: 'top-end',
          type: 'success',
          title: 'Country updated Successfully!',
          showConfirmButton: false,
          timer: 1500
        })

      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }
  deleteCountry(country) {
    this.deleteEntity = country;
    swal({
      title: 'Are you sure?',
      text: "You want to delete this Country?",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    })
      .then((result) => {
        if (result.value) {
          var del = { 'Userid': this.globals.authData.UserId, 'id': country.CountryId, 'Name': country.CountryName };
          this.globals.isLoading = true;
          this.CountryService.deleteCountry(del)
            .then((data) => {
              this.globals.isLoading = false;
              let index = this.countryList.indexOf(country);
              if (index != -1) {
                this.countryList.splice(index, 1);
              }
              swal({
                position: 'top-end',
                type: 'success',
                title: 'Country deleted successfully!',
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
