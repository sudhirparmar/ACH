<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ach extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Ach_model');
	}
    
	public function getACHLink()
		{				
		$post_achlink = json_decode(trim(file_get_contents('php://input')), true);		
		if ($post_achlink)
			{
				$result = $this->Ach_model->getACHLink($post_achlink);
				if($result)
				{
					echo json_encode('Success');
				}	
				else
				{
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
			}
			else {
			
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
}	

?>