<?php  
   class Ach_model extends CI_Model  
   {  
      function __construct()  
      { 
         parent::__construct();  
      }  

      public function getACHLink($post_achlink) 
      {
        if($post_achlink)
        {
          $this->db->select('UserId,InvitationCode,EmailAddress');				
          $this->db->where('UserId',trim($post_achlink['UserId']));
          $this->db->where('InvitationCode',trim($post_achlink['InvitationCode']));
          $this->db->limit(1);
          $this->db->from('tbluser');
          $query= $this->db->get();

            if ($query->num_rows() == 1) 
            {
              return true;
            } 
            else
            {
              return false;
            }
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
            $UserDetails = $data['UserDetails'];
            $UserId = $UserDetails['UserId'];
            $BankDetails = $data['BankDetails'];
            
            //add user detail
            $ach_data=array(
              "FirstName"=>trim($UserDetails['FirstName']),
              "LastName"=>trim($UserDetails['LastName']),
              "Address"=>trim($UserDetails['Address']),
              "PhoneNumber"=>trim($UserDetails['PhoneNumber']),
              "PanCard"=>trim($UserDetails['PanCard']),
              "AddressProof"=>trim($UserDetails['AddressProof']),
              'InvitationCode' =>'',
              'StatusId'=>1
            );
            $this->db->where('UserId',$UserId);
            $this->db->where('EmailAddress',trim($UserDetails['EmailAddress']));
            $result = $this->db->update('tbluser', $ach_data);

            if($result) {

              /* ACTIVITY LOG */
              $activity_log = array(
                'UserId'=>$UserId,
                'Module' =>'AchForm',
                'Activity'=>'Fill Ach form by -'.$UserDetails['FirstName']
              );

              $log = $this->db->insert('tblactivitylog',$activity_log);
              /* END */

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

                  /* ACTIVITY LOG */
                  $activity_log = array(
                    'UserId'=>$UserId,
                    'Module' =>'AchForm',
                    'Activity'=>'Fill Ach form by -'.$UserDetails['FirstName']
                  );

                  $log = $this->db->insert('tblactivitylog',$activity_log);
                  /* END */

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
      
  }
    
?>  