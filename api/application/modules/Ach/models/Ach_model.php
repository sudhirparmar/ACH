<?php  
   class Ach_model extends CI_Model  
   {  
      function __construct()  
      { 
         parent::__construct();  
      }  
  
      public function addAchForm($data)
      {
        try{
          if($data)
          {
            $UserDetails = $data['UserDetails'];
            $BankDetails = $data['BankDetails'];
            
            //add user detail
            $ach_data=array(
              "FirstName"=>trim($UserDetails['FirstName']),
              "LastName"=>trim($UserDetails['LastName']),
              "Address"=>trim($UserDetails['Address']),
              "PhoneNumber"=>trim($UserDetails['PhoneNumber']),
              "EmailAddress"=>trim($UserDetails['EmailAddress']),
              "PanCard"=>trim($UserDetails['PanCard']),
              "AddressProof"=>trim($UserDetails['AddressProof'])
            );
            $result = $this->db->insert('tbluser', $ach_data);

            if($result) {
              $UserId = $this->db->insert_id();
              
              //loop start
              foreach($BankDetails as $Bank){
                
                              
                $this->db->select('BankId,BankIFSCCode');
                $this->db->where('BankIFSCCode',trim($Bank['BankIFSCCode']));
                $this->db->limit(1);
                $this->db->from('tblmstbank');
                $query = $this->db->get();                            

                if ($query->num_rows() != 1) {
                  $bank_data=array(
                    "BankName"=>trim($Bank['BankName']),
                    "BankIFSCCode"=>trim($Bank['BankIFSCCode']),
                    "BankPhoneNumber"=>trim($Bank['BankPhoneNumber']),
                    "BankAddress"=>trim($Bank['BankAddress'])
                  );
                  $result2 = $this->db->insert('tblmstbank', $bank_data);
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
                  $result3 = $this->db->insert('tbluserbank', $userbank_data);
                  if($result3){
                    //return true;
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
        }
          catch(Exception $e){
            trigger_error($e->getMessage(), E_USER_ERROR);
            return false;
          }
      }
      public function getUserData()
      {
        try{
          $this->db->select('UserId, FirstName, LastName, Address, PhoneNumber, EmailAddress, PanCard, AddressProof');
          $result = $this->db->get('tbluser');
          $db_error = $this->db->error();
              if (!empty($db_error) && !empty($db_error['code'])) { 
                throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
                return false; // unreachable return statement !!!
              }
          $res=array();
          if($result->result())
          {
            $res=$result->result();
          }
          return $res;
        }catch(Exception $e){
          trigger_error($e->getMessage(), E_USER_ERROR);
          return false;
        }
      }
      
      public function getBankDetails($post_data) {
        $this->db->select('tb.BankName, tb.BankIFSCCode, tb.BankAddress, tb.BankPhoneNumber, tub.BankAccountNumber, tub.AccountType, tub.PercOfSalary');
        $this->db->join('tblmstbank tb','tb.BankId=tub.BankId','left');
        $this->db->where('tub.UserId',$post_data['UserId']);
        $result = $this->db->get('tbluserbank as tub');	
        $res = array();
        if($result->result()) {
          $res = $result->result();
        }
        return $res;
      }
  }
    
?>  