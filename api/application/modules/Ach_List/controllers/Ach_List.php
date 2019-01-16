<?php
class Ach_List extends CI_controller
{
    public function __construct(){
        parent::__construct();
        $this->load->model('AchList_model');  
    }

    public function index()
    {
        try{
            $data['record']=$this->AchList_model->viewdata(); 
            
            $db_error = $this->db->error();
            if(!empty($db_error) && !empty($db_error['code']))
            {
                throw new Exception('Database Error ! Error Code :[' . $db_error['code'] . '] Error: ' . $db_error['message']);
                return false;
            }
            $this->load->view('AchList', $data);
           
           
        }
        catch(Exception $e){
            trigger_error($e->getMessage(),E_USER_ERROR);
        }
       
    }
}
?>