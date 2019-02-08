<?php  
   class InviteUser_model extends CI_Model  
   {  
      function __construct()  
      { 
         parent::__construct();  
      }  

      public function getUserData()
      {
        try{
          $this->db->select('tu.UserId,tu.FirstName,tu.LastName,tu.EmailAddress,tu.PhoneNumber,tu.IsActive,tud.PanCard,tud.AddressProof');
          $this->db->join('tbluserdocument tud','tud.UserId=tu.UserId','left');
          $this->db->where('tu.StatusId','1');
          $result = $this->db->get('tbluser tu');
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

      public function isActiveChange($data)
      {
        try{
          if($data) {

            if(trim($data['IsActive'])==1){
              $IsActive = true;
            } else {
              $IsActive = false;
            }
            $updatedata = array(
              'IsActive' => $IsActive
            );	
           
            $this->db->where('UserId',trim($data['UserId']));
            $res = $this->db->update('tbluser',$updatedata);
          
            if($res){
               return $res;
            }else{
              return false;
            }
          }else{
            return false;
          }
        }catch(Exception $e){
          trigger_error($e->getMessage(), E_USER_ERROR);
          return false;
        }
      }
      
      public function getBankDetails($post_data) {
        $this->db->select('tb.BankName,tb.BankBranch,tb.BankIFSCCode, tb.BankAddress, tb.BankPhoneNumber, tub.BankAccountNumber, tub.AccountType, tub.PercOfSalary');
        $this->db->join('tblmstbank tb','tb.BankId=tub.BankId','left');
        $this->db->where('tub.UserId',$post_data['UserId']);
        $result = $this->db->get('tbluserbank as tub');	
        $res = array();
        if($result->result()) {
          $res = $result->result();
        }
        return $res;
      }
      
      public function getAddressDetails($post_data) {


      $this->db->select('ua.UserAddressId,ua.Address,ua.City,ua.Zipcode,ua.StateId,ms.StateName,ms.CountryId,mc.CountryName');
      $this->db->join('tbluseraddress ua','ua.StateId=ms.StateId','left');
      $this->db->join('tblmstcountry mc','mc.CountryId=ms.CountryId','left');
			$this->db->where('ua.UserId',$post_data);
			$result = $this->db->get('tblmststate as ms');

      $res = array();
      if($result->result()) {
        $res = $result->result();
      }
      return $res;
            // if($result)
            // {
            //   $this->db->select('StateName,CountryId');
            //    $this->db->where('IsActive','1');
            //   $this->db->where('UserId',$post_data);
            //   $result = $this->db->get('tbluseraddress');
            // }
        
        // $res = array();
        // if($result->result()) {
        //   $res = $result->result();
        // }
        // return $res;
      }
      public function getUserInvitationList()
      {
        try{
          $this->db->select('UserId, EmailAddress, StatusId');
          $this->db->where('RoleId',2);
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
      
      public function RevokeUser($data)
      {
        try{
          if($data) {
            $UserId = $data['id'];
            $Email = $data['Email'];
            $data = array( 
              'Statusid'	=>  2,
              'InvitationCode' => ''
            );
            $this->db->where('UserId', $UserId);
            $res = $this->db->update('tbluser',$data);
            if($res){
              /* ACTIVITY LOG */
              $activity_log = array(
                'Module' =>'Revoke User',
                'Activity'=>'Revoke Invitation of - '.$Email
              );

              $log = $this->db->insert('tblactivitylog',$activity_log);
              /* END */
              return true;
            }else{
              return false;
            }
          }else{
            return false;
          }
        }catch(Exception $e){
            trigger_error($e->getMessage(), E_USER_ERROR);
            return false;
        }
      }

       public function ReInviteUser($data)
       {
         try{
           if($data)
           {
             $UserId = $data['id'];
             $InviteCode = $data['InvitationCode'];
             $Email = $data['Email'];
            
             $data = array( 
              'InvitationCode' => $InviteCode,
              'Statusid'	=>  0
              );
               $this->db->where('UserId', $UserId);
               $res = $this->db->update('tbluser',$data);
              
               if($res)
               {
                 /* ACTIVITY LOG */
                $activity_log = array(
                  'Module' =>'Re-Invite User',
                  'Activity'=>'Re-Invitation sent to - '.$Email
                );

                $log = $this->db->insert('tblactivitylog',$activity_log);
                /* END */
                 return $UserId;
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
           catch(Exception $e){
             trigger_error($e->getMessage(), E_USER_ERROR);
             return false;
           }
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
            if(isset($post_Invitation['PhoneNumber']) && !empty($post_Invitation['PhoneNumber'])) {
							$PhoneNumber = $post_Invitation['PhoneNumber'];
						}	else {
							$PhoneNumber = '';
						}
            $Invitation_data = array(
              'RoleId' => 2,
              'FirstName' => trim($post_Invitation['FirstName']),
              'LastName' => trim($post_Invitation['LastName']),
              'EmailAddress' =>  trim($post_Invitation['EmailAddress']),
              'PhoneNumber' => $PhoneNumber,
              'StatusId' =>  0,
              'Password' =>  md5(trim($post_Invitation['Password'])),
              'CreatedBy' => 1,
              'CreatedOn' => date('y-m-d H:i:s'),
              'UpdatedBy' => 1,
              'UpdatedOn' => date('y-m-d H:i:s')
            );
            $res = $this->db->insert('tbluser',$Invitation_data);

            
            $UserId = $this->db->insert_id();

            $db_error = $this->db->error();
            if (!empty($db_error) && !empty($db_error['code'])) { 
              throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
              return false; // unreachable return statement !!!
            }
            
            if($res) { 
              /* ACTIVITY LOG */
                $activity_log = array(
                  'Module' =>'Invite User',
                  'Activity'=>'Invitation sent to - '.$post_Invitation['EmailAddress']
                );

                $log = $this->db->insert('tblactivitylog',$activity_log);
                /* END */
              return $UserId;
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