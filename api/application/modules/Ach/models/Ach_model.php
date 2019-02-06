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
          $this->db->select('UserId,FirstName,LastName,EmailAddress,PhoneNumber');				
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
                        "BankIFSCCode"=>trim($Bank['BankIFSCCode']),  
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
                        "PercOfSalary"=>trim($Bank['PercOfSalary'])
                      );                
                      $UserBankResult = $this->db->insert('tbluserbank', $userbank_data);
                      if($UserBankResult){
                        /* ACTIVITY LOG */
                        $activity_log = array(
                          'UserId'=>$UserId,
                          'Module' =>'AchForm',
                          'Activity'=>'Fill Ach form by - '.$UserDetails['FirstName']
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