<?php  
   class InviteUser_model extends CI_Model  
   {  
      function __construct()  
      { 
         parent::__construct();  
      }  
      public function userInvite($post_Invitation) {
        try{
        if($post_Invitation) {
          $this->db->select('EmailAddress');
          $this->db->from('tbluser');
          $this->db->where('EmailAddress',trim($post_Invitation['EmailAddress']));
          $this->db->limit(1);
          $query = $this->db->get();
          $db_error = $this->db->error();
            if (!empty($db_error) && !empty($db_error['code'])) { 
              throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
              return false; // unreachable return statement !!!
            }
          if ($query->num_rows() == 1) {
            return false;
          } 
          else 
          {
            $Invitation_data = array(
              'EmailAddress' =>  trim($post_Invitation['EmailAddress']),
              'StatusId' =>  0,
              'InvitationCode' =>  trim($post_Invitation['InvitationCode']),
              'UpdatedOn' => date('y-m-d H:i:s')
            );
            $res = $this->db->insert('tbluser',$Invitation_data);
            $db_error = $this->db->error();
            if (!empty($db_error) && !empty($db_error['code'])) { 
              throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
              return false; // unreachable return statement !!!
            }
            
            if($res) { 
              return $res;
            } else {
              return false;
            }
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