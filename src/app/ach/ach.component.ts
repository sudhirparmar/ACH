import { Component, OnInit, ElementRef } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';
import { ActivatedRoute } from '@angular/router';
import { AchService } from '../services/ach.service';
import { Globals } from '../globals';
import { JwtHelper } from 'angular2-jwt';
declare var $, swal: any;


@Component({
  selector: 'app-ach',
  templateUrl: './ach.component.html',
  styleUrls: ['./ach.component.css']
})
export class AchComponent implements OnInit {

  UserInfoEntity;
  AddressEntity;
  UserDocumentEntity;
  BankDetails;
  countryList;
  stateList;
  submitted;
  bankList;

  constructor(private http: Http, private router: Router, public globals: Globals, private route: ActivatedRoute, private AchService: AchService, private elem: ElementRef) {

  }

  ngOnInit() {
    debugger
    this.globals.isLoading = false;

    this.countryList = [];
    this.stateList = [];

    this.UserInfoEntity = {};
    this.AddressEntity = {};
    this.UserDocumentEntity = {};

    let id = this.route.snapshot.paramMap.get('id');
    var UserInfo = { 'UserId': id }

    this.globals.isLoading = true;

    this.AchService.getCountryList()
      .then((data) => {
        this.countryList = data;
      },
        (error) => {
          //alert('error');
        });

    this.AchService.getUserInfo(UserInfo)
      .then((data) => {
        this.UserInfoEntity = data;
        console.log(this.UserInfoEntity);
      },
        (error) => {
          //this.btn_disable = false;
          this.submitted = false;
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });



    if (this.globals.authData.StatusId == 1) {
      this.AchService.getUserAddress(UserInfo)
        .then((data) => {
          this.AddressEntity = data;
          console.log(this.AddressEntity);
        },
          (error) => {
            //this.btn_disable = false;
            this.submitted = false;
            this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          });
      // this.AchService.getBankDetails(UserInfo)
      //   .then((data) => {
      //     this.BankEntity = data;
      //     console.log(this.BankEntity);
      //   },
      //     (error) => {
      //       //this.btn_disable = false;
      //       this.submitted = false;
      //       this.globals.isLoading = false;
      //       this.router.navigate(['/pagenotfound']);
      //     });

    } else {
      this.globals.isLoading = false;
      var item = { 'BankName': '', 'BankAccountNumber': '', 'BankBranch': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current' };
      this.bankList = [];
      this.bankList.push(item);
      this.AddressEntity.StateId = "";
      this.AddressEntity.CountryId = "";
    }



  }

  getStateList(AddressEntity) {
    this.AddressEntity.StateId = '';
    this.globals.isLoading = true;
    if (this.AddressEntity.CountryId > 0) {
      this.AchService.getStateList(this.AddressEntity.CountryId)
        .then((data) => {
          this.stateList = data;
          this.globals.isLoading = false;
        },
          (error) => {
            //alert('error');
            this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          });
    } else {
      this.stateList = [];
    }
  }

  getFromIFSC(ifsc, i) {
    debugger
    this.bankList[i].BankName = '';
    this.bankList[i].BankBranch = '';
    this.bankList[i].BankPhoneNumber = '';
    this.bankList[i].BankAddress = '';
    this.globals.isLoading = true;
    if (ifsc) {
      debugger
      this.AchService.getFromIFSC(ifsc)
        .then((data) => {
          this.BankDetails = data;
          this.bankList[i].BankName = this.BankDetails.BANK;
          this.bankList[i].BankBranch = this.BankDetails.BRANCH;
          this.bankList[i].BankPhoneNumber = this.BankDetails.CONTACT;
          this.bankList[i].BankAddress = this.BankDetails.ADDRESS;
          this.globals.isLoading = false;
        },
          (error) => {
            this.globals.isLoading = false;
            swal({
              title: "Please enter valid IFSC Code",
              type: "warning",
              showConfirmButton: true
            })
          });
    } else {
      this.bankList[i].BankName = '';
      this.bankList[i].BankBranch = '';
      this.bankList[i].BankPhoneNumber = '';
      this.bankList[i].BankAddress = '';
    }
  }

  AddBank(index) {

    var item = { 'BankName': '', 'BankAccountNumber': '', 'BankBranch': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current' };
    if (this.bankList.length <= index + 1) {
      this.bankList.splice(index + 1, 0, item);
    }
  }

  RemoveBank(item) {
    alert(item);
    var index = this.bankList.indexOf(item);
    alert(index);
    this.bankList.splice(index, 1);
  }

  addAchForm(achForm) {
    let PanCardFile = this.elem.nativeElement.querySelector('#PanCard').files[0];
    let AddressProofFile = this.elem.nativeElement.querySelector('#AddressProof').files[0];
    var fd = new FormData();
    if (PanCardFile) {
      var PanCard = Date.now() + '_' + PanCardFile['name'];
      PanCard = PanCard.replace(/ /g, "_");
      fd.append('PanCard', PanCardFile, PanCard);
      this.UserDocumentEntity.PanCard = PanCard;
      //alert(PanCard);
    } else {
      fd.append('PanCard', null);
      this.UserDocumentEntity.PanCard = null;
    }
    if (AddressProofFile) {
      var AddressProof = Date.now() + '_' + AddressProofFile['name'];
      AddressProof = AddressProof.replace(/ /g, "_");
      fd.append('AddressProof', AddressProofFile, AddressProof);
      this.UserDocumentEntity.AddressProof = AddressProof;
    } else {
      fd.append('AddressProof', null);
      this.UserDocumentEntity.AddressProof = null;
    }

    this.submitted = true;

    if (achForm.valid) {
      this.globals.isLoading = true;
      var obj = { 'UserInfo': this.UserInfoEntity, 'UserAddress': this.AddressEntity, 'UserDocument': this.UserDocumentEntity, 'BankDetails': this.bankList };
      debugger
      this.AchService.addAchForm(obj)
        .then((data) => {
          if (PanCardFile && AddressProofFile) {
            this.AchService.uploadFile(fd)
              .then((data) => {
                this.submitted = false;
                this.UserInfoEntity = {};
                this.AddressEntity = {};
                this.UserDocumentEntity = {};
                var item = { 'BankName': '', 'BankAccountNumber': '', 'BankBranch': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current' };
                this.bankList = [];
                this.bankList.push(item);
                this.globals.isLoading = false;
                achForm.form.markAsPristine();
                swal({
                  position: 'top-end',
                  type: 'success',
                  title: 'ACH Form submitted successfully!',
                  showConfirmButton: false,
                  timer: 1500
                })
                this.router.navigate(['/login']);
              },
                (error) => {
                  this.submitted = false;
                  this.globals.isLoading = false;
                  this.router.navigate(['/pagenotfound']);
                }
              );
          } else {
            this.submitted = false;
            this.UserInfoEntity = {};
            this.AddressEntity = {};
            this.UserDocumentEntity = {};
            var item = { 'BankName': '', 'BankAccountNumber': '', 'BankBranch': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current' };
            this.bankList = [];
            this.bankList.push(item);
            achForm.form.markAsPristine();
          }
          $("#PanCard").val(null);
          $("#AddressProof").val(null);
          this.AddressEntity.PanCard = null;
          this.AddressEntity.AddressProof = null;
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
