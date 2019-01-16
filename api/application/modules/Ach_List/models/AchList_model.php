<?php  
   class AchList_model extends CI_Model  
   {  
      function __construct()  
      { 
         parent::__construct();  
      }  
     
      public function viewdata()
      {
        try{
          //$query = $this->db->get('ach_payment');  
          $result = $this->db->query('call getuserdata()');

          $db_error = $this->db->error();
          if(!empty($db_error) && !empty($db_error['code']))
          {
              throw new Exception('Database Error ! Error Code :[' . $db_error['code'] . '] Error: ' . $db_error['message']);
              return false;
          }
          if($result)
          {
            return $result; 
          }
          else
          {
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