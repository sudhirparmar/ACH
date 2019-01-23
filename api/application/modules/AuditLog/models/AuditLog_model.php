<?php  
   class AuditLog_model extends CI_Model  
   {  
      function __construct()  
      { 
         parent::__construct();  
      }  

      public function getLoginLog()
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
  }
    
?>  