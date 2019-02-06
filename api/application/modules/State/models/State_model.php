<?php

class State_model extends CI_Model {

	public function addState($post_State)
	{	
		try{
			if($post_State) {
				if($post_State['IsActive']==1) {
					$IsActive = true;
				} else {
					$IsActive = false;
				}
				$state_data=array(
					'CountryId'=>trim($post_State['CountryId']),
					'StateName' => trim($post_State['StateName']),
					'StateAbbreviation' => trim($post_State['StateAbbreviation']),
					'CreatedBy' => trim($post_State['CreatedBy']),
					'UpdatedBy' => trim($post_State['UpdatedBy']),
					'UpdatedOn' => date('y-m-d H:i:s'),
					'IsActive' => $IsActive
				);
				$res=$this->db->insert('tblmststate',$state_data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_State['CreatedBy']),
						'Module' => 'State',
						'Activity' =>'Add State - '.$post_State['StateName']
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

	public function editState($post_State) 
	{
		try{
			if($post_State['IsActive']==1) {
				$IsActive = true;
			} else {
				$IsActive = false;
			}
			if($post_State) {
				$state_data = array(
					'CountryId'=>trim($post_State['CountryId']),
					'StateName' => trim($post_State['StateName']),
					'StateAbbreviation' => trim($post_State['StateAbbreviation']),
					'UpdatedBy' => trim($post_State['UpdatedBy']),
					'UpdatedOn' => date('y-m-d H:i:s'),
					'IsActive' => $IsActive
				);
				$this->db->where('StateId',trim($post_State['StateId']));
				$res = $this->db->update('tblmststate',$state_data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_State['UpdatedBy']),
						'Module' => 'State',
						'Activity' =>'Update State - '.$post_State['StateName']
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
	public function getById($stateId=Null)
	{
	  if($stateId)
	  {
		 $this->db->select('tms.StateId,tms.StateName,tms.StateAbbreviation,tms.CountryId,tms.IsActive');
		 $this->db->where('tms.StateId',$stateId);
		 $result=$this->db->get('tblmststate tms');
		 $state_data= array();
		 foreach($result->result() as $row)
		 {
			$state_data=$row;
		 }
		 return $state_data;
	  }
	  else
	  {
		  return false;
	  }
	}
	public function getAllState()
	{
		try{
			$this->db->select('tms.StateId, tmc.CountryName, tms.StateName, tms.StateAbbreviation, tms.IsActive');
			$this->db->join('tblmstcountry tmc', 'tmc.CountryId = tms.CountryId', 'left');
			$result = $this->db->get('tblmststate tms');
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
	public function getAllCountry() 
	{
		try{
			$this->db->select('CountryId, CountryName');
			$this->db->where('IsActive',1);
			$this->db->order_by('CountryName','asc');
			$result = $this->db->get('tblmstcountry');
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
				$this->db->where('StateId',trim($post_data['StateId']));
				$res = $this->db->update('tblmststate',$data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_data['UpdatedBy']),
						'Module' => 'State',
						'Activity' =>'Update State Active Status - '.$post_data['StateName']
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
	public function deleteState($post_State) {
		try{
			if($post_State) 
			{
				$id=$post_State['id'];
				$this->db->where('StateId',$post_State['id']);
				$res = $this->db->delete('tblmststate');
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => $post_State['Userid'],
						'Module' => 'State',
						'Activity' =>'Delete State - '.$post_State['Name'].' (Id - '.$post_State['id'].')'
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
