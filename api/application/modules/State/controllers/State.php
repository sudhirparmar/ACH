<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class State extends MY_Controller {


	public function __construct() {	
		parent::__construct();
		$this->load->model('State_model');		
	}
	
	public function addState()
	{
		$post_State = json_decode(trim(file_get_contents('php://input')), true);
		if ($post_State) {
			if($post_State['StateId']>0) {
				$result = $this->State_model->editState($post_State);
				if($result) {
					echo json_encode($post_State);	
				}	
			}
			else {
				$result = $this->State_model->addState($post_State); 
				if($result) {
					echo json_encode($post_State);	
				}	
			}		
		}
	}
	public function getById($countryId=null)
	{	
		if(!empty($countryId)) {
			$data=[];
			$data=$this->State_model->getById($countryId);
			echo json_encode($data);
		}
	}
	public function getAllState()
	{
		$data=$this->State_model->getAllState();
		echo json_encode($data);
	}
	public function getAllCountry()
	{
		$data=$this->State_model->getAllCountry();
		echo json_encode($data);
	}
	public function isActiveChange() {
		$post_data = json_decode(trim(file_get_contents('php://input')), true);	
		if ($post_data) {
			$result = $this->State_model->isActiveChange($post_data);
			if($result) {
				echo json_encode('success');	
			}						
		}		
	}	
	public function deleteState() {
		$post_State = json_decode(trim(file_get_contents('php://input')), true);		

		if ($post_State)
		 {
			if($post_State['id'] > 0){
				$result = $this->State_model->deleteState($post_State);
				if($result) {
					echo json_encode("Delete successfully");
				}
		 	}
		} 	
	}	
}
