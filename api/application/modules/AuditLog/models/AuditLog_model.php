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
          // $this->db->select('LoginLogId, UserId, LoginType, UserAgent, IPAddress, CreatedOn');
          // $result = $this->db->get('tblloginlog');

         
          $this->db->select('tblloginlog.LoginLogId,tblloginlog.LoginType,tblloginlog.LoginType,tblloginlog.UserAgent,tblloginlog.IPAddress,tblloginlog.CreatedOn,tbladminuser.EmailAddress');
          $this->db->from('tblloginlog');
          $this->db->join('tbladminuser','tblloginlog.UserId=tbladminuser.AdminUserId','inner');
          $result=$this->db->get();

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

      public function getActivityLog()
      {
        try{
          $this->db->select('CONCAT(tu.FirstName," ",tu.LastName) as Name,tag.Module,tag.Activity,tag.CreatedOn');
          $this->db->join('tbluser tu','tag.UserId=tu.UserId','left');
          $result = $this->db->get('tblactivitylog tag');
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

      public function getEmailLog()
      {
        try{
          $this->db->select('EmailLogId, From, To,Subject, MessageBody, CreatedOn');
          $result = $this->db->get('tblemaillog');
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