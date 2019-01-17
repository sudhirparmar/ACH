import { Component, OnInit, ElementRef } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
import { ActivatedRoute } from '@angular/router';
import { AchService } from '../services/ach.service';
import { Globals } from '../globals';
declare var $, swal: any;


@Component({
  selector: 'app-ach',
  templateUrl: './ach.component.html',
  styleUrls: ['./ach.component.css']
})
export class AchComponent implements OnInit {

  achEntity;
  submitted;
  bankList;

  constructor(private http: Http, private router: Router, public globals: Globals, private route: ActivatedRoute, private AchService: AchService, private elem: ElementRef) {

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
    let PanCardFile = this.elem.nativeElement.querySelector('#PanCard').files[0];
    let AddressProofFile = this.elem.nativeElement.querySelector('#AddressProof').files[0];
    var fd = new FormData();
    if (PanCardFile) {
      var PanCard = Date.now() + '_' + PanCardFile['name'];
      PanCard=PanCard.replace(/ /g,"_");
      fd.append('PanCard', PanCardFile, PanCard);
      this.achEntity.PanCard = PanCard;
      alert(this.achEntity.PanCard);
    } else {
      fd.append('PanCard', null);
      this.achEntity.PanCard = null;
    }
    if (AddressProofFile) {
      var AddressProof = Date.now() + '_' + AddressProofFile['name'];
      AddressProof=AddressProof.replace(/ /g,"_");
      fd.append('AddressProof', AddressProofFile, AddressProof);
      this.achEntity.AddressProof = AddressProof;
      alert(this.achEntity.AddressProof);
    } else {
      fd.append('AddressProof', null);
      this.achEntity.AddressProof = null;
    }

    this.submitted = true;

    if (achForm.valid) {
      this.globals.isLoading = true;
      var obj = { 'UserDetails': this.achEntity, 'BankDetails': this.bankList };
      this.AchService.addAchForm(obj)
        .then((data) => {
          if (PanCardFile && AddressProofFile) {
            this.AchService.uploadFile(fd)
              .then((data) => {
                this.submitted = false;
                this.achEntity = {};
                var item = { 'BankName': '', 'BankAccountNumber': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current' };
                this.bankList = [];
                this.bankList.push(item);
                achForm.form.markAsPristine();
                swal({
                  position: 'top-end',
                  type: 'success',
                  title: 'ACH Form submitted successfully!',
                  showConfirmButton: false,
                  timer: 1500
                })
              },
                (error) => {
                  this.submitted = false;
                  this.globals.isLoading = false;
                  this.router.navigate(['/pagenotfound']);
                }
              );
          } else {
            this.submitted = false;
            this.achEntity = {};
            var item = { 'BankName': '', 'BankAccountNumber': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current' };
            this.bankList = [];
            this.bankList.push(item);
            achForm.form.markAsPristine();
          }
          $("#PanCard").val(null);
          $("#AddressProof").val(null);
          this.achEntity.PanCard = null;
          this.achEntity.AddressProof = null;
        },
          (error) => {
            this.submitted = false;
            this.globals.isLoading = false;
            swal({
              title: "Sorry, there was an error.",
              type: "warning",
              showConfirmButton: true
            })
          });
    }
  }



}
