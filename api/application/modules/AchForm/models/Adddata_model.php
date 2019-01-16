<?php
class Adddata_model extends CI_model{
   
    public function addData($user){
        try{
            if($user)
            {
                //$result = $this->db->insert('ach_payment', $user);
                $result = $this->db->query('call addData(?,?,?,?,?,?,?)',$user);
                
               $db_error = $this->db->error();
               if(!empty($db_error) && !empty($db_error['code']))
               {
                   throw new Exception('Database Error ! Error Code :[' . $db_error['code'] . '] Error: ' . $db_error['message']);
                   return false;
               }
               if($result)
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
               $db_error = $this->db->error();  
               if(!empty($db_error) && !empty($db_error['code']))
               {
                   throw new Exception('Database Error ! Error Code :[' . $db_error['code'] . '] Error: ' . $db_error['message']);
                   return false;
               }
            }
            
        }
        catch(Exception $e){
            trigger_error($e->getMessage(),E_USER_ERROR);
        }
     }
    }
    ?>