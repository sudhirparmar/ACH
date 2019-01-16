<?php  
   class Ach_model extends CI_Model  
   {  
      function __construct()  
      { 
         parent::__construct();  
      }  
     
      public function go()
      {
        echo "acho model called";
      }
      public function InsertRecord($data)
      {
        try{
          if($data)
          {
            $ach_data=array(
              "firstname"=>trim($data['firstName']),
              "lastname"=>trim($data['lastName']),
              "Address"=>trim($data['homeAddress']),
              "PhoneNo"=>trim($data['phone']),
              "Email"=>trim($data['email']),
              "PanCard"=>trim($data['pancard']),
              "AddressProof"=>trim($data['addressproof']),
              
            );

            /*
              "bankname"=>trim($data['bankName']),
              "bankaddress"=>trim($data['bankAddress']),
              "bankacno"=>trim($data['bankAcno']),
              "ifsc_code"=>trim($data['ifscCode']),
              "account_type"=>trim($data['actype']),
              "bank_phone"=>trim($data['bankPhone'])
            */
          //  print_r($ach_data);
            $result = $this->db->insert('tblachuser', $ach_data);

            if($result) {
              return true;
            } else {
              return false;
            }
          }
          else{
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