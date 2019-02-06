import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '../globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { CountryService } from '../services/country.service';
declare var $, swal: any;

@Component({
  selector: 'app-country',
  templateUrl: './country.component.html',
  styleUrls: ['./country.component.css']
})
export class CountryComponent implements OnInit {

  countryEntity;
  submitted;
  btn_disable;
  header;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute, private CountryService: CountryService) { }

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
      $("#collapseExample1").addClass("in");
      $("#test_country").removeClass("collapsed");
      $("#test_country").attr("aria-expanded", "true");
    }, 100);

    const body = document.querySelector('body');
    var count = $(window).height() - 270;
    body.style.setProperty('--screen-height', count + "px");

    let id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.header = 'Edit';
      this.globals.isLoading = true;
      this.CountryService.getById(id)
        .then((data) => {
          this.countryEntity = data;
          if (data['IsActive'] == 0) {
            this.countryEntity.IsActive = 0;
          } else {
            this.countryEntity.IsActive = '1';
          }
          this.globals.isLoading = false;
        },
          (error) => {
            this.globals.isLoading = false;
            //alert('error');
            this.btn_disable = false;
            this.submitted = false;

            //	this.router.navigate(['/admin/pagenotfound']);
          });
    }
    else {
      this.header = 'Add';
      this.countryEntity = {};
      this.countryEntity.CountryId = 0;
      this.countryEntity.IsActive = '1';
    }
  }
  addCountry(countryForm) {
    debugger
    let id = this.route.snapshot.paramMap.get('id');

    if (id) {
      this.countryEntity.UpdatedBy = this.globals.authData.UserId;
      this.submitted = false;
    } else {
      this.countryEntity.CreatedBy = this.globals.authData.UserId;
      this.countryEntity.UpdatedBy = this.globals.authData.UserId;
      this.countryEntity.CountryId = 0;
      this.submitted = true;
    }

    if (countryForm.valid) {
      this.btn_disable = true;
      this.globals.isLoading = true;
      this.CountryService.addCountry(this.countryEntity)
        .then((data) => {
          this.btn_disable = false;
          this.submitted = false;
          this.countryEntity = {};
          countryForm.form.markAsPristine();
          if (id) {
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Country updated successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          } else {
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Country added successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          }
          this.router.navigate(['/country/list']);
        },
          (error) => {
            alert('error');
            this.btn_disable = false;
            this.submitted = false;
            this.globals.isLoading = false;
            //	this.router.navigate(['/admin/pagenotfound']);
          });
    }
  }

}
