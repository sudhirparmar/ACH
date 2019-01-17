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
    
	public function addAchForm()
	{
		$data = json_decode(trim(file_get_contents('php://input')), true);
		if ($data) {
			
				$result = $this->Ach_model->addAchForm($data); 
				if($result) {
					echo json_encode($data);	
				}
			}
			else {
			
			return false;
			}		
	}
	public function getUserData()
	{
		$data=$this->Ach_model->getUserData();
		if($data){
			echo json_encode($data);
		}else{
			return false;
		}
	}
	public function getBankDetails()
	{
		$post_data= json_decode(trim(file_get_contents('php://input')), true);
		if ($post_data)
		{
			$data=$this->Ach_model->getBankDetails($post_data);			
			echo json_encode($data);
		}		
	}
	public function uploadFile()
	{
		if($_FILES){
			if(isset($_FILES['PanCard']) && !empty($_FILES['PanCard'])){
				move_uploaded_file($_FILES["PanCard"]["tmp_name"], "../src/assets/document/PAN_Card/".$_FILES["PanCard"]["name"]);
			}
			if(isset($_FILES['AddressProof']) && !empty($_FILES['AddressProof'])){
				move_uploaded_file($_FILES["AddressProof"]["tmp_name"], "../src/assets/document/Address_Proof/".$_FILES["AddressProof"]["name"]);
			}
			echo json_encode('success');
		}
	}
}	

?>