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
              "homeaddress"=>trim($data['homeAddress']),
              "phone"=>trim($data['phone']),
              "email"=>trim($data['email']),
              "pancard"=>trim($data['pancard']),
              "address_proof"=>trim($data['addressproof']),
              "bankname"=>trim($data['bankName']),
              "bankaddress"=>trim($data['bankAddress']),
              "bankacno"=>trim($data['bankAcno']),
              "ifsc_code"=>trim($data['ifscCode']),
              "account_type"=>trim($data['actype']),
              "bank_phone"=>trim($data['bankPhone'])
            );

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
        $query = $this->db->get('ach_payment');

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
     
        
       
  }
    
?>  