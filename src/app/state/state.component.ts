import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { StateService } from '../services/state.service';
declare var $, swal: any;

@Component({
  selector: 'app-state',
  templateUrl: './state.component.html',
  styleUrls: ['./state.component.css']
})
export class StateComponent implements OnInit {

  stateEntity;
  countryList;
  submitted;
  btn_disable;
  header;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute, private StateService: StateService) { }

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
      $("#collapseExample2").addClass("in");
      $("#test_state").removeClass("collapsed");
      $("#test_state").attr("aria-expanded", "true");
    }, 100);

    const body = document.querySelector('body');
    var count = $(window).height() - 270;
    body.style.setProperty('--screen-height', count + "px");

    this.globals.isLoading = true;
    this.StateService.getAllCountry()
      .then((data) => {
        this.countryList = data;
        this.globals.isLoading = false;
      },
        (error) => {
          //alert('error');
        });

    let id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.header = 'Edit';
      this.StateService.getById(id)
        .then((data) => {
          this.stateEntity = data;
          if (data['IsActive'] == 0) {
            this.stateEntity.IsActive = 0;
          } else {
            this.stateEntity.IsActive = '1';
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
      this.stateEntity = {};
      this.stateEntity.StateId = 0;
      this.stateEntity.IsActive = '1';
      this.stateEntity.CountryId='';
    }
  }
  addState(stateForm) {
    debugger
    let id = this.route.snapshot.paramMap.get('id');

    if (id) {
      this.stateEntity.UpdatedBy = this.globals.authData.UserId;
      this.submitted = false;
    } else {
      this.stateEntity.CreatedBy = this.globals.authData.UserId;
      this.stateEntity.UpdatedBy = this.globals.authData.UserId;
      this.stateEntity.StateId = 0;
      this.submitted = true;
    }

    if (stateForm.valid) {
      this.btn_disable = true;
      this.globals.isLoading = true;
      this.StateService.addState(this.stateEntity)
        .then((data) => {
          this.btn_disable = false;
          this.submitted = false;
          this.stateEntity = {};
          stateForm.form.markAsPristine();
          if (id) {
            swal({
              position: 'top-end',
              type: 'success',
              title: 'State updated successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          } else {
            swal({
              position: 'top-end',
              type: 'success',
              title: 'State added successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          }
          this.router.navigate(['/state/list']);
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
