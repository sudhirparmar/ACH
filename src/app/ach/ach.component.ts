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
  IsUpdate;


  constructor(private http: Http, private router: Router, public globals: Globals, private route: ActivatedRoute, private AchService: AchService, private elem: ElementRef) {

  }

  ngOnInit() {
    debugger
    this.globals.isLoading = false;

    this.IsUpdate = false;

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

        if (this.UserInfoEntity.StatusId == 1) {
          this.IsUpdate = true;
          this.AchService.getUserAddress(UserInfo)
            .then((data) => {
              this.AddressEntity = data;
              var StateId = data['StateId'];
              this.getStateList(this.AddressEntity);
              this.AddressEntity.StateId = StateId;

              this.AchService.getUserDocument(UserInfo)
                .then((data) => {

                  this.UserDocumentEntity = data;

                  this.AchService.getUserBank(UserInfo)
                    .then((data) => {
                      this.bankList = data;
                      this.globals.isLoading = false;
                    },
                      (error) => {
                        this.submitted = false;
                        this.globals.isLoading = false;
                        this.router.navigate(['/pagenotfound']);
                      });
                },
                  (error) => {
                    this.submitted = false;
                    this.globals.isLoading = false;
                    this.router.navigate(['/pagenotfound']);
                  });


            },
              (error) => {
                this.submitted = false;
                this.globals.isLoading = false;
                this.router.navigate(['/pagenotfound']);
              });
        } else {
          this.globals.isLoading = false;
          var item = { 'BankName': '', 'BankAccountNumber': '', 'BankBranch': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current', 'VoidCheque': '' };
          this.bankList = [];
          this.bankList.push(item);
          this.AddressEntity.StateId = "";
          this.AddressEntity.CountryId = "";
        }
      },
        (error) => {
          //this.btn_disable = false;
          this.submitted = false;
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
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
      this.globals.isLoading = false;
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

    var item = { 'BankName': '', 'BankAccountNumber': '', 'BankBranch': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current', 'VoidCheque': '' };
    if (this.bankList.length <= index + 1) {
      this.bankList.splice(index + 1, 0, item);
    }
    this.submitted = false;
  }

  RemoveBank(item) {
    var index = this.bankList.indexOf(item);
    this.bankList.splice(index, 1);
  }

  addAchForm(achForm) {
    this.submitted = true;
    if (achForm.valid) {
      let sum = 0;
      for (let i = 0; i < this.bankList.length; i++) {
        sum += parseInt(this.bankList[i].PercOfSalary);
      }
      if (sum == 100) {
        $('#BankDetails_Modal').modal('show');
        $('.right_content_block').addClass('style_position');
      } else {
        swal({
          title: "Percentage of salary should be sum of 100.",
          type: "warning",
          showConfirmButton: true
        })
      }
    }

  }

  finalSubmit(achForm) {

    let PanCardFile = this.elem.nativeElement.querySelector('#PanCard').files[0];
    let AddressProofFile = this.elem.nativeElement.querySelector('#AddressProof').files[0];

    var fd = new FormData();
    var vc = new FormData();
    if (PanCardFile) {
      let pan = PanCardFile['name'];
      var mystring = this.UserInfoEntity.FirstName + "_" + this.UserInfoEntity.LastName + "_PanCard_" + Date.now();
      var ind1 = pan.lastIndexOf('/');
      var ind2 = pan.lastIndexOf('.');
      var PanCard = pan.substring(0, ind1 + 1) + mystring + pan.substring(ind2);
      fd.append('PanCard', PanCardFile, PanCard);
      this.UserDocumentEntity.PanCard = PanCard;
    } else {
      fd.append('PanCard', null);
      this.UserDocumentEntity.PanCard = null;
    }
    if (AddressProofFile) {
      let address = AddressProofFile['name'];
      var mystring = this.UserInfoEntity.FirstName + "_" + this.UserInfoEntity.LastName + "_AddressProof_" + Date.now();
      var ind1 = address.lastIndexOf('/');
      var ind2 = address.lastIndexOf('.');
      var AddressProof = address.substring(0, ind1 + 1) + mystring + address.substring(ind2);
      fd.append('AddressProof', AddressProofFile, AddressProof);
      this.UserDocumentEntity.AddressProof = AddressProof;
    } else {
      fd.append('AddressProof', null);
      this.UserDocumentEntity.AddressProof = null;
    }

    var TotalCheque = this.bankList.length;

    for (var j = 0, k = 1; j < this.bankList.length; j++ , k++) {
      let ChequeFile = this.elem.nativeElement.querySelector('#VoidCheque' + j).files[0];



      if (ChequeFile) {
        let cheque = ChequeFile['name'];
        var mystring = this.UserInfoEntity.FirstName + "_" + this.UserInfoEntity.LastName + "_VoidCheque" + k + "_" + Date.now();
        var ind1 = cheque.lastIndexOf('/');
        var ind2 = cheque.lastIndexOf('.');
        var VoidCheque = cheque.substring(0, ind1 + 1) + mystring + cheque.substring(ind2);

        vc.append('VoidCheque' + j, ChequeFile, VoidCheque);
        this.bankList[j].VoidCheque = VoidCheque;
      } else {
        vc.append('VoidCheque' + j, null);
        this.bankList[j].VoidCheque = null;
      }
    }


    if (achForm.valid) {
      this.globals.isLoading = true;
      var obj = { 'UserInfo': this.UserInfoEntity, 'UserAddress': this.AddressEntity, 'UserDocument': this.UserDocumentEntity, 'BankDetails': this.bankList ,'CreatedBy':this.globals.authData.UserId};
      debugger
      this.AchService.addAchForm(obj)
        .then((data) => {
          if (PanCardFile && AddressProofFile) {
            this.AchService.uploadDocs(fd)
              .then((data) => {
                this.AchService.uploadCheque(vc, TotalCheque)
                  .then((data) => {
                    this.submitted = false;
                    $('#BankDetails_Modal').modal('hide');
                    $('.right_content_block').removeClass('style_position');
                    this.globals.isLoading = false;
                    achForm.form.markAsPristine();
                    if (this.UserInfoEntity.StatusId == 1) {
                      swal({
                        position: 'top-end',
                        type: 'success',
                        title: 'ACH Form updated successfully!',
                        showConfirmButton: false,
                        timer: 1500
                      })
                    } else {
                      swal({
                        position: 'top-end',
                        type: 'success',
                        title: 'ACH Form submitted successfully!',
                        showConfirmButton: false,
                        timer: 1500
                      })
                    }
                    this.globals.authData.StatusId = 1;
                    this.UserInfoEntity = {};
                    this.AddressEntity = {};
                    this.UserDocumentEntity = {};
                    var item = { 'BankName': '', 'BankAccountNumber': '', 'BankBranch': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current', 'VoidCheque': '' };
                    this.bankList = [];
                    this.bankList.push(item);
                    if (this.globals.authData.RoleId == 1) {
                      this.router.navigate(['/ach-list']);
                    }
                    else {
                      this.router.navigate(['/thank-you']);
                    }
                  },
                    (error) => {
                      this.submitted = false;
                      this.globals.isLoading = false;
                      this.router.navigate(['/pagenotfound']);
                    }
                  );
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
            var item = { 'BankName': '', 'BankAccountNumber': '', 'BankBranch': '', 'BankIFSCCode': '', 'BankPhoneNumber': '', 'BankAddress': '', 'PercOfSalary': '', 'AccountType': 'Current', 'VoidCheque': '' };
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
