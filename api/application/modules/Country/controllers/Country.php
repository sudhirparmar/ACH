<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Country extends MY_Controller {


	public function __construct() {	
		parent::__construct();
		$this->load->model('Country_model');		
	}
	
	public function addCountry()
	{
		$post_Country = json_decode(trim(file_get_contents('php://input')), true);
		if ($post_Country) {
			if($post_Country['CountryId']>0) {
				$result = $this->Country_model->editCountry($post_Country);
				if($result) {
					echo json_encode($post_Country);	
				}	
			}
			else {
				$result = $this->Country_model->addCountry($post_Country); 
				if($result) {
					echo json_encode($post_Country);	
				}	
			}		
		}
	}
	public function getById($countryId=null)
	{	
		if(!empty($countryId)) {
			$data=[];
			$data=$this->Country_model->getById($countryId);
			echo json_encode($data);
		}
	}
	public function getAllCountry()
	{
		$data=$this->Country_model->getAllCountry();
		echo json_encode($data);
	}
	public function isActiveChange() {
		$post_data = json_decode(trim(file_get_contents('php://input')), true);	
		if ($post_data) {
			$result = $this->Country_model->isActiveChange($post_data);
			if($result) {
				echo json_encode('success');	
			}						
		}		
	}	
	public function deleteCountry() {
		$post_Country = json_decode(trim(file_get_contents('php://input')), true);		

		if ($post_Country)
		 {
			if($post_Country['id'] > 0){
				$result = $this->Country_model->deleteCountry($post_Country);
				if($result) {
					echo json_encode("Delete successfully");
				}
		 	}
		} 	
	}	
}
