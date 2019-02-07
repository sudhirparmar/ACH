<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ach extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Ach_model');
	}
    
	public function getUserInfo() {				
	$post_userinfo = json_decode(trim(file_get_contents('php://input')), true);		
		if ($post_userinfo) {
			$result = $this->Ach_model->getUserInfo($post_userinfo);
			if($result) {
				echo json_encode($result);
			} else {
				echo json_encode('fail');
			}									
		}	
	}
	public function getUserAddress() {				
		$post_userAddress = json_decode(trim(file_get_contents('php://input')), true);		
		if ($post_userAddress) {
			$result = $this->Ach_model->getUserAddress($post_userAddress);
			if($result) {
				echo json_encode($result);
			} else {
				echo json_encode('fail');
			}									
		}	
	}

	public function getUserBank()
	{	
		$post_userBank = json_decode(trim(file_get_contents('php://input')), true);		
		if ($post_userBank) {
			$result = $this->Ach_model->getUserBank($post_userBank);
			if($result) {
				echo json_encode($result);
			} else {
				echo json_encode('fail');
			}									
		}
	}

	public function addAchForm()
	{
		$data = json_decode(trim(file_get_contents('php://input')), true);
		if ($data) {			
			$result = $this->Ach_model->addAchForm($data); 
			if($result) {
				echo json_encode($data);	
			}
		} else {			
			return false;
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

	public function getCountryList()
	{
		$data=$this->Ach_model->getCountryList();
		echo json_encode($data);
	}

	public function getStateList($CountryId = NULL) {		
		if(!empty($CountryId)) {
			$result = [];
			$result = $this->Ach_model->getStateList($CountryId);			
			echo json_encode($result);				
		}			
	}

}	

?>