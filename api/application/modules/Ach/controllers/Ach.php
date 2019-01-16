<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: *');
header('Content-Type: application/json');
class Ach extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Ach_model');
	}
    
	public function addData()
	{
		
		
		$data = json_decode(trim(file_get_contents('php://input')), true);
	//	echo json_encode($data);
		if ($data) {
			
				$result = $this->Ach_model->InsertRecord($data); 
				if($result) {
					echo json_encode($data);	
				}
			}
			else {
			
			return false;
			}		
	}
	public function getAchData()
	{
		$data=$this->Ach_model->getAchData();
		if($data)
		{
			echo json_encode($data);
		}
		else
		{
			return false;
		}
		
	}
}	

?>