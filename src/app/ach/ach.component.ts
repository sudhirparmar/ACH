import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
import { ActivatedRoute } from '@angular/router';
import { AchService } from '../services/ach.service';
import { Globals } from '../globals';



@Component({
  selector: 'app-ach',
  templateUrl: './ach.component.html',
  styleUrls: ['./ach.component.css']
})
export class AchComponent implements OnInit {

  achEntity;
  submitted;
  bankList;

  constructor(private http: Http, private router: Router, public globals: Globals, private route: ActivatedRoute, private AchService: AchService) {

  }

  ngOnInit() {
    this.achEntity = {};

    var item = { 'BankName': '', 'BankAccountNumber': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current' };
    this.bankList = [];
    this.bankList.push(item);
  }

  AddBank(index) {

    var item = { 'BankName': '', 'BankAccountNumber': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current' };
    if (this.bankList.length <= index + 1) {
      this.bankList.splice(index + 1, 0, item);
    }
  }

  RemoveBank(item) {

    var index = this.bankList.indexOf(item);
    this.bankList.splice(index, 1);
  }

  addAchForm(achForm) {
    this.submitted = true;
    var obj = { 'UserDetails': this.achEntity, 'BankDetails': this.bankList };;
    if (achForm.valid) {
      this.AchService.addAchForm(obj)
        .then((data) => {
          this.submitted = false;
          this.achEntity = {};
          var item = { 'BankName': '', 'BankAccountNumber': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current' };
          this.bankList = [];
          this.bankList.push(item);
          achForm.form.markAsPristine();
        },
          (error) => {
            alert('error');
            this.submitted = false;
            //	this.router.navigate(['/admin/pagenotfound']);
          });
    }
  }



}
