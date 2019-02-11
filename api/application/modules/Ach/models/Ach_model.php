<?php  
   class Ach_model extends CI_Model  
   {  
      function __construct()  
      { 
         parent::__construct();  
      }  

      public function getUserInfo($post_userinfo) 
      {
        if($post_userinfo)
        {
          $this->db->select('UserId,FirstName,LastName,EmailAddress,PhoneNumber,StatusId');				
          $this->db->where('UserId',trim($post_userinfo['UserId']));
          $this->db->limit(1);
          $this->db->from('tbluser');
          $result= $this->db->get();

          $UserInfo = array();
          foreach($result->result() as $row){
            $UserInfo = $row;
          }
          return $UserInfo;
        } 
        else
        {
            return false;
        }	
      }

      public function getUserDocument($post_userDocument) 
      {
        if($post_userDocument)
        {
          $this->db->select('UserId,PanCard,AddressProof');	
          $this->db->where('UserId',trim($post_userDocument['UserId']));
          $this->db->limit(1);
          $this->db->from('tbluserdocument');
          $result= $this->db->get();

          $UserDocument = array();
          foreach($result->result() as $row){
            $UserDocument = $row;
          }
          return $UserDocument;
        } 
        else
        {
            return false;
        }	
      }

      public function getUserAddress($post_userAddress) 
      {
        if($post_userAddress)
        {
          $this->db->select('UserId,Address,City,ZipCode,StateId,CountryId');	
          $this->db->where('UserId',trim($post_userAddress['UserId']));
          $this->db->limit(1);
          $this->db->from('tbluseraddress');
          $result= $this->db->get();

          $UserAddress = array();
          foreach($result->result() as $row){
            $UserAddress = $row;
          }
          return $UserAddress;
        } 
        else
        {
            return false;
        }	
      }
      
      public function getUserBank($post_userAddress)
      {
        if($post_userAddress) {

          $this->db->select('tub.BankId,tmb.BankIFSCCode,tub.BankAccountNumber,tub.AccountType,tub.PercOfSalary,tmb.BankName,tmb.BankAddress,tmb.BankBranch,tmb.BankPhoneNumber,tub.VoidCheque');
          $this->db->join('tblmstbank tmb','tmb.BankId = tub.BankId','left');
          $this->db->where('UserId',trim($post_userAddress['UserId']));
          $result=$this->db->get('tbluserbank tub');
          $bank_data= array();
          if($result->result()) {
            $bank_data=$result->result();
          }
        return $bank_data;
        } else {
          return false;
        }
      }
  
      public function addAchForm($data)
      {
        try{
          if($data)
          {
            $UserInfo = $data['UserInfo'];
            $UserAddress = $data['UserAddress'];
            $UserDocument = $data['UserDocument'];
            $BankDetails = $data['BankDetails'];

            $UserId = $UserInfo['UserId'];
            
            //add user info
            $UserInfo_data=array(
              "FirstName"=>trim($UserInfo['FirstName']),
              "LastName"=>trim($UserInfo['LastName']),
              "PhoneNumber"=>trim($UserInfo['PhoneNumber']),
              'StatusId'=>1
            );
            $this->db->where('UserId',$UserId);
            $this->db->where('EmailAddress',trim($UserInfo['EmailAddress']));
            $UserInfoResult = $this->db->update('tbluser', $UserInfo_data);

            if($UserInfoResult){
              //add user address
              $UserAddress_data=array(
                "UserId"=>$UserId,
                "Address"=>trim($UserAddress['Address']),
                "City"=>trim($UserAddress['City']),
                "ZipCode"=>trim($UserAddress['ZipCode']),
                "CountryId"=>trim($UserAddress['CountryId']),
                "StateId"=>trim($UserAddress['StateId'])
              );
              $AddressResult = $this->db->insert('tbluseraddress', $UserAddress_data);

              if($AddressResult) {
                //add user document
                $UserDocument_data=array(
                  "UserId"=>$UserId,
                  "PanCard"=>trim($UserDocument['PanCard']),
                  "AddressProof"=>trim($UserDocument['AddressProof'])
                );
                $DocumentResult = $this->db->insert('tbluserdocument', $UserDocument_data);

                if($DocumentResult) {                  
                  //Add Bank Details
                  foreach($BankDetails as $Bank){                                 
                    $this->db->select('BankId,BankIFSCCode');
                    $this->db->where('BankIFSCCode',trim($Bank['BankIFSCCode']));
                    $this->db->limit(1);
                    $this->db->from('tblmstbank');
                    $query = $this->db->get();                            

                    if ($query->num_rows() != 1) {
                      $bank_data=array(
                        "BankName"=>trim($Bank['BankName']),
                        "BankBranch"=>trim($Bank['BankBranch']),
                        "BankIFSCCode"=>strtoupper(trim($Bank['BankIFSCCode'])),  
                        "BankPhoneNumber"=>trim($Bank['BankPhoneNumber']),
                        "BankAddress"=>trim($Bank['BankAddress'])
                      );
                      $BankResult = $this->db->insert('tblmstbank', $bank_data);
                      $BankId = $this->db->insert_id();                      
                    } else {
                      foreach($query->result() as $row) {
                        $BankId=$row->BankId;
                      }
                    }
                    if($BankId){
                      $userbank_data=array(
                        "UserId"=>$UserId,
                        "BankId"=>$BankId,
                        "BankAccountNumber"=>trim($Bank['BankAccountNumber']),
                        "AccountType"=>trim($Bank['AccountType']),
                        "PercOfSalary"=>trim($Bank['PercOfSalary']),
                        "VoidCheque"=>trim($Bank['VoidCheque'])
                      );                
                      $UserBankResult = $this->db->insert('tbluserbank', $userbank_data);
                      if($UserBankResult){
                        return true;
                      } else {
                        return false;
                      }
                    } else {
                      return false;
                    }
                  }
                  //loop end
                  return true;
                } else {
                  return false;
                }
              } else {
                return false;
              }
            } else {
              return false;
            }            
          } else {
            return false;
          }
        }
        catch(Exception $e){
          trigger_error($e->getMessage(), E_USER_ERROR);
          return false;
        }
      }

      public function updateAchForm($data)
      {
        try{
          if($data)
          {
            $UserInfo = $data['UserInfo'];
            $UserAddress = $data['UserAddress'];
            $UserDocument = $data['UserDocument'];
            $BankDetails = $data['BankDetails'];

            $UserId = $UserInfo['UserId'];
            
            //add user info
            $UserInfo_data=array(
              "FirstName"=>trim($UserInfo['FirstName']),
              "LastName"=>trim($UserInfo['LastName']),
              "PhoneNumber"=>trim($UserInfo['PhoneNumber']),
              'StatusId'=>1
            );
            $this->db->where('UserId',$UserId);
            $this->db->where('EmailAddress',trim($UserInfo['EmailAddress']));
            $UserInfoResult = $this->db->update('tbluser', $UserInfo_data);

            if($UserInfoResult){
              //add user address
              $UserAddress_data=array(
                "UserId"=>$UserId,
                "Address"=>trim($UserAddress['Address']),
                "City"=>trim($UserAddress['City']),
                "ZipCode"=>trim($UserAddress['ZipCode']),
                "CountryId"=>trim($UserAddress['CountryId']),
                "StateId"=>trim($UserAddress['StateId'])
              );
              $AddressResult = $this->db->update('tbluseraddress', $UserAddress_data);

              if($AddressResult) {

                //add user document
                // $UserDocument_data=array(
                //   "UserId"=>$UserId,
                //   "PanCard"=>trim($UserDocument['PanCard']),
                //   "AddressProof"=>trim($UserDocument['AddressProof'])
                // );
                // $DocumentResult = $this->db->insert('tbluserdocument', $UserDocument_data);

                $this->db->where('UserId',$UserId);
				        $deleteUserBank = $this->db->delete('tbluserbank');

                if($deleteUserBank) {              
                  //Add Bank Details
                  foreach($BankDetails as $Bank){                                 
                    $this->db->select('BankId,BankIFSCCode');
                    $this->db->where('BankIFSCCode',trim($Bank['BankIFSCCode']));
                    $this->db->limit(1);
                    $this->db->from('tblmstbank');
                    $query = $this->db->get();                            

                    if ($query->num_rows() != 1) {
                      $bank_data=array(
                        "BankName"=>trim($Bank['BankName']),
                        "BankBranch"=>trim($Bank['BankBranch']),
                        "BankIFSCCode"=>strtoupper(trim($Bank['BankIFSCCode'])),  
                        "BankPhoneNumber"=>trim($Bank['BankPhoneNumber']),
                        "BankAddress"=>trim($Bank['BankAddress'])
                      );
                      $BankResult = $this->db->insert('tblmstbank', $bank_data);
                      $BankId = $this->db->insert_id();                      
                    } else {
                      foreach($query->result() as $row) {
                        $BankId=$row->BankId;
                      }
                    }
                    if($BankId){
                      $userbank_data=array(
                        "UserId"=>$UserId,
                        "BankId"=>$BankId,
                        "BankAccountNumber"=>trim($Bank['BankAccountNumber']),
                        "AccountType"=>trim($Bank['AccountType']),
                        "PercOfSalary"=>trim($Bank['PercOfSalary']),
                        "VoidCheque"=>trim($Bank['VoidCheque'])
                      );                
                      $UserBankResult = $this->db->insert('tbluserbank', $userbank_data);
                      if($UserBankResult){
                        /* ACTIVITY LOG */
                        $activity_log = array(
                          'UserId'=>$UserId,
                          'Module' =>'AchForm',
                          'Activity'=>'Update Ach form by - '.$UserInfo['FirstName']
                        );

                        $log = $this->db->insert('tblactivitylog',$activity_log);
                        /* END */
                      } else {
                        return false;
                      }
                    } else {
                      return false;
                    }
                  }
                  //loop end
                  return true;
                } else {
                  return false;
                }
              } else {
                return false;
              }
            } else {
              return false;
            }            
          } else {
            return false;
          }
        }
        catch(Exception $e){
          trigger_error($e->getMessage(), E_USER_ERROR);
          return false;
        }
      }

      public function getCountryList() {	
        $this->db->select('CountryId,CountryName');
        $this->db->where('IsActive="1"');
        $this->db->order_by('CountryName','asc');
        $result = $this->db->get('tblmstcountry');
        $res = array();
        if($result->result()) {
          $res = $result->result();
        }
        return $res;        
      }  
      
      public function getStateList($CountryId = NULL) {		
        if($CountryId) {          
          $this->db->select('StateId,StateName');
          $this->db->order_by('StateName','asc');
          $this->db->where('IsActive="1"');
          $this->db->where('CountryId',$CountryId);
          $result = $this->db->get('tblmststate');           
          
          $res = array();
          if($result->result()) {
            $res = $result->result();
          }
          return $res;          
        } else {
          return false;
        }
      }
  }
    
?>  