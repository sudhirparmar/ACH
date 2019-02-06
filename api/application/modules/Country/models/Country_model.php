<?php

class Country_model extends CI_Model {

	public function addCountry($post_Country)
	{	
		try{
			if($post_Country) {
				if($post_Country['IsActive']==1) {
					$IsActive = true;
				} else {
					$IsActive = false;
				}
				$country_data=array(
					'CountryName' => trim($post_Country['CountryName']),
					'CountryAbbreviation' => trim($post_Country['CountryAbbreviation']),
					'PhonePrefix' => trim($post_Country['PhonePrefix']),
					'CreatedBy' => trim($post_Country['CreatedBy']),
					'UpdatedBy' => trim($post_Country['UpdatedBy']),
					'UpdatedOn' => date('y-m-d H:i:s'),
					'IsActive' => $IsActive
				);
				$res=$this->db->insert('tblmstcountry',$country_data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_Country['CreatedBy']),
						'Module' => 'Country',
						'Activity' =>'Add Country - '.$post_Country['CountryName']
					);
					$log = $this->db->insert('tblactivitylog',$log_data);
					return true;
				} else {
					return false;
				}
			}
			else
			{
				return false;
			}
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}	
	}

	public function editCountry($post_Country) 
	{
		try{
			if($post_Country['IsActive']==1) {
				$IsActive = true;
			} else {
				$IsActive = false;
			}
			if($post_Country) {
				$country_data = array(
					'CountryName' => trim($post_Country['CountryName']),
					'CountryAbbreviation' => trim($post_Country['CountryAbbreviation']),
					'PhonePrefix' => trim($post_Country['PhonePrefix']),
					'UpdatedBy' => trim($post_Country['UpdatedBy']),
					'UpdatedOn' => date('y-m-d H:i:s'),
					'IsActive' => $IsActive
				);
				$this->db->where('CountryId',trim($post_Country['CountryId']));
				$res = $this->db->update('tblmstcountry',$country_data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_Country['UpdatedBy']),
						'Module' => 'Country',
						'Activity' =>'Update Country - '.$post_Country['CountryName']
					);
					$log = $this->db->insert('tblactivitylog',$log_data);
					return true;
				} else {
					return false;
				}
			}
			else {
				return false;
			}
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}	
	}
	public function getById($countryId=Null)
	{
	  if($countryId)
	  {
		 $this->db->select('tmc.CountryId,tmc.CountryName,tmc.CountryAbbreviation,tmc.PhonePrefix,tmc.IsActive');
		 $this->db->where('tmc.CountryId',$countryId);
		 $result=$this->db->get('tblmstcountry tmc');
		 $country_data= array();
		 foreach($result->result() as $row)
		 {
			$country_data=$row;
		 }
		 return $country_data;
	  }
	  else
	  {
		  return false;
	  }
	}
	public function getAllCountry()
	{
		try{
			$this->db->select('tmc.CountryId, tmc.CountryName, tmc.CountryAbbreviation, tmc.PhonePrefix, tmc.IsActive, (SELECT COUNT(tms.StateId) FROM tblmststate as tms WHERE tms.CountryId=tmc.CountryId) as isdisabled');
			$result = $this->db->get('tblmstcountry tmc');
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
	public function isActiveChange($post_data) {
		try{
			if($post_data) {
				if(trim($post_data['IsActive'])==1){
					$IsActive = true;
				} else {
					$IsActive = false;
				}
				$data = array(
					'IsActive' => $IsActive,
					'UpdatedBy' => trim($post_data['UpdatedBy']),
					'UpdatedOn' => date('y-m-d H:i:s'),
				);			
				$this->db->where('CountryId',trim($post_data['CountryId']));
				$res = $this->db->update('tblmstcountry',$data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_data['UpdatedBy']),
						'Module' => 'Country',
						'Activity' =>'Update Country Active Status - '.$post_data['CountryName']
					);
					$log = $this->db->insert('tblactivitylog',$log_data);
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}	
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}
	}
	public function deleteCountry($post_Country) {
		try{
			if($post_Country) 
			{
				$id=$post_Country['id'];
				$this->db->where('CountryId',$post_Country['id']);
				$res = $this->db->delete('tblmstcountry');
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => $post_Country['Userid'],
						'Module' => 'Country',
						'Activity' =>'Delete Country - '.$post_Country['Name'].' (Id - '.$post_Country['id'].')'
					);
					$log = $this->db->insert('tblactivitylog',$log_data);
					return true;
				} else {
					return false;
				}
			}else {
				return false;
			}
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}
	}
}
