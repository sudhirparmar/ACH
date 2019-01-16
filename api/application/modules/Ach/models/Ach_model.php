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
                $this->db->from('tblbank');
                $query = $this->db->get();                            

                if ($query->num_rows() != 1) {
                  $bank_data=array(
                    "BankName"=>trim($Bank['BankName']),
                    "BankIFSCCode"=>trim($Bank['BankIFSCCode']),
                    "BankPhoneNumber"=>trim($Bank['BankPhoneNumber']),
                    "BankAddress"=>trim($Bank['BankAddress'])
                  );
                  $result2 = $this->db->insert('tblbank', $bank_data);
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
      public function getAchData()
      {
        $query = $this->db->get('tbluser');

        $result = $query->result();

        if($result)
        {
          return $result;
        }
        else
        {
          return false;
        }
      }
      public function viewDetail($Id)
      {
        if($Id)
        {
         $this->db->select('user.FirstName, user.LastName, user.Address,user.PhoneNumber,user.EmailAddress');
         $this->db->where('user.UserId',$Id);
         $query=$this->db->get('tbluser user');

            $result = $query->result();
            if($result)
            {
              return $result;
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
        // if($Id)
        // {
        //  $this->db->select('tmet.EvaluationTypeId, tmet.EvaluationTypeName, tmet.IsActive');
        //  $this->db->where('tmet.EvaluationTypeId',$evaluationtypeId);
        //  $result=$this->db->get('tblmstevaluationtype tmet');
        //  $evaluationtype_data= array();
        //  foreach($result->result() as $row)
        //  {
        //   $evaluationtype_data=$row;
          
        //  }
        //  return $evaluationtype_data;
         
        // }
        // else
        // {
        //   return false;
        // }
      }
     
        
       
  }
    
?>  