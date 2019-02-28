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

	public function getUserDocument() {				
		$post_userDocument = json_decode(trim(file_get_contents('php://input')), true);		
		if ($post_userDocument) {
			$result = $this->Ach_model->getUserDocument($post_userDocument);
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
			$UserInfo=$data['UserInfo'];			
			if($UserInfo['StatusId']==0) {
				$result = $this->Ach_model->addAchForm($data); 
				if($result) {
					/* ACTIVITY LOG */
					$activity_log = array(
						'UserId'=>$data['CreatedBy'],
						'Module' =>'Ach Form',
						'Activity'=>'Fill Ach form of '.$UserInfo['FirstName'].' '.$UserInfo['LastName']
					  );
					  $log = $this->db->insert('tblactivitylog',$activity_log);
					/* END */
					echo json_encode($data);	
				}	
			}
			else if ($UserInfo['StatusId']==1){
				$result = $this->Ach_model->updateAchForm($data); 
				if($result) {
					/* ACTIVITY LOG */
					$activity_log = array(
						'UserId'=>$data['CreatedBy'],
						'Module' =>'Ach Form',
						'Activity'=>'Update Ach form of '.$UserInfo['FirstName'].' '.$UserInfo['LastName']
					  );
					  $log = $this->db->insert('tblactivitylog',$activity_log);
					/* END */
					echo json_encode($data);	
				}
			}	 
		} else {			
			return false;
		}		
	}
	
	public function uploadDocs()
	{
		if($_FILES){
			if(isset($_FILES['PanCard']) && !empty($_FILES['PanCard'])){				
				$fileName = $_FILES["PanCard"]["name"];
				$char = strtoupper(substr($fileName,0,1));
				$directoryName = "../src/assets/document/PAN_Card/" . $char . "/";
				$source_file = $_FILES["PanCard"]["tmp_name"];
				$target_file = $directoryName . $fileName;
				if(!is_dir($directoryName)){
					mkdir($directoryName, 0755, true); //Create New folder if not exist
				}
				move_uploaded_file($source_file, $target_file);
			}
			if(isset($_FILES['AddressProof']) && !empty($_FILES['AddressProof'])){				
				$fileName = $_FILES["AddressProof"]["name"];
				$char = strtoupper(substr($fileName,0,1));
				$directoryName = "../src/assets/document/Address_Proof/" . $char . "/";
				$source_file = $_FILES["AddressProof"]["tmp_name"];
				$target_file = $directoryName . $fileName;
				if(!is_dir($directoryName)){
					mkdir($directoryName, 0755, true); //Create New folder if not exist
				}
				move_uploaded_file($source_file, $target_file);
			}
			echo json_encode('success');
		}
	}
	public function uploadCheque($TotalCheque=null)
	{
		if($_FILES){
			for( $j = 0 ; $j < $TotalCheque ; $j++ ){
				if(isset($_FILES['VoidCheque'.$j]) && !empty($_FILES['VoidCheque'.$j])){
					$fileName = $_FILES["VoidCheque".$j]["name"];
					$char = strtoupper(substr($fileName,0,1));
					$directoryName = "../src/assets/document/Void_Cheque/" . $char . "/";
					$source_file = $_FILES["VoidCheque".$j]["tmp_name"];
					$target_file = $directoryName . $fileName;
					if(!is_dir($directoryName)){
						mkdir($directoryName, 0755, true); //Create New folder if not exist
					}
					move_uploaded_file($source_file, $target_file);
				}
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